Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 31572747E7
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Mar 2019 01:57:33 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id y5so810270plk.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Mar 2019 17:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=A6BoIiWdTcZ0nkP0K74MlcW3QekLnt+KopQ2DYoEqzs=;
	b=dUVoc2msNc/22sKN454qb1YAqgYUx2179zakrd5BzLkLr6jfvB+xiJ4icXHYEOt2AG
	3iqW5KQy1MmCWZRNZW/V2dPk+YqC4NcA4R5KwoJgHUkfKndt12rg4Wsk/d1fnich2fXN
	+nBkihOsxTDZXhY38ArNvEtBmT0wSiwOX8MYyKVPrhxWW0QPFicMV3xp5aaYXMpmbk3/
	REmf3ocvuuTOYajsQ6aELcxtxI5hhgtvaAKOyUqZ5eXnySddyZFYmUZQ4fzlmcqkm4UA
	fZugxbJ4Yb02xn+fBBtnXgYUAaH/lwZyWiMcSsaMhQuZWXGgF5ZjxJk3rO+uX/P911l7
	vFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=A6BoIiWdTcZ0nkP0K74MlcW3QekLnt+KopQ2DYoEqzs=;
	b=kNIUot5BXuaFzF/lM+61xUfB0tFROfdSuT4sOul50F4Rgy7QGzZsVbddRaf9SqOuWF
	3g7Jtc1Z+WfJCBahN1YccxK4hs2YBf4mJ5pis1Wo9GtS2ZTba5hRPCSX/QaxhmJ7WPLl
	64uhYM8mnT/b0IWJqTGJXci33LqyrX9CCGVZLdhCb8g3KFml4cQzvQJMzZmdtcvqammR
	PrhXqmf0lMMYnKIHfYdGHefsHzqvNNuSNBQwSddNYNNWY2WqoRwBpuuGoBBYmZPozLEM
	j1IDFsZoX3p0BlkJKlEQUdnLP39Z9a37vpCrbTOxZ6srUFHnNd5jJi1TcSj8kasIS2+4
	x9fA==
X-Gm-Message-State: APjAAAXv9DCLdm7GJPPnGVstK429MmcyLRRdHJ1tpSo9GX5IZj8W0c/e
	Z24/wSjJeirbhR4attDQ6roBbtTs
X-Google-Smtp-Source: APXvYqyLDI5MQDmRkHBdsmRXsFhARWgoS9X6hqLwz6/pJvbmTh/HSWXb0o42zBwk9kFIBrF+rYXSKg==
X-Received: by 2002:a17:902:684:: with SMTP id 4mr13200773plh.3.1551578253969; 
	Sat, 02 Mar 2019 17:57:33 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:487d:58db:471f:2b6?
	([2601:202:4180:c33:487d:58db:471f:2b6])
	by smtp.gmail.com with ESMTPSA id a1sm2886165pfn.26.2019.03.02.17.57.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Mar 2019 17:57:33 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20190303003834.44637-1-raj.khem@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <96553c6e-dfe3-7074-99a0-f5770c72a4f2@gmail.com>
Date: Sat, 2 Mar 2019 17:57:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190303003834.44637-1-raj.khem@gmail.com>
Subject: Re: [PATCH 1/2] grub: Enhance Waddress-of-packed-member patch to cover x86_64 testcase
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
X-List-Received-Date: Sun, 03 Mar 2019 01:57:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 3/2/19 4:38 PM, Khem Raj wrote:
> This was not compiled last time when testing aarch64

The subject and body have conflicting archs.
is it both?
- armin
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../files/disable-address-of-packed-member.patch    | 13 +++++++++++++=

>  1 file changed, 13 insertions(+)
>
> diff --git a/meta/recipes-bsp/grub/files/disable-address-of-packed-memb=
er.patch b/meta/recipes-bsp/grub/files/disable-address-of-packed-member.p=
atch
> index 4af6a599d5..415f52ebe3 100644
> --- a/meta/recipes-bsp/grub/files/disable-address-of-packed-member.patc=
h
> +++ b/meta/recipes-bsp/grub/files/disable-address-of-packed-member.patc=
h
> @@ -247,3 +247,16 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  =20
>   static grub_dl_t my_mod;
>  =20
> +--- a/grub-core/commands/usbtest.c
> ++++ b/grub-core/commands/usbtest.c
> +@@ -63,6 +63,10 @@ static const char *usb_devspeed[] =3D
> +     "High"
> +   };
> +=20
> ++#if __GNUC__ >=3D 9
> ++#pragma GCC diagnostic ignored "-Waddress-of-packed-member"
> ++#endif
> ++
> + static grub_usb_err_t
> + grub_usb_get_string (grub_usb_device_t dev, grub_uint8_t index, int l=
angid,
> + 		     char **string)



