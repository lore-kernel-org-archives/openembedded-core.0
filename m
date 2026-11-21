Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25957.1795302715220942302
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Nov 2026 15:11:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=LkoQs9aK;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4aa5833c263so1945791f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 15:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795302713; x=1795907513; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ai6xNxBw/1e0Oa7xwhopYpq+r4uudZIpXQn1BAb7Mo=;
        b=LkoQs9aK03/62flskpG82by6aV5dl9jAWBYTX1qxaoRqkCaOvaGxkVALd9j9OfDa3W
         1oqAcRqZ2BghnQ05G/1qifPzI1xlzJ8kJ9rqSLxQU6omaZvHI9XkLpSz4bbhe01M/jwk
         VnaewcViwWX8Gv39n1K16laYU0V7ED9s+BbGu1FTWC1eOCSWoyvNrcz+PTJFjw7tFHSq
         QmfOv0l7l+7DyF3rHiQPgr8rczsrpno+7/iMR6q/LpTsVU3ErkVPV8dnAoTXfKv9HSSi
         WxkPY/Y/vVFxZ8z//84KYCFR1lwjpb07EloP4lWz6XVLpugNwDLR7VpIV9licHSREtf9
         VDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302713; x=1795907513;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6ai6xNxBw/1e0Oa7xwhopYpq+r4uudZIpXQn1BAb7Mo=;
        b=ooTyZXuM6NJzKhUxeYXlnYdmN7vkGdbGBHTlWsNF6ZrB7qpRBSvlp+1weg8LJMs0ni
         MdnaJuIntz2PDmEUQljoSsEKLhnAdu6c9DLDAVMY9ckCm6pLRzl1OSc4/w3lixP35CU4
         g/ptPwNSTKJs/EpyqZn4gdfTORZXShh2xF91rtMeTr984j191OAV6WNBsn29FScU+Qja
         4UXgU1H62cmnaf6kcMWhJTvwPoGvmvg/NYpiuarghRurHvcadHHEbc08OZXvmOoEIVNp
         9FvPT/hVBg+EODi74WGWCRBUGJyzrkC6lXKNkQreKxGLYtuMEopa2RBc+PCEPiSULGJp
         bbzg==
X-Forwarded-Encrypted: i=1; AL+hErF9rm0ku65erbO3eE81g9tCwYes430jvj+unufnU1v2y6g2q0ZBAxfsquu12bRT+ketl+GwT/rlADTxuHr8cqUAQg==@lists.openembedded.org
X-Gm-Message-State: APuU4Z8KEjy6CUtZFwsBRTVBgAhj6CUiaU9Z1P6yd7PGSOPdSN+h+xJz
	KyeyBd+cggYmPbgIPPtNGluZhla/4WofdupAfi+F+nP/vx6tWTUDGQDdI0K5wxTPfQs=
X-Gm-Gg: AZFdTZeAlzBhxaPryfkWW8qv1f7MNto3XhQfqeNoVBZN9i48gTXpuAs2ohUnfSMB13K
	Vnznub+B7f2Ax8Sovz8kdM8blUbdapujfCiroiWq+5NHrOquYRDhcT5MsYBhDynYQc/sfJUFCi9
	KWBcXMmeSAaKfZh/IuQO51of4ETzmNZR9v0HR3RHb/OCfYP99C4d5wSqWo94hMx32H44dOZuKLE
	8uwqsfJiWYOArgGdQkfIFxPLF34zoLdDANojVoLTS5cjeKCSGMUkLKGwh72iHx4Jpa00p8Yrwdm
	dusd00xH1G05l+GVY2PVA8TtXIDo65YXxj02Rm7oE5CFOnHAA+L0KFgCwUaYesnmFP8HzCSxqhq
	8wnUZpmZ4y6bbsTQ64uNrJX469q3jZm/mDqeby/l+Eos78YAv8buUi/uv1p6VuitOh/xgNlv7k1
	7OcBuKhPNSJdgN6iFp/s/QAmPZWRDVUDk5wvSH7dVSq1STTOTQBOXxK0hu32W1wSgueRQZFbl3R
	148nUadUTi67xiVjIghHqTtqiKGiDZpL09ig/Cc1e/LDMGV/WmpPqJtNn9znSr7+sclek1/93Cs
	3BQCbPLbpE0hckONsksFooAbZB0RhtnzwOFQXcNu9U8dN/QotlvJ72eVZ6B/bR/7zpFf97dG0Pm
	/rdb7AbrGDHEERm8D
X-Received: by 2002:a5d:4841:0:b0:4a6:a704:4b72 with SMTP id ffacd0b85a97d-4abb395664fmr10356213f8f.35.1795302713272;
        Sat, 21 Nov 2026 15:11:53 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa0009d38a8173e0a09d.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:9d3:8a81:73e0:a09d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2e6dsm13846755f8f.6.2026.11.21.15.11.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 15:11:52 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Nov 2026 00:11:52 +0100
Message-Id: <DN19P4D41RQC.J6VXZC0CZ5L8@smile.fr>
To: "Prasanth R" <ragaprasanth@gmail.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [scarthgap][PATCH 1/2] u-boot: fix CVE-2026-29009
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20261117073849.3089566-1-ragaprasanth@gmail.com>
In-Reply-To: <20261117073849.3089566-1-ragaprasanth@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 23:11:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250857

On Tue Nov 17, 2026 at 8:38 AM CET, Prasanth R wrote:
> A malicious NFS server can overflow nfs_path_buff with READLINK
> replies. Backport the upstream fix, as done for wrynose. It applies
> to 2024.01 unchanged.
>
> AI-Generated: Uses Claude
> Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
> ---
> Tested: built with CONFIG_CMD_NFS=3Dy for qemux86-64. Also ran
> nfs_readlink_reply() from the unpatched and patched 2024.01 source
> under AddressSanitizer with two 1100-byte READLINK replies: without
> this patch it overflows nfs_path_buff, with it the second reply is
> dropped.
>
>  .../u-boot/files/CVE-2026-29009.patch         | 53 +++++++++++++++++++
>  meta/recipes-bsp/u-boot/u-boot_2024.01.bb     |  1 +
>  2 files changed, 54 insertions(+)
>  create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2026-29009.patch

Hello,

Thanks for the series, but I think we need to do the merging of sources
between u-boot/u-boot-tools first as was discussed here:
  [scarthgap][PATCH] u-boot-tools: use all patches from u-boot
  https://lore.kernel.org/all/20260923173850.21338-1-peter.marko@siemens.co=
m/T/#u

I'll hold this series until then. Beware, is the merge is accepted, you
will have to rebase your series on top. If not, feel free to ping me to
remind me of this series.

Regards,
--=20
Yoann Congal
Smile ECS

