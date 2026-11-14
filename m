Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8254.1794649360115364823
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2026 01:42:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=T0zZ1dcz;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so2117815e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 01:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794649358; x=1795254158; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mgWwshEmDcUIR3FSgUHflnPq1d7tgVXX1sjyfsM3dQ4=;
        b=T0zZ1dczjVRk1KMCBmpxxB3pfXUWz5mLrBN4G5yhlwdZhlyvQKlKGwGvtzTr/gzGwP
         MddY+xbbiGH/titHs6oLNZ1tr3aAWrbC4emDH6iYKEZn778txxM6xp8FwiGPCrXhaGPs
         z16Dz9Tyyv3gSPvpNV/CD5J+BtfKJeFBGqyoY3EGU7jWcHbnZfn9L7YL6UJ5RgAIh47H
         HSGtATGVlyVJJ6ergC1CQB7Z3XGynLWeDICmBR5T8IsdTo9o/Pje+x0f9kx6QDIaEzt8
         tLxcVzCXdmslposWzAU+Jcfrap6rqcHm7wZde+fcjhKnWkbeJIBYkyuBTJAVbGpQxNk3
         wP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794649358; x=1795254158;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mgWwshEmDcUIR3FSgUHflnPq1d7tgVXX1sjyfsM3dQ4=;
        b=qEQHDDT+GNAbyQ8XFRy+V77YamCIruqWelYxF9Ritiuupcl+N14TuUvFimPx2wC3ri
         7Kxal/oxIyiyOs1yVtQN6qrmuLJLkIHYMghH8CyF87o7qPaw/eKxZsWLvm1DXms2AfKm
         xaweV5kGmOF1Wcp/xZgD15hYmPCIl31IMIrs8JpQkUqmhn0RD62Z8RujHopLShSRUtW6
         lkpLIAckUb3oXxOxsEzuki4baYqe1F5yftz2mzd7k8/4B11vPN5ir7LnwDB4RHoE+tds
         cgebAucyvtNqaedsfKIN2xM4ki+NGygsqRM+XMhSy1TsKLzI5RRLXsBnujgrgt9ifssc
         YapQ==
X-Forwarded-Encrypted: i=1; AL+hErHhi/2ahDaK7IZimoa02DDwvBv9Cv1a92NH5qTbDKa3aAr3aaUogT7a7w/pauMykwwcMXHqNeGd+Ilxn/AwgB4EHw==@lists.openembedded.org
X-Gm-Message-State: APuU4Z/qHCqmU51uJa3xMznlyOsGUrr+oHkZlPfcSHKZXmIDryPEJSAw
	TFeLVb+WI5W1k7aPQwc4hs8rKkiGgPxD7qRIg3xACLtdBMlHjefrkkgXNN8Ksl38jjQ=
X-Gm-Gg: AYBFou00IORVaXjn74cB6kjxWRW+CnlmoPqmnYJLea63JwGsjwX8wxO1QFvTL1Lm8B8
	g2BZ4D0beUu/xPua7XTBozoi9xkkNnA+ojZsCpWmC75uXKlCvoQ9czLpPspbodHmUR92J7F4uhn
	BtT7cCj4rvXrif8HWcYlOYSAo15qwCezug8oJDwZ/RiHZzmIIIw9f9hNB41ULcLX8LZiv3SkHJW
	UHebUNG7e2DxOsZKTf0zfB6ux9eQzcNysFEd+tZIvdQmCvhtjLuTrJImvt/bEtG//f7ECGLJCLT
	EN+TYr0xwVpfVLrgetwEvyR1Vzr8PMNbfkp2xH20MelLjnsvr9yNrpkp/NDxAxQijKeW4BxSJm0
	FcdxLAVfG1zXK6K65YbknBg3+PfjsbtUCbG8yZZvV5LRftXCe/BLPoT8Y5SfasYPck+i4ONAfVy
	KpZ9OMSYXMnhT2VCdsRO+5xh9w6Q5oEuPN858u+qjrDcq7BfVcwgKWmp3qSP+mB5BZ3BiABF9kQ
	lhEh4delYPudp8K56nJVVW+EIjHTJNM4x5Q8apm5cghunP0n2NTF6mjZEYPJMLCiTYEx5oV1j8O
	DED39cp68xkXLlxSmkTI3boQIHnmpnCStfy5150w6SAhjrTtuIxqFrn6ke52UoKtXzKPWkxJ/ZB
	b9pCC9VqdlWUozjOa
X-Received: by 2002:a05:600c:1daa:b0:4a1:9663:7633 with SMTP id 5b1f17b1804b1-4bb55a47625mr104359425e9.11.1794649358322;
        Sat, 14 Nov 2026 01:42:38 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e252f7fsm231677005e9.2.2026.11.14.01.42.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 01:42:37 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Nov 2026 10:42:37 +0100
Message-Id: <DMUU3P3KWKLT.308M5CKOHWEOP@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <dkelaiya@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH 3/3] python3: fix CVE-2026-87910
X-Mailer: aerc 0.20.0
References: <20261016053944.3835603-1-dkelaiya@cisco.com>
 <20261016053944.3835603-4-dkelaiya@cisco.com>
In-Reply-To: <20261016053944.3835603-4-dkelaiya@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 09:42:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250201

On Fri Oct 16, 2026 at 7:39 AM CEST, Darsh Kelaiya -X (dkelaiya - E INFOCHI=
PS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Darsh Kelaiya <dkelaiya@cisco.com>
>
> This patch applies the upstream fix shown in [1]. The Windows test
> correction is applied from [2]. The advisory identifying the fix is
> referenced in [3].
>
> [1] https://github.com/python/cpython/commit/fb2f0bbc3b35264f09cc2cb2934b=
7987527a6bc2
> [2] https://github.com/python/cpython/commit/d9565e54b1fc6d63c5be9afd5811=
4499128fa57b
> [3] https://nvd.nist.gov/vuln/detail/cve-2026-87910
>
> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> ---
>  .../python/python3/CVE-2026-87910_p1.patch    | 98 +++++++++++++++++++

Hello,

CVE-2026-87910_p1.patch now fails to apply on top of the recent python3
upgrade:
| ERROR: python3-3.14.10-r0 do_patch: Applying patch 'wrynose/_review/workt=
rees/openembedded-core/meta/recipes-devtools/python/python3/CVE-2026-87910_=
p1.patch' on target directory 'bitbake-builds/wrynose/tmp/work/x86-64-v3-oe=
-linux/python3/3.14.10/sources/Python-3.14.10'
| CmdError('quilt --quiltrc bitbake-builds/wrynose/tmp/work/x86-64-v3-oe-li=
nux/python3/3.14.10/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Ap=
plying patch CVE-2026-87910_p1.patch
| patching file Lib/tarfile.py
| Hunk #1 FAILED at 2818.
| 1 out of 1 hunk FAILED -- rejects in file Lib/tarfile.py
| patching file Lib/test/test_tarfile.py
| Hunk #1 FAILED at 4395.
| Hunk #2 succeeded at 4710 with fuzz 2 (offset 134 lines).
| 1 out of 2 hunks FAILED -- rejects in file Lib/test/test_tarfile.py
| patching file Misc/NEWS.d/next/Security/2026-09-10-13-38-11.gh-issue-1572=
65.-vYuMp.rst
| Patch CVE-2026-87910_p1.patch does not apply (enforce with -f)

Can you rebase&resend?

Thanks!
--=20
Yoann Congal
Smile ECS

