Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF6E5C64ED8
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 19:45:12 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.28273.1677267902335649501
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 11:45:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=w2rt1xnN;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.41, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f41.google.com with SMTP id f13so1587197edz.6
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 11:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yxHUjT+awWpEH+w5dlILnI9qhYVMT88oeiUjvITbXjY=;
        b=w2rt1xnNH5dozJSAD2P0njJr6vAO1X8p/draHe0eDpek2FHYheuAn0CzDds/hMMU+6
         FRIfd9RfosjVpTNxU3y8h+y1iUm5FT8CSIFYR1olpsx6C9WDCWQN/JIrbXvtP+ubmrWl
         y5mj1TRcgJ8fJLiNO7NL2/M3Snhyn3t+Cm2gsUoMomQCzDIyx9hIhiIaiHgA+x+8mirT
         iS6xoFGU35hx1O4RqSODRbk0cxnsD43u75BfKRVKAZV/EaXnW8M8qY2VPkI8mcDYzyZz
         24ZlQpT3JX0onZq+Kxo9H012xC8cRN8AzMWDZGcFe9A5F+yi5fgj3SuGC/mevAsea+dv
         Jglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yxHUjT+awWpEH+w5dlILnI9qhYVMT88oeiUjvITbXjY=;
        b=N5KcGEmjeYclVy8zpXjmDVPQ3uP708WNyqelT+nTh5EeTy+LMC6J04CwYnMCi8NnjN
         /meMGVTk5lfFja1QgtDz2tioFE2BRsYw/P98u187AzXGDOXO5Amat8rp+2I9dCNchBsJ
         rmSMoTBbdotz3hEXMPLQkYxHLB/0lanc3wL40TvfcvUBPxIXVxOlRZsEjZ8sM3+/gr+v
         ieVsNGzXK1GUPJ4WGyfZybqcauBhXdMQRpszkOTHsZ2M1QlL9QfafXd37yxbg3Iv0+rw
         DBBAF3QbTnUAxcZxW2oJkwTpLNItzTIHWyTVE5gnkj/zWleTTcKrbREbqktzzpzKFoyK
         orRw==
X-Gm-Message-State: AO0yUKUTGPeBAqoqqtUG9oh7Z53/n/zg8WSfj4PYfGNp0hMCCCkQ0/Cb
	BMgWOuULWTG/vHq0TfWr9To1AlkaP0FtGD693n271w==
X-Google-Smtp-Source: AK7set+Q6qlvVfjFHqIX8d4+y4FRICHimUfOcZ79k9mhNwCMMmjekV3Fl1GA08YID2Ih/k631tJ/rRsRX+6cmAz+g18=
X-Received: by 2002:a17:907:60cd:b0:8b1:3540:7632 with SMTP id
 hv13-20020a17090760cd00b008b135407632mr595541ejc.2.1677267900710; Fri, 24 Feb
 2023 11:45:00 -0800 (PST)
MIME-Version: 1.0
References: <PR3P192MB07142C2980B0341534DEAE4BDAA59@PR3P192MB0714.EURP192.PROD.OUTLOOK.COM>
In-Reply-To: <PR3P192MB07142C2980B0341534DEAE4BDAA59@PR3P192MB0714.EURP192.PROD.OUTLOOK.COM>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 24 Feb 2023 09:44:49 -1000
Message-ID: <CAOSpxdazLrhvB0dbrmbXUgrZoajFMoMUuo-ZuBF3VN5hSAKzQw@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] openssl: upgrade 1.1.1s to 1.1.1t
To: hsimeliere.opensource@witekio.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 19:45:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177712

Also a corruption issue with this patch:

Applying: openssl: upgrade 1.1.1s to 1.1.1t
error: corrupt patch at line 19
error: could not build fake ancestor
Patch failed at 0001 openssl: upgrade 1.1.1s to 1.1.1t

Steve

On Tue, Feb 21, 2023 at 6:24 AM Hugo Simeliere via
lists.openembedded.org
<hsimeliere.opensource=witekio.com@lists.openembedded.org> wrote:
>
> Major changes between OpenSSL 1.1.1s and OpenSSL 1.1.1t [7 Feb 2023]
>
> * Fixed X.400 address type confusion in X.509 GeneralName (CVE-2023-0286)
>
> * Fixed Use-after-free following BIO_new_NDEF (CVE-2023-0215)
>
> * Fixed Double free after calling PEM_read_bio_ex (CVE-2022-4450)
>
> * Fixed Timing Oracle in RSA Decryption (CVE-2022-4304)
>
>
>
> Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
>
> ---
>
> .../openssl/{openssl_1.1.1s.bb => openssl_1.1.1t.bb}            | 2 +-
>
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> rename meta/recipes-connectivity/openssl/{openssl_1.1.1s.bb => openssl_1.1.1t.bb} (98%)
>
>
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1s.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1t.bb
>
> similarity index 98%
>
> rename from meta/recipes-connectivity/openssl/openssl_1.1.1s.bb
>
> rename to meta/recipes-connectivity/openssl/openssl_1.1.1t.bb
>
> index 6c8f285996..a1956ad8c2 100644
>
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1s.bb
>
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1t.bb
>
> @@ -24,7 +24,7 @@ SRC_URI_append_class-nativesdk = " \
>
>             file://environment.d-openssl.sh \
>
>             "
>
> -SRC_URI[sha256sum] = "c5ac01e760ee6ff0dab61d6b2bbd30146724d063eb322180c6f18a6f74e4b6aa"
>
> +SRC_URI[sha256sum] = "8dee9b24bdb1dcbf0c3d1e9b02fb8f6bf22165e807f45adeb7c9677536859d3b"
>
>  inherit lib_package multilib_header multilib_script ptest
>
> MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
>
> --
>
> 2.25.1
>
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177525): https://lists.openembedded.org/g/openembedded-core/message/177525
> Mute This Topic: https://lists.openembedded.org/mt/97112482/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

