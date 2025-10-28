Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53445CCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 14:20:09 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.10136.1761661204860490856
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 07:20:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=juVWUqW0;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-63c4c346bd9so11742355a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 07:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761661203; x=1762266003; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XAt9uJpbxfuFvBolNrpK9QCVQSuYMGmqHEqkdjzM1R8=;
        b=juVWUqW0TTmVgtM4/CxmqDivas5lU7xPwCspIjBIB79VxTixeOAxPePYPkQLRXxSNu
         b7Yb9q7V9ltgFz2MVL6SiCbZ6zz5tW8kouS9gPDl7RbFcq+snxHwrWdKYG//220Vkzlc
         jXfyKqAq7GBLWvOR+4feW8KdNi5vANDU//Pr2gtN5w6zdstDIf9J0goPj85drhXvuwHe
         NzogdiWvrnR5kPu+PekmLQLLaLYH5pQDVgLylFu0z7PP2GveSxLm29Jxeo55Mh6UbLBO
         Muzay092Axt9trGni3neeL+KcUs6nKayv3jtNTqc5eL/cDflxckSrcmP7Z8jyiUJdni0
         sfIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761661203; x=1762266003;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XAt9uJpbxfuFvBolNrpK9QCVQSuYMGmqHEqkdjzM1R8=;
        b=cbCal4ea/Xnd/er5+80pHUvnwpez6U5v8yXgST1wHpLkzZKifcwmKQYcNhdtgxa4ru
         wzEEYP514260RGWKD+1dSJH9Qa4uRpYmDTr8xf6Hnnw2p1qDNq6l7rLF25JnQEBUM0ZX
         SdsBKPWNIU7hlxHYpjafGmUQ8c02QFsI15jCe3Nj/idcTaD1V00v6DzGjWYQ/gwuKBkb
         lW2NBjQnKN8wzTA2AWoubMDi61vKvbYoVKNt6QQDunPHQvOBMcMwqyVrQq+OCikgrW0Q
         1bXCu43TsyczXs3Bh9sXv/V9Va5Ben35nixeOpur+FcXgHZEvwto+r1r2K8Zf5DorkYL
         uamg==
X-Gm-Message-State: AOJu0Yz2J7z7qB3+ROlXPRzsm9TCVYWgEFZYO57RLVdPM3NPpMuRS/dc
	2CcIBJbyy1nZaRMR9ekya0+DXxZkzJbfbhsAPAJIqoPNopH6SH7Xeka+7qRXlQ==
X-Gm-Gg: ASbGncvnIVdGWWav0oewIqSIZ+mIosY9yXMoEirq7x8NFWaF7ZaqxfPWoHhVxjTNoiL
	38Yd77daWLJqeV8n+3+klBbGbqCz88zFdzfTMSWq0HdH+S2Oq9SwcI1ZJ5JlOHc12jVoK4AnBg9
	GVqptx0OsHu9cvKCnTRcOfbal/nQDsIMqZL6x2FjdVG4yqzh3Xh+MTkVbjTuo5Atv6cxegCjdUR
	OAOrWsLvrQDt6CXD4HG8KojRQJLNZRudZ8jW1GYUUX8Ti1jO+KuMDAJ7BrI29AlJYd+pc7SKoWn
	8vO4VvIRJuUWq1eZIgBTuX4EaO/GHDpHGJltv8V0SgL2jC2Czn54SHqjeNfGqwD/k5cJqmqFaqV
	UBpP7ALR/vj2SV3rpdfEzyLSh3la7mGRwcOC2+RGjjwEA+tOL/buYrxsPwCtF4Iu0b7HneOb8By
	o6pubI303QybwQ3VxRBBBSjF/8FPX549LD7YKTdNH25HZG
X-Google-Smtp-Source: AGHT+IERR+cd1pvti+RAFYBTcqoijdF4slzSbtCBRpX3wnmCMiSUFX2GEY8XGmSY8XbZr3xWtcj8pw==
X-Received: by 2002:a05:6402:1467:b0:62f:c6c8:e6c6 with SMTP id 4fb4d7f45d1cf-63ed848f035mr3301186a12.23.1761661202863;
        Tue, 28 Oct 2025 07:20:02 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640325d4079sm1112864a12.0.2025.10.28.07.20.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 07:20:02 -0700 (PDT)
Message-ID: <921ee01c-e264-4e29-a424-ec294b7f2903@gmail.com>
Date: Tue, 28 Oct 2025 15:20:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: rpm-sequoia-native issue Re: [OE-core] llvm-native is pulled into
 package builds that do not rely on it
To: openembedded-core@lists.openembedded.org
References: <18729CC0E7CCD2F0.436@lists.openembedded.org>
Content-Language: en-US
Cc: Khem Raj <raj.khem@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <18729CC0E7CCD2F0.436@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 14:20:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225411

2025. 10. 28. 10:12 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
> Hi,
>
> I am trying to make my meta-clang-revival layer compatible
> with Yocto 5.3 that merged meta-clang and llvm is split off
> into its own recipe.
>
> Target recipes that use LLVM 14 or 15 (most notably, variants of
> intel-compute-runtime and their dependencies) fail with
> conflicting files being copied into recipe-sysroot-native,
> like static libs from clang14-native and llvm-native, etc.
>
> As far as I can tell, the issue occurs during packaging, after
> compilation already succeeded. The dependency chain is correct,
> otherwise the issue would occur during do_prepare_recipe_sysroot.
>
> It seems that the python function "extend_recipe_sysroot" is re-run
> for packaging. That's when it fails because llvm-native is pulled in,
> because llvm-native conflicts with e.g. clang14-native.
>
> Is it because I use signed rpm packaging?

Apparently, yes.

> rpm-sequoia-native, while it depends on rust-native, and as a
> consequence, depends on llvm-native to build, requires neither to run.
>
> How can I avoid this problem without switching to non-signed rpms?

I found the solution:

SSTATE_EXCLUDEDEPS_SYSROOT = "\
     rpm-sequoia-native->.* \
"

I have added this to my repo's layer.conf.

It may be useful for including in oe-core, or maybe not.

Only recipes depending on older clangNN versions in my
meta-clang-revival trigger the problem.

> Thanks in advance,
> Zoltán Böszörményi
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225383): https://lists.openembedded.org/g/openembedded-core/message/225383
> Mute This Topic: https://lists.openembedded.org/mt/115990504/3617728
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


