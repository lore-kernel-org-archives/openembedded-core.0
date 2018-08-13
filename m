Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1D53C78F6A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 14:37:14 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id f14-v6so7586201pgv.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 07:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=IAL1XDB19QhFreYyIgr2yL1e2D9JUOr3zZakcWKub/g=;
	b=NYadmXv150D2BuAysRhzQYsmQc9WXO4WNiybLge/882hkL9jpDNTzeu+IXA0uQ0nve
	Nty/H2GjFQRgSYzZBMicmy+rYP0MbSeKOlW6XBtJkLpO2w5AgXvsIBDKJxVw0y3hmdiT
	vmDody24FFUXS55y0ZbMV+BOHDv7+Ahq6sMayYKT9DVqykTncCF9zfEBptjAqkFRZ4eg
	zWKNGlLum9u/rI9gRcPx0B6VixSbZMqZA4agn/GeVL2ccy9Hsx50DOHAWYjcIBw0Fsof
	uML2mo6bUoLfCBN9aVSzsWCsQ1UxWyXlMKaxGemPzXp5PFvqORtUJRqXD70v5BiAkfUC
	l/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=IAL1XDB19QhFreYyIgr2yL1e2D9JUOr3zZakcWKub/g=;
	b=p4ZWOI8w6hHgRXIAU5kyzFwyhDowfwJ/krq3ags4nhuNf+ei18EDN0ro5w2uFtjYl8
	kuoc85kkSe5E3e9NzL+I5HeCRU+9HI9K/IBRPhvc0hRYO7qCGPcu1MLf6d+RN2YyxCrz
	V+5ccfIuP3453V1Elxq4txI5Pvb8pTrRdIoQhzBohuZ/gHgmLuDLDAt/xDXYHuPb4GlK
	DggjhLG5bbB0MvMOezK2J3yDkWvZuUd1Ky7YW1/MxguC49y2mwz8VxN3XBQTxKlqs9WA
	VIslDmdtf9RLhaUPo4V2i5OUqeM4BUjlAlW3iGMOIf7OIOufLUHLJSbpxlJrcqopHp5K
	Clkg==
X-Gm-Message-State: AOUpUlFCgCb/Wt7tm1ibdItQVQxuXT45/TGyeP7f1vo1VA7gUZURvXaI
	rVyMoISnMsrA+j9RXz8VboVnnlz3
X-Google-Smtp-Source: AA+uWPyZ7zXebJCb/qg/gHqjDhn909J8V3wSUYoGpZ4BS8LOV/dDHwqb8XuWMuyh1Uw8DnQppGcnJg==
X-Received: by 2002:a63:1c13:: with SMTP id
	c19-v6mr17430254pgc.332.1534171035859; 
	Mon, 13 Aug 2018 07:37:15 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:9ca4:2778:861f:6bc?
	([2601:202:4180:c33:9ca4:2778:861f:6bc])
	by smtp.gmail.com with ESMTPSA id
	y128-v6sm16268410pfb.56.2018.08.13.07.37.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 07:37:15 -0700 (PDT)
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
References: <1534150507-171031-1-git-send-email-changqing.li@windriver.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <b936607d-dd70-47a1-826e-b245a57a7c79@gmail.com>
Date: Mon, 13 Aug 2018 07:37:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1534150507-171031-1-git-send-email-changqing.li@windriver.com>
Subject: Re: [PATCH] bind: upgrade 9.11.4 -> 9.13.2
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
X-List-Received-Date: Mon, 13 Aug 2018 14:37:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 08/13/2018 01:55 AM, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>

Is there a reason why this version was selected? 9.13 is still under
development and ISC in not recommending=C2=A0 this version for production=
=2E=C2=A0
9.11 EOL is 2020.

We should keep one long term version around if you need bleeding edge.

- armin
> ---
>  meta/recipes-connectivity/bind/{bind_9.11.4.bb =3D> bind_9.13.2.bb} | =
4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-connectivity/bind/{bind_9.11.4.bb =3D> bind_9.13.2=
=2Ebb} (97%)
>
> diff --git a/meta/recipes-connectivity/bind/bind_9.11.4.bb b/meta/recip=
es-connectivity/bind/bind_9.13.2.bb
> similarity index 97%
> rename from meta/recipes-connectivity/bind/bind_9.11.4.bb
> rename to meta/recipes-connectivity/bind/bind_9.13.2.bb
> index 7522fdb..08ebd24 100644
> --- a/meta/recipes-connectivity/bind/bind_9.11.4.bb
> +++ b/meta/recipes-connectivity/bind/bind_9.13.2.bb
> @@ -19,8 +19,8 @@ SRC_URI =3D "https://ftp.isc.org/isc/bind9/${PV}/${BP=
N}-${PV}.tar.gz \
>             file://0001-lib-dns-gen.c-fix-too-long-error.patch \
>  "
> =20
> -SRC_URI[md5sum] =3D "9b4834d78f30cdb796ce437262272a36"
> -SRC_URI[sha256sum] =3D "595070b031f869f8939656b5a5d11b121211967f15f6af=
eafa895df745279617"
> +SRC_URI[md5sum] =3D "01d0524016ac15ea3f4b6c77d99db0b2"
> +SRC_URI[sha256sum] =3D "6c044e9ea81add9dbbd2f5dfc224964cc6b6e364e43a8d=
6d8b574d9282651802"
> =20
>  UPSTREAM_CHECK_URI =3D "https://ftp.isc.org/isc/bind9/"
>  UPSTREAM_CHECK_REGEX =3D "(?P<pver>9(\.\d+)+(-P\d+)*)/"



