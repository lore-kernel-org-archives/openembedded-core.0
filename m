Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail.openembedded.org (Postfix) with ESMTP id 720CB7FCD0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2019 18:23:34 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id r11so820042pjp.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2019 10:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:user-agent:mime-version:content-transfer-encoding;
	bh=o44FRaKn1S+SA1JCKsuwQuQuQc+S77xHTdeHNPngYlE=;
	b=r6nwsGoV2hHadz6wkaNGwvIblI98rkT6sP1tkbcdM1fkbigfv+JuvleUvidqsw/MB2
	lSOCEaTBghKy4VOgLJA6KKwj2FWWo9D34470u06wDEZlUJkanhu7fKRCsqw7p+8m8jfv
	Oq0nlQxv1dBXy+e9l+nd5LaPJth+jYf4ZcFC+3EX+YNtZoft7FiEKaN9BejkrAWwMfyc
	1hNumMgd3adRT+2GlpC/Y7KHPGE6pZCGWrRr+fJ0PiwJ9nr5IyB/5PxB6n19oGmcvetR
	3JjFEq53ZwnhuT54iaClzcNjCw7m4/SkoTzB1pSj7Ohmx4hZJdK0MZS+hPApDynlASP3
	57DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=o44FRaKn1S+SA1JCKsuwQuQuQc+S77xHTdeHNPngYlE=;
	b=gj2wVppTdWwBWjQgBjnXykrN4Xx7uhpsL10KYMK/5EmUhMs3IlrO9coLRWEmmuMwMy
	328Je2c0TqwRKzw2j8ipdu7wHEOKBdcxug752xNg6vZkFnbqzPfFqVe9MHcqn2sk3SOE
	zFPhknQcBnusp7EvnGbhA6vlYBxtlgdB/rJ64Mvjg87SHPbCExWbcSKy5w5P9O2D9TmX
	Hm8NbGBrujSNXBhALW4pls2JXruDBMVA+E6lS3d5DzT/EGLDWbiB83ktdbW5efI7prDZ
	CeMoVvCquYlTf+xDhI9tZI0YWRcAERmiPFUxL+hEjg/+Z8fSFkGPugr60sSHctdKG0Ai
	SeNA==
X-Gm-Message-State: APjAAAWojw+OvKjvekoWQ5GcX5X2fAa84AXbpUJO5FM7zrNEV9YHAMXx
	4PT9cauvLYVzYWOub5hmaKE=
X-Google-Smtp-Source: APXvYqxZiPP7o5JJG0gkQBBPxaaEDtNr9KLxsYFfsorZeovVwFMfKdp1Gr+RVtyadRHrFA555BuCZg==
X-Received: by 2002:a17:902:74c7:: with SMTP id
	f7mr1328149plt.231.1574792615217; 
	Tue, 26 Nov 2019 10:23:35 -0800 (PST)
Received: from apollo ([2601:646:8500:1c20::e439])
	by smtp.gmail.com with ESMTPSA id
	k4sm13398766pfa.25.2019.11.26.10.23.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 26 Nov 2019 10:23:34 -0800 (PST)
Message-ID: <21ce9c214d0da111bbfa6643e3784bf1e19fbd61.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Christopher Larson <kergoth@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 26 Nov 2019 10:23:29 -0800
In-Reply-To: <20191126180829.25680-1-kergoth@gmail.com>
References: <20191126180829.25680-1-kergoth@gmail.com>
Organization: HIMVIS LLC
User-Agent: Evolution 3.34.2 
MIME-Version: 1.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCHv2 1/3] acpica: correct flex/bison deps, add explicit m4-native dep
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
X-List-Received-Date: Tue, 26 Nov 2019 18:23:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

this patchset looks good to me.

On Tue, 2019-11-26 at 23:08 +0500, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
> 
> This project doesn't require target flex or bison, just the natives,
> and it uses m4 explicitly in its configuration.
> 
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  meta/recipes-extended/acpica/acpica_20191018.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-extended/acpica/acpica_20191018.bb
> b/meta/recipes-extended/acpica/acpica_20191018.bb
> index 4692275762b..04732bbfe3f 100644
> --- a/meta/recipes-extended/acpica/acpica_20191018.bb
> +++ b/meta/recipes-extended/acpica/acpica_20191018.bb
> @@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "
> file://source/compiler/aslcompile.c;beginline=7;endline=150;
>  
>  COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
>  
> -DEPENDS = "bison flex bison-native"
> +DEPENDS = "m4-native flex-native bison-native"
>  
>  SRC_URI = "
> https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
>  SRC_URI[md5sum] = "539a0252bcb42c383ceeaeb12ae9a60d"
> -- 
> 2.11.1
> 


