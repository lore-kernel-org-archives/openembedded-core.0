Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id E9EF07D105
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 14:14:01 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a184so10618686wma.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 07:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=z4j6uYS/BMr1EEYUdXY/XHUrIO9JmtXLovl+lasbDvg=;
	b=MZD4tV5r0TFhdv7ujyJdLg8tbt994mGHKVIbWvx94wqmqTzzChwZcBi5QAxzMnHJv0
	mgX4bRaLsOaEwvzYaJLRpnnpkQouYHPGZTqlPCO6zADBsHMKLg2AjzxG2BrLPJO90XSu
	QQZv8Sb5texO5MKN/gtpxC/PqiM83GzanwiRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=z4j6uYS/BMr1EEYUdXY/XHUrIO9JmtXLovl+lasbDvg=;
	b=nxLIbV4NulaCPPvX25A+JDrGnzFqCZtz83ndSZFxssSjwymcGYynmXoIKxwWuZXeba
	34EbfzFA7y3YRoY/wKlNbeYi7bgTK2KwZUqk2rtyangmQnCSXZ5Nbz+QQUMj0jhvvcMs
	le+Zph4zYJIqG9ROn4rDbthrJMZ1QUDHQYF8T1bY9li4m8/4dn56hwQkcdldrB9vueRG
	oruc2CR86gZM3QBV0xzs0ZLabNbvxzZNIpkbPvFXof66S2jQ/8iFO1BJIWrLgHLvsQw/
	RhdnTOsbki2mhzIS9qudY0ciP7PI/1YMijlXAiX2/r2DMv2+Te5MdLSsyn+LOFHwD2mP
	R0zg==
X-Gm-Message-State: APjAAAXJOMDZqb7uLPKSohhDS+aBdy/8gyugPVUzMmLq347d8gdIU0gk
	b2kJgvU66g9lIo2FR/fU1hl44CzMXd56Kg==
X-Google-Smtp-Source: APXvYqzdUem4KxqGkFqELe7OeB2mU9JoRfT6R9y8QMaWIugSWVSePW0DBRWKHmQrdBWwB+PzcGj6kw==
X-Received: by 2002:a1c:cfcb:: with SMTP id f194mr13067222wmg.51.1554128042722;
	Mon, 01 Apr 2019 07:14:02 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	m6sm13321704wrr.53.2019.04.01.07.14.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 01 Apr 2019 07:14:01 -0700 (PDT)
Message-ID: <25e816bb8ab33d104be3feec92080bda3ee60f99.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 01 Apr 2019 15:13:59 +0100
In-Reply-To: <20190330224908.2108-1-open.source@oleksandr-kravchuk.com>
References: <20190330224908.2108-1-open.source@oleksandr-kravchuk.com>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Subject: Re: [PATCH] ofono: update to 1.28
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
X-List-Received-Date: Mon, 01 Apr 2019 14:14:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-03-30 at 23:49 +0100, Oleksandr Kravchuk wrote:
> Deleted patch has been mainstremaed.
> 
> Changelog:
> ver 1.28:
> - Fix issue with SIM initialization and Gemalto modems.
> 
> ver 1.27:
> - Add support for handling SIMCom based SIM800 modems.
> - Add support for SIM lock state with xmm7xxx modems.
> - Add support for coexistence feature with xmm7xxx modems.
> 
> ver 1.26:
> - Fix issue with AT callback handler and GPRS.
> - Fix issue with handling EUTRAN SMS only states.
> - Fix issue with handling MBIM strings on big endian.
> - Fix issue with missing char and SMS national language.
> - Fix issue with unsolicited notifications of +CGAUTH/+CGDCONT.
> - Add support for setting "none" authentication method.
> - Add support for SMS and phonebook with xmm7xxx modems.
> - Add support for voice features and Gemalto modems.
> - Add support for Bengali and Gujrati SMS alphabets.
> - Add support for 8 additional languages for GSM 7 bit
> - Add support for using internal Embedded Linux library.
> 
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com
> >
> ---
>  meta/recipes-connectivity/ofono/ofono.inc     |  7 ++---
>  .../ofono/ofono/use-python3.patch             | 27 ---------------
> ----
>  meta/recipes-connectivity/ofono/ofono_1.25.bb |  9 -------
>  meta/recipes-connectivity/ofono/ofono_1.28.bb |  8 ++++++
>  4 files changed, 12 insertions(+), 39 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/ofono/ofono/use-
> python3.patch
>  delete mode 100644 meta/recipes-connectivity/ofono/ofono_1.25.bb
>  create mode 100644 meta/recipes-connectivity/ofono/ofono_1.28.bb
> 
> diff --git a/meta/recipes-connectivity/ofono/ofono.inc
> b/meta/recipes-connectivity/ofono/ofono.inc
> index 0472414b19..37772121f8 100644
> --- a/meta/recipes-connectivity/ofono/ofono.inc
> +++ b/meta/recipes-connectivity/ofono/ofono.inc
> @@ -1,13 +1,14 @@
>  HOMEPAGE = "http://www.ofono.org"
> -SUMMARY  = "open source telephony"
> -DESCRIPTION = "oFono is a stack for mobile telephony devices on
> Linux. oFono supports speaking to telephony devices through specific
> drivers, or with generic AT commands."
> +SUMMARY  = "Open Source Telephony"
> +DESCRIPTION = "oFono is a stack for mobile telephony devices on
> Linux. \
> +oFono supports speaking to telephony devices through specific
> drivers, or with generic AT commands."
>  LICENSE  = "GPLv2"
>  LIC_FILES_CHKSUM =
> "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
>                      file://src/ofono.h;beginline=1;endline=20;md5=3c
> e17d5978ef3445def265b98899c2ee"
>  
>  inherit autotools pkgconfig update-rc.d systemd bluetooth gobject-
> introspection-data
>  
> -DEPENDS  = "dbus glib-2.0 udev mobile-broadband-provider-info"
> +DEPENDS  = "dbus glib-2.0 udev mobile-broadband-provider-info ell"


ERROR: Nothing PROVIDES 'ell' (but /media/build1/poky/meta/recipes-
connectivity/ofono/ofono_1.28.bb DEPENDS on or otherwise requires it)

OE-Core doesn't contain ell?

The new dependency isn't mentioned in the changelog?

Cheers,

Richard



