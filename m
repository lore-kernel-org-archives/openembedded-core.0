Return-Path: <Jef.Driesen@niko.eu>
X-Greylist: delayed 672 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 22 May 2018 10:10:10 UTC
Received: from relay05.secure-mail.be (relay05.secure-mail.be [195.13.7.8])
	by mail.openembedded.org (Postfix) with ESMTP id DB07E748A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 10:10:10 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2DYBgB26QNb/7lOx1RcHAEBAQQBAQoBA?=
	=?us-ascii?q?YJvVFQOgSUKmGSBeYEPlS4LIwgBhEACgh8hOBQBAgEBAQEBAQIBaxwMgjUiglE?=
	=?us-ascii?q?BAQU6UQEIGAoUQiYBBAEagxyCAAMBCqpMiEWCCgUJAYcufYIThByDEQQYgUiDL?=
	=?us-ascii?q?oIkAocjkSsHAoVqiiSDbYdZh06CEYcZgSUzIYFSc4MRgkeISIU+b3oBAY5jgRg?=
	=?us-ascii?q?BAQ?=
X-IPAS-Result: =?us-ascii?q?A2DYBgB26QNb/7lOx1RcHAEBAQQBAQoBAYJvVFQOgSUKmGS?=
	=?us-ascii?q?BeYEPlS4LIwgBhEACgh8hOBQBAgEBAQEBAQIBaxwMgjUiglEBAQU6UQEIGAoUQ?=
	=?us-ascii?q?iYBBAEagxyCAAMBCqpMiEWCCgUJAYcufYIThByDEQQYgUiDLoIkAocjkSsHAoV?=
	=?us-ascii?q?qiiSDbYdZh06CEYcZgSUzIYFSc4MRgkeISIU+b3oBAY5jgRgBAQ?=
Received: from edge.nikogroup.be ([84.199.78.185])
	by relay05.secure-mail.be with ESMTP; 22 May 2018 11:58:48 +0200
Received: from HUB.NIKO.LAN (172.22.10.201) by EDGE.nikogroup.be
	(192.168.22.31) with Microsoft SMTP Server (TLS) id 14.3.389.1;
	Tue, 22 May 2018 11:59:20 +0200
Received: from MBX.NIKO.LAN ([::1]) by HUB.NIKO.LAN ([::1]) with mapi id
	14.03.0389.001; Tue, 22 May 2018 11:58:48 +0200
From: <Jef.Driesen@niko.eu>
To: <armccurdy@gmail.com>, <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] arch-armv7a.inc: default to Thumb2
	instruction set for armv7a and above
Thread-Index: AdPxsaFuT7IU+qkuTa6nl+vBo/37Xg==
Date: Tue, 22 May 2018 09:58:46 +0000
Message-ID: <FAB9E48578194042BE5C63B8BE47610339CF54BD@MBX.NIKO.LAN>
Accept-Language: en-US, nl-BE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.10.94]
x-endpointsecurity-0xde81-ev: v:6.2.36.1014, d:out, a:y, w:t, t:0,
	sv:1526971307, ts:1526983128
x-exclaimer-md-config: ea9a6d46-d5fe-4ddc-9ba9-49fab8e88ad4
MIME-Version: 1.0
Subject: Re: [PATCH] arch-armv7a.inc: default to Thumb2 instruction set for armv7a and above
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
X-List-Received-Date: Tue, 22 May 2018 10:10:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Andre McCurdy wrote:
> Although there may still be specific cases which can benefit from the
> ARM instruction set, the Thumb2 instruction set is generally a better
> default for armv7a class CPUs. Distros such as Debian and Fedora have
> been targeting Thumb2 by default for some time.
>
> Note that setting ARM_INSTRUCTION_SET has no effect unless
> TUNE_FEATURES contains "thumb" (which is controlled by the "t" suffix
> in DEFAULTTUNE, e.g. armv7vehf-neon -vs- armv7vethf-neon, etc) so out
> of tree machine configs may need to update their DEFAULTTUNE to take
> advantage of this change.

I recently ran into some major problems due to thumb vs arm. It turns out g=
libc doesn't support systems with thumb disabled anymore. See this bug repo=
rt for details:

https://sourceware.org/bugzilla/show_bug.cgi?id=3D23031

This might be useful input for this discussion also.

Jef
Disclaimer

This e-mail and its attachments is intended only for the person(s) or entit=
y to which it is addressed. If you receive this e-mail by mistake, please d=
elete this e-mail from your system and destroy all copies of it. It may con=
tain confidential and/or privileged information. You should not copy it or =
use it for any purpose nor disclose its contents to any person unless allow=
ed by a written document between the sender and the addressee.

