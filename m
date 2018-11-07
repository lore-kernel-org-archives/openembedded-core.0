Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id A43A478F72
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Nov 2018 16:56:41 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id e11so20420118itl.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Nov 2018 08:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=F+vMvljrt7ECIzRsu69aAnz6E3d46J6CBLZt4EbsVqg=;
	b=iEOUCXjlDPDOExXRGiTsn2BTRWGLP/W5qtB2/uFE2TVRd7A8UGezUcjfLEwRpOcJ03
	4c5W2IUeyInHoyU4FbqOFR3pzAlHudtT8zxDTGF0A1/42lb+qTc4z/QNnplx442UECFf
	6yIK4QghLg6nOgeZk0BXxi7PWCUKwVv+2dVSQco3Ye6voDg9r+mTlNRz9wRuYKXTqapz
	JvI2x0XcwfzY7gLlPe4DAJ9Kj4DxcrQWemUD/7mq9WyV+A9rBUmPp9W75gKB29no8CRc
	PHW/ztyOyGdfZxWdhg4TMInv95USq1NhhIBuTnKGODtZ3WTc7+6Yn3ebRzbMIP9Fu38u
	/NqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=F+vMvljrt7ECIzRsu69aAnz6E3d46J6CBLZt4EbsVqg=;
	b=q83zJo8PtbUuNE6HRQhajir783h5akzOVruMAguRdhZhG8B+PRWYZD1vVEqpbLhteB
	+Joz3RGmCcww8i1SahYz/qextbicEdIJEC3JgwIJoOZyAR6GBrGkaF0hwHBdPGBtbTFy
	Veh/UjNPsDyYaoka4Q5vyZrJe++zmIX+aESgS4vSDy97q6hdpg2wbeRaZEbJNBFmlaa3
	MRB+R7XxyEOaMQqKyfVa7yhHbF2aoSTMJ0Ua45aMxGhE/BUckhwh94Zrvub6zYVIu+9z
	2a2iT1mfAu1Yb2RqBUqto6YGKgycwOVZucJNVnpmLcNp3xpnzO8AD1GoXjZY2Gsi/2H7
	x0ng==
X-Gm-Message-State: AGRZ1gIpMOxAoraVSFq55fY858ycRRoRK7cZb/zdwGegBKdIL5uip8Yr
	4zhokZwYjEAQWORDo3rAKF0l50CxD8m7TlaxeSudiPlViD0=
X-Google-Smtp-Source: AJdET5cneVD8ptsVVQydUeIV0SmN2HKdSWWFk06+YEtgCFT8Ja7XmX9+xzADVDYW49wnqmGbcq1fiJg7k4G9MdZ1FX4=
X-Received: by 2002:a24:1d8e:: with SMTP id 136-v6mr843174itj.62.1541609802664;
	Wed, 07 Nov 2018 08:56:42 -0800 (PST)
MIME-Version: 1.0
References: <20181107155601.32065-1-deuteros76@gmail.com>
In-Reply-To: <20181107155601.32065-1-deuteros76@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 7 Nov 2018 16:56:30 +0000
Message-ID: <CAJTo0LYJBwTfxdvG1gxj9skCts9LsY-wUk_z0k0euJns=XLa9g@mail.gmail.com>
To: deuteros76@gmail.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Fix header files to compile libgpg-error-native on ppc64le Power8 build machine
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
X-List-Received-Date: Wed, 07 Nov 2018 16:56:41 -0000
Content-Type: text/plain; charset="UTF-8"

The identical patch by Serhey Popovych is queued for master right now.

Ross
On Wed, 7 Nov 2018 at 15:57, Guillermo Amat <deuteros76@gmail.com> wrote:
>
> Using a ppc64le build machine the following error occurs when compiling libjpg-error-native
>
> cp: cannot stat '/home/ubuntu/Yocto/build-ppc64/tmp/work/ppc64le-linux/libgpg-error-native/1.32-r0/libgpg-error-1.32/src/syscfg/lock-obj-pub.ppc64le-unknown-linux-gnu.h': No such file or directory
> ---
>  meta/recipes-support/libgpg-error/libgpg-error_1.32.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb
> index 4f3e3d8..1a8c1dc 100644
> --- a/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb
> +++ b/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb
> @@ -48,6 +48,8 @@ do_compile_prepend() {
>           mips*el)    TUPLE=mipsel-unknown-linux-gnu ;;
>           mips*)      TUPLE=mips-unknown-linux-gnu ;;
>           x86_64)     TUPLE=x86_64-unknown-linux-gnu ;;
> +          ppc64le) TUPLE=powerpc64le-unknown-linux-gnu ;;
> +          ppc64) TUPLE=powerpc64-unknown-linux-gnu ;;
>           *)          TUPLE=${TARGET_ARCH}-unknown-linux-gnu ;;
>         esac
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

