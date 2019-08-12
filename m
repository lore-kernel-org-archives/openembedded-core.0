Return-Path: <brgl@bgdev.pl>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id BCBC27E6AC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 07:01:21 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id g17so4341458otl.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 00:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=zUeAX3H7EQWCEawubsyjcT2rgCA4ZhHF/lYbzXYPm2I=;
	b=PKpYkpEV+n0bmEJ3YCZ3R3tRW1IyGwQLJJt+lsjkoVyNFhXAsgJzWZ25/IxlB60w1f
	DpHRrS17uuCnlDkPIXPcmbUmt+SUJN/8UIUBjiEnYbJ5sw+I8U1DBaTD6TujuyaNaXbs
	q7NYEqp+RjT4eTSmuCQK5Ttuxeo/JLrCQzjRxvXjfw5rmdqfCo4BKYwuZ7F7tchz3OcK
	fmXJUJOoU+X0u9eQ+38kZnpeSXfGztwZG9BxRINl5MjZvOc//s0XY1n6Gp0IzJZ+DsZW
	A3RowKy2c0nx0k3GXJsOkBchU0YpCByce+FPZHm0m9wk1Yq8UW3su6WsFGtdDoIMP8mt
	BcCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=zUeAX3H7EQWCEawubsyjcT2rgCA4ZhHF/lYbzXYPm2I=;
	b=rLFWFhq5+x4CN4Juqrh8BT73+zvvUhhV1PtDIlAYxPftMK39kk2BRiNeZTGXTCIyN2
	uQCnZxBjtYMjmpiPPEgFejQ14uF6hBxP9869AU0/JzDp4RZFaCUdRJ6wlMgn7hAN0jUl
	4yeNPozRMSUAl/2qqNncT9TMF/azApFtkqpuaug1bjqqjKpXKN4GUugn2NaZY0VLROEf
	O1+2sGUkb6ZUyhfwQpE/EwMimQwzSobR9GSU//KGEL6kTZYwKxRJL/FC+u9Yd5+Le2KR
	nR2f6HTuoPADoefzu8bGJYsWoHOM9fI9NgShIklKH46XrHa5GUJSfGn0bpDE94mal1+U
	z6yw==
X-Gm-Message-State: APjAAAXZlThN75s6UFLDgHJrDLcU3gVI6k7TFlWTA3qhUcXhiqWiUoq8
	XSOw08+ubcJbX8epXABrTGiQssxsv9/TK9dMGIuJ9w==
X-Google-Smtp-Source: APXvYqy7EEdX5rr+k1AQEP28FLN50/slQYuVvv+ptu+3bVEZUqXamK024aTGzTbDmhhXYu4+GMxgsKsdn1vKrNElmto=
X-Received: by 2002:a6b:8f82:: with SMTP id r124mr23134425iod.6.1565593282599; 
	Mon, 12 Aug 2019 00:01:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190730072254.10730-1-brgl@bgdev.pl>
In-Reply-To: <20190730072254.10730-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 12 Aug 2019 09:01:11 +0200
Message-ID: <CAMRc=MfE4sO7BAsmFdnQnogdXJ-TpJTkDODgLaxxKoirVVVngA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] qemu: fix patch authorship
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
X-List-Received-Date: Mon, 12 Aug 2019 07:01:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

wt., 30 lip 2019 o 09:22 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82(a=
):
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> I accidentally changed the patch author when backporting this from
> upstream qemu. This commit restores the original author.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  ...4-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/qemu/qemu/0014-linux-user-fix-to-handl=
e-variably-sized-SIOCGSTAMP-w.patch b/meta/recipes-devtools/qemu/qemu/0014-=
linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch
> index 2feb567f1c..f7939b84bf 100644
> --- a/meta/recipes-devtools/qemu/qemu/0014-linux-user-fix-to-handle-varia=
bly-sized-SIOCGSTAMP-w.patch
> +++ b/meta/recipes-devtools/qemu/qemu/0014-linux-user-fix-to-handle-varia=
bly-sized-SIOCGSTAMP-w.patch
> @@ -1,5 +1,5 @@
>  From 8104018ba4c66e568d2583a3a0ee940851ee7471 Mon Sep 17 00:00:00 2001
> -From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> +From: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>  Date: Tue, 23 Jul 2019 17:50:00 +0200
>  Subject: [PATCH] linux-user: fix to handle variably sized SIOCGSTAMP wit=
h new
>   kernels
> --
> 2.21.0
>

Gentle ping.

Bart

