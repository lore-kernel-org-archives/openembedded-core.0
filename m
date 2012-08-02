Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SwyEz-0005Dx-BW; Thu, 02 Aug 2012 18:27:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q72GFXUM009497;
	Thu, 2 Aug 2012 17:15:33 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09311-03; Thu,  2 Aug 2012 17:15:29 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q72GFPkk009491
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 2 Aug 2012 17:15:25 +0100
Message-ID: <1343924127.9756.88.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 02 Aug 2012 17:15:27 +0100
In-Reply-To: <CABcZANmUVia_qXt7a3oG5ofJeJYVO29gOoLaLb7zT=64W00CxQ@mail.gmail.com>
References: <1343250562.29991.0.camel@ted>
	<20120802135335.GQ16306@jama.jama.net>
	<20120802141450.GS16306@jama.jama.net> <1343922792.9756.81.camel@ted>
	<CABcZANmUVia_qXt7a3oG5ofJeJYVO29gOoLaLb7zT=64W00CxQ@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core <openembedded-core@openembedded.org>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [PATCH] sstate: Add a two character subdirectory to the sstate directory layout
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Aug 2012 16:27:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-08-02 at 08:59 -0700, Chris Larson wrote:
> On Thu, Aug 2, 2012 at 8:53 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Thu, 2012-08-02 at 16:14 +0200, Martin Jansa wrote:
> >> 2 more ideas:
> >>
> >> 1) would be great to also download file.sigdata if it exists, to be able
> >>    to compare them when they change even on machine which downloaded
> >>    older sstate file from remote url
> >> 2) if the reason for this patch was number of files in shared
> >>    sstate-cache directory, then fetcher creating .done files makes
> >>    number double too (would be fine if fetcher stores all 3 files
> >>    (.tgz, .tgz.sigdata, .tgz.done) in right prefix, or moves them to
> >>    right prefix instead of symlinks.
> >
> > I'm aware of the problem. The main issue is that we probably need to
> > start enforcing complete paths for all downloads in DL_DIR, including
> > http:// urls. This would resolve conflicts like:
> >
> > SRC_URI = "http://server1.org/somefile.patch \
> >            http://server2.org/somefile.patch"
> >
> > where the two files are different. The trouble is it will pretty much
> > break all the source mirrors :(.
> 
> I think we need to stop the tendency to use DL_DIR as is as a mirror,
> and instead create a task or something to populate a mirror directory
> from the DL_DIR. This would avoid potential issues with licensing if
> it uses license filtering to control what gets populated, as well.

I agree, there are some issues in that area and we shoudl encourage
people to think about this.

Having said that, I'm worried we are going to hit conflicts over DL_DIR
regardless of that.

Perhaps making this change might be a way to remind people of that....

Cheers,

Richard



