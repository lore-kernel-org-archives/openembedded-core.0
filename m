Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id CDFDE747E7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 12:03:09 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id s15so2425447wra.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 05:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=lt6yIu/NlClQcSmEDmJbjDqS4fZWf2DXHeK6xKavpTc=;
	b=erBPtdUass1JGAiGpFOJ1vfPlDHEr8jQxmG/n7YUa95td68NZK4eiWIfR2/UjtowEj
	vIx7rxEb0I+grWQ8ywk+dKKHUma+b8FxF53lSOwucI29Dh8+68YJkKzIl6Idno3iCTFp
	MeYMrKeRk7pdyvbwPYjZJCMCKtAVsscYZqfpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=lt6yIu/NlClQcSmEDmJbjDqS4fZWf2DXHeK6xKavpTc=;
	b=ExNhUCo4OJUi7PaNGPgwQ1w907PyABEkL33XJ6mwGHSeeUZKd0/Tem0egfp72uNyjb
	k0GHTSPXjEuRYLaf7gc064MjSS4AlXqrhuUbBxwm6UzFePg5LruNdaTKEwEAcLzt2hAd
	3t+M4peDnYGrBWel4lC5sxQYYwQINV+ZbGWfnOSItcvN1aEmczlRIqPrsQvzvwiNbOz+
	mV8qPZyhLFVVyZsw4zSb78z96WN67wpSkA5Y72w177qFkE3hm4aHne9h97pf3D+k3ZDo
	OAIc+B+ya6s+cm8BsgFj6FjS4Urri5xcG9tofySoT+Y8aHnYTVS6nud0gOCpQh+X7uU8
	PZ+Q==
X-Gm-Message-State: APjAAAWC0xOtItVZ0t3nJPM4XBwFglAw6iOkoHyFwa5L/7em8rhWE9z6
	5QNjBCuayizfqlJ5jgsVoF1dZw==
X-Google-Smtp-Source: APXvYqw9afT8W98ig9l0XOOnBRv4PT6P2cKF0da/Y0QUeRnVa8ca4HTvtcsC8o4T7ma2dOQFBWkLoQ==
X-Received: by 2002:adf:f54b:: with SMTP id j11mr22900326wrp.39.1553083390483; 
	Wed, 20 Mar 2019 05:03:10 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id w8sm2554051wmc.0.2019.03.20.05.03.09
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 20 Mar 2019 05:03:09 -0700 (PDT)
Message-ID: <29966a07a2f3bb62205ce0feeeffbac7aa64b57b.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Jiang Lu <lu.jiang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 20 Mar 2019 12:03:08 +0000
In-Reply-To: <20190320093929.28688-4-lu.jiang@windriver.com>
References: <20190320093929.28688-1-lu.jiang@windriver.com>
	<20190320093929.28688-4-lu.jiang@windriver.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] glib-networking:enable glib-networking build as native package
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
X-List-Received-Date: Wed, 20 Mar 2019 12:03:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-03-20 at 17:39 +0800, Jiang Lu wrote:
> Enable glib-networking build as a native package, for it is depended
> by libsoup.
> 
> Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
> ---
>  .../glib-networking/glib-networking_2.58.0.bb            | 9
> +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/meta/recipes-core/glib-networking/glib-
> networking_2.58.0.bb b/meta/recipes-core/glib-networking/glib-
> networking_2.58.0.bb
> index f3190e1cae..96ba181b71 100644
> --- a/meta/recipes-core/glib-networking/glib-networking_2.58.0.bb
> +++ b/meta/recipes-core/glib-networking/glib-networking_2.58.0.bb
> @@ -29,3 +29,12 @@ FILES_${PN} += "\
>                  "
>  FILES_${PN}-dev += "${libdir}/gio/modules/libgio*.la"
>  FILES_${PN}-staticdev += "${libdir}/gio/modules/libgio*.a"
> +
> +# Make sure we compile with ca-certificates support enabled.
> +PACKAGECONFIG_append = " ca-certificates"

This wasn't acceptable in the last patch and still isn't acceptable
now. We don't use _append in recipes like this with PACKAGECONFIG.

> +DEPENDS += "ca-certificates"
> +RDEPENDS_${PN} += "ca-certificates"

This belongs in the PACKAGECONFIG entry.

> +# We need native version for ostree-/flatpak-native.
> +BBCLASSEXTEND = "native"

This belongs in a separate patch.

Cheers,

Richard


