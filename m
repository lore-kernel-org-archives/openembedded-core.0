Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1CDCD607A5
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Jul 2018 08:52:53 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id v8-v6so27746191oie.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Jul 2018 01:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/irohWedqfdzgk1AL3BAWfBBfYdnzOqHr+tK7oxiKqA=;
	b=IInAdm241KjcrUj1TfbFzYdWKmUFjOTSqug6uigCEvXRPbhAIp09UFTMyiDjyMbzMD
	+qoj3W+21ewxC2gn8XtzI3qI/KW/bQCSFQjKJmcEdDAMN2OcTTx+79J8EJOA8yL0ykt9
	Xbxx1qwGNn6UDiMMKT7LQwkpflGN38GhtNZy3YXxKCuvKQKbHdbYzAo+IF5kIPxql5ok
	se9+7XmogbYoyurPWGTjx3JpjpQvDNHqe39UgCqeLn8D5L1McBQbrAT8ncsmU5CgNtxJ
	9BbbFECO3LuVw1s1jbBA7cF3YzrB9ju8fzXIsmBo80d7B4sTj1+XE4N/EDKdbiBTw6wu
	xtZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/irohWedqfdzgk1AL3BAWfBBfYdnzOqHr+tK7oxiKqA=;
	b=XTE6tGJ1F2JkkVHyjGOm+AOZFNZUV+ypqvVFRBI3htbkAO0M41Dy01sCnAaupEAQH9
	pPjJXU7j95/G/5yLRd5C1n0cg6jvFuD6I2RsHun1LVLW99BOqEdZGJD1zkgfupwvS2fL
	dk6KOhuVED4VZPVLy9g2g38nbSwp1zzoshi7Pr47GstBAvnPPy2Sq2RRgHQuiE6Ozw7U
	LoyCj773C2cVjE91BpGmF4HvjIh7d1Ml0lWXoJ6XRAog/e55RN14N4lTIPJ+SwMnv5Tl
	mQLZscJOjroQpN0ynaIli2/wAOBC7kOTFzUgC0xqGynN3PPA/e+QVe4ESiQwMzlUAg3a
	bvyw==
X-Gm-Message-State: APt69E0w/TCs6eJENfNqLIO0ztMmYLGZ6rVhkZTPuKy7Bv6qQmKhAs5L
	G/2UkEIcptbHmZ6PzgEpv5hUYwthT7kt8tlCCss=
X-Google-Smtp-Source: AAOMgpcnoCDIAVgXcWcGaPOJYF/VZPbXyWEsqdKfnJE+awYsZzXgXxCNnw03UZH5aO33KWVBTXXt23oZ2dVusf61lCU=
X-Received: by 2002:aca:560d:: with SMTP id
	k13-v6mr13989857oib.190.1530953573993; 
	Sat, 07 Jul 2018 01:52:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90c5:0:0:0:0:0 with HTTP;
	Sat, 7 Jul 2018 01:52:53 -0700 (PDT)
In-Reply-To: <1530903954-20926-1-git-send-email-armccurdy@gmail.com>
References: <1530903954-20926-1-git-send-email-armccurdy@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 7 Jul 2018 10:52:53 +0200
Message-ID: <CANNYZj_aKU=fV7AqF17CVRzgRSC9thHO9aZcw8S5CuHVCB0PYA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] openssl_1.1: avoid using += with an over-ride
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
X-List-Received-Date: Sat, 07 Jul 2018 08:52:53 -0000
Content-Type: text/plain; charset="UTF-8"

We really need a QA warning for this issue. Nobody's going to remember
what the correct way is. Can you look into it please?

Alex

2018-07-06 21:05 GMT+02:00 Andre McCurdy <armccurdy@gmail.com>:
> Using += with an over-ride can be a source of confusion so try to
> avoid the construct in core recipes.
>
> The current usage is incorrect and prevents the aarch64 and musl
> specific config options from being active together.
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/recipes-connectivity/openssl/openssl_1.1.0h.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
> index 94b75eb..ac2ad81 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
> @@ -122,12 +122,12 @@ do_configure () {
>  #| engines/afalg/e_afalg.c:110:20: error: '__NR_eventfd' undeclared (first use in this function)
>  #|      return syscall(__NR_eventfd, n);
>  #|                     ^~~~~~~~~~~~
> -EXTRA_OECONF_aarch64 += "no-afalgeng"
> +EXTRA_OECONF_append_aarch64 = " no-afalgeng"
>
>  #| ./libcrypto.so: undefined reference to `getcontext'
>  #| ./libcrypto.so: undefined reference to `setcontext'
>  #| ./libcrypto.so: undefined reference to `makecontext'
> -EXTRA_OECONF_libc-musl += "-DOPENSSL_NO_ASYNC"
> +EXTRA_OECONF_append_libc-musl = " -DOPENSSL_NO_ASYNC"
>
>  do_install () {
>          oe_runmake DESTDIR="${D}" MANDIR="${mandir}" MANSUFFIX=ssl install
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

