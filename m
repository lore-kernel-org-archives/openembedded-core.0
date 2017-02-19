Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5756560620
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Feb 2017 17:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v1JHZH2B013752; Sun, 19 Feb 2017 17:35:17 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id OZU7OFUSInNW; Sun, 19 Feb 2017 17:35:17 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v1JHZBoP013692
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 19 Feb 2017 17:35:15 GMT
Message-ID: <1487525710.30548.20.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Date: Sun, 19 Feb 2017 09:35:10 -0800
In-Reply-To: <alpine.LFD.2.20.1702181316120.26007@localhost.localdomain>
References: <alpine.LFD.2.20.1702181316120.26007@localhost.localdomain>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: possible consequences of adding "extraneous" layers to a build?
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
X-List-Received-Date: Sun, 19 Feb 2017 17:35:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2017-02-18 at 13:25 -0500, Robert P. J. Day wrote:
>   (currently updating a pile of my OE online pages so i'm going to
> ask
> a bunch of basic questions to make sure i'm not missing anything.)
> 
>   what are the basic rules for layer design such that you should
> (theoretically) be able to toss a bunch of ostensibly superfluous
> layers into a build, and it shouldn't make a difference? that is,
> leaving aside obvious conflicts in having two layers trying to define
> precisely the same thing, what are the only issues you should worry
> about in throwing more layers into your "bblayers.conf" file, even if
> you end up not using anything from them?
> 
>   first, it seems(?) clear that introducing new recipes or classes or
> machines or distros in those additional layers should make no
> difference -- if you weren't referring to any of those features
> before, then if you don't change your configuration, you certainly
> won't be referring to them now.
> 
>   the most obvious consequence is that one or more .bbappend files
> will tweak some recipes you were already building, so .bbappend files
> strike me as, really, the only consequence of note.
> 
>   the only thing that leaps to mind is if some really weird content
> was placed in the new layers' "layer.conf" file, but that strikes me
> as really bad design unless there's a good reason for it.
> 
>   so ... is there any other possible consequence of adding layers to
> a
> build that i'm overlooking?

A layer can do pretty much *anything* to the build. You can design
layers not to have an impact, or the impact may be the whole purpose of
the layer.

With YP Compatible v2, we plan to detect "invasive" changes using the
sstate checksums changing to show that the layer did something
unexpected. But in general a layer can do pretty much anything.

Cheers,

Richard



