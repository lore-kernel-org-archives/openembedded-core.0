Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 4D1176FEFE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 17:14:07 +0000 (UTC)
Received: from poczta.nazwa.pl (unknown [10.252.0.11])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id B4C641B27B1;
	Fri, 12 Feb 2016 18:14:06 +0100 (CET)
Date: Fri, 12 Feb 2016 18:14:06 +0100 (CET)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Reply-To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org, 
	Dmitry Rozhkov <dmitry.rozhkov@intel.com>
Message-ID: <548649854.435770.1455297246525.JavaMail.open-xchange@ox1.netart.com.pl>
In-Reply-To: <1455279342-5458-1-git-send-email-dmitry.rozhkov@intel.com>
References: <1455279342-5458-1-git-send-email-dmitry.rozhkov@intel.com>
MIME-Version: 1.0
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.6.2-Rev33
X-Originating-Client: com.openexchange.ox.gui.dhtml
Subject: Re: [PATCH] os-release: remove double-quotes around VERSION_ID value
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
X-List-Received-Date: Fri, 12 Feb 2016 17:14:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

> Dnia 12 luty 2016 o 13:15 Dmitry Rozhkov <dmitry.rozhkov@intel.com>
> napisa=C5=82(a):
>
>
> man 5 os-release states that VERSION_ID is
>
> "
> a lower-case string (mostly numeric, no spaces or other
> characters outside of 0-9, a-z, ".", "_" and "-")
> identifying the operating system version
> "
>
> This becomes crucial when ClearLinux's software
> update mechanism is integrated into builds, because
> its client side ignores VERSION_ID's value if it
> doesn't conform the definition.

Is this integration work already published somewhere? I'm interested
in trying out swupdate with Yocto, but the lack of publicly available
repo is kind of holding this back (yes, I'm ware of SRPMs).

When I was asking on the mailing list about Yocto and ClearLinux back
in January[1][2] Arjan responded that there was a mismatch between the
development models used by Clear and Yocto and that there was a number
of reasons for not using Yocto tooling in Clear. Now, I'm still
interested in getting swupdate to work outside of Clear, so I took
some time to go through the source code to figure out the update
mechanism[3]. IMO making it work with Yocto should not be a
significant effort, even in embedded applications.

Do you mind sharing the some details if there is a larger plan for
getting Clear closer to Yocto/OE?

[1]. https://lists.clearlinux.org/pipermail/dev/2016-January/000150.html
[2]. https://lists.clearlinux.org/pipermail/dev/2016-January/000151.html
[3]. https://lists.clearlinux.org/pipermail/dev/2016-January/000159.html

--
Maciej Borz=C4=99cki
Senior Software Engineer at Open-RnD Sp. z o.o.
www.open-rnd.pl, Facebook, Twitter

