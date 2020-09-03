Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.15151.1599143082185394000
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2020 07:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZmNsqZai;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id z1so3489432wrt.3
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2020 07:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Jw4hL+qTqvc776UpzoEazpgICuDcl3zAiQkGYRpbBJ0=;
        b=ZmNsqZaiUurE2BViZsomlBn+gDKijrPFsQjJf8C11VyPXE/Ri2cwpqtsW0qK8G7hNK
         wK3zJuunTTmt7MgQBsckG4hk2YJbE0Uh1RGhwUCm0QwP0I3Ue+D4xO4b1J0GQXf/Qiee
         7g/H18bURfu3VDMro+W5KaPfmr2dCsw58giAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Jw4hL+qTqvc776UpzoEazpgICuDcl3zAiQkGYRpbBJ0=;
        b=rDGlAk+J3bwhX0AcbKYpJ88m/gFSolT28HO1CKe5l0u41lRWhFlzIq0CgGPUuYy9XF
         kekkf6cvumlBLOLztF9z9kCn9A2/aoHm5NfToFy/B5ICr0iSG8EgeX+kwAFymB4e5sB0
         MxMDYPJddykrELAziZVZGiiEWXZIsnEMd8/0rne9HHqQBZPvpZ4F2lSlEMnl704N60yW
         vmiPZdDdIB75YlvrRpwOuowY8nt1/kwo2WK5Pt2+FVHF+9IwA54hQ0r/4ujygBsPX0X6
         y6D8aKGi/JBX2FZwHu3ZR34fyKu0W2aVLJYT82LeCgiWdniyO/FRwgrIraKe4j8ulUen
         TJSg==
X-Gm-Message-State: AOAM532MNTprAqYnUbzEgpMYH/zK/surTkpOI5UJ6VbFpqy8Uf2KCqq4
	Gp7z3TPUIprrPsj4zv6e/7f33g==
X-Google-Smtp-Source: ABdhPJyYC1Cg/dj9XO+4JlIxsLpHVgtfqW4p+gHQe9NlPBBdH9E7nPVgao/MoFJ9m6k7/VikogEb4g==
X-Received: by 2002:a5d:40c7:: with SMTP id b7mr2759270wrq.300.1599143080448;
        Thu, 03 Sep 2020 07:24:40 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.f.d.f.5.0.6.0.0.2.6.1.6.b.c.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.f.d.f.5.0.6.0.0.2.6.1.6.b.c.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:7cb6:1620:605:fdfd])
        by smtp.gmail.com with ESMTPSA id v2sm2762218wrm.16.2020.09.03.07.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 07:24:39 -0700 (PDT)
Message-ID: <1ad62c452ca661237401689e81c0ac4a1b182288.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] go: Upgrade to 1.15 major release
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Thu, 03 Sep 2020 15:24:37 +0100
In-Reply-To: <20200903013403.345340-1-raj.khem@gmail.com>
References: <20200903013403.345340-1-raj.khem@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-09-02 at 18:34 -0700, Khem Raj wrote:
> 1.15 is latest major release changelog is [1] and detailed blog is [2]
> 
> [1] https://golang.org/doc/go1.15
> [2] https://blog.golang.org/go1.15
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc   |  2 +-
>  .../go/{go-1.14.inc => go-1.15.inc}           |  6 ++---
>  ...ow-CC-and-CXX-to-have-multiple-words.patch |  2 +-
>  ...ent-based-hash-generation-less-pedan.patch | 22 +++++++++----------
>  ...-to-be-overridden-in-the-environment.patch |  0
>  ...4-ld-add-soname-to-shareable-objects.patch |  6 ++---
>  ...de-CC-when-building-dist-and-go_boot.patch |  0
>  ...dist-separate-host-and-target-builds.patch |  0
>  ...d-go-make-GOROOT-precious-by-default.patch |  6 ++---
>  ...008-use-GOBUILDMODE-to-set-buildmode.patch |  2 +-
>  ...place-glibc-dynamic-linker-with-musl.patch | 16 +++++++-------
>  ...e_1.14.7.bb => go-binary-native_1.15.1.bb} |  4 ++--
>  ...dian_1.14.bb => go-cross-canadian_1.15.bb} |  0
>  .../go/{go-cross_1.14.bb => go-cross_1.15.bb} |  0
>  ...o-crosssdk_1.14.bb => go-crosssdk_1.15.bb} |  0
>  .../{go-native_1.14.bb => go-native_1.15.bb}  |  1 -
>  ...{go-runtime_1.14.bb => go-runtime_1.15.bb} |  0
>  .../go/{go_1.14.bb => go_1.15.bb}             |  0
>  18 files changed, 33 insertions(+), 34 deletions(-)
>  rename meta/recipes-devtools/go/{go-1.14.inc => go-1.15.inc} (86%)
>  rename meta/recipes-devtools/go/{go-1.14 => go-1.15}/0001-allow-CC-and-CXX-to-have-multiple-words.patch (95%)
>  rename meta/recipes-devtools/go/{go-1.14 => go-1.15}/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch (93%)
>  rename meta/recipes-devtools/go/{go-1.14 => go-1.15}/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch (100%)
>  rename meta/recipes-devtools/go/{go-1.14 => go-1.15}/0004-ld-add-soname-to-shareable-objects.patch (89%)
>  rename meta/recipes-devtools/go/{go-1.14 => go-1.15}/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch (100%)
>  rename meta/recipes-devtools/go/{go-1.14 => go-1.15}/0006-cmd-dist-separate-host-and-target-builds.patch (100%)
>  rename meta/recipes-devtools/go/{go-1.14 => go-1.15}/0007-cmd-go-make-GOROOT-precious-by-default.patch (95%)
>  rename meta/recipes-devtools/go/{go-1.14 => go-1.15}/0008-use-GOBUILDMODE-to-set-buildmode.patch (96%)
>  rename meta/recipes-devtools/go/{go-1.14 => go-1.15}/0009-ld-replace-glibc-dynamic-linker-with-musl.patch (91%)
>  rename meta/recipes-devtools/go/{go-binary-native_1.14.7.bb => go-binary-native_1.15.1.bb} (83%)
>  rename meta/recipes-devtools/go/{go-cross-canadian_1.14.bb => go-cross-canadian_1.15.bb} (100%)
>  rename meta/recipes-devtools/go/{go-cross_1.14.bb => go-cross_1.15.bb} (100%)
>  rename meta/recipes-devtools/go/{go-crosssdk_1.14.bb => go-crosssdk_1.15.bb} (100%)
>  rename meta/recipes-devtools/go/{go-native_1.14.bb => go-native_1.15.bb} (96%)
>  rename meta/recipes-devtools/go/{go-runtime_1.14.bb => go-runtime_1.15.bb} (100%)
>  rename meta/recipes-devtools/go/{go_1.14.bb => go_1.15.bb} (100%)

Seems to fail on musl:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/2401
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/2402

Cheers,

Richard

