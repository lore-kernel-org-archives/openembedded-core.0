Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 820206102E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 21:14:44 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8NLTTpL021663; Mon, 23 Sep 2013 22:29:29 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5N6st7sZvtrk; Mon, 23 Sep 2013 22:29:29 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8NLTPvs021641
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 23 Sep 2013 22:29:27 +0100
Message-ID: <1379970871.18603.265.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: David Nystrom <david.c.nystrom@gmail.com>
Date: Mon, 23 Sep 2013 22:14:31 +0100
In-Reply-To: <CAAKB1h2tRBDowRYZ9vOXduTCy0Fg4aoD+fJmVkN7vZ=XqzWpEg@mail.gmail.com>
References: <1379954041-5575-1-git-send-email-david.nystrom@enea.com>
	<1379954041-5575-2-git-send-email-david.nystrom@enea.com>
	<5240820E.5020407@windriver.com>
	<CAAKB1h2tRBDowRYZ9vOXduTCy0Fg4aoD+fJmVkN7vZ=XqzWpEg@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] shadow: Create recipe nativesdk-shadow
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Sep 2013 21:14:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-09-23 at 21:01 +0200, David Nystrom wrote:
> 
> On Sep 23, 2013 8:01 PM, "Mark Hatle" <mark.hatle@windriver.com>
> wrote:
> >
> > This looks to be the same as the 'native' package, but I don't think
> you can just add a BBCLASSEXTEND = "nativesdk"
> 
> It mostly is and I cant, your right.

Why not? Just the SRC_URI or other issues?

> > Perhaps (in 1.6) someone should look at merging the three back
> together.
> 
> Agree, the merged recipe will also get a bit messy, but probably
> easier to maintain than in its current state.
> 
> > If this is the same as the native version, I'd suggest adding a
> comment stating as much so we can hopefully keep them in sync.
> 
> Will do, will return with v2
> 
Well, I'm not happy with the idea of duplicating all this code.
shadow-native shouldn't exist and this makes things worse. With a few
minutes, I could write this patch:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t2&id=0730423fcda165a12112182b093d2f6df2f9c5eb

which at least makes the situation a bit less ugly. I guess I did spend
years doing these kinds of patches back when we had 50 versions of
everything and BBCLASSEXTEND didn't yet exist. With a few more minutes
perhaps I can get rid of the separate -native, now the differences are
clear. meld is a nice too for this kind of work btw.

Cheers,

Richard



