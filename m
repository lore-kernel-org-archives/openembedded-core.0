Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 66D737D6B5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 11:11:07 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id q15so2459932wmj.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 04:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=jJzUqUrkuhOB61hZ67yncSM0IHRZlf5uQequczpN8FY=;
	b=RipFg7aVXo+CoKHKMSZxWTDMHI6dl5MVDQ55CBeN0UWeLGHIeezdXu3pJWJN8ZO7rV
	RUGY4LJ25exmi91VrWbslnCl4hyIKnZSKSknEBIfXkXnbQgljRNcUSeEdkItRP08qZqP
	jz4EKX3f31pR48eJoiwM8GwZta9kqnHmFZZVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=jJzUqUrkuhOB61hZ67yncSM0IHRZlf5uQequczpN8FY=;
	b=TVBHS+iWHySx70914c3jnF7QFp/jvztdhwkHnOWaQzdJFtdiys0xqDh5FuXLiq7Eg5
	Tf/6rDwdVxFQk7/MdBhDewwRLcsBC7OTXyKj7PhzPXc7wZUN9n1KyazYwfmceUlV/gcW
	jyQegNBUjB/ENrLiSkh44is92CPLt+GKkMUJQep2EqV4DJqSIaZHm+LuAI75NumeNbaN
	dcJUhHVR/laL678dDUuPHmnLXQLleN5wiw8BQLCdT6s+M+b1u29mgItHo9+spjqKAcMQ
	91JviN4/Gmzhv4VAXRlZaNWRUiLW/QwR/17X3n/4QbBUb4RQ2FDefSN84QlXucmROu9C
	ErVw==
X-Gm-Message-State: APjAAAXHaDY/LA3GXl81O1OmWwo5Wb9yuPPUKcNZ+/KPdDLdVrEEpnSP
	tYaDlLdU9MlyC9d9UuDMJqTGBA==
X-Google-Smtp-Source: APXvYqymT6TSHc0QdXVpv6bZGTsM8hHLYllBZoAe25489HBCbyKywZNQqE6mzUIwu09vyVgkmZrnrg==
X-Received: by 2002:a1c:e1d7:: with SMTP id y206mr2912061wmg.104.1558437067963;
	Tue, 21 May 2019 04:11:07 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q11sm3602598wmc.15.2019.05.21.04.11.06
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 21 May 2019 04:11:07 -0700 (PDT)
Message-ID: <483b1f52ae421d0fcd1fbcbd463f076367ed99e9.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: luca.boccassi@gmail.com, openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2019 12:11:05 +0100
In-Reply-To: <20190521105900.24147-1-luca.boccassi@gmail.com>
References: <20190516210956.19906-1-luca.boccassi@gmail.com>
	<20190521105900.24147-1-luca.boccassi@gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH v2] python*-setuptools: add separate packages for pkg_resources module
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
X-List-Received-Date: Tue, 21 May 2019 11:11:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-05-21 at 11:59 +0100, luca.boccassi@gmail.com wrote:
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
> v2: restrict new RDEPENDS to class-target. As advised by Alexander,
> bitbake
>     cannot resolve native rdeps that mention package names rather
> than
>     recipe names.
> 
>  meta/recipes-devtools/python/python-setuptools.inc | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/meta/recipes-devtools/python/python-setuptools.inc
> b/meta/recipes-devtools/python/python-setuptools.inc
> index 357aa07086..c5dcee7059 100644
> --- a/meta/recipes-devtools/python/python-setuptools.inc
> +++ b/meta/recipes-devtools/python/python-setuptools.inc
> @@ -37,3 +37,9 @@ do_install_prepend() {
>  }
>  
>  BBCLASSEXTEND = "native nativesdk"
> +
> +PACKAGES =+ "${PYTHON_PN}-pkg-resources "
> +FILES_${PYTHON_PN}-pkg-resources =
> "${PYTHON_SITEPACKAGES_DIR}/pkg_resources/*"
> +# Due to a bitbake bug, the native class cannot have a dependency on
> something
> +# that is not a recipe name.
> +RDEPENDS_${PN}_append_class-target = " ${PYTHON_PN}-pkg-resources"

Its not a bitbake bug as such but the way OE-Core decided to implement
native recipes.

I'm guessing but the best thing to do here is probably add:

RPROVIDES_append_class-native = " ${PYTHON_PN}-pkg-resources-native"

which is slightly cleaner than the target change above (I'm left
wondering if nativesdk works in that case).

Cheers,

Richard



