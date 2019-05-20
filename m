Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7C57B7D71A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:14:50 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id d9so1851588wrx.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=425fa2xAXXF3VYzKgYO/O75bXbC2IhQ+07jVReZYZeU=;
	b=BS1vx4OibLSFMjfpSz5Bxl0wcbcdWre4XIbv9iUHQZIqWfa5cF4W0+9rPZygj0A97m
	zqeFnT6Dj0RkZCzKGwr1ulmG0jp1hg7K2S5ktr3qsfBos57gXKOHYj+tXZZBXSlU33kF
	eX9GDQFhfzGcuFe7QuYk6akxNr2vFPnYgI19s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=425fa2xAXXF3VYzKgYO/O75bXbC2IhQ+07jVReZYZeU=;
	b=nY/pp7KzpUni6R88XsTvSdP4gF+lThHP9Xmi6PRuwhnZvorS0xvBgOu7bYy3HSNQv2
	Ex3wtpxcm+Vz4HKPKfEnCLxNVzo6nN3ezAW5m1vjmQ/hme6zL94JeqVJAVauOPaifa4R
	FuSPMSHt/JDXWV8YFb9LXO3oD4NN1nVkHzkj6lj11nLohOFGsoLfPZ+6jGMQkPiGI0c6
	TJ7X/pTpB75VBENawvcCyX/k3Eetm69yjqJQrR16K8tWcTkyFNwaJh52JeCRimr+5lpM
	d89uhyoufkBPaekY0FaYr7ZaeYCOiCRyRHb8Z/c+bK0xpMxH/hswBbHV/ABzT4BYmZqG
	LGew==
X-Gm-Message-State: APjAAAWPoETA3JK9iVuUbHLYfKSqiAkO0nltWP57V+YlFn8W0kIV56gp
	B0IG+UbQnR+szbEObQY/DoNS4w==
X-Google-Smtp-Source: APXvYqyCGWSTx48E4SjwWzvmPzdZCExpVlQQdCU+5qORVEC/FZFuwqnWo2JwRIy8n8WD5nPcjJsg8w==
X-Received: by 2002:adf:f6c4:: with SMTP id y4mr19390884wrp.37.1558361691446; 
	Mon, 20 May 2019 07:14:51 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o6sm36263799wrh.55.2019.05.20.07.14.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 20 May 2019 07:14:50 -0700 (PDT)
Message-ID: <e8e8d3b516e2a0e3b30fe2aa1882700f3ad5df43.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: luca.boccassi@gmail.com, openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 15:14:47 +0100
In-Reply-To: <20190516210956.19906-1-luca.boccassi@gmail.com>
References: <20190516210956.19906-1-luca.boccassi@gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] python*-setuptools: add separate packages for pkg_resources module
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
X-List-Received-Date: Mon, 20 May 2019 14:14:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-05-16 at 22:09 +0100, luca.boccassi@gmail.com wrote:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
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
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
>  meta/recipes-devtools/python/python-setuptools.inc | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta/recipes-devtools/python/python-setuptools.inc
> b/meta/recipes-devtools/python/python-setuptools.inc
> index 357aa07086..ad00cbe0ef 100644
> --- a/meta/recipes-devtools/python/python-setuptools.inc
> +++ b/meta/recipes-devtools/python/python-setuptools.inc
> @@ -24,6 +24,7 @@ RDEPENDS_${PN} = "\
>    ${PYTHON_PN}-html \
>    ${PYTHON_PN}-netserver \
>    ${PYTHON_PN}-numbers \
> +  ${PYTHON_PN}-pkg-resources \
>    ${PYTHON_PN}-pkgutil \
>    ${PYTHON_PN}-plistlib \
>    ${PYTHON_PN}-shell \
> @@ -37,3 +38,6 @@ do_install_prepend() {
>  }
>  
>  BBCLASSEXTEND = "native nativesdk"
> +
> +PACKAGES =+ "${PYTHON_PN}-pkg-resources "
> +FILES_${PYTHON_PN}-pkg-resources =
> "${PYTHON_SITEPACKAGES_DIR}/pkg_resources/*"


This breaks native builds:

https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/614

(and many other similar failures)

Cheers,

Richard


