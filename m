Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 30B567016E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 10:06:22 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id v83-v6so9478477itc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jun 2018 03:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZDClrjZZjY1NlvX5HP0VnOiZ8YbG4uRcPy+ovGbkPdY=;
	b=h+gqmwj+cMduJIFrFagcxOiIc9a+8Kly8iK+jOp1NlSv2TbhYeUrMZvM7lM6x49VUH
	u6eD2afcteMfa0Pw3LY6abMZhSTnJSKPaHWdz6k9eOHitIGMhzOBVnxVL53IGmS+87q4
	rUVcBMc8UhSo3Q3X1xKZlRX8EjKy/96Lb+EPehs53HCgsyplhtDsFtwgk/QDOG8lJSig
	QzHXplgHbJ1VfhbvxPcJ/k55PEoEh/nhPBMo58x7eJeHSjQCT90ZlR1nVVPKaYwaZ4xm
	FCV19p5GR6wQ+f029q1hb96pDhZ4P2GEazOI4HV5NFkBRW0CswQ4/oNSzdPUbcPNwuo8
	osPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZDClrjZZjY1NlvX5HP0VnOiZ8YbG4uRcPy+ovGbkPdY=;
	b=dupP0bnkQTH/eXNhtHzQZ0V2w/7TW5LhkskFtSh+sTHqXFXV4UqfcmNvu5IqF8vPVG
	9a5no0nOBuJL+5j/k/qIotKVEPV9pFV/GAWPwLApjhGsRzRGkNq3+5QReCWHpGMulDWF
	JIg7ZoJnZ/mMZ1RLH55BvZObkLMB2KE7v/WSFU72kSOQPxkcYnTLkwqkMR5sksv2VeY2
	l03smp/aW0FO6PK1/5NMGGJvo0TK1Yoa7ywCXPES6WGJV8djjpyc4iHJpVei9cXbUedE
	tQBduvv0NaJ+MXG2HAs6GTCEVvhipxU5AAxbME3Sgdkx0p1xfryMWZeXEKuG4UUHrRuK
	OtXg==
X-Gm-Message-State: APt69E3SeZ3b7nskfQEX+lQXeoKqu547VvnJjg4EYqf1zoTZhigR1nDL
	pqWxh+gVa/6KyEm+0yWLjFDspe6kywRTvMwzVcZdvA==
X-Google-Smtp-Source: ADUXVKI807nf2UNJKCnRZERUqP9atYqiWEK6ovoTJc2owFv6aKETBgZx1iEeyskrd6K9evwFq1bMh73qS0BSn8rZs0Y=
X-Received: by 2002:a24:4d8c:: with SMTP id
	l134-v6mr13822118itb.60.1528106783257; 
	Mon, 04 Jun 2018 03:06:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:f614:0:0:0:0:0 with HTTP;
	Mon, 4 Jun 2018 03:06:02 -0700 (PDT)
In-Reply-To: <20180601221436.27162-2-alistair.francis@wdc.com>
References: <20180601221436.27162-1-alistair.francis@wdc.com>
	<20180601221436.27162-2-alistair.francis@wdc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 4 Jun 2018 11:06:02 +0100
Message-ID: <CAJTo0Laocxug2iUZjAD8bLqDN4ho7GPO=_c2ZOQQmvSErOXyyQ@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] [meta] atk: Specify gettext-native dependency
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
X-List-Received-Date: Mon, 04 Jun 2018 10:06:22 -0000
Content-Type: text/plain; charset="UTF-8"

So why isn't the inherit gettext sufficient?

Ross

On 1 June 2018 at 23:14, Alistair Francis <alistair.francis@wdc.com> wrote:
> atk requires xgettext to compile, specify it as a dependency.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  meta/recipes-support/atk/atk_2.28.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/atk/atk_2.28.1.bb b/meta/recipes-support/atk/atk_2.28.1.bb
> index 657c69d576..1198005804 100644
> --- a/meta/recipes-support/atk/atk_2.28.1.bb
> +++ b/meta/recipes-support/atk/atk_2.28.1.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
>                      file://atk/atkutil.c;endline=18;md5=6fd31cd2fdc9b30f619ca8d819bc12d3 \
>                      file://atk/atk.h;endline=18;md5=fcd7710187e0eae485e356c30d1b0c3b"
>
> -DEPENDS = "glib-2.0"
> +DEPENDS = "glib-2.0 gettext-native"
>
>  GNOMEBASEBUILDCLASS = "meson"
>  inherit gnomebase gtk-doc gettext upstream-version-is-even gobject-introspection
> --
> 2.17.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

