Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 0C71B60125
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 21:01:14 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id n13so14247320pff.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 13:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:user-agent:mime-version:content-transfer-encoding;
	bh=HGyakTGnMimEC1s7EinSkax5tWQCD6C7g1rtrW1rPlE=;
	b=nuOe4lnb3c8dJGYKBoLBKs+NkjcLIVfoitfBMtlwDColp5YgdBX9Qu6w4yGxoBL376
	pIWBmP/AtEp8hwE/ZIBXa1ZGg0Ne0HyNW8zHSsxGK5c+13cSjCwspLHQYUFQoRgWXPCR
	73Ff4RWcnYH+Sychkjd3wTxJC3H1Xe5+fgm5jz+UH89wVlNfGMUzwJbcZUoXFWr6CRAb
	PodrXHP2Jr1W17u+vXy+9HLxP6zlHCvO4tsCnXxJgc+g7YFCAYvYwFXoBqouwNvAnwE0
	5MPiDiXVKBY0joN31gCxUBjHlIBjx170cx4Dg22F3LIyDvp0gl9YQYeVTCoiEBawTrfD
	NFQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=HGyakTGnMimEC1s7EinSkax5tWQCD6C7g1rtrW1rPlE=;
	b=RWQJ2gsxA2LZmUWkCsmQXJkWE7U+QBial73l6f28Z/74gXjVpOVQD0+EwlGPvRPmAN
	yjK+Kn++81fuDi9Vi26v/1oXRcnAxBMzTos4AyTtlXsZbYpK1aBuY2zha8Sqha/wFVhJ
	u6gkhKGDh2Iz63GrdbHzu0+RnfuMzY6U2Q8AvFRr+S5huwazwMJHCvEazoPexo6hJHWv
	TtBEsI9x3ILatK4BcBL+3cOT334/1B8gSvcntrKdDZgmuV2FxslLntkVlsFVY4eHOree
	GtIwpKfVaivrPpGBxsODlp+SQ5jSaBOv+AYkf0jqsh4Vsrn5HqHUvqXVA9mAiu7Lw1cr
	NXgw==
X-Gm-Message-State: APjAAAUpE3fcAgouPpW6r4pfK8VOo4Lqzmn+lWmNuNIG+7rR6to5zmzj
	EvKgeaDrRBUqztJ8izzgxE8=
X-Google-Smtp-Source: APXvYqxtdnjFHIv844zEe9oMbMCPUMQ8y3kbHTWvBWn7mj1sTPmcicTIvEnQMG7EiBD9ytAIu0I9pQ==
X-Received: by 2002:a63:e145:: with SMTP id h5mr37849732pgk.447.1573592475652; 
	Tue, 12 Nov 2019 13:01:15 -0800 (PST)
Received: from apollo ([2601:646:8500:1c20::30e8])
	by smtp.gmail.com with ESMTPSA id
	s13sm18774931pfc.110.2019.11.12.13.01.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 12 Nov 2019 13:01:15 -0800 (PST)
Message-ID: <b7c3ec8ee350e606ff8bc99c20efacb87654c858.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Michael Scott <mike@foundries.io>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 12 Nov 2019 13:01:10 -0800
In-Reply-To: <20191112195656.7359-1-mike@foundries.io>
References: <20191112195656.7359-1-mike@foundries.io>
Organization: HIMVIS LLC
User-Agent: Evolution 3.34.1 
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Stefan Agner <stefan.agner@toradex.com>, Adrian Bunk <bunk@stusta.de>,
	Bryan Gillespie <bryan.gillespie@hughes.com>
Subject: Re: [meta-oe] modemmanager: Upgrade 1.10.6 -> 1.10.8
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
X-List-Received-Date: Tue, 12 Nov 2019 21:01:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-11-12 at 11:56 -0800, Michael Scott wrote:
> Includes: Fix for an issue presenting after 1.10.6 update where modem
> would enter status denied state.
> 
> See:
> https://cgit.freedesktop.org/ModemManager/ModemManager/commit/?h=1.10.8&id=47fd8a1e55cac0b0b45812e1dda826f38c264d1b
> 

Patch is ok, but please send it to openembedded-devel mailing list, so
it can be caught by patchwork into right project.

> Signed-off-by: Michael Scott <mike@foundries.io>
> ---
>  .../{modemmanager_1.10.6.bb => modemmanager_1.10.8.bb}        | 4
> ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-
> connectivity/modemmanager/{modemmanager_1.10.6.bb =>
> modemmanager_1.10.8.bb} (92%)
> 
> diff --git a/meta-oe/recipes-
> connectivity/modemmanager/modemmanager_1.10.6.bb b/meta-oe/recipes-
> connectivity/modemmanager/modemmanager_1.10.8.bb
> similarity index 92%
> rename from meta-oe/recipes-
> connectivity/modemmanager/modemmanager_1.10.6.bb
> rename to meta-oe/recipes-
> connectivity/modemmanager/modemmanager_1.10.8.bb
> index 92d4fe0f4..3cd21cc0d 100644
> --- a/meta-oe/recipes-
> connectivity/modemmanager/modemmanager_1.10.6.bb
> +++ b/meta-oe/recipes-
> connectivity/modemmanager/modemmanager_1.10.8.bb
> @@ -14,8 +14,8 @@ DEPENDS = "glib-2.0 libgudev intltool-native
> libxslt-native"
>  SRC_URI = "
> http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz
> \
>             "
>  
> -SRC_URI[md5sum] = "7452a94f0d1ca361ae51ff1d287c53f5"
> -SRC_URI[sha256sum] =
> "3c2ca73782215664141042422759899ca9846440fc26d6223c7cf7ea4dd3c996"
> +SRC_URI[md5sum] = "c05ac4246c81cc15d617c4a129232988"
> +SRC_URI[sha256sum] =
> "cbe174078dbdf3f746a55f0004353d3c27da2a31da553036d90fc7dc34a0169a"
>  
>  S = "${WORKDIR}/ModemManager-${PV}"
>  


