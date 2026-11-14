Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2639.1794615373438741646
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2026 16:16:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=GMTfKL8s;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e09aa5264so712570f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 16:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794615371; x=1795220171; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mKWHtZ8Wuf2gkuKsexNbL+Gv+tf/150hUz8v8BnJ1rI=;
        b=GMTfKL8sG0Ct/6+ElFCMhZw74Cwm7X/aIb8Cc4XytmicFBxkhVyUPLgsiznI6JjdNA
         oFO5Jw/x4ElW33T9vG/1SRU8pgLHaNFwxtIYNa40mO4MotfcfhRXLgN5J3j7Bb/XAAvH
         hrEfGgC/Mu8BeikJP+6UtBGO0+Hu8GMfYp/kl1JKbU6W8RSNd+vmQQkkee17OQtAwESF
         c7FcuoJqMMfrF2z1vXRnsZ/5WnkKxBZrUKq3AUuMixuLLPni7I6iP7P9RQz7SA90cKT1
         KPJergWV3xQBDxVhbbClOt0S1YsKhVCyZ3FsJiZLZkXUa6v/P/P7xqrwIQSiQW6myGeY
         fiEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794615371; x=1795220171;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mKWHtZ8Wuf2gkuKsexNbL+Gv+tf/150hUz8v8BnJ1rI=;
        b=eP0vOeaZAKV8G0s8C5MY40+VHsPjoToAZac4wWI0ZvomZpgE7HBEmMHh8S9rSc3eS9
         T4kz2RwUvkeiNkeuiUWX9uZYmWiyI9vTdMKyBPkcl4yb95oFNe9q+o1KIMiX42HC20tz
         CKokHUsqomzOmVuJ8OkXf+D7xi6k4F/EwxiP5plD8qeXVP7CoLtYAEMoGRxJHl8Q09dZ
         1Ij4NNI8WPJzcG5FjmonCnlIcLVkElOqgFFTOXdMRvvmTnosEndGj2zHEL0QY6NzaA44
         h80ks/l4lu/hVojbpt6rgdGfzTp4yp1s2bNjjOQaWklcBVNFd5AhvKh2JA3OJ2ClGeW5
         U7yA==
X-Forwarded-Encrypted: i=1; AL+hErF0xVGlb9pmdpm3XEpAeZZyLao0x1eKxJgn6JmErN7QNsa0hTlU6DFWvy8uogQyVl2RAEttjH4IezdwXxIBTSzy+g==@lists.openembedded.org
X-Gm-Message-State: APuU4Z+cV9Rx6M5lNT1XbV2Ly1VJzgNJkSrBOgnAgyqlyPbvYjove05m
	kVxFXgOSpVQayyC0pMz4dXQDA1phF99kkIO8Ork7XLtB4LXJprv3rbOfAdf2pnZ85sI=
X-Gm-Gg: AYBFou3H9Ct6gNTIw69CVAZJVBoo7b9QKWImYZPVfMOgtfil5rw1NZR6LrjUWwaLobc
	d+9gOgy4m9aem/HgF0IVTiqB6guBL73hLGqFNzYwSW9nqW7e3vgutYGWpqfuRRlmUSbhBOrk52E
	5k5xoTgzTFQa5i5fDYiPth6xHK1CIFC7A1xZd92unQEB1zq9o1VGxDCq36PAnZGhpZKONA9fnXB
	xhKh/Qnm9f0NmhmzQj3LEIrncnhfaHLOQXbTJy+3VFXsrTsA6L+uwhsEMzSFd/cxknkUXx/l3fc
	pM23aUEd4Ls6aU64lPKJNVDgAmnZV68YHY1cRyQ9FKs2gitnGu8Xa+Ujzd74tQjDPySj1x/0c7w
	J7PnCIFmb9Zvqw1DBCHZGbIgj/zm/TMyZ7n24wavewspGeO6379P3URhxQIX2k10qxMH6L4Un/O
	G+LJ9ExCr86TUyCtc8mzleiUWJp3m+RUV3w1bwo+sc5lstSTJ8+3KbDPe9hR/q+0+IoF//YodDz
	vZIYn0vXfmqOn0UuhtEiC1ayFY7dGFv+v5SAzAi6JcA/9NEpRKApGJJZC9CQeR86rlaiDWLaBPR
	Js/v5u9Lr085Qv+zpu1EhkG2aFyw1QZkimCiXdXwauXuzD7uW/4vTCZPmCu29bjkj1pf8us/Fhr
	9KDQ92G0roYMLNs5MCQZCZ2JBCp1MsiEzLGuW0hQ=
X-Received: by 2002:a05:6000:65b:b0:488:8bc1:a2eb with SMTP id ffacd0b85a97d-49c740bc18cmr7467094f8f.39.1794615371375;
        Fri, 13 Nov 2026 16:16:11 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00d795e58479169e39.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:d795:e584:7916:9e39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49d673ce75fsm3358828f8f.55.2026.11.13.16.16.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 16:16:10 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Nov 2026 01:16:10 +0100
Message-Id: <DMUI1ZOVOAVC.1G797W00GRUU2@smile.fr>
Subject: Re: [OE-core][wrynose][v2 PATCH 00/27] python3-git: Security fixes
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <yurade@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261106144331.3354811-1-yurade@cisco.com>
In-Reply-To: <20261106144331.3354811-1-yurade@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 00:16:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250190

On Fri Nov 6, 2026 at 3:43 PM CET, Yogita Urade -X (yurade - E INFOCHIPS PR=
IVATE LIMITED at Cisco) via openembedded-core wrote:
> Backport 27 GitPython security fixes covering 28 CVEs to the python3-git
> 3.1.43 recipe on wrynose. The series adds the fixes as patches and update=
s
> the recipe to apply them.
>
> CVE-2026-78678 and CVE-2026-78679 are addressed together. The CVE-2026-76=
222
> fix includes a regression correction and follow-up patch, CVE-2026-73619
> and CVE-2026-87819 are each carried in two patches. The patches retain
> upstream references.
>
> Changes in v2:
> - Re-reviewed all patches and removed changes that were not needed for th=
e backports.
> - Restored upstream commit metadata and corrected CVE references.
> - Updated Backport Changes notes to describe the differences from upstrea=
m.

Hello,

> - Removed trailing whitespace and regenerated the series diffstat.
I think you should not have done this last change. Some whitespaces at
end of line are actually meaningful in the patch format (e.g. an empty
context line) also, upstream patches will have these whitespace,
removing those will add noise when I take the diff.

To help you clean this, here is the script I use to check patch format:
https://gist.github.com/ycongal-smile/3692790a48269e59d602e5be1d667982

Here is its full log on your series:
=E2=9D=AF git diff --numstat 63484d666ac 802fb424a4e |cut -f3 | grep "\.pat=
ch$" |xargs check_patch.py
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-100689.patch:42
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-100689.patch:90
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-73619_p1.patch:47
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-73619_p1.patch:57
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-73621.patch:41
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-73621.patch:50
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-73621.patch:54
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-73622.patch:41
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-73622.patch:45
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-73624.patch:40
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-73624.patch:49
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-73624.patch:65
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-73624.patch:92
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-73624.patch:132
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-73624.patch:136
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-76218.patch:50
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-76218.patch:73
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-76222_p1.patch:48
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-76222_p1.patch:71
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-76222_p1.patch:74
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-76222_p1.patch:78
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-76222_p1.patch:88
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-76222_p1.patch:91
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-76222_p1.patch:96
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-76222_p1.patch:104
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-76222_p2.patch:36
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-78675.patch:42
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-78675.patch:45
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-78676.patch:51
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-78676.patch:57
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-78676.patch:66
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-87818.patch:34
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-87818.patch:40
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-87818.patch:49
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-87819_p1.patch:44
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-87819_p1.patch:76
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-87819_p2.patch:88
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-87819_p2.patch:92
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-87819_p2.patch:94
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-87819_p2.patch:97
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-87819_p2.patch:98
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-87819_p2.patch:117
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-87819_p2.patch:125
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-87819_p2.patch:130
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-87819_p2.patch:138
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.
Error: Malformed patch line at meta/recipes-devtools/python/python3-git/CVE=
-2026-87819_p2.patch:144
Line content: '\n'
Context lines must start with exactly one space. This line is missing its p=
refix.

Regards,
--=20
Yoann Congal
Smile ECS

