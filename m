Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3BB826BCA9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 08:52:46 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id i12so14947104wrw.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 00:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=TVflG8+a0AVLmks/z1KtLRXT1DKyCgqGMLRxn+HlwSc=;
	b=FbFc2FS8AazCxwERdvCo/1N779x5GzmA20JjqxYpUIDUJMoRsBPWHTRumOukTmBw3n
	juAkpoRbgC2o+NOfibtm0gdlQU4v1k5AmYRqpJHzHXtFoTe05rQ3ekVkcuxH9hpjBUtU
	4btTizoXVjwmBfP9pxmp+uPycVspq74A4qxRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=TVflG8+a0AVLmks/z1KtLRXT1DKyCgqGMLRxn+HlwSc=;
	b=KoNrwOUMFWq9Ztja3pkdXCItq3IZn9Vp7rpLzM9PCFhDGWzElF/BEyY44HzVQjRfdJ
	wq5grAfAXSbUu8xmGAd9e8MYybbrbTpwukAgvhi70jmTTlZfCkhZF1kWK15vsabYK08m
	l37mLl/Mmp7LnpZERzZz1peUZZVnzrW4VFQysWOsaEltmzgsraAJ1zGRDsWKj6atILua
	acJYWCVkjj53vL16Efz+yhtIcDOx7AGrPKWB77U83xyfrZXfOs7yq+XJuaObTNUHqGvT
	AaRCRV4UpXDxANGX+My7zZM1BrJ83QjB18BnuHulY4IH0YYXfC7VG1L+7vhWi6RCwXBA
	6UyA==
X-Gm-Message-State: AHQUAuZr0IMviBCjhnev3qoNCCRX+aJzYGATw1DKA+6kSuplz2YcRq88
	+o9a9MvU45vyhEwSIHrKOzil98Yjwx0=
X-Google-Smtp-Source: AHgI3IaUGyW3bk+/f2gFHtGOhePRZ7fvehZcPwqFbPPG/YqoUhEaD45WJy1mnSBe2xBsoYQOa2DhQA==
X-Received: by 2002:adf:b211:: with SMTP id u17mr4977017wra.322.1550393566691; 
	Sun, 17 Feb 2019 00:52:46 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	90sm24112781wrk.95.2019.02.17.00.52.44
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 17 Feb 2019 00:52:45 -0800 (PST)
Message-ID: <33c0eed2a4d8a49ef8489ab004058700a969e7e0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Sun, 17 Feb 2019 08:52:44 +0000
In-Reply-To: <05262e8e31704f8a91db22e0ffb140db@XBOX04.axis.com>
References: <20190216214638.11456-1-richard.purdie@linuxfoundation.org>
	<20190216214638.11456-4-richard.purdie@linuxfoundation.org>
	<05262e8e31704f8a91db22e0ffb140db@XBOX04.axis.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH 4/7] glib-2.0-native: Break circular dependency on	shared-mime-utils
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
X-List-Received-Date: Sun, 17 Feb 2019 08:52:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-02-16 at 22:45 +0000, Peter Kjellerstedt wrote:
> > diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-
> > core/glib-2.0/glib.inc
> > index c9093cee866..7e2847d4b22 100644
> > --- a/meta/recipes-core/glib-2.0/glib.inc
> > +++ b/meta/recipes-core/glib-2.0/glib.inc
> > @@ -80,6 +80,7 @@ FILES_${PN}-utils = "${bindir}/*"
> >  RRECOMMENDS_${PN} += "shared-mime-info"
> 
> Wouldn't it be clearer to change this to:
> 
> RRECOMMENDS_${PN}_append_class-target = " shared-mime-info"
> 
> instead of adding the RRECOMMENDS_${PN}_class-native below?

You could argue that both ways, I see the native case as the exception.
Having the mingw32 remove in there is ugly as well and cleaning that up
at the same time might swing it.

Cheers,

Richard

> >  # When cross compiling for Windows we don't want to include this
> >  RRECOMMENDS_${PN}_remove_mingw32 = "shared-mime-info"
> > +RRECOMMENDS_${PN}_class-native = ""
> > 
> >  ARM_INSTRUCTION_SET_armv4 = "arm"
> >  ARM_INSTRUCTION_SET_armv5 = "arm"
> > --
> > 2.20.1
> 
> //Peter
> 
> 


