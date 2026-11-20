Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7684.1795216824155331171
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 15:20:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=Wcp2qD7M;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a32576da88so852129f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 15:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795216822; x=1795821622; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VK1Q6U1wKAgyOILHdOa5PDKF07fGzdxyUrc3vozf6fw=;
        b=Wcp2qD7MXwMSr0BqLH1aaIl+yAvyEtyG3SNnR9JADannYojZgr9j+nvuq/As9ldafM
         ULMpQF3GZZa3CjecyWk4mkx9aJ5GXKzYLhIkPhF5xPG73+8yOZgbf0hESGYD7rp2luGo
         1Ea+vp1G4l7A6gWupV+S9rW+T0Qnk8bfY4JRIYDFwOxL8KccahgZ3dPFSfqYdDofbTlq
         OO5SZtpAx8XCewqbYUKp0widrBDouN7G6mcAzQOrCXefyuIWRSocZUK5LgYS1POYjW9A
         vaeJBNqFYU/6Uth1Mi7NgurHiaRom4UG4w70/hrpWN09Y5RFsfywSwCOBsX/7H3Xt7JZ
         eiPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795216822; x=1795821622;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VK1Q6U1wKAgyOILHdOa5PDKF07fGzdxyUrc3vozf6fw=;
        b=n/yYDGkdzYziDaS0rZy8eV8NS4PeJ+xRpVlJpjqSmWJ9RavfugHTOwtZMyBpyHluos
         JO5Odhd5ZHm9k+P3F4vlBLbVoh91jq5SMNuLpVUzHg+g2yUEYCqdutIJSbCvzp8z3j+t
         kHKpc38lqOvnAOYUvF63Xip8dROxFlfLkY0eZwPxgfIs/gb2FiIUV9HesLSuREYB0H2T
         eYIUVmU5nHguyaFKOYvS4znr4CecZjOws7K6/KdYT2ApHjEMVEFMwmlwEsxw5tj+xQ5t
         v1AP53/sTzUriPHa2t+JzSdaJ1ltEK2L7BVkwQZQ0GoBgCDDIqBNgkPbFGSdXJpXV8Bs
         LDiA==
X-Forwarded-Encrypted: i=1; AL+hErEeqy6x2RDCY3U4jgVx5o4l/1qLls9kt7GpyMbQ+MWGnUffHZj+jIPyBLD0GycJY0nljaEVFpnkxnoD+KMOE7tDlQ==@lists.openembedded.org
X-Gm-Message-State: APuU4Z/KYRX2uTXaA13bde2NcUbWKdrrmQruCstiDKxNoW6hkomvCj2Y
	KBIVfRD7GTSll/m7NoKYicD4KDc3yv16EUuLz/JE9egt1H2dyGHMs71YXIt7qt7vTPM=
X-Gm-Gg: AYBFou248gpd6vVv9ReE98Sz0AWNjZRq9InOSXng6AMbLA7QiC5GqIrjQ/zStmRvj0D
	mniJFIDoCuxClDfFEu3Mc42OYVXkYK7nsKciaDPllFd9wazMdNaOMnsskbHoLZai9bJFTr1GrRj
	hi96zJhLdDCi/ItJEdtON5BhT+oHvnsatkeQOFErnPmjQM138fJWIwJ5RC2yOk30Yf9eKvjZHtI
	UXMBtVsg5zxnAIWyFVBgEjiGleAqx/KWLsn26xirNRYhtrSmUOG264h2PLpmvD6wKqKsZpV799o
	Zj0yMGS2epebTJUK/XKewI+OhxAOOzaHUo88tS0fHrPk0Ps3lErTp3l7BfsVBBis8VSvEmAqJoq
	GT3qRguUf6u/D1I4oKHiqGiKj2JgcW26bvVej643xgEewBY1hILFchRS4kFesl0EMBZC/4pJqY2
	3Ha4t/D2vcymA7sSlE8PSM3ORZhRbA2q3U5f4hRaXkqsrze/fsJZCLCofUNyHbDObwGwC/ucoKr
	vRHhV6Hnfp2LsRDNfVyR2hMP7sHPbdmQklgNXpfR/EybYM6dqD0Q0uBGHmDrZXU2JlcxbWtyHAr
	FtRDQQXgxdEDdbL37DYFxSiblQFEpooIHj7fo6SaR4Fs7zFV1XoHrfJjbSUQem1MFOLxcjgVUoY
	WxtfRVi/tFXxB+GXLzPUZdjceQPYnNnjCmUA2iw==
X-Received: by 2002:a05:600c:828e:b0:4a1:cd83:b23e with SMTP id 5b1f17b1804b1-4bb88786ddemr100355915e9.0.1795216822279;
        Fri, 20 Nov 2026 15:20:22 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00b03901bd7f693780.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b039:1bd:7f69:3780])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm15624755e9.0.2026.11.20.15.20.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 15:20:21 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Nov 2026 00:20:21 +0100
Message-Id: <DN0F92M3R0XZ.1O8238KWB8AYH@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH 0/2] openssh: fix GSSAPI
 CVE-2026-106555 and CVE-2026-106553
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <benhur.tessele@est.tech>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261029171057.15032-1-benhur.tessele@est.tech>
In-Reply-To: <20261029171057.15032-1-benhur.tessele@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 23:20:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250827

On Thu Oct 29, 2026 at 6:10 PM CET, Benhur T via lists.openembedded.org wro=
te:
> Backport two related upstream GSSAPIAuthentication fixes from OpenSSH
> 10.6p1 to openssh 9.6p1:
>
> - CVE-2026-106555: reset GSSAPI client state before each authentication
>   attempt (upstream 670510d1).
> - CVE-2026-106553: only store GSSAPI credentials when authentication has
>   succeeded (upstream 6f9cd19a).
>
> The patches are ordered as upstream, as the second one applies on top of
> the helper function introduced by the first. The vulnerable code is only
> built when PACKAGECONFIG contains kerberos.
>
> Tested by building openssh (bitbake openssh -c compile) for qemux86-64
> with the default PACKAGECONFIG and with kerberos enabled (krb5 from
> meta-oe), confirming that GSSAPI support was compiled in.
>
> Also ran the openssh ptest on qemux86-64 (core-image-ptest-openssh with
> PACKAGECONFIG kerberos, bitbake ... -c testimage): 82 PASS, 0 FAIL,
> 1 SKIP (agent-ptrace, gdb not installed). Note that the openssh
> regression suite has no GSSAPI tests, so this checks for general
> regressions only.
>
> Benhur Tessele (2):
>   openssh: fix CVE-2026-106555
>   openssh: fix CVE-2026-106553
>
>  .../openssh/openssh/CVE-2026-106553.patch     |  88 ++++++++++++++
>  .../openssh/openssh/CVE-2026-106555.patch     | 109 ++++++++++++++++++
>  .../openssh/openssh_9.6p1.bb                  |   2 +
>  3 files changed, 199 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-10=
6553.patch
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-10=
6555.patch

Hello,

This whole series is blocked pending a fix for those 2 CVEs on
blacksail. I will let this series open for a few days but barring a
blacksail fix, I will have, then, to drop this.

Regards,
--=20
Yoann Congal
Smile ECS

