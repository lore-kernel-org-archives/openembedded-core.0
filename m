Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18448.1794923678341114616
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 05:54:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=fhcOpwFp;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so55706845e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 05:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794923676; x=1795528476; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LlYt/2zgaMDi7ty+xrr7rr/aj5IO5vaUQr7/r9jcvyg=;
        b=fhcOpwFp+Jdr3BgtyrS+Hny9e6Om2LmKatHzFnC6YJGrbTKG5xaUXUUEmlT017IdPu
         Pg+UJ0BRrl+zjWFSs+C8PkDgOzWD1ZEkUqa/Quyrh2Bgv03dUi87ZRZbaW9d/NAt+8Mi
         QakUQDBHkwv4x81MstjNOm5pf7zX/FgWAdtSGZfBqh3AjOm2bqBRigOI58/IcRFS99w+
         43vjDBOPnksg2e8AjdVWiKF76abLbNgpMIjENbJ8oIOasahNoX6qJ2xeHFEnb5nqnwt/
         ojDkwHfqxVcm8NVU6+gGP8afY/mSheRKKAXsQEU9JHK4oyyGiVRscI0y/SjIstSHDxUx
         iZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794923676; x=1795528476;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LlYt/2zgaMDi7ty+xrr7rr/aj5IO5vaUQr7/r9jcvyg=;
        b=bPlfVDvEiRFTweiv8/UIydyL+Y6nKpumkFZ4/ebc71xMscIvr2q6YwrUNVJN4+8/A8
         s08gdrYOgJZ9PK1/Vq+d5qVjvUrtzbYb5ntFbSynxjj1ZrpzwPYxxfCyVfJS/hXv0Dn2
         IaLjnDcR2Wf0QKzNNvzcw+TEfXJo5p1udVAq30BM72KJEHFza6YvHNrToo8FG1tDL3QT
         S7HyVjsiaarcYS82n/hrXsXtPnGXiqatiVlMmmx8arPFozSY6PcXbxod2Q+IgxQ2AKwO
         Sq1odXEJmuKfn6lnULBc63RaVY+GTmrb+GBq5RMjTncvIbHk2Vl/iOgfq93n/YAD6Z6p
         YpMA==
X-Forwarded-Encrypted: i=1; AL+hErEnJf8MyAakhz3CRWrDw0qjc3MALC4B4L4eh+udTHp9UIDX1MX+rja8eXUQM3Lr+eoQCP02rPrO2GkWEBV4Ev6GoQ==@lists.openembedded.org
X-Gm-Message-State: APuU4Z+uoNRS1jUcatDgL4CpEqOUagBk1q0sUiLhLstt/ZXYkeguZhA7
	cr9FSZZL7TYRWhp0rtAp9J98uTbsio64jio7nfyO8PiZ6RIKqRZc55DlY36ZxWY2PvY=
X-Gm-Gg: AYBFou0YCTWzmrxvmd++VjQxJ/nL25bRE2osLJkNXetAcVNYjokSqEq+WFdD/wUjr2+
	JKOAqwuWEUYwtiXrSsuD9pvdsA+aAthiZYsYSbppxpuUI2MQBLc658t3y0r9Y+qnrMvN5oBA2zM
	BzQzP6bVpd5zIzHcWEv2YcrOxDu9NB8UvwHQwGZqAfcWZLm463uzI/269inyA2ttm1LZH8cyRLm
	AMlxkm8J1bj1Xc+oA+Ee7yMizCLoOS1eklnDxWser/KD80F8E3KL4Ko3tzcFROwXMh5Pa4D19Ns
	UdMDem+YxbYMTFYiil5im1Rj4nQJ8c45AvsSmXvcdvCBGZZruMSXUcBzCeeyfiMRE4QPHDK+rwN
	ehGp5cFCf+vFKcsCh6xRDyWNkVitq/rxeBWWEZeNLcpSz4N48+hpufvgRJa+hip/RDdogkGyiO+
	HKus/xbq4c8oYcRdL26TgJA7CWSgUJKzqdOlW4/P7jV9DOR0burUbIuzo63Bn6mwP1DuUZLxrSY
	xNq8lru5a6l6MUYvUu54Gnrj/koK1q5Sr+vVKFK8nJirMiq2rgEcyGjsj3q57FTh7VMW9/Y6pBZ
	wfz3eJVVxqmr/ZmROAvEOy30LrXQNoY2pwxs76C+bSVClFURRFLji/4k395nVFMZTA2APsVBrJM
	m+tb/kzPxpCzmnVE9esc2i353ZE8cRWD3F+hkefVI54/flJaQ6St9c/nFq7ITd7GBWhEv/JgQ14
	q7NyBE/GVGYXcHdtt8cFj9lkJIZbDeW7iO
X-Received: by 2002:a05:600c:1daa:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4bb55a4ea8emr284640235e9.18.1794923676294;
        Tue, 17 Nov 2026 05:54:36 -0800 (PST)
Return-Path: <fabien.thomas@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a43d41ec38sm3755060f8f.19.2026.11.17.05.54.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 05:54:35 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Nov 2026 14:54:34 +0100
Message-Id: <DMXJC8MY3ICL.3R9DYAAS6OXEF@smile.fr>
Cc: <thomas.petazzoni@bootlin.com>
Subject: Re: [OE-core] [scarthgap][PATCH] glibc: fix CVE-2026-84243
From: "Fabien Thomas" <fabien.thomas@smile.fr>
To: <joaomarcos.costa@bootlin.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.22.0
References: <20261104150611.1720587-1-joaomarcos.costa@bootlin.com>
In-Reply-To: <20261104150611.1720587-1-joaomarcos.costa@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 13:54:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250454

On Wed Nov 4, 2026 at 4:06 PM CET, Joao Marcos Costa via openembedded-core =
wrote:
> This vulnerability, marked as High [1], was fixed upstream [2] since
> 2.45.
>
> Backport the fix to glibc v2.39.
>
> The only changes not included in the backport are the ones in NEWS file.
>
> [1] https://nvd.nist.gov/vuln/detail/cve-2026-84243
> [2] https://sourceware.org/bugzilla/show_bug.cgi?id=3D17142
>
> Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.co=
sta@bootlin.com>
> ---
>  .../glibc/glibc/CVE-2026-84243.patch          | 193 ++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.39.bb         |   1 +
>  2 files changed, 194 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2026-84243.patch
>

Hello Jo=C3=A3o,

Thanks for this patch. However, I can't apply it directly in Scarthgap unti=
l
Wrynose branch has been updated, as mentionned in this thread [1].

I'm putting it on hold until then.

[1] https://lore.kernel.org/all/20261112062448.3128219-1-hthakar@cisco.com/
--=20
Fabien Thomas
Smile

