Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id 61F2E7C039
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jan 2019 02:42:40 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id v11so6842882qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2019 18:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=5dpN39Hi27itWAy/Ok7qSMjEzKEoaeAbbqqipt93EAg=;
	b=f/XQsesjDGR4QrLD9D3fE/Pma97W425XkPA1bs7kRXeTASt73D2ac4o4qkPnRIwCBS
	4ehVMTJUqooOvX6cTsfU0QMP9OX4clo4QUeYqNgPEEWv3FH+3vwumHpqM2zUMzLuqJCx
	eJjaGd3MLyJlok0j7o0ELMMKAg6iblVkaEcEi28A9Blc5eiUVrhYh9T4ILYPc17z3sZe
	5HMQsDrpiwIJfDZ7iqbapbvIP50vsIYbXrWxgvXig6JT1kbmmJGvrX1/WYZaaWUeo8iX
	FGTs5PHffbj99v7T22jjhk39w3kIM3KvqD0LV60rXlhcpHzuLI5RWMmcylgU6Fd9ZMNA
	633g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=5dpN39Hi27itWAy/Ok7qSMjEzKEoaeAbbqqipt93EAg=;
	b=svOYr9WFNnb9Kkk/MzmDZIa0/5hoqJ0AoFkWM+fZs7j3IRCzG4JDmq/Kh5Mwdnmutc
	kBqAXwh76XJTR0/0oNApQkN3nEkNxErTULfqqAtFtmEWOftb/G7pBepbPlkWCZ3eOwN8
	/lPcXL5WTw8gwbqvttDycOoCF6LRVrFRV2wwoSJkyzJC6tKbTpmYYbJLCkwCNXCuCORX
	PRkP861QBsHtXxNJ5TRGGSlYPhGuhiSfLmBBflJasIwadqqukNfxAO4kkcaEwGSuia8J
	K3QYZVnaTDVhp/SqfmsyaPVHlpmumw3mHJslYV/RfCYH5RpD9gvtgTHekSKE3ej+FrmX
	A32A==
X-Gm-Message-State: AJcUuke/jNjrRHekWuJFlDh6PdWWKxiredTr/9J0Efh7lswSXXwwCSKj
	j1tthJ/yHv45KG3dWr+K9HgOh7pYB7bG/USQ4Y8gxOSE
X-Google-Smtp-Source: ALg8bN5qLlbVq1HA13KT7FvF59lWDTMPZpDRGoxwIfSJsp+CQ0AJFHQu73o7DPWfRwUBLY2s7Hcl45VGoQ74ZCVzAMA=
X-Received: by 2002:ad4:41d0:: with SMTP id a16mr4061336qvq.55.1547001760940; 
	Tue, 08 Jan 2019 18:42:40 -0800 (PST)
MIME-Version: 1.0
References: <20190109000907.7647-1-alistair.francis@wdc.com>
In-Reply-To: <20190109000907.7647-1-alistair.francis@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Jan 2019 18:42:14 -0800
Message-ID: <CAMKF1soxG5DZOBt5S+uMEjU=zp1Mqbteom_8k5TKLoy5FVoLhQ@mail.gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer: Add RISC-V support
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
X-List-Received-Date: Wed, 09 Jan 2019 02:42:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 8, 2019 at 4:19 PM Alistair Francis
<Alistair.Francis@wdc.com> wrote:
>
> Backport RISC-V support from master Gstreamer.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  ...stconfig.h.in-initial-RISC-V-support.patch | 28 +++++++++++++++++++
>  .../gstreamer/gstreamer1.0_1.14.4.bb          |  3 ++
>  2 files changed, 31 insertions(+)
>  create mode 100644 meta/recipes-multimedia/gstreamer/files/0002-gstconfi=
g.h.in-initial-RISC-V-support.patch
>
> diff --git a/meta/recipes-multimedia/gstreamer/files/0002-gstconfig.h.in-=
initial-RISC-V-support.patch b/meta/recipes-multimedia/gstreamer/files/0002=
-gstconfig.h.in-initial-RISC-V-support.patch
> new file mode 100644
> index 0000000000..8d8f8dca00
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/files/0002-gstconfig.h.in-initial=
-RISC-V-support.patch
> @@ -0,0 +1,28 @@
> +From 8a156d1725ecd03f2e8cdc8874e081dda2d3b43d Mon Sep 17 00:00:00 2001
> +From: Aurelien Jarno <aurelien@aurel32.net>
> +Date: Sun, 15 Apr 2018 00:49:55 +0200
> +Subject: [PATCH] gstconfig.h.in: initial RISC-V support
> +
> +RISC-V supports unaligned accesses, but these might run extremely slowly
> +depending on the implementation. Therefore set GST_HAVE_UNALIGNED_ACCESS
> +to 0 on this architecture.
> +
> +https://bugzilla.gnome.org/show_bug.cgi?id=3D795271
> +Upstream-Status: Accepted [1.15.1 - https://bugzilla.gnome.org/show_bug.=
cgi?id=3D795271]
> +---
> + gst/gstconfig.h.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/gst/gstconfig.h.in b/gst/gstconfig.h.in
> +index 6351c04da..33dfed1f6 100644
> +--- a/gst/gstconfig.h.in
> ++++ b/gst/gstconfig.h.in
> +@@ -104,7 +104,7 @@
> +  * http://docs.oracle.com/cd/E19205-01/820-4155/c++_faq.html#Vers6
> +  * https://software.intel.com/en-us/node/583402
> +  */
> +-#if defined(__alpha__) || defined(__arc__) || defined(__arm__) || defin=
ed(__aarch64__) || defined(__bfin) || defined(__hppa__) || defined(__nios2_=
_) || defined(__MICROBLAZE__) || defined(__mips__) || defined(__or1k__) || =
defined(__sh__) || defined(__SH4__) || defined(__sparc__) || defined(__spar=
c) || defined(__ia64__) || defined(_M_ALPHA) || defined(_M_ARM) || defined(=
_M_IA64) || defined(__xtensa__) || defined(__e2k__)
> ++#if defined(__alpha__) || defined(__arc__) || defined(__arm__) || defin=
ed(__aarch64__) || defined(__bfin) || defined(__hppa__) || defined(__nios2_=
_) || defined(__MICROBLAZE__) || defined(__mips__) || defined(__or1k__) || =
defined(__sh__) || defined(__SH4__) || defined(__sparc__) || defined(__spar=
c) || defined(__ia64__) || defined(_M_ALPHA) || defined(_M_ARM) || defined(=
_M_IA64) || defined(__xtensa__) || defined(__e2k__) || defined(__riscv)
> + #  define GST_HAVE_UNALIGNED_ACCESS 0
> + #elif defined(__i386__) || defined(__i386) || defined(__amd64__) || def=
ined(__amd64) || defined(__x86_64__) || defined(__ppc__) || defined(__ppc64=
__) || defined(__powerpc__) || defined(__powerpc64__) || defined(__m68k__) =
|| defined(_M_IX86) || defined(_M_AMD64) || defined(_M_X64) || defined(__s3=
90__) || defined(__s390x__) || defined(__zarch__)
> + #  define GST_HAVE_UNALIGNED_ACCESS 1
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.4.bb b/m=
eta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.4.bb
> index 232234b888..c3bac1f658 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.4.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.4.bb
> @@ -30,6 +30,9 @@ SRC_URI =3D " \
>  SRC_URI[md5sum] =3D "f67fbbc42bd85a0701df119f52fb52bd"
>  SRC_URI[sha256sum] =3D "f94f6696c5f05a3b3a9183e39c5f5c0b779f75a04c0efa49=
7e7920afa985ffc7"
>
> +SRC_URI_append_riscv64 =3D " file://0002-gstconfig.h.in-initial-RISC-V-s=
upport.patch"
> +SRC_URI_append_riscv32 =3D " file://0002-gstconfig.h.in-initial-RISC-V-s=
upport.patch"
> +

there is nothing riscv specific here. This patch should be applied
unconditionally.

>  PACKAGECONFIG ??=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests',=
 '', d)} \
>                     "
>
> --
> 2.19.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

