Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
	[209.85.167.53])
	by mail.openembedded.org (Postfix) with ESMTP id 50FA26C498
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Jan 2019 17:25:00 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id l10so14013044lfh.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Jan 2019 09:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xhuQ2nqsgAz+8aB1I4kmoFpcyjw7QaknVvWdPNmuT0o=;
	b=eHTLmqDPPSFzHTzfl2jCJ6NIs3kmBMzaRDIrl5bsjFdou/9crfDQlA4Kp0DNkHxDlF
	0MDdiOFZ+8zP6JvtpKlsliKEMGX/XVT7JCJWBa1a2sqUTKjtIT8aPsnC5Orh/69KvnZG
	/PFs3dWqKkns3UAKB6P3GBSqsWOU9ZZPry9t9e8N6qb9NiV4Te7hxrx17hGdWIDilo3w
	JUKlUHBNQmBfAyx1n02reggA6pF4twrjTmMqP+uxJ2ov6/CzUyyn0iAol/dw236GGSxq
	19YquS6DbS/n8ffk9W1RHq6wmXkf/qgkX3cOUkZFyDUjBOVtOqQdGSgK2sYstfd4/kmT
	99sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xhuQ2nqsgAz+8aB1I4kmoFpcyjw7QaknVvWdPNmuT0o=;
	b=J2ID2OM3rZy9qr3R/I544BBkevRL29aBlCXEXv4GtB6KCamkWjQo5NaGF5Jp30Prgh
	xLAIjpTGVfNz8fi9U/vSOiDR0mGLSfDKjb+XgMSpZQocIKfXHy1y7Mra8wSbbKR7J9aa
	lv7PyuJUp938XKxBY7dgLbil41p6E7sm/2m+0Bdi1SN099qQv4vi7vajka2uN9SWxhii
	TjkMFb3SqgyPnMxTqY/Gtk6lDaGZ0Ff+tqZgUbfHc0rQgFo2aPQkCx1GdOI+1X0N4AG+
	t/QHeR45B1+o+PN/rfu0rMfqlOijYHP5ETXPuwrapUkGVk2Ih+/vTMn/A5Cf+m/n0iIf
	44Zw==
X-Gm-Message-State: AJcUukdf3hv/7NPruNvOtJBXq3/z7GpCOCNYQFaiZh8oVvmHUaQ0OL3f
	R5+Oarer1JV/7y36K8b9K3SBE+dGQrI+VkhTM4M=
X-Google-Smtp-Source: ALg8bN52vB0fSeq2ZCt3tder7vPYh8FWZF/TPDuobah2IllxvNOKr8px4crWDX+gyk6TUTpbr2MIerxZtFCQac4GKzU=
X-Received: by 2002:a19:c18d:: with SMTP id r135mr10874568lff.59.1547400300189;
	Sun, 13 Jan 2019 09:25:00 -0800 (PST)
MIME-Version: 1.0
References: <cover.1547316462.git.bruce.ashfield@windriver.com>
	<a5bbd32ecd957f036a9b1e47cc4e3c813d206111.1547316462.git.bruce.ashfield@windriver.com>
	<CAMKF1sokO=RakSBuZy-o4cMBB5EYzDrEJ+R7ZtfzyddNaxqKQw@mail.gmail.com>
	<230139f6-ad04-7033-5da8-3617b8a7a6a9@windriver.com>
	<CAMKF1srt-KM61LaOmvorNY8SvQ98dAB36-HmMz0b3Zym1gMudA@mail.gmail.com>
In-Reply-To: <CAMKF1srt-KM61LaOmvorNY8SvQ98dAB36-HmMz0b3Zym1gMudA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Sun, 13 Jan 2019 09:24:26 -0800
Message-ID: <CAKmqyKMyqXnY3Cpmg4-_pz5WDCf3N_-obBvOKnyu=ETpQ2m2rA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] linux-yocto/4.19: introduce qemuriscv64 and qemuarma15 BSP definitions
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
X-List-Received-Date: Sun, 13 Jan 2019 17:25:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 12, 2019 at 12:18 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sat, Jan 12, 2019 at 10:45 AM Bruce Ashfield
> <bruce.ashfield@windriver.com> wrote:
> >
> > On 2019-01-12 1:34 p.m., Khem Raj wrote:
> > > On Sat, Jan 12, 2019 at 10:14 AM Bruce Ashfield
> > > <bruce.ashfield@windriver.com> wrote:
> > >>
> > >> Incorporating the BSP definitions for two new qemu targets.
> > >>
> > >> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > >> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> > >> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> > >> ---
> > >>   meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   |  4 ++--
> > >>   meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb |  6 +++---
> > >>   meta/recipes-kernel/linux/linux-yocto_4.19.bb      | 18 +++++++++---------
> > >>   3 files changed, 14 insertions(+), 14 deletions(-)
> > >>
> > >> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> > >> index cdcdff2e1746..f823683526ee 100644
> > >> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> > >> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> > >> @@ -11,8 +11,8 @@ python () {
> > >>           raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
> > >>   }
> > >>
> > >> -SRCREV_machine ?= "bd456d13d8bea4c416209a59f9e0bf50f8511c47"
> > >> -SRCREV_meta ?= "ced14887c323f1cb6b3befe2b29e471e8fee1bc6"
> > >> +SRCREV_machine ?= "78404e3a73613f8e07c276e55112989f897cdd04"
> > >> +SRCREV_meta ?= "096c8bd3bd11801f95683bbe4bcc885a2318f51d"
> > >>
> > >>   SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
> > >>              git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
> > >> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
> > >> index 89c4b9f14d4c..0a79f442a075 100644
> > >> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
> > >> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
> > >> @@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
> > >>   KMETA = "kernel-meta"
> > >>   KCONF_BSP_AUDIT_LEVEL = "2"
> > >>
> > >> -SRCREV_machine_qemuarm ?= "b8f2e8e00f8ddbdf5d7d7614c14eab52f8ee9275"
> > >> -SRCREV_machine ?= "e727c70583a78cf1dc53e8e219722e2f9d1bc858"
> > >> -SRCREV_meta ?= "ced14887c323f1cb6b3befe2b29e471e8fee1bc6"
> > >> +SRCREV_machine_qemuarm ?= "2594d14d76ae2c49ad43b626662fe53da807ddca"
> > >> +SRCREV_machine ?= "1114697c04b9699112e78dd8fc6ec849609ca1cb"
> > >> +SRCREV_meta ?= "096c8bd3bd11801f95683bbe4bcc885a2318f51d"
> > >>
> > >>   PV = "${LINUX_VERSION}+git${SRCPV}"
> > >>
> > >> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
> > >> index bf4fec71d86c..f410cc8cdb31 100644
> > >> --- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
> > >> +++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
> > >> @@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "v4.19/standard/base"
> > >>   KBRANCH_qemux86-64 ?= "v4.19/standard/base"
> > >>   KBRANCH_qemumips64 ?= "v4.19/standard/mti-malta64"
> > >>
> > >> -SRCREV_machine_qemuarm ?= "ec8e55a97ad8a88107c5af069ece1b7f203f4ac4"
> > >> -SRCREV_machine_qemuarm64 ?= "e727c70583a78cf1dc53e8e219722e2f9d1bc858"
> > >> -SRCREV_machine_qemumips ?= "3b5fba0207a870c1de76c5dd80d8d3c0e42aa1cf"
> > >> -SRCREV_machine_qemuppc ?= "e727c70583a78cf1dc53e8e219722e2f9d1bc858"
> > >> -SRCREV_machine_qemux86 ?= "e727c70583a78cf1dc53e8e219722e2f9d1bc858"
> > >> -SRCREV_machine_qemux86-64 ?= "e727c70583a78cf1dc53e8e219722e2f9d1bc858"
> > >> -SRCREV_machine_qemumips64 ?= "d21ff98864241c971c7a42a3c4f1eb940b9b8855"
> > >> -SRCREV_machine ?= "e727c70583a78cf1dc53e8e219722e2f9d1bc858"
> > >> -SRCREV_meta ?= "ced14887c323f1cb6b3befe2b29e471e8fee1bc6"
> > >> +SRCREV_machine_qemuarm ?= "8b378ac8aca51207085c8df616a6fe56af19f0b4"
> > >> +SRCREV_machine_qemuarm64 ?= "1114697c04b9699112e78dd8fc6ec849609ca1cb"
> > >> +SRCREV_machine_qemumips ?= "58f59c2213a657515a158379db153ad618986235"
> > >> +SRCREV_machine_qemuppc ?= "1114697c04b9699112e78dd8fc6ec849609ca1cb"
> > >> +SRCREV_machine_qemux86 ?= "1114697c04b9699112e78dd8fc6ec849609ca1cb"
> > >> +SRCREV_machine_qemux86-64 ?= "1114697c04b9699112e78dd8fc6ec849609ca1cb"
> > >> +SRCREV_machine_qemumips64 ?= "6f56a58c214379efe8949da6921b1c00c2af353a"
> > >> +SRCREV_machine ?= "1114697c04b9699112e78dd8fc6ec849609ca1cb"
> > >> +SRCREV_meta ?= "096c8bd3bd11801f95683bbe4bcc885a2318f51d"
> > >
> > > Dont we need qemuriscv64 locks here too ?
> >
> > Not until the machine is in oe-core and there's something I can test.
> > Right now, it is just the meta-data.
>
> fair enough. I guess that falls on either Alistrair or myself :)

Working on it! Waiting for an improved boot loader.

Alistair

> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

