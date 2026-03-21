Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFCD1109448B
	for <webhook@archiver.kernel.org>; Sat, 21 Mar 2026 18:45:18 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16638.1774118711089818295
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Mar 2026 11:45:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2134RWqe;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so14648515e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2026 11:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774118709; x=1774723509; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rcd5vJ55JYWMMMZ6IwweezE8b2h4xKoSWXA8qJ1Cxw=;
        b=2134RWqePJ566vtNJvGSGYs8qwslwfojRian5F+dL0Uav1XuOlPRdmNF5rL5uG6CR6
         gSR+7nFoJDBlUH/Z9prmsMoGYT/9z2jF+c0qgz1Xg85/DgVChPVAQm9rG2lCIXvqINxx
         TiNuhGvC/l6ycQ2KYKx0+4DySlnX3VeSxdd6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774118709; x=1774723509;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8rcd5vJ55JYWMMMZ6IwweezE8b2h4xKoSWXA8qJ1Cxw=;
        b=nQUkLg8sYJzWuD1X8JXg5ZDF8UciIo5Mp4MlSKtvKMepZro3w6Q+urXmmezKCJd8k+
         CcgdeALDkKSx6FbHXojEql4Tf2gaitW+RC0kZ6asXy8+Zwgr2T9/OCdKn9AF4G12FWkT
         xQBylc1fOstgFG4PM80upCZ9aKZzcy1AQM7If+EgrVJqPMS8JjbATtBkH/8E0Ws7sHho
         lzL7zh8UPRnn1oJwsRJTDGrz7yjOI+rqYgpYrdrGfojyekSTR8IShpmOFM4VduHg+S/n
         HKwDX3Q6xfJMkAwP4SzW35n2jFEYOnX6SaR+og9ud3IQZIiN3hY4ithKvI8twth/VjoN
         JoAg==
X-Forwarded-Encrypted: i=1; AJvYcCVpKqs4efRXLOwoNPxSv/6L02V+tu17S0Po5vwtOXBbEswU3ddbR7ch/nTaAl3gdhQ63ShJtfjKb++Z0w3nn6kD/g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzWgpUp/sYyCMuB0N97pXPXewtS4jD47VUspSbVh/X0tyiKrf8p
	c7J+1Jv3YAJYABj1Tjuge8ZnaZyoRUc+6bc6e1dwGjAibElSJm+eeIPyCovUWHPkZK4=
X-Gm-Gg: ATEYQzxbeRPbiAdxEOeWLZeJYNGGXDijeNreSegLlHKUHRjMnIIyX6cTbx6pZlgW6Es
	imfeObEeAy1zRqgAHk9IQLv4ZBpN8qePpAhGZqGbffITHh3aljg8jz9mcXF+kxKP0HSH6pfWJYL
	x+7XAgDrH2RpKOTlYg0jEaPrTsEem8dlGsku7c9V1x2FjTm5Ck9M7+YiiOqsU12KK5+W2b8dIQv
	dxhVJk9aO/cp7eycLJ1kIoKQpXDj9lZq6FoTPMGappHfwWXY2C7Qk5VD4bUlkdX58Qe0OUDwhaR
	JK7WZoKNPSEfmVq5/K/wMW4m++CY0dXnFFtU7tQET9aItYGBkmETgLperlpaulZDGnhNLbaLjtK
	LWCMnuMkLxY1BNSD0Yjc5cgn8yQbSDIljhCofPH3hkMl/JQZSwHHnEJkcLAK7FzdF1v5dM/DTw9
	OgAtYFR/77/uMmAsk9PBkO1MjCn8qjbbRm51f0WKNBgAmpPd5gBqozqpRfsSV5IVZv5l+6EbdjC
	C/mqxoci0D41FE=
X-Received: by 2002:a05:600c:8b25:b0:480:6bef:63a0 with SMTP id 5b1f17b1804b1-486fee0d8cdmr108579425e9.21.1774118709425;
        Sat, 21 Mar 2026 11:45:09 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe6d9896sm170391965e9.2.2026.03.21.11.45.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 11:45:08 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Mar 2026 19:45:08 +0100
Message-Id: <DH8OLEZRDNFV.3D8WHZTAXNI2F@smile.fr>
Subject: Re: [OE-core] [whinlatter][PATCH 0/4] gn: upgrade to latest
 revision
From: "Yoann Congal" <yoann.congal@smile.fr>
To: =?utf-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi_Zolt=C3=A1n?= <zboszor@gmail.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260321073820.1403645-1-zboszor@gmail.com>
 <DH8CJYGCGVWY.CKRVLGTIY6JG@smile.fr>
 <8723b2eb-3931-4aaf-a406-e17fd62fa72e@gmail.com>
In-Reply-To: <8723b2eb-3931-4aaf-a406-e17fd62fa72e@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2026 18:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233667

On Sat Mar 21, 2026 at 3:02 PM CET, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n =
wrote:
> 2026. 03. 21. 10:19 keltez=C3=A9ssel, Yoann Congal =C3=ADrta:
>> On Sat Mar 21, 2026 at 8:36 AM CET, Zoltan Boszormenyi via lists.openemb=
edded.org wrote:
>>> The latest revision of gn is needed to build Chromium 145
>>> for whinlatter. Nothing else.
>>>
>>> See https://github.com/OSSystems/meta-browser/pull/963
>>>
>>> Please merge these into whinlatter.
>> Hello,
>>
>> Sorry but general upgrades like this are not acceptable for stable.
>
> I can keep the gn_git.bbappend in the meta-browser PR.
>
> But then it's not better when every layer shipped their version
> before moving it to core.
>
>> Is there a verifiable stability promise from gn upstream that would
>> somehow make that acceptable? Note that I'm not familiar with it.
>
> Chromium updates carry a lot of CVE fixes, too.
> gn is just a build tool for it and other projects.
Yes I understand.
But this upgrade has feature changes in it (see below) and those are
generaly unacceptable on the risk breaking existing code and our
stability promise.

Your whole series upgrade gn by 43 commits. I saw these ones that are
problematic just by reading the commit title:
 $ git log --oneline 81b24e01531ecf0eff12ec9359a555ec3944ec4e..9d19a7870add=
65151ff91bcc26252bb7521065cf
7498ca2e Add validation support to gn analyze/desc/path/refs
3c0f5be7 Add pcm files to the deps of phony target
bd3356ac Add `validations` dependency type to targets
1d89b984 Add conductor setup files
4e0818fd Add a sha256 hash implementation and use it for string_hash
0eb071f6 Add a `module_name` flag to source_set.
bf891ce4 Refactor module name to be dynamic.
8450d601 Optimize vector creation in compile_commands_writer.cc.
6e0b557d Run 'tools/run_formatter.sh'
ab6f8b21 Implement `string_hash` function.
d92aee22 Support weak_libraries
4619125b Do not add .inputdeps paths to --ninja-outputs-file
fb3b73df Make clang modules output -fmodule-file=3Dfoo=3D<pcm>.
e7f32021 Add --file_relation to gn refs command
20a6b6d6 Optimize vector initialization and preallocation in desc_builder.c=
c.
a0c5124a Add `reserve` statement when vector size is known beforehand.
092f4f0d Refactor container update by preferring the range insert.

If you want a shared repo with an upgraded gn for LTS, what do
you think about creating a mixin layer?
https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS#LTS_%E2%80%9CMixi=
n%E2%80%9D_repositories
https://git.yoctoproject.org/meta-lts-mixins

For whinlatter (stable but not a LTS) which have more or less a month of
support left, the bbappend in your layer is, IMHO, the realistic
solution.

Regards,
--=20
Yoann Congal
Smile ECS


