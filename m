Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Smrn4-0003sv-KG for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 21:32:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q65JLSAa002776
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Jul 2012 20:21:28 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00528-08 for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jul 2012 20:21:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q65JLLIA002770
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Jul 2012 20:21:22 +0100
Message-ID: <1341516081.19821.19.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 05 Jul 2012 20:21:21 +0100
In-Reply-To: <4FF3E606.7000001@gmail.com>
References: <CANrdZLjpmXK5j+jr=fTD43je2Ni6exWGcrCkejKgE1ZZXe5TGQ@mail.gmail.com>
	<CAMKF1spWqFCoXRbnevoKz+ftThQf41nObpMQ6N46YQ6_fucznQ@mail.gmail.com>
	<4FE167B4.3020802@gmail.com> <4FF3E606.7000001@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Generating a movable SDK
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
X-List-Received-Date: Thu, 05 Jul 2012 19:32:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-07-04 at 08:43 +0200, Tasslehoff Kjappfot wrote:
> On 06/20/2012 08:03 AM, Tasslehoff Kjappfot wrote:
> > On 06/19/2012 10:33 PM, Khem Raj wrote:
> >>
> >>
> >> On Tuesday, June 19, 2012, Steve English <steve.english@navetas.com
> >> <mailto:steve.english@navetas.com>> wrote:
> >>  > Hi,
> >>  > I've generated a cross compiling ARM SDK
> >> (angstrom-eglibc-x86_64-armv7a-v2012.05-toolchain.tar.bz2) that works
> >> great if installed in /usr/local/oecore-x86_64. I would like to move
> >> these binaries and run them from under my home directory (on this and
> >> other host machines).
> >>  >
> >>  > I can tweak the PATH and use --sysroot where appropriate, but the ELF
> >> binaries themselves specify a loader of
> >> /usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/lib/ld-linux-x86-64.so.2
> >>
> >> in their .interp header. Is it possible to generate an SDK that uses the
> >> standard host loader, or at least uses a relative path for the built
> >> loader?
> >>
> >>
> >> Sdk is not install time relocatable yet there is a feature enhancement
> >> request in yo to bugzilla for the same
> >>
> > That request is mine, I think. I have gotten around this by making
> > /usr/local/oecore-i686 a symlink to where I want to keep the toolchain
> > (in a vcs). Works like a charm.
> >
> > - Tasslehoff
> 
> But now I wish the sdk was relocatable again.
> 
> As I said we have the sdk in our vcs, and a symlink in /usr/local to 
> make the toolchain binaries happy. We have a build server that does 
> continous builds, and she has multiple trees checked out, so the 
> symlink-approach is not ideal.
> 
> Any clever workaround for this (or even better, a fix to make the sdk 
> relocatable)?

There is work underway to make it relocatable as part of the 1.3
release:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=2383

Cheers,

Richard



