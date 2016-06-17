Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6D13365CB6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 02:38:11 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id k184so15387697wme.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 19:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3c6WqPHDw+DGN5bud+Oee5ZqcIswwYBz7ew/xqr/AQQ=;
	b=gXvO3rXZDf4/gR9f3IF35JA4X0dnT+MaRvYaCCpo3Bd2X1iBMjCNVjLIn+4MOGNFh/
	Yld47t46pKyhhUgQ2OK1BsjPtINozu2op7J6s+TDnHei2u6idmUWlJUakN5TCaFwiTMX
	7CPYA2iKDYoNI4wwtV9aMfMiCB8EkA5NsSyd8i9KkJR+3YnMZh/BFurFKHPBSumgRC6i
	z03Oi0PKkQz8mzVGTJLBxpIp7tyBsBdMT+9Nn2zMSJIm5lgXEEn1Eq6FsY4Z1Ann8blE
	VG0IK/gdwNXuAqKZro/OK7xFdsdYN+RahxkzeJx8KrUInST6cQqc7DkqdSNDpjLe95W3
	K7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3c6WqPHDw+DGN5bud+Oee5ZqcIswwYBz7ew/xqr/AQQ=;
	b=J1/GVFaiD1iCb+Q5VF/aFW7kzebcShwKCOsBk+UeeECdK3QzqnEfAVAWEzU9xoDvrS
	F8BEou/AOapKN9/LUXDpJp0y/wYoDiOh2yYwoGE2R4opXDDCln5ftZ7DrUHnFJjQGOHV
	8rV55Xo9w+YHnHkzY40EU6gp2cU+/hCjtSM5I6A7CrOI4OnlYlMmoSePczF86hkKuHzF
	pj25nKGHPlL0205lty+mAP3x/g51m5/QZsviDmzP+Xkm9nPlGCo/SkcbpFCWJAB9LTWk
	ULL3sS8cXkLO5cD8q2/SaRM9ce+oFXlftuvKhzMuDJUt9dlhZmoRweB9Ij2O/JxqCLTO
	Rlqg==
X-Gm-Message-State: ALyK8tLCyUn+CGJCMixVB+WgAN3GsfQeltxUR0vyMM9Imhzv4ZpE66F4RC0pLhLxTy92J5hIE/b2hs85Rr43yg==
X-Received: by 10.28.223.215 with SMTP id w206mr17801157wmg.61.1466131091089; 
	Thu, 16 Jun 2016 19:38:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.6.165 with HTTP; Thu, 16 Jun 2016 19:38:10 -0700 (PDT)
In-Reply-To: <1466074764-14109-3-git-send-email-alexander.kanavin@linux.intel.com>
References: <1466074764-14109-1-git-send-email-alexander.kanavin@linux.intel.com>
	<1466074764-14109-3-git-send-email-alexander.kanavin@linux.intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 16 Jun 2016 19:38:10 -0700
Message-ID: <CAJ86T=WziMrSqVgrqV-M5OhEUtMTkHaepk=XEzOzVYTXpUrmxg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] security_flags.inc: add -fPIC to SECURITY_NO_PIE_CFLAGS
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
X-List-Received-Date: Fri, 17 Jun 2016 02:38:11 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 16, 2016 at 3:59 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> The packages that break due to -fpie can be still built with -fPIC.
>
> [YOCTO #9486]
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/conf/distro/include/security_flags.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
> index a7be185..26804bd 100644
> --- a/meta/conf/distro/include/security_flags.inc
> +++ b/meta/conf/distro/include/security_flags.inc
> @@ -13,7 +13,7 @@ lcl_maybe_fortify = "${@base_conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE
>  SECURITY_STRINGFORMAT ?= "-Wformat -Wformat-security -Werror=format-security"
>
>  SECURITY_CFLAGS ?= "-fstack-protector-strong -pie -fpie ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
> -SECURITY_NO_PIE_CFLAGS ?= "-fstack-protector-strong ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
> +SECURITY_NO_PIE_CFLAGS ?= "-fPIC -fstack-protector-strong ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"

I don't think this does anything useful. An executable won't be
position independent unless -pie is passed to the linker, so if
linking with -pie doesn't work, forcing all object code to be position
independent is just adding overhead with no benefit.

>  SECURITY_LDFLAGS ?= "-fstack-protector-strong -Wl,-z,relro,-z,now"
>  SECURITY_X_LDFLAGS ?= "-fstack-protector-strong -Wl,-z,relro"
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

