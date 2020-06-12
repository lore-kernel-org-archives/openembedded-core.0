Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.15316.1591947286419026692
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2020 00:34:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ohd+5Ry2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id x14so8671999wrp.2
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2020 00:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=pKo4q0Ea5RCA7btGvUER1q9gHS7MKaXGqtnG6GFuuY0=;
        b=Ohd+5Ry2TISuxcvTnnKAg/GXPGaY81A8yjtHQ2Qurk+pUflawj8i01HNY5RcTnHt5p
         94nmTjCs7e+9IBZSahfyQgz0LDeSz5mhPTX2vJXeh/yLEhlDVU7tXGq0qm5g8VW3c767
         kmruFWXViMGG+qiExcswwbOrckdDKuFlFFRYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=pKo4q0Ea5RCA7btGvUER1q9gHS7MKaXGqtnG6GFuuY0=;
        b=YOeMIStoer06mQikkuECFQd7cotxqGHlEVSX65LtUTvInY6QM6Ja+wS0+cWGznTuo+
         23Eolb1Zdd/ZvOK/AbozZH5A5pNRWG8+iUy6mTkh9icfXpaxJwxaroCCGgCNmR5T3ocp
         YEKnbFbNyJklc5ZAtHJ3K2xw9GczhD2wb8reWVG3iNWmQhEO5SyKWzsmtur769npERkB
         2e7m1HqAsSRPPX8nOuodYAaXfxwF4gWiZEBh08VKj6rl0nuaRvBPvDyyS2dTs/BO4F2t
         Xh6NSc7Tvlj7oowt0DpCVZlCrULAodGYrANzTdLqKfhKWMZzqf2wxo931Pt3vJRDYNPo
         4mug==
X-Gm-Message-State: AOAM5339T+N0cLNR4Hn3P+x/A2GRXQFa9nnc4UbujSQ1RZIU7ZwmIcTw
	wd3uTDo6+uEglZIxt6GOTb/frQ==
X-Google-Smtp-Source: ABdhPJxRKPIooE3YQsIAM93CiInf88XAXLm5WnQ7Ad3G1Law8XGfhIsRb3LPW7e0cULqUP7JwdIwEA==
X-Received: by 2002:adf:f30d:: with SMTP id i13mr12789612wro.146.1591947284925;
        Fri, 12 Jun 2020 00:34:44 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id z2sm8361763wrs.87.2020.06.12.00.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 00:34:44 -0700 (PDT)
Message-ID: <e617e5f69e0b7779d56e5248104c007848239dc6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/2] selftest: git-submodule-test: New recipe for testing a gitsm SRC_URI
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Paul Barker <pbarker@konsulko.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 12 Jun 2020 08:34:43 +0100
In-Reply-To: <20200604173301.12364-2-pbarker@konsulko.com>
References: <20200604173301.12364-1-pbarker@konsulko.com>
	 <20200604173301.12364-2-pbarker@konsulko.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Paul,

On Thu, 2020-06-04 at 18:33 +0100, Paul Barker wrote:
> Signed-off-by: Paul Barker <pbarker@konsulko.com>
> ---
>  .../recipes-test/git-submodule-test/git-submodule-test.bb | 8 ++++++++
>  1 file changed, 8 insertions(+)
>  create mode 100644 meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
> 
> diff --git a/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb b/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
> new file mode 100644
> index 0000000000..08089b4186
> --- /dev/null
> +++ b/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
> @@ -0,0 +1,8 @@
> +SUMMARY = "Test recipe for fetching git submodules"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> +
> +INHIBIT_DEFAULT_DEPS = "1"
> +
> +SRC_URI = "gitsm://git.yoctoproject.org/git-submodule-test"
> +SRCREV = "a2885dd7d25380d23627e7544b7bbb55014b16ee"

I didn't spot it at first but unfortunately this recipe is breaking the
autobuilder. I think there is a problem with gitsm:// modules not
mirroring correctly.

Here you see the a-quick build run:

bitbake universe -c fetch -k
(meta-selftest is included and SOURCE_MIRROR_FETCH = '1' set)

https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/1055/steps/10/logs/step1b

you do see do_fetch called for this recipe. Then later in the build it
does:

oe-selftest -r buildoptions.SourceMirroring.test_yocto_source_mirror

https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/1055/steps/12/logs/step1d

The intent is that we check YP can build from its mirrors. The test is
say it cannot.

Any ideas on what might be wrong?

Cheers,

Richard


