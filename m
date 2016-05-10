Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id E4F84700F3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 15:36:36 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id yl2so1124526pac.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 08:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=EU2w0UPwHwTUDfLq+7AxQoxFbscXYTnhgc9OVbII3qY=;
	b=x42WfxDfvYv7yC+S1VTZIsZEiDR2qHKrfBWRcPmi+v97BZ5m8MMigAmnRRsbqoN+Ab
	BbfinHPfl9UufqInYh/CpPTG/WsmrhQJe48Bfm4OYiMXJf+6yH8YGf9HlgTi3qJm8BAE
	1NYnqt6ThdAyF/SeqTDFCfjBxHrJ1VAG0/7v+ymi8Qc40Eonr480VxdvaqH/e+eWFDXY
	niWYJXpuPvzWuBO27ZFX8cYsqrCa43GJXWUZq+uaNEo/svTkMz2MNCwPrQUT3bvzw95p
	q6By7gFro6WN9C+/Z6ihzCVDs56mv5TNDlJ/x3Ud5gaJQEujL1AqgTrDYPrEjinR57qe
	8U6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=EU2w0UPwHwTUDfLq+7AxQoxFbscXYTnhgc9OVbII3qY=;
	b=HBVLtWGRi808rBBbu54SvkPMenoJZIN2UznJFi+IDnhHPnq9mSv9BzowTZH+r1asyj
	W3wVN231hxdF0xkfQh5zrnnZM3dUOjWfXJC45lDgsLYi0fnT/bXJy7+y6tFqTxx3uRcQ
	9XQselFm4aN+cyKgr+VhNaHdyDoffrAudSBvpTD/XFWZ/eKJqOPS09jWkKBxkcoAvGoB
	bOoep35wjuF3ZulZkt78noX94ZamKjiPx9Jym/LyleYL8SMI2ITqKyF3LBtfkfVVDC0k
	BuJg4VLmDXlOrRnUGY9l3YR1GEwmp09hL8uAoDXT2ZpAPopAG/ZbCF36xOKIxar+UUGL
	1ORA==
X-Gm-Message-State: AOPr4FVmtQ53B7z3YJZ/i2XLD23yycOv/ewwXp2k6qWTJY8jg20uw01msOqI8xbQmd2BUA==
X-Received: by 10.66.164.68 with SMTP id yo4mr32970851pab.157.1462894597217;
	Tue, 10 May 2016 08:36:37 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:bcb8:adbb:cb97:70db?
	([2601:202:4000:1239:bcb8:adbb:cb97:70db])
	by smtp.googlemail.com with ESMTPSA id
	u127sm5374636pfb.82.2016.05.10.08.36.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2016 08:36:35 -0700 (PDT)
To: Bruce Ashfield <bruce.ashfield@windriver.com>,
	richard.purdie@linuxfoundation.org
References: <cover.1462383941.git.bruce.ashfield@windriver.com>
	<fe6fd22aae19a4723616d4b712c7105151315318.1462383941.git.bruce.ashfield@windriver.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <57320003.40509@gmail.com>
Date: Tue, 10 May 2016 08:36:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <fe6fd22aae19a4723616d4b712c7105151315318.1462383941.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 10/11] linux-yocto/4.4: bump to v4.4.8
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
X-List-Received-Date: Tue, 10 May 2016 15:36:38 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 05/04/2016 10:53 AM, Bruce Ashfield wrote:
> Integrating the korg -stable releases.

shouldn't LINUX_VERSION ?= "4.4.3" be LINUX_VERSION ?= "4.4.8" ??

- Armin

> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  2 +-
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  2 +-
>  meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 16 ++++++++--------
>  3 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
> index 89c6fff5a4b6..5b509940b5ca 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
> @@ -2,7 +2,7 @@ KBRANCH ?= "standard/preempt-rt"
>  
>  require recipes-kernel/linux/linux-yocto.inc
>  
> -SRCREV_machine ?= "fcabc089b516e760d00a066893f9772d1535785c"
> +SRCREV_machine ?= "4da435e403bbe6dd8fbc5cdda4411cb6afe72053"
>  SRCREV_meta ?= "9ab4787fe2aea2ae0fcc31a5e067eaba19ef64c8"
>  
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
> index 345e2d577889..b094143c9c07 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
> @@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.4.3"
>  KMETA = "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL = "2"
>  
> -SRCREV_machine ?= "076cc85486fda808582bd1e77400a5c49dea3e2e"
> +SRCREV_machine ?= "b18090556c1d1b449233cd555c27a04d38272d6d"
>  SRCREV_meta ?= "9ab4787fe2aea2ae0fcc31a5e067eaba19ef64c8"
>  
>  PV = "${LINUX_VERSION}+git${SRCPV}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> index f02e0189f21f..b74903ee8aef 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> @@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
>  KBRANCH_qemux86-64 ?= "standard/base"
>  KBRANCH_qemumips64 ?= "standard/mti-malta64"
>  
> -SRCREV_machine_qemuarm ?= "1882e842bd477d8a4de02e304a13d230b597d142"
> -SRCREV_machine_qemuarm64 ?= "076cc85486fda808582bd1e77400a5c49dea3e2e"
> -SRCREV_machine_qemumips ?= "3d1402582cd48731ccfaec497dd9296a59cda386"
> -SRCREV_machine_qemuppc ?= "076cc85486fda808582bd1e77400a5c49dea3e2e"
> -SRCREV_machine_qemux86 ?= "076cc85486fda808582bd1e77400a5c49dea3e2e"
> -SRCREV_machine_qemux86-64 ?= "076cc85486fda808582bd1e77400a5c49dea3e2e"
> -SRCREV_machine_qemumips64 ?= "6519e6317cc72e380bc1b7543e614ac0032a80ae"
> -SRCREV_machine ?= "076cc85486fda808582bd1e77400a5c49dea3e2e"
> +SRCREV_machine_qemuarm ?= "1394eb1f0a1988da223dfc93304222f4543d19c3"
> +SRCREV_machine_qemuarm64 ?= "b18090556c1d1b449233cd555c27a04d38272d6d"
> +SRCREV_machine_qemumips ?= "6a063a7239fd16e7a796ce4876e8677d5d02e8cc"
> +SRCREV_machine_qemuppc ?= "b18090556c1d1b449233cd555c27a04d38272d6d"
> +SRCREV_machine_qemux86 ?= "b18090556c1d1b449233cd555c27a04d38272d6d"
> +SRCREV_machine_qemux86-64 ?= "b18090556c1d1b449233cd555c27a04d38272d6d"
> +SRCREV_machine_qemumips64 ?= "3a1c6d7576908a2dd21746b1d4ab4f43b83cd824"
> +SRCREV_machine ?= "b18090556c1d1b449233cd555c27a04d38272d6d"
>  SRCREV_meta ?= "9ab4787fe2aea2ae0fcc31a5e067eaba19ef64c8"
>  
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
> 

