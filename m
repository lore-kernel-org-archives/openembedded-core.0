Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.682.1793228906796787436
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 16:08:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=vx9H3mS5;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so1829395e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 16:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793228905; x=1793833705; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zdrf0lIiQNG80Jqcq9qlYaLmAjufr9/p9MX/fBaQlUA=;
        b=vx9H3mS5qNkUM6rhyC8Yt4kWShNB30M7a8bwVifOkq1E+t8hpnci23vKANV+jeFy6A
         vsRJkNYfiKQ2le155+RT2RESxW0g2aJWHlXI8gPI9xBTRFjLKTRf/spQSKQKtabI0i5Q
         iBp4wKUS2uE2u+tAo26xdnl6V+6eqN6dnXhXxgD39cMH4/DqqqmcZNTVWDOzhH5U6hTG
         SdDggeI5GU6dZihFhlNtFMBaPiHkrKyS2ckS7FfjBmW07KEvgtG38gkXHbyi244P8kne
         Y6fd5g+Ux8Ri+ylctMYs3/NI8hWXZkDdCABbVIynVm8wWNDqOx9ewAR9bQDoMqZ5rEd8
         LNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793228905; x=1793833705;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zdrf0lIiQNG80Jqcq9qlYaLmAjufr9/p9MX/fBaQlUA=;
        b=mJBI21ms5PS1lFNInnshSSzIFbf/xjlQSMobowD/2K4YuC4dPmb0kbfn3pM9MYqAVN
         G7hOXIDaVHVeUqgggdCFcYUd9WUW0AdH375TortSw8mhrUJb4yr+BlvKUoegD8gAvouE
         8j0+uphpOsf1DoSbvCTusIXyR4dKyqRlQoLmM+tOwPopr+XkEEEZjyd15RN+dKSnFalH
         0THeFwzPNtMjeYOwUm0coROUfdcKO98xq+uOy6pmBhGEyeaetxJ1iH7dGiWOJD0/+5Bk
         Gx1IAfhAxSDzQVjzAObiaQRV+MHCBa+et85CmfZOkHCZnlXSKmZowqL0ZLSaFJLjihov
         wH2w==
X-Forwarded-Encrypted: i=1; AKwUvBzSag9zV9Z/wHuXsgmJ0Ma1YGUmc84lCgriAwdBSYzVEEVXU7UX3vnhu2Xg/yVneAzc5OpCnzCyTQBRloZf1MlAXw==@lists.openembedded.org
X-Gm-Message-State: AFq9FYK0SU4Hdgqw0aTWG7U95/fBllqIWYMi0WGZgzKRYlCbrGC12sIR
	ODUNVHsuia863BP6+W0/FQUszzHPuML3B5xcJvSPGon0S3xDFdl3IM0i
X-Gm-Gg: AYBFou0l9kiaGIHuw7kv0zoauRHlah4ps/W/wIAVKrySt94eXSRQEDEcoIHrWJDC9cF
	fOuTOTodeyiZQu3eZBl95f/IzIvAtgUz0o8keMUJ1KI4RfwKNo/flO4UjuYxhf8cAn8YH3vJ9MA
	X+7+oVSQJOAfJlQXQWIq8F4Tw4kWkqZUnW3aM7BvBl3b4K4vSdmlMq4nNbL2hAfOzdlYtFLY1n6
	R5dVtWu4Z7hEPPrlofjHb4HwOCNYXpSeBAiBUJ+Sjt9fd/RZ79gYejihujZIs0bggyXZNu8UyeW
	jJluW97WypZ+cNhSlCcf8VTG4YDDIgMhvnWwUyC08/YoQ+Kt8urXfVazGBjQTJVtKW+74ey5zkX
	0mU8K8UjP3BCN0LPQnnoO9ySSbtF+uEJfd+idN+nYldm02W/jAOaTeJsZs5fYMd6WZLw8NFV/ry
	FgyB3R3/qEITDLPHoATePUsAVkq4F0HLl+sdfXFE5W+Szcyh1DwGra7qW/W68cBvXRPlP+J/prz
	Z6oBMCymK5PcLqPpcB8Of8FoFBMOAsMjSD2SlmNv+SjNlHM2RLF+mbTEL7V1anu0qECKk9Jiv6Z
	XSzL4OKjdEjEF7pQ1uaaQfu+paIDjOOe33ZFqJrRzh9SxGNjynRLf8a3FMyIR4+4Uw+8Q3qpqbA
	BWX1xcPOqlUrEQag2yWmAyjM=
X-Received: by 2002:a05:600c:540f:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4aa871e8bd4mr24863515e9.5.1793228904494;
        Wed, 28 Oct 2026 16:08:24 -0700 (PDT)
Return-Path: <adrian.freihofer@gmail.com>
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa8213ead6sm22684965e9.14.2026.10.28.16.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 16:08:24 -0700 (PDT)
Message-ID: <8ab23bcff84d5834ceef6fe5e5d0a30411036a82.camel@gmail.com>
Subject: Re: [OE-core] [PATCH 12/20] devtool: ide-sdk: enforce LLDB for Cargo
From: "adrian.freihofer@gmail.com" <adrian.freihofer@gmail.com>
To: enguerrand.de-ribaucourt@savoirfairelinux.com, 
	openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Date: Thu, 29 Oct 2026 00:08:23 +0100
In-Reply-To: <20261026-devtool-ide-sdk-cargo-v1-12-d4504e124d07@savoirfairelinux.com>
References: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
	 <20261026-devtool-ide-sdk-cargo-v1-12-d4504e124d07@savoirfairelinux.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 23:08:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248851

Hi,

This is a blocking issue. uses_lldb is wired into ide_sdk.py (debugger
selection, wants_lldb_server) and ide_code.py, but not into
ide_plugins/ide_none.py. ide_none.setup_modified_recipe() still checks
toolchain =3D=3D 'clang'.

With --ide=3Dnone or --ide=3Dall on a Cargo recipe, the image gets lldb-
server and RecipeLldbNative, but GdbCrossConfigNone generates gdbserver
scripts for a gdbserver that isn't on the target. Please use
modified_recipe.uses_lldb there.

No test can catch this today, since all Cargo tests use --ide=3Dcode
only. Please add a Cargo --ide=3Dcode --ide=3Dnone test without QEMU,
asserting the generated debugger configuration and install script, as
the C++ _test_code_and_none_qemu does.

Also, the comment citing the VS Code Rust docs is good. Please add one
sentence on why cppdbg/GDB can't resolve Rust breakpoints.

Best regards
Adrian
