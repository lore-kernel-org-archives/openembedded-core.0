Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9658FC433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 23:36:21 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web08.4409.1645227380195401458
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 15:36:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=QbcrJoFZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.44,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f44.google.com with SMTP id lw4so18310270ejb.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 15:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CHJrLIHv7Ecgj/F2N17jF7+BGxK6KMTnNUeW8mAdFcU=;
        b=QbcrJoFZBNiEgUOENMpiKooxfn27ouJD3THm4HmfWp8tG6SSxQf3UwLnbzCPgJhi1N
         CciNEx4WwhJbJNYB/ompCbo7I2t2TJMLPTtPd6kxEyEP2DSnxpnYptAy1Q3GUOls755c
         apfqAJYw4XDc+KDL3gdXM82Mii68KrVJRJ8zo6H3l5Zt2xXbJaTQ1//MsgVgVw8dzvLr
         jBv0gjXg9D1YSxFo+ZZ0yQTVvy/kepEj5Wh4jNQgQAgIXID90REPivWW4wLoTWGOac5W
         ck2UGBinUyiH6j1NF4zIlv8+s0lsWQQo5iiwQZARudLfNMVk6waQfVY+2SChFgVfyqYA
         hhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CHJrLIHv7Ecgj/F2N17jF7+BGxK6KMTnNUeW8mAdFcU=;
        b=Yrvefzhui682ejvy6Webcrv5uWW+FJW+MVLsmKuKS7GipQmwYuxXtsvQyejbJiJdOs
         LF0/HDRn9ZzQ8oZ5/z+WXS7bYuu0InRsLclDDregXjtDl43QgBWWrGsPedkaYU1j2glP
         yUaJcp3r0UDboJW8A69IiWAMGcb8fWag8fBGMVELxt2Wo442dQZnpOjWR2b6GLCOvxjq
         VvISzamDogG+u/8wIdQx1P43T13DldbHbnt/u5B/sL2QxMaG/zHJ71YKME2c19iNaGIs
         ED5nHAaJASnr2Tt8eln1uVy9i1z9LnDKDb0QFSf8XcmA+X7GS9D1CAlRU7HT65+mj31D
         Dl6Q==
X-Gm-Message-State: AOAM531PUxdyt5/3hTCan88SbUY/qUyzmNIm5cDMqUqm7q7YpzGWjOGj
	xDovks0+/DacicWSDRbGTfXJ3SCxBXxkGV4SsfpsNQ==
X-Google-Smtp-Source: 
 ABdhPJwiZqFz5A1om8h3Ms66kHkO+UnOfXAZxNAMU29mVv5tyfYdtubapvkYmhqFLmXYwFZDf0d/fQoLTKlwRhu/4vI=
X-Received: by 2002:a17:906:6d09:b0:6b9:2e0e:5bdd with SMTP id
 m9-20020a1709066d0900b006b92e0e5bddmr7828793ejr.246.1645227378587; Fri, 18
 Feb 2022 15:36:18 -0800 (PST)
MIME-Version: 1.0
References: <20220216035900.851949-1-tim.orling@konsulko.com>
In-Reply-To: <20220216035900.851949-1-tim.orling@konsulko.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 18 Feb 2022 13:36:07 -1000
Message-ID: 
 <CAOSpxdYvC6Lk_d7MT81ZM72e4NUrPyg7W3HhF53_niN38bA77Q@mail.gmail.com>
Subject: Re: [dunfell][PATCH v2] openssl: upgrade to 1.1.1m for CVE-2021-4160
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Tim Orling <tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 23:36:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161954

On Tue, Feb 15, 2022 at 5:59 PM Tim Orling <ticotimo@gmail.com> wrote:
>
> Changes are only security and bug fixes.

I'm seeing ptest errors:

WARNING: core-image-sato-sdk-ptest-1.0-r0 do_testimage: There were
failing ptests.
Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/core/decorator/__init__.py",
line 36, in wrapped_f
    return func(*args, **kwargs)
  File "/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/core/decorator/__init__.py",
line 36, in wrapped_f
    return func(*args, **kwargs)
  File "/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/core/decorator/__init__.py",
line 36, in wrapped_f
    return func(*args, **kwargs)
  File "/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/runtime/cases/ptest.py",
line 25, in test_ptestrunner_expectfail
    self.do_ptestrunner()
  File "/home/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/runtime/cases/ptest.py",
line 108, in do_ptestrunner
    self.fail(failmsg)
AssertionError: Failed ptests:
{'openssl': ['test/recipes/30-test_evp_extra.t,_test_returned_1']}

Happens with both qemuarm64-ptest and qemux86-64-ptest:

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/2863
https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/3124

Steve

> https://www.openssl.org/news/cl111.txt
> https://git.openssl.org/?p=openssl.git;a=log;h=refs/tags/OpenSSL_1_1_1m
>
> CVE: CVE-2021-4160
>
> https://nvd.nist.gov/vuln/detail/CVE-2021-4160
>
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
> Changes in v2:
>  - drop SRC_URI[md5sum] that devtool snuck in.
>
>  .../openssl/{openssl_1.1.1l.bb => openssl_1.1.1m.bb}            | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-connectivity/openssl/{openssl_1.1.1l.bb => openssl_1.1.1m.bb} (98%)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1m.bb
> similarity index 98%
> rename from meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
> rename to meta/recipes-connectivity/openssl/openssl_1.1.1m.bb
> index bf7cd6527ef..c6f8499d4f5 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1m.bb
> @@ -24,7 +24,7 @@ SRC_URI_append_class-nativesdk = " \
>             file://environment.d-openssl.sh \
>             "
>
> -SRC_URI[sha256sum] = "0b7a3e5e59c34827fe0c3a74b7ec8baef302b98fa80088d7f9153aa16fa76bd1"
> +SRC_URI[sha256sum] = "f89199be8b23ca45fc7cb9f1d8d3ee67312318286ad030f5316aca6462db6c96"
>
>  inherit lib_package multilib_header multilib_script ptest
>  MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
> --
> 2.30.2
>

