Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R0ey2-0002Yr-Ct for openembedded-core@lists.openembedded.org;
	Mon, 05 Sep 2011 21:36:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p85JVQjM001070
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Sep 2011 20:31:26 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00973-03 for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2011 20:31:22 +0100 (BST)
Received: from [192.168.1.40] (dynamic10.rpnet.com [192.168.1.40])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p85JVItQ001063
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Sep 2011 20:31:18 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CAP9ODKpdUMKw0RUHgzy5LnEupR9+wOuan7xiekefGitHSROBbw@mail.gmail.com>
References: <CAP9ODKoei49fOtr7sySUQkbXY-yrdaF+cVydXXfwOXxtQ+8kyQ@mail.gmail.com>
	<1314394806.5939.264.camel@rex>
	<CAP9ODKp6igGGDY2AQL+VqhYZm-GmFrKKcLg=5gRMaq5jwp+2MQ@mail.gmail.com>
	<1314517270.5939.268.camel@rex>
	<CAP9ODKpdUMKw0RUHgzy5LnEupR9+wOuan7xiekefGitHSROBbw@mail.gmail.com>
Date: Mon, 05 Sep 2011 20:31:17 +0100
Message-ID: <1315251077.1243.16.camel@ted>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Use of multiple GIT repositories in SRCREV but updating PV
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
X-List-Received-Date: Mon, 05 Sep 2011 19:36:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-29 at 14:24 -0300, Otavio Salvador wrote:
> On Sun, Aug 28, 2011 at 04:41, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > See linux-yocto as an example. You need to name the two git uris:
> >
> > SRC_URI = "\
> > git://git.yoctoproject.org/linux-yocto-a;protocol=git;name=machine \
> > git://git.yoctoproject.org/linux-yocto-b;protocol=git;name=meta \
> > "
> 
> I did it locally and it ...:
> 
>  - does the clones in DL_DIR file
>  - gets the right SRCREV for both
>  - gets the right SRCPV
> 
> However on unpack it fails; it always use S as '${WORKDIR}/git' even
> if I change it in the recipe.
> 
> Something seems broken on bitbake support for it.
> 
> Clues?

Just to follow up for the benefit of the mailing list, we were missing a
patch Holger submitted a while back for this problem which has now
merged into bitbake master. You can now tell the fetcher to use
something other than "git" as the checkout directory.

Cheers,

Richard





