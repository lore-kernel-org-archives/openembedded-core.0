Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2287BC83F27
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 08:14:02 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.7449.1753172034831876828
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 01:13:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BT8jo392;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7e3142e58cfso315879585a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 01:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753172034; x=1753776834; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b2dmLLBl+9/99QUdF9vIdCR7IxLJjzCBipOJZC9jacM=;
        b=BT8jo392SMKLCSyG7IAw5v8CrXp8yfVuXn4QpETbBQYYA6jqwgsQGGIwPgR8MCWPFl
         1Y8cXIOp0UgNPtHGRC78lSphVAAGuIwt3tgctLjUS+zVB/MqhiFIJjpW0HslNkJRXfBX
         arBo5xT1rjek90G6+tvuVrOzNqX32J09ydRXcRPWZ2dNTMGjRaCierEwt1qXBRMoJ8eo
         JlgPk0l4bzuhQo/3ULoqYjydp9omodEjQmBzYAwqeEwOx7Bz3ZqAaLotrpZ7UuqErTei
         RjKFQbiE8YSXXajvwZt/yr1xLGPARJXjmADEfbNdTDPzoSWYV4ljdmPCfyq0+L6UW0OO
         /Cug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753172034; x=1753776834;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b2dmLLBl+9/99QUdF9vIdCR7IxLJjzCBipOJZC9jacM=;
        b=hPaFHgin2Q7EQReOAMn8jKihfbDhbg1JwSz5CEIB+lJh0b+KF+GVzSa76HsAuQRkbg
         SsLv58qE51eJYsy2WcljgRA0Xpd4QT3GwReg7vJgo/kVsW9pSMEbri/Ad0bgqhhmD02l
         7pJaJfoZisOBUZfHAmbXnHkCUdUzexJqufL7ngNqYMLM3cSnQbomyfSrhUWyz0DylJmn
         EY847OhqOTECYCSy9uJkL3hjNEYl0aiRE4/Oiy4YCg/gQhOBasoziNMBErGTr7+2k81u
         COjTGs31+mqAs2XGO9SIepQ3jFYMKkY+q0M+CzCatui3VOWiMHUVwZi+I5awFlkCBNf4
         VO+Q==
X-Gm-Message-State: AOJu0Yw1imJGMNSEN5++mzG5h+GtLV76NEE+ypFpujL55tOp1qlttQZY
	9Vpw4/X4bu4m6pUigUaaHjT2GABEgjcl4HiAmVfSaQfP7MTlQgUm8HHjlZn1uDBDSDbZAAME9pm
	nkgXtlu6xfgA3VW9ALpZ+qQKYEDVtYW6mwQ==
X-Gm-Gg: ASbGnct2EQpOokgovbD5oHvAnsB4lp2f9Dke2wGsx6jHBbVxBuDU+MMAXcY1ZQVs6JL
	Y8TQ/PyduFoNn96ZwYMrdmtDqMxzr2O/14IiH6zD64WosKXl2YVcfmTnm2lGgcR6HVfS9JCNTxt
	nRUfAE4dvKzrFKNOsu5R9teRTT2x4B+AADZxa5Uug70SGII8WrHtKctNikstSI+/cWI22m3CCa4
	Qod/2KbLCLxnSyYJ+48hJAGo391JgS9aV8QP5JR
X-Google-Smtp-Source: AGHT+IHGMsCA9524KE1MDXw1JDINl/GlB6DUwuoc8YRfBRIWqjiJRvBs6ziTaTQmuuDGfmulH1FTGQUB31Mc7yhGzpk=
X-Received: by 2002:a05:6214:5d8d:b0:706:aae8:ad48 with SMTP id
 6a1803df08f44-706aae8ae56mr170939986d6.35.1753172033482; Tue, 22 Jul 2025
 01:13:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250722075840.664002-1-Harish.Sadineni@windriver.com>
In-Reply-To: <20250722075840.664002-1-Harish.Sadineni@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 22 Jul 2025 10:13:42 +0200
X-Gm-Features: Ac12FXxODok-qFe724QcM2hoyR7G6VmfAxQXJQZq1g2iZPoVFnHj2kl-6TIqtUE
Message-ID: <CANNYZj9TN44N0c5BtBM1YcbNKwUXWY2vjJbpspsuGC4Lu_o=zw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] Revert "rust: remove redundant cargo config file"
To: Harish.Sadineni@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 08:14:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220726

Reverting prior changes means there is a gap in testing that allowed
regressions to slip in. Is there a test that can be added to testsdk
that would catch such issues going forward?

Alex

On Tue, 22 Jul 2025 at 09:59, Sadineni, Harish via
lists.openembedded.org
<Harish.Sadineni=windriver.com@lists.openembedded.org> wrote:
>
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> The 'cargo build' is supposed to build binary for the target but it is
> building for Host.
> Reverting below commit to make 'cargo build' to built for target as
> default in sdk
> commit# 37fea972a6fafe360bfbb2d1ac472fa9e060c733.
>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>  meta/recipes-devtools/rust/rust-cross-canadian.inc | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
> index df8b78d326..fcfd178f34 100644
> --- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
> +++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
> @@ -64,6 +64,20 @@ do_install () {
>
>      chown -R root.root ${D}
>
> +    CARGO_ENV_SETUP_SH="${ENV_SETUP_DIR}/cargo.sh"
> +    cat <<- EOF > "${CARGO_ENV_SETUP_SH}"
> +       export CARGO_HOME="\$OECORE_TARGET_SYSROOT/home/cargo"
> +       mkdir -p "\$CARGO_HOME"
> +        # Init the default target once, it might be otherwise user modified.
> +       if [ ! -f "\$CARGO_HOME/config" ]; then
> +               touch "\$CARGO_HOME/config"
> +               echo "[build]" >> "\$CARGO_HOME/config"
> +               echo 'target = "'${RUST_TARGET_SYS}'"' >> "\$CARGO_HOME/config"
> +               echo '# TARGET_SYS' >> "\$CARGO_HOME/config"
> +               echo '[target.'${RUST_TARGET_SYS}']' >> "\$CARGO_HOME/config"
> +               echo 'linker = "target-rust-ccld"' >> "\$CARGO_HOME/config"
> +    fi
> +       EOF
>  }
>
>  FILES:${PN} += "${base_prefix}/environment-setup.d"
> --
> 2.49.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220722): https://lists.openembedded.org/g/openembedded-core/message/220722
> Mute This Topic: https://lists.openembedded.org/mt/114283231/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

