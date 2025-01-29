Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E77C1C02190
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 11:16:25 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.10173.1738149378328213414
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 03:16:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fx2zJo5F;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso3828505e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 03:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738149377; x=1738754177; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d3Km5kkvoPyIkZOgWjXOBbLYeFGv/fztdV8HM5iWYdo=;
        b=fx2zJo5FiD6DGhLAtvbuRLhcULQD641e9f6IINQ1oXq7mgf5D0EbmstkUSKl80TMCX
         7NiPwQ0amDwDm9r1tryQoPF/tsVntFu46W7+XoOQKsTeNTZ85030578MhWQnOJTTNbxf
         DJNGNM3op7LCiN2TW/y1q3IPJ0tg1lc/6GueXNEqcIGxCNWeFYkUWYvSKS3XAXryoj27
         PNTfwh4q+nHXdmcQTSEnOBhGb9MYGUujkisTUYEekkc1XAox+cV4FsA5XD1wBrYhvunO
         ZaLn2QGm8nF9HusQxDEgtClbJmB71JFO5jR+GJjgx8R95BF/ljiruWz6+WGkczQCPL04
         PrvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738149377; x=1738754177;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d3Km5kkvoPyIkZOgWjXOBbLYeFGv/fztdV8HM5iWYdo=;
        b=HfQcoMgf50NdGP100INnxIWktscLCoUQDtMfJDkNC+gtlRqsWSLxs+gyVXBZFoE6KL
         yS+YmtHNWQOr3QtvA5WsB0+v5pJXGUw3o/tNYOOg060UY86lrMyzNZdPj9fj9wrZTEcb
         DDYTj5Yqo5EutIvdfgceIhCI29HeuPzaedejsul0Nd8kfIxohdlTKgd+iM6yGznyIFKz
         F38NbYczw4Kmx0wyRZXIHBj27RJa9DE+vVMWeUD8l7VyBFachuZsZGW6h/JBqO8NHHNN
         +EiBI3uygN5wwQtzv7RWYP4XfgBI2Yim0CaBtF6UVFOVaSiYzDtHX4bCBjTd8mTveMr8
         B1hA==
X-Gm-Message-State: AOJu0Yy/SeOWjpHnNKfnZ1yhhGFXfgxaB9X/hDDuT81eUpcImSAvqIOc
	IVRTnKKrdQKZRt/k54xfrAUiRBIjBEk9WCtGg1cGA+hqK71zScqj
X-Gm-Gg: ASbGncsn9yUuxN33yvsH9CZosozvQP3FkasqFiGzMjAAtPkXL7tUAcgMmgwJH2C6bbf
	CYSQhbExEDVNE8zZ0SvySE8pVqz2P9YT9bkNT9TNzp6qENlbcCsPDHOhfLRusZCJmJCLgkr+Rak
	j+6oGT6h+PDRlgG2VUDPewHYEV6h5/z7+2m+9JeCMDYfgMDkFALize5gcDsMTcjfm8hduQBRjuU
	x+HuhyWuRKenpfVIt+PiPOhOKhVDE+8yeQfUcwRxfMIIaUTGFp/kZX/QuNOB1C/kn8XQVhih7Mn
	N4yXRsUXF0/gaHl09FshDVxEsLj/wgLyhvfB0Az5RyhdZ0Nj
X-Google-Smtp-Source: AGHT+IFhid6593Dqxz6CPBOar3RCC5sRc2YaMThYWzhR9t+D62wMbkJaShlx10Oiqr4XLPjB5MMfMg==
X-Received: by 2002:a05:600c:4893:b0:434:92f8:54a8 with SMTP id 5b1f17b1804b1-438d57c04fdmr54300375e9.0.1738149376439;
        Wed, 29 Jan 2025 03:16:16 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc24e73sm19052835e9.16.2025.01.29.03.16.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 03:16:16 -0800 (PST)
Message-ID: <40435266-20cd-4ed6-98cf-8cc498ea97e3@gmail.com>
Date: Wed, 29 Jan 2025 12:16:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v2 1/2] rpm-sequoia: New recipe for version 1.6.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
References: <20250129104150.2391653-1-zboszor@gmail.com>
 <CANNYZj84GhZfxXJ-Snnyb2Zfh2Qu_A5BZemxWNWCm=sKH39=Hw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj84GhZfxXJ-Snnyb2Zfh2Qu_A5BZemxWNWCm=sKH39=Hw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 11:16:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210373

2025. 01. 29. 12:04 keltezéssel, Alexander Kanavin írta:
> On Wed, 29 Jan 2025 at 11:41, Zoltán Böszörményi <zboszor@gmail.com> wrote:
>> +++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.6.0.bb
> Let's take the latest version right at this point, which is 1.7.0.

Ok.

>> +# The license line is taken verbatim from Fedora's specfile
>> +# with formatting differences for Yocto. (AND -> &, OR -> |)
>> +# https://kojipkgs.fedoraproject.org//packages/rust-rpm-sequoia/1.7.0/3.fc41/src/rust-rpm-sequoia-1.7.0-3.fc41.src.rpm
>> +LICENSE = "LGPL-2.0-or-later & Apache-2.0 & BSL-1.0 & MIT & Unicode-DFS-2016 & (Apache-2.0 | MIT) & (MIT | Apache-2.0 | Zlib) & (Unlicense | MIT)"
> This is the original source, please replace the link:
> https://src.fedoraproject.org/rpms/rust-rpm-sequoia/blob/rawhide/f/rust-rpm-sequoia.spec

Thanks!

> Does the target rpm-sequoia build without issues, or did you try only
> the native?

I tried both. bitbake rpm-sequoia implicitly builds the native version
if rpm signing is enabled. :)
I checked that rpm is linked with the new library.

> Otherwise, this looks really good, thanks for working through to a
> much better recipe :)

Thanks. :)


