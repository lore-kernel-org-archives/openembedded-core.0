Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3E94C607A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 14:41:37 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id hh10so3475562pac.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 07:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=W9lCrfPK7eTlFFvOYJ04nh5rQeIWRRy4Uqbag30DcZI=;
	b=g7O9OYBCq4MK0Yh4s3BOj1tHYn5hY+Sx6QQkk8LQfiPSRWgGEWmLBzHx0FkmimkoOj
	QbhNVZtGySogftm1SuRgmsJNV0oNl94MVBqlaSdMeCV0BcpIqbPep3ZUyGTbSkm/CWzo
	+RYrXKPyFeFusuuqbAjb2mu1mfxf5sKcLtT3PzA2VAVFaGrIjMJDLXzm/JDMEbM90z3E
	mEMoBmyVt90DIxV6LCZvXvImemqrkPZ9E1RLmvlVngfKSwrj5heC8fJCCTso9ju3RQ6m
	ZRD7hBOOPlaomvBOMqSx2cK0mjtDAH+WN4mszDwZI4noilatwb1o2UR0KQ6I6urT8fyj
	VBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=W9lCrfPK7eTlFFvOYJ04nh5rQeIWRRy4Uqbag30DcZI=;
	b=XcwwmQNdJcdeyy81OdJYAN7oBpqCdTsHgWeeMJYYhOm2x1+nopiOWuSDih4TydVIV/
	nXnE3Nzy21jYpfzpujjsqUFLQfi7eGu49rJcrxGXPafarc5OS2x/GWFdq2dKT10FmqM1
	cAq7oWMTOMDnKb5uIuWYj2NTeWcEkpHTeroy33GWWnN6IaMcnHIPqpoOS31rdzhAfS2m
	EARaKFxZtymJhVQwgRtD19t1Qv64dlDy89ZTD04syNFARZpnCDk/JRQGQIj7Ur27TYfD
	1luNjpwVOvqs5bxdUBh7m8Wa5opS4zq+3/vnz4IlFdMlGdrpi1Cze3Jg/dqfe+M6OGim
	6Jsw==
X-Gm-Message-State: ALyK8tLDBx+QMdh+WNtPACx5bUmpBqbm9OyEKo2R3F+cmbNEGhBkRVlN6+5FMBXAvzLA1g==
X-Received: by 10.66.52.11 with SMTP id p11mr75530238pao.155.1469025698261;
	Wed, 20 Jul 2016 07:41:38 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:81a:ab00:ca81:5385?
	([2601:202:4001:9ea0:81a:ab00:ca81:5385])
	by smtp.googlemail.com with ESMTPSA id
	3sm5289734pfe.81.2016.07.20.07.41.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Jul 2016 07:41:37 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <1466609398-17634-1-git-send-email-akuster808@gmail.com>
	<1466609398-17634-2-git-send-email-akuster808@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <578F8DA0.3020200@gmail.com>
Date: Wed, 20 Jul 2016 07:41:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1466609398-17634-2-git-send-email-akuster808@gmail.com>
Subject: Re: [PATCH 1/2] build summary: add gcc version being used.
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
X-List-Received-Date: Wed, 20 Jul 2016 14:41:38 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

I noticed this patch was being carried in mut builds and no is missing.

does that mean this is rejected?

- armin


On 06/22/2016 08:29 AM, Armin Kuster wrote:
> From: Armin Kuster <akuster@mvista.com>
> 
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  meta/classes/base.bbclass | 2 ++
>  meta/conf/bitbake.conf    | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 5d8e8d6..b90e9ce 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -195,6 +195,8 @@ def buildcfg_vars(d):
>          if value is not None:
>              yield '%-17s = "%s"' % (var, value)
>  
> +    yield '%-17s = "%s"' % ("GCC_VERSION", d.getVar("GCCVERSION", True).strip('%'))
> +
>  def buildcfg_neededvars(d):
>      needed_vars = oe.data.typed_value("BUILDCFG_NEEDEDVARS", d)
>      pesteruser = []
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 942b8b1..7132922 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -650,7 +650,7 @@ PREFERRED_PROVIDER_virtual/fakeroot-native ?= "pseudo-native"
>  
>  # Pre-build configuration output
>  BUILDCFG_HEADER = "Build Configuration:"
> -BUILDCFG_VARS = "BB_VERSION BUILD_SYS NATIVELSBSTRING TARGET_SYS MACHINE DISTRO DISTRO_VERSION TUNE_FEATURES TARGET_FPU"
> +BUILDCFG_VARS = "BB_VERSION BUILD_SYS NATIVELSBSTRING TARGET_SYS MACHINE DISTRO DISTRO_VERSION TUNE_FEATURES TARGET_FPU GCC_VERSION"
>  BUILDCFG_VARS[type] = "list"
>  BUILDCFG_NEEDEDVARS = "TARGET_ARCH TARGET_OS"
>  BUILDCFG_NEEDEDVARS[type] = "list"
> 

