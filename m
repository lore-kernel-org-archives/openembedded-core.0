Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F93AE7BD88
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 10:25:21 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16904.1771237520129776858
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Feb 2026 02:25:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=JgllwOrP;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4807068eacbso22828405e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 02:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771237518; x=1771842318; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gi9xAJQdGbCBJABW4dz8rpYkO4w3MTLBdBdN1zRNjzc=;
        b=JgllwOrPKoGLmIXrz/KE1tByTzamXm7CuEoFNn4MJ01GYmCN2JFRp8HbXnr6Pu4hdC
         CtPt4wXaIO7vWLvzPq6xDhWSBE6MBGW32nRZRrf6GfhzZlcs8tv6TuC++LN/07V9WTAu
         eWQo8KVnXwpL+s9FoQB/hApCxHLeLy8cy7bPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771237518; x=1771842318;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gi9xAJQdGbCBJABW4dz8rpYkO4w3MTLBdBdN1zRNjzc=;
        b=OfGgKa7e9UDwoI4rqcSrY8CW51fMv0PRJRSGCQs90iHY+HZ/yalNtlb8dKmo7VbZtx
         Mm1TM5OY6AFi57Rm74a7X0wl7X8JFmSd3HlocsUkJO3PAsv/CNAGHSarggHrTpK1F6gH
         4dWSIaI6TdyiUoULahUOg0Wd3oi9yUu4Ts16VBdEeQVSnWgP6PKspWXhSi2cvdUZvVGO
         0HH1iAcSsNoIQJL76HB5bJVe0H4GKL2nTNTP5dN3HG/fB5Nrq+CqgTHp4DzURFLnyvro
         NYBXEvC33VhHJBXVYC6K8aNIS31uZkJz7RYpoWRMt6gMMCpxaNARWb44wazPKTQMSoI8
         XPMw==
X-Gm-Message-State: AOJu0YwEe1TkXpsEdaBEcnrI+eJfYR8ZSe4eHXYMPOVAEgBRNSVq5k3Z
	G1Grjr4dHN+mExW/FfbYNbHKm9GaMnFbOrBN/NPg8N7lDcjAkTgN/X3OEA5kYE0VPdY=
X-Gm-Gg: AZuq6aJK3eOkiVEKQh3CuTvj6FPh6Ofg2gQXLunykOQBQu0n90TPZ0FhfTnbjP6cGu6
	4MXIgvp+3idb8GZLXLXyL/earHZoYOHREH5sf1rVA5Lm9tqvxsBH93daxETId/xVEAc40ejxxig
	31O7jYBabXWDYy6K8iuZUZVzZaaWZAH8tk9FTNGV3RPs9Zp5UnHYeHwxVhrwE+7BfQu6m0UwEZ4
	YTWyZug6IU5/r/HyPcnUalOC3bz7OXnel4uOWpoeiwcuPVauR8fY5oqqrnogRrxMNdvau26qpyP
	guKlLLgEste0vWpOjUnHSLqxJFjLtReI5B3M6aDmVNjCQ8oPQvWqLRDtGqiSFAL3wJIUZVoWGI1
	R+I26nc3g60qeFOANc6sVK6ZskgpcQMaomEmpPmjET3AcWR5kvXPaHDGPO2hxWYbKyWZq/axB8/
	mHsjXar5QbzWOg1QZlRgi6BuMcYodHuYzsCgQP9ING6CsG+o7tb3w5LFyL2z1ucB4KubUK2LB6Y
	9Q4gv3ivR+h6TAV3bZiyg==
X-Received: by 2002:a05:600c:1907:b0:479:3a86:dc1c with SMTP id 5b1f17b1804b1-48373a7a0eamr166782995e9.36.1771237517954;
        Mon, 16 Feb 2026 02:25:17 -0800 (PST)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d834ebesm451454335e9.13.2026.02.16.02.25.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 02:25:17 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Feb 2026 11:25:16 +0100
Message-Id: <DGGBAPYOR973.2Q7OYDPEVCBTB@smile.fr>
Subject: Re: [OE-core] [PATCH] classes/base: prefer gnu-prefixed HOSTTOOLS
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>
To: <ernstp@gmail.com>, <ross.burton@arm.com>
X-Mailer: aerc 0.20.0
References: <20251029130310.2882818-1-ross.burton@arm.com>
 <CAD=4a=WCwONJsM3yXHWMsC9PPqUAQhm3ABsDTRoqO_YoVo910Q@mail.gmail.com>
In-Reply-To: <CAD=4a=WCwONJsM3yXHWMsC9PPqUAQhm3ABsDTRoqO_YoVo910Q@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 10:25:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231193

Hello,

On Mon Feb 16, 2026 at 10:32 AM CET, Ernst Persson via lists.openembedded.o=
rg wrote:
> Backport to other branches?

We do not plan to backport this to stable branches at this time.

Ubuntu 25.10 is EOL in July 2026. The next version is 26.04 (planed to
be released in April) and will be a LTS.

We would rather wait for 26.04 and see if its support is possible on
stable branches and what is needed (we will most likely revisit this
patch then).

For kirkstone (EOL'd in April), that will be too late.

Regards,

>
> Den ons 29 okt. 2025 kl 14:03 skrev Ross Burton via lists.openembedded.or=
g
> <ross.burton=3Darm.com@lists.openembedded.org>:
>
>> Ubuntu 25.10 has changed the default coreutils implementation from GNU
>> coreutils to uutils/coreutils. Unfortunately this causes build problems:
>>
>>   couldn't allocate absolute path for 'null'.
>>   tail: cannot open 'standard input' for reading: No such file or direct=
ory
>>   install: failed to chown '...': Invalid argument (os error 22)
>>
>> Clear build failures happen in 'install' and 'tail', but there may be
>> further breakage.
>>
>> Luckily, Ubuntu also installs GNU coreutils with a binary prefix of
>> 'gnu', so whilst these issues are root-caused and fixed in either pseudo
>> or uutils we can prefer the gnu-prefixed binaries where they are present=
.
>>
>> [ YOCTO #16028 ]
>>
>> Signed-off-by: Ross Burton <ross.burton@arm.com>
>> ---
>>  meta/classes-global/base.bbclass | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes-global/base.bbclass
>> b/meta/classes-global/base.bbclass
>> index 6de17d1bb5d..cf303c237a5 100644
>> --- a/meta/classes-global/base.bbclass
>> +++ b/meta/classes-global/base.bbclass
>> @@ -127,7 +127,11 @@ def setup_hosttools_dir(dest, toolsvar, d,
>> fatal=3DTrue):
>>              # clean up dead symlink
>>              if os.path.islink(desttool):
>>                  os.unlink(desttool)
>> -            srctool =3D bb.utils.which(path, tool, executable=3DTrue)
>> +
>> +            # Prefer gnu-prefixed binaries, if available
>> +            srctool =3D (bb.utils.which(path, "gnu" + tool,
>> executable=3DTrue) or
>> +                       bb.utils.which(path, tool, executable=3DTrue))
>> +
>>              # gcc/g++ may link to ccache on some hosts, e.g.,
>>              # /usr/local/bin/ccache/gcc -> /usr/bin/ccache, then
>> which(gcc)
>>              # would return /usr/local/bin/ccache/gcc, but what we need =
is
>> --
>> 2.43.0
>>
>>
>>=20
>>
>>


--=20
Yoann Congal
Smile ECS


