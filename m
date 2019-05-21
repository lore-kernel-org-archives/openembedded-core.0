Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 829E47E25D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 12:35:23 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 15so2712412wmg.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 05:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=/vCaDkh6Ss4+vnnxwWHI9ybpR5SV7/9xwf99yTEFHrQ=;
	b=Nz/bjpfQtNhGRdpoHRAWMG8rXodQib1phhhQDBkkG8mIigPd/0mWi1PVpbmMDKlkel
	OwuD45cDV8NPZJab8AW+VFsSrKzjX1moXboR8yloqN8p/6z3odN60DlVlYFeA9xE2kl2
	nIXknJehNtDnKLqukPu6kTXwVYOEsEEAeNSwMJdmbolPJfsHKu+yhsYd5FzcSqku9J8R
	NB2cEk8W0sdoKDlZrXyTZtsQfvjrNUcKEubXNuQZnbHDGuZXcgoURSnG99eqEC/GSAV9
	O4wL47Vvh9ow+262cDWoGi1s3+aqIU2Z87OSBCTRFd5lUOf8ef2M3p1CzJenzQ4zbU2X
	stZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=/vCaDkh6Ss4+vnnxwWHI9ybpR5SV7/9xwf99yTEFHrQ=;
	b=HPec1Gb+WCzNsANlYU3fgDobkfLntuxCSAiyWShTEU6yWC+9BHIxsjG1CSwEmaN/JD
	7zfNlwtkE5Namfhif2Hr+fQNBfxbdJ7jEg7GCTWppf7O9cbd3PI1/BWIPILlwGlovmuv
	kvLSyzkxaJolJhY9j/xT3KKPZYlLZB4X+L3WNnKWtz35gH+/X8wpaZM2lniQMRzFnkcD
	k7b7+3nMt2IwNfyTt2F4Mmoy8LgcUQHMHwOMJT9rZULtk52yQGl9CdISaBAPrunnRHyo
	IBtp+wpa86ZbtoE+DEJUUStZOO+vUrKX4eQfA1qZtm1NJkjb5cPdpUKk1Y5Hv7Rmxf1I
	uHxw==
X-Gm-Message-State: APjAAAW8+JlZRkNQIWdr3eujLnNv1ngCr1ZDVaen9U4uIG8wTrbWGrXj
	ZW6qprVALx4j5oDPq2QOBAHa8jno
X-Google-Smtp-Source: APXvYqwZMaWwBXx9eZMPa2y9ZKuv3+yj6Hs0qIsGmjeDfPpmYrDAe0xHllGJWhf8b0L1UfThkd7d7Q==
X-Received: by 2002:a1c:9c8c:: with SMTP id f134mr3109846wme.95.1558442123624; 
	Tue, 21 May 2019 05:35:23 -0700 (PDT)
Received: from bluca-lenovo ([88.98.246.218]) by smtp.gmail.com with ESMTPSA id
	b18sm18642720wrx.75.2019.05.21.05.35.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 21 May 2019 05:35:22 -0700 (PDT)
Message-ID: <3824e96c3c191f5df0432ef98b0c210312ea0e78.camel@gmail.com>
From: Luca Boccassi <luca.boccassi@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2019 13:35:22 +0100
In-Reply-To: <20190521123418.16290-1-luca.boccassi@gmail.com>
References: <20190509214007.13927-1-luca.boccassi@gmail.com>
	<20190521123418.16290-1-luca.boccassi@gmail.com>
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Subject: Re: [PATCH v3] python*-setuptools: add separate packages for pkg_resources module
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
X-List-Received-Date: Tue, 21 May 2019 12:35:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-05-21 at 13:34 +0100, luca.boccassi@gmail.com wrote:
> From: Luca Boccassi <
> luca.boccassi@microsoft.com
> >
> 
> The pkg_resources Python module is useful by itself, for example for
> automatic loading of resources shipped in a Python package.
> Add separate packages for it, so that users can depend on them
> individually and avoid pulling in the entire setuptools, which
> include scripts to download other packages, which might not be
> desired on minimal images.
> 
> Other distributions like Debian and Ubuntu already split setuptools
> and pkg-resources in this way.
> 
> The setuptools packages now depend on the new pkg-resources packages,
> to avoid regressions for other packages that depend on them
> already.
> 
> Signed-off-by: Luca Boccassi <
> luca.boccassi@microsoft.com
> >
> ---
> 
> v2: restrict new RDEPENDS to class-target. As advised by Alexander,
> bitbake
>     cannot resolve native rdeps that mention package names rather
> than
>     recipe names.
> v3: manually add RPROVIDES to the native class instead of restricting
> the
>     RDEPENDS to the target class as a better workaround. Also
> document why
>     the package is being split.
> 
>  meta/recipes-devtools/python/python-setuptools.inc | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/meta/recipes-devtools/python/python-setuptools.inc
> b/meta/recipes-devtools/python/python-setuptools.inc
> index 357aa07086..f49e078697 100644
> --- a/meta/recipes-devtools/python/python-setuptools.inc
> +++ b/meta/recipes-devtools/python/python-setuptools.inc
> @@ -37,3 +37,14 @@ do_install_prepend() {
>  }
>  
>  BBCLASSEXTEND = "native nativesdk"
> +
> +# The pkg-resources module can be used by itself, without the
> package downloader
> +# and easy_install. Ship it in a separate package so that it can be
> used by
> +# minimal distributions.
> +PACKAGES =+ "${PYTHON_PN}-pkg-resources "
> +FILES_${PYTHON_PN}-pkg-resources =
> "${PYTHON_SITEPACKAGES_DIR}/pkg_resources/*"
> +# Due to the way OE-Core implemented native recipes, the native
> class cannot
> +# have a dependency on something that is not a recipe name. Work
> around that by
> +# manually setting RPROVIDES.
> +RDEPENDS_${PN}_append = " ${PYTHON_PN}-pkg-resources"
> +RPROVIDES_append_class-native = " ${PYTHON_PN}-pkg-resources-native"
> 

Sorry, wrong in-reply-to, resending.

-- 
Kind regards,
Luca Boccassi


