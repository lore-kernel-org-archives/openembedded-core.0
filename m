Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D2731601A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 07:30:35 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6V7UX5B029608; Thu, 31 Jul 2014 08:30:33 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id D2P6xd0bEK1a; Thu, 31 Jul 2014 08:30:33 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6V7UQSu029284
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 31 Jul 2014 08:30:28 +0100
Message-ID: <1406791826.13346.173.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Stefan =?ISO-8859-1?Q?M=FCller-Klieser?= <s.mueller-klieser@phytec.de>
Date: Thu, 31 Jul 2014 08:30:26 +0100
In-Reply-To: <53D9EA71.8010308@phytec.de>
References: <1406720953-30774-1-git-send-email-s.mueller-klieser@phytec.de>
	<53D92310.9090308@linux.intel.com> <53D9EA71.8010308@phytec.de>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC 1/1] add support for the barebox bootloader
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
X-List-Received-Date: Thu, 31 Jul 2014 07:30:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2014-07-31 at 09:04 +0200, Stefan Müller-Klieser wrote:
> On 30.07.2014 18:53, Saul Wold wrote:
> > On 07/30/2014 04:49 AM, Stefan Müller-Klieser wrote:
> >> Barebox is a bootloader that inherits the best of U-Boot and the Linux
> >> kernel. The barebox uses kconfig and kbuild mechanisms similar to the
> >> Linux kernel. This is reflected in the recipe. As soon as this
> >> functionality gets more abstraction in classes, the barebox recipe can
> >> be simplified. The recipe supports: kconfig handling, kconfig fragments,
> >> packages for dev tools and support for the initial program loader
> >> creation.
> >>
> >> Signed-off-by: Stefan Müller-Klieser <s.mueller-klieser@phytec.de>
> >> ---
> >>   meta/recipes-bsp/barebox/barebox-ipl.inc          |  37 +++++
> >>   meta/recipes-bsp/barebox/barebox-ipl_2014.07.0.bb |   4 +
> >>   meta/recipes-bsp/barebox/barebox.inc              | 161
> >> ++++++++++++++++++++++
> >>   meta/recipes-bsp/barebox/barebox_2014.07.0.bb     |   4 +
> >>   4 files changed, 206 insertions(+)
> >>   create mode 100644 meta/recipes-bsp/barebox/barebox-ipl.inc
> >>   create mode 100644 meta/recipes-bsp/barebox/barebox-ipl_2014.07.0.bb
> >>   create mode 100644 meta/recipes-bsp/barebox/barebox.inc
> >>   create mode 100644 meta/recipes-bsp/barebox/barebox_2014.07.0.bb
> >>
> >> diff --git a/meta/recipes-bsp/barebox/barebox-ipl.inc
> >> b/meta/recipes-bsp/barebox/barebox-ipl.inc
> >> new file mode 100644
> >> index 0000000..f388522
> >> --- /dev/null
> >> +++ b/meta/recipes-bsp/barebox/barebox-ipl.inc
> >> @@ -0,0 +1,37 @@
> >> +# Copyright (C) 2014 Stefan Mueller-Klieser
> >> <s.mueller-klieser@phytec.de> \
> >> +# PHYTEC Messtechnik GmbH
> >> +# Recipe released under the GPL-3.0 license
> >> +
> > Before I review this much further, I have to ask why are you licensing
> > the recipe meta-data as GPL-3.0?  All the rest of the meta-data is MIT.
> >   I also note that barebox itself is GPL-2.0.
> >
> > Thanks
> >      Sau!
> 
> Thats our default license. GPL3 is modern and better compatible with the 
> huge number of other free licenses. I can easily remove the line for 
> upstream work, so it will be MIT too.

Our metadata is MIT and I'd much prefer to try and keep it simple with
one license if at all possible.

Cheers,

Richard


