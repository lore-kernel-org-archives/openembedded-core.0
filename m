Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <80057c485bdc44beb4e4cd4dc533bb6f8333516d.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v2 1/2] qemu.bbclass: drop OLDEST_KERNEL reference
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Thu, 30 Dec 2021 13:21:04 +0000
In-Reply-To: <3e66c6fb-b376-a292-34b1-70abdc270f41@windriver.com>
References: <20211216114836.964835-1-matt@madison.systems>
	 <20211216114836.964835-2-matt@madison.systems>
	 <3e66c6fb-b376-a292-34b1-70abdc270f41@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Changqing Li <changqing.li@windriver.com>, Matt Madison <matt@madison.systems>, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>, Khem Raj <raj.khem@gmail.com>

On Thu, 2021-12-30 at 16:51 +0800, Changqing Li wrote:
> 
> On 12/16/21 7:48 PM, Matt Madison wrote:
>  
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> > 
> > which is introducing task hash changes for some
> > allarch package builds, and should no longer
> > be needed with recent versions of qemu.
> > 
> > Signed-off-by: Matt Madison <matt@madison.systems>
> > ---
> >  meta/classes/qemu.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
> > index 01a7b86ae1..333202b7c4 100644
> > --- a/meta/classes/qemu.bbclass
> > +++ b/meta/classes/qemu.bbclass
> > @@ -54,7 +54,7 @@ def qemu_run_binary(data, rootfs_path, binary):
> >  # this dance). For others (e.g. arm) a -cpu option is not necessary, since
> > the
> >  # qemu-arm default CPU supports all required architecture levels.
> > 
> > -QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s" %
> > d.getVar('PACKAGE_ARCH')) or ""}"
> > +QEMU_OPTIONS = "${@d.getVar("QEMU_EXTRAOPTIONS_%s" %
> > d.getVar('PACKAGE_ARCH')) or ""}"
> Hi,
> Latest yocto still take "CentOS 7.x" as Supported Linux Distributions. But
> centos7 have kernel version 3.10.
> But we have some archs, like aarch64, set OLDEST_KERNEL to 3.14. Without "-r
> ${OLDEST_KERNEL}",
> some recipes which will run qemu during configure or compile will failed with
> error:
> FATAL: kernel too old
> How about add it back? 
> 

It was removed for a reason and believed to be no longer needed. Which version
of qemu was this with?

Cheers,

Richard



