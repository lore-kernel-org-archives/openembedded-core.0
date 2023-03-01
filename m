Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3936EC64EC7
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 08:26:16 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.17411.1677659171302113437
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 00:26:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h1Y4FAYS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id ay29-20020a05600c1e1d00b003e9f4c2b623so11218934wmb.3
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 00:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hN29P2vXeK4KWXWTY327JTFQPZnOJW655BmzWJrN2tU=;
        b=h1Y4FAYSUfz8fpcg794EEHRlNnM483k72akhAfaVI4LOPn+VsyRnottwELLx7xbWHw
         vZTsTPyrDDrrT/feWoo0Ba1JoKKoyNOUaLfzDqlI+c53pcd0s2RQQNt1ghZdZNFcTGmx
         zMlu6C/lx9AXVK5KCu1NXfrwS5PKREKeQRg7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hN29P2vXeK4KWXWTY327JTFQPZnOJW655BmzWJrN2tU=;
        b=nOO5XNne864azHfYnqg2A+7v7COuEXTzX4mmIBXYuiEdaBQOsXugCBQxqj6ooTVWWb
         HLthkaqIAQa9smxgRUy2bzt7EXM9JDWPXQIUpJRKvvqMdJ/Ix0uiGa256F1tD/iYvAAI
         3Wgp7FXP0bReUtiUmDdRu2yTyI1E6mopqaAizkO5r9ytcjE8fAdwZwFpjidHcm+iwU8j
         hdppEjVH4rSAfijNyN/dB8GYxlhxSbgW1nerEBHliIzvEFwyRPAWCclRBMysmDF8eGTj
         rcv3Bf2hsldWdB/3sJvdBskSRw9EXz8RmKXgOeqd3CYwef4pSvRDpQrxI4HlachNPfTR
         G/TA==
X-Gm-Message-State: AO0yUKV0CY1O7+LZEJ58Zjk3+cRQaqSi79sqtz3qB+uO/Xmnkr8/cStm
	ZB1zc0wViFh/ZgpeN8FpwT0SkQ==
X-Google-Smtp-Source: AK7set+ynZ20zBrnY+T9tT7AKYPSQpy+/jWc1XTZXPCyjC0XpKP3xSMe4XZLwsT2KwSQ2RZwfA6g4g==
X-Received: by 2002:a05:600c:4f42:b0:3eb:38b0:e748 with SMTP id m2-20020a05600c4f4200b003eb38b0e748mr9723127wmq.13.1677659169548;
        Wed, 01 Mar 2023 00:26:09 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:cc9e:5433:f22d:3a1c? ([2001:8b0:aba:5f3c:cc9e:5433:f22d:3a1c])
        by smtp.gmail.com with ESMTPSA id fm16-20020a05600c0c1000b003dd1bd0b915sm18675157wmb.22.2023.03.01.00.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 00:26:09 -0800 (PST)
Message-ID: <78da5788b9adfdfa1bdff68b3b38b3de96999a82.camel@linuxfoundation.org>
Subject: Re: [OE-core] Yocto reproducibilty issue :: rust-llvm binary
 differences
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 01 Mar 2023 08:26:08 +0000
In-Reply-To: <22315.1677652117161137395@lists.openembedded.org>
References: 
	<CAMKF1sp8fQHaZw=eyXD6C4qnQhLjNjZ6_upxfauEZ8jBT9egbw@mail.gmail.com>
	 <22315.1677652117161137395@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 08:26:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177874

On Tue, 2023-02-28 at 22:28 -0800, Sundeep KOKKONDA wrote:
> Hello,
> =C2=A0
> I tried to copy the=C2=A0libLTO.so=C2=A0to ${D}. But this shows=C2=A0ERRO=
R: rust-
> llvm-1.67.0-r0 do_package_qa: QA Issue: -dev package rust-llvm-dev
> contains non-symlink .so '/usr/lib/llvm-rust/lib/libLTO.so' [dev-
> elf]=C2=A0and I had a look into symlink where it points... The libLTO.so
> files RPATH in ${D} & sysroot-destdir are different as below,
> =C2=A0
> $=C2=A0objdump -x ./image/wdr/poky/buildA/tmp/work/x86_64-linux/rust-llvm=
-native/1.67.0-r0/recipe-sysroot-native/usr/lib/llvm-rust/lib/libLTO.so | g=
rep 'R.*PATH'=C2=A0
> =C2=A0=C2=A0RUNPATH=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/wdr/poky/buildA/tmp/work/x86_64-linux/rust-l=
lvm-native/1.67.0-r0/recipe-sysroot-native/usr/lib:/wdr/poky/buildA/tmp/wor=
k/x86_64-linux/rust-llvm-native/1.67.0-r0/recipe-sysroot-native/lib::::::::=
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::=
:::::::::::::::::::::::::::::::::::=C2=A0
> $=C2=A0objdump -x ./sysroot-destdir/wdr/poky/buildA/tmp/work/x86_64-linux=
/rust-llvm-native/1.67.0-r0/recipe-sysroot-native/usr/lib/llvm-rust/lib/lib=
LTO.so | grep 'R.*PATH'=C2=A0
> =C2=A0=C2=A0RUNPATH=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$ORIGIN/../..:$ORIGIN/../../../../lib:.:.:.:.=
:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:=
.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.=
:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:.:=
.:.=C2=A0

It is expected that the system would adjust the RUNPATH in the binary
to be relocatable so that isn't surprising.

> Also, the libLTO.so is a symlink for libLTO.so.15.

Right, so you only need to replace libTLO.so.15 and not the symlink.

>  So,=C2=A0I tried copying both libLTO.so & libLTO.so.15 but again getting=
 below QA error:
> ERROR:=C2=A0rust-llvm-1.67.0-r0 do_package: QA Issue: File '/usr/lib/llvm=
-rust/lib/libLTO.so' from rust-llvm was already stripped, this will prevent=
 future debugging! [already-stripped]=C2=A0
> ERROR:=C2=A0rust-llvm-1.67.0-r0 do_package: QA Issue: File '/usr/lib/llvm=
-rust/lib/libLTO.so.15' from rust-llvm was already stripped, this will prev=
ent future debugging! [already-stripped]=C2=A0
> WARNING:=C2=A0rust-llvm-1.67.0-r0 do_package: rust-llvm-liblto-1.67.0 was=
 registered as shlib provider for libLTO.so.15, changing it to rust-llvm-de=
v-1.67.0 because it was built later=C2=A0
> ERROR:=C2=A0rust-llvm-1.67.0-r0 do_package: Fatal QA errors were found, f=
ailing task.=C2=A0

You can avoid that with:

ERROR_QA:remove =3D "already-stripped"

> I tried to do the same with by adding my own task with 'addtask
> patchso after do_install' but that is also having some issues while
> calling that task and that is not recommended=C2=A0way to do it by
> Richard.

Adding to do_install will be much easier than trying to get the
dependencies right for that new task.

Cheers,

Richard


