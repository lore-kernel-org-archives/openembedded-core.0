Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9B7B8610F5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 22:54:49 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id h3so3295207igd.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 15:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=cHk0NYcQ2Mt2eo5t54JA//YOEBAiEk0NyF8EDQ2GF+M=;
	b=hrbuhZCVXqfVtBko/5ljjWLsD0UefDU/ZRvBPohM2n+4pmjVaOIi4KgEisEp4+ft5J
	vXyK3g5OKN9YmAfKacq256rN1RYuRtXDP3bIAt8Woi/w0Bv86hDZqzgJFH4Cve2HxzLL
	5eTM3DmSNRZvQk9l9u4LHULm/idiqC+4UGAh7o0muubgt6RQnF5x+dGoHNF9/3wtAJfc
	gOD69MDFKPjk2r8/nju5X8d4LgfKKFoHA75l3QR6lcvlpUzRXBo3UbpNwlMHQIYS4fif
	IR6xNAfUL0Pm6eY/eDcz3L9N0ZkCIRTWH+IkLJfNkDlTYUjdJoZLYUngNEIUVcH0h93D
	1NmQ==
X-Received: by 10.50.43.225 with SMTP id z1mr11677246igl.17.1407970491346;
	Wed, 13 Aug 2014 15:54:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.126.103 with HTTP; Wed, 13 Aug 2014 15:54:21 -0700 (PDT)
In-Reply-To: <53EBD780.9060005@mlbassoc.com>
References: <53EBD780.9060005@mlbassoc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Aug 2014 15:54:21 -0700
Message-ID: <CAMKF1sq3urKBFvQpb8H3NrX5HGBgP6ZbTmw6fJJ5J22mQrr4xg@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: GCC 4.9 considered evil
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
X-List-Received-Date: Wed, 13 Aug 2014 22:54:52 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 13, 2014 at 2:24 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> I've found that the latest GCC doesn't work very well, at
> least not on ARM (and obviously other architectures as well [1])
> When I build Google Chromium browser for my i.MX boards using
> GCC-4.9.x, no pages can be rendered - massive bloodshed and
> failures are shown on the console.  If I use the older GCC 4.8.2,
> everything else the same, all is well.
>
> Here's my configuration:
> BB_VERSION        = "1.23.1"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Ubuntu-13.10"
> TARGET_SYS        = "arm-amltd-linux-gnueabi"
> MACHINE           = "teton-p0382"
> DISTRO            = "amltd"
> DISTRO_VERSION    = "1.6+snapshot-20140812"
> TUNE_FEATURES     = "arm armv7a vfp neon callconvention-hard cortexa9"
> TARGET_FPU        = "vfp-neon"
> meta              = "master:86afd7eb7c679eb065706137f28f44248f3fbc5a"
> meta-amltd        = "master:899529b4184dc9e3e291e7fcdbbf157233db056d"
> meta-teton-imx6-p0382 = "master:9188e2f8fafd203c95dcd7a3c79cb38a1568e9b5"
> meta-fsl-arm      = "master:b0cf5c78c5f98c5977ae556d331e7495648f154c"
> meta-fsl-arm-extra = "master:12e560967b7136222c325d11633295fe3a0c701c"
> meta-browser      = "master:da93c8e386133a15eff1414d9307c8f2c7a44787"
>
> Should this be filed as a bug?  I don't have much data other than it
> simply breaks (and chrome is not the easiest thing to debug!).  Other
> applications seem OK, but I am loathe to trust it...

You need to provide more info to get any traction on this. If you can
narrow it down more that will be helpful.

>
> I'm going to hold onto GCC-4.8.x for my $DISTRO at least (and I hope
> it doesn't vanish like 4.7.x did too quickly).
>
> [1]
> http://slashdot.org/story/14/07/27/1838219/linus-torvalds-gcc-490-seems-to-be-terminally-broken
>

thats probably unrelated to what you are seeing.

> Note: I've also tried this on qemux86 (a totally different
> architecture) and chrome bombs just as badly!
>
> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

