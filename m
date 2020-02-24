Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5AAFE606C9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 09:17:57 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id m16so9406334wrx.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 01:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=dODm2ZDMW4IxszTGfyaFuGaoFxkNtAVAOCICfFDxQ0A=;
	b=H18dnPTHGHpzz23atf2ZEkGrLezGuYJm4MReWBgG/2qWJ5AHNWMQSpwhlXpbRtrd4s
	kh49GokU9Wdrte3RI/Yv5jJwAZ5a+kELJPGKKQlkhxelOdZh97ZxhX4oSmgjQsMMccU1
	hRmDDq9/gjwj5i5+acEph06Kx8y7W499d0RPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=dODm2ZDMW4IxszTGfyaFuGaoFxkNtAVAOCICfFDxQ0A=;
	b=ubEjpxikDwKFRFWuDFWi3M+nWx8WGihc3xHkN5BPpoIqfbPxljk9SGPpp602FItdW1
	xcaBAONp0dDUkFC3erbjSE99w2qKwmcbwdDJRzsbfPWeNvBKrN9iStc4bKthlprS/Zxz
	xAOiVKMsPk6n0P9FL1+U80KQoFSavF9S0slfjmz9E/5neQptJt09z0crhyMTd3CdwDJA
	kux/FCJGmObo83irb+A/jaGmgD3h85IAkw3UGxh7NO+8QcbsKRNAMeQimJUK2h8fbyu0
	NIHNpx5tW5pwGm0w0eSjJnom6qsIuXafYUo4aUSof40x5HnAVOcxH5Oc2R2pCf1LM/jB
	yrsg==
X-Gm-Message-State: APjAAAV2eg29Kix01+HpBAIsS334WmF2TBvSm1RSNXHhCUdYYEMzNkQZ
	uUzxh7D3N+/4c9khdvlg/ZurmwX4IF8=
X-Google-Smtp-Source: APXvYqyqHHH5cTvOF3yT9+85VZewl8j8ROYJxR0win6s3FEMLXz7WZkcYd4VH7Z5iruVBANcIMikcQ==
X-Received: by 2002:a5d:5452:: with SMTP id w18mr62628408wrv.333.1582535877868;
	Mon, 24 Feb 2020 01:17:57 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u8sm17631220wmm.15.2020.02.24.01.17.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 24 Feb 2020 01:17:57 -0800 (PST)
Message-ID: <fd59ef897ef077f4f0160e1e2d7c95466c75a3f7.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Bunk <bunk@stusta.de>, openembedded-core@lists.openembedded.org
Date: Mon, 24 Feb 2020 09:17:56 +0000
In-Reply-To: <20200223182933.6168-1-bunk@stusta.de>
References: <20200223182933.6168-1-bunk@stusta.de>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/6] webkitgtk: Remove unnecessary REQUIRED_DISTRO_FEATURES requirements
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
X-List-Received-Date: Mon, 24 Feb 2020 09:17:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-02-23 at 20:29 +0200, Adrian Bunk wrote:
> opengl is optional.
> x11 can be replaced with wayland.
> 
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  meta/recipes-sato/webkit/webkitgtk_2.26.4.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
> index a48a976f94..51fba94964 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
> @@ -26,7 +26,7 @@ SRC_URI[sha256sum] = "4386900713dfadf9741177210b32623cab22562a79ffd0d446b6656993
>  
>  inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
>  
> -REQUIRED_DISTRO_FEATURES = "x11 opengl"
> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>  
>  CVE_PRODUCT = "webkitgtk webkitgtk\+"

The autobuilder no-x11 build seems unhappy with this patch series
unfortunately :(

https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/1616

Cheers,

Richard


