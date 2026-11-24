Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13574.1795508559795713989
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 00:22:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=UJVOXMnE;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-497614c95f0so2303915f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 00:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795508558; x=1796113358; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FAycVLvCzzjpTn07kMzRfIfGy53nMHBW+v+6VlKixsM=;
        b=UJVOXMnELKSWhgmuBzYC8ec3xIp/6ACPklT/SYEb40MZSPSzvNFedQFbM6DqVTIsY/
         T3XgWT0ylkAJaR5BK1540iaMNbU7YwdptQebhh4biJWyHRG9MpKH4MGgdmaqMmWLGs1+
         Iqs6BB64PLzM4jypghZpHONSa0g6AYvXSYJSJbfrmqNUSZZb2dBSg9UMZUY2IMZppgqW
         QFVA9Vz0n7upk3RUOYyNuXLNYl2tL1r+l6W1KZhaRnsarPj4NDhTCFGFXn4DTrB8ONJK
         Tkaa7mcTHcVUVmN9vyoXBg6BOB4PVjlxWAbv7qgzFHb/zkKh0t6eg+zkaFzs59E+Mi9m
         I/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795508558; x=1796113358;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FAycVLvCzzjpTn07kMzRfIfGy53nMHBW+v+6VlKixsM=;
        b=jDZSLLqOvAPwZJl6qOzDpFteR/ijfIPVvmLQo/q3EAdjx/2zT9HViWpA3VXjf1wyux
         l/QBae2SdgVOzbdbDe+vMEbHCDUMLn94pFqRNX1tEIdQdPG8aiBZ2xartHurmfccnXOK
         gUVpZcIk0uQ0dh6kFLWaan7D1pOXr6/P8J7wgUALjCt8hxOkvfnptlqjdLR9I/j/4Ubm
         r0qE0wvY//zYxSQj84sPuB6Lk9OcMcAqHyXBHiOD4tbxA2j6SnLuMu8lGNgPJWCPm0+w
         E0YjF9kBDwsHJk+4UGGshCl5ytsWGVClnu4U81rhYDMo8x5RHgoq9mV+dYeOLaIe3QyA
         rJ3w==
X-Forwarded-Encrypted: i=1; AL+hErHicqU5sElrCCUbIiM793BwzhgSnLHEgU9+Mjcx0dgWaMj2jFSCPx1k+7cOv9Qu3YBL1neUkH4BQxin5bNVF3KdeQ==@lists.openembedded.org
X-Gm-Message-State: APuU4Z8qLFgyqS1twry8PABFWY1ujRdvpTrtphOC6joeIo5xX4sBFPjw
	4uORCGGk92oytvBRECegdiGusl/XbMWOCVWFElMcN2GsZD4VK4eUjKWSVcsyJHVM40c=
X-Gm-Gg: AZFdTZee7ctmVSqZ57nK66OmADFLq3UXNIu/kPNNj6M8mdqYc5QGMajEPUQaTdndKxH
	/lzY8hCjzICozxznOhxSmb8q9QPCMaLb9zTcE7JJ7VeaaO/0aTs6RgkUIQ5Jpq86nJoAqh/W++7
	Qc4KZHo5ZrEOgkD5ikWF0Lw73tWTiVluRbtgEgHPQD89XVx7tHFK9HpGKiymdX+bU1KbdeGTUdO
	/gzWomBYcbtqA/7d7PEPIPhXChJYntFSGTumWkXmFF1i5bLndWagZGRCpSPZ5RLeyW3JtdNcR3O
	inhRb/1r68UabFUZVxBcoScKREfd7pZ9Rna+XKW1L/jVbdkQJRqzgtZtGem4tDpLAzuQ00SdgWu
	6U2Zae40fcXOdTHkbPUD7ABd71YhzrSqB18IsJFMoxjBSdGUcmxCp49cmVQYKaWCDo75Gig+3SR
	fntTlRCkebDGXP2qyxhCt1CW+gR+13yizhrgSPVgGjLSQ5qEfzICuSDe955OT4IyJo9SR6MruCM
	8NHpp9C0zfQB5Phw5Panrg8L239p+QWVORPYVpSvrQC3sTsmyn1yYPl2cfEAJzm0SYbP7l4vPfW
	C1PuP3y1Ws2y/q//lOoeLi6I+uIYWhVQWA6Lzf7K67l+rPPCZrEw9k3Tp25jxa+RGB4OTiQOaGu
	nJ81T0pGtV4uG+BEm
X-Received: by 2002:a05:6000:4024:b0:4b7:7db4:2cd8 with SMTP id ffacd0b85a97d-4b77db42cf7mr1571524f8f.35.1795508557881;
        Tue, 24 Nov 2026 00:22:37 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm26603862f8f.50.2026.11.24.00.22.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 00:22:37 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 09:22:37 +0100
Message-Id: <DN3ANW1PYB7F.3UQIXBSJZ4JOK@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH] acl: upgrade 2.3.2 -> 2.4.0
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Alexander Kanavin" <alex@linutronix.de>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>
To: <dkelaiya@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261124073557.219159-1-dkelaiya@cisco.com>
In-Reply-To: <20261124073557.219159-1-dkelaiya@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 08:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250965

On Tue Nov 24, 2026 at 8:35 AM CET, Darsh Kelaiya -X (dkelaiya - E INFOCHIP=
S PRIVATE LIMITED at Cisco) via openembedded-core wrote:
> From: Alexander Kanavin <alex@linutronix.de>
>
> Backport a patch to tar to avoid name clashes.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 2830d1319eec866947f4fa4a1ac16e2ea6584be5)
> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> ---
>  ...0001-Avoid-acl_-prefix-for-functions.patch | 90 +++++++++++++++++++
>  meta/recipes-extended/tar/tar_1.35.bb         | 22 ++---
>  ...t_uid-fix-memory-wasting-loop-if-use.patch | 49 ----------
>  ...isc.test-Don-t-mix-stdout-and-stderr.patch | 35 --------
>  .../attr/{acl_2.3.2.bb =3D> acl_2.4.0.bb}       |  4 +-
>  5 files changed, 102 insertions(+), 98 deletions(-)
>  create mode 100644 meta/recipes-extended/tar/tar/0001-Avoid-acl_-prefix-=
for-functions.patch
>  delete mode 100644 meta/recipes-support/attr/acl/0001-libmisc-__acl_get_=
uid-fix-memory-wasting-loop-if-use.patch
>  delete mode 100644 meta/recipes-support/attr/acl/0001-test-misc.test-Don=
-t-mix-stdout-and-stderr.patch
>  rename meta/recipes-support/attr/{acl_2.3.2.bb =3D> acl_2.4.0.bb} (90%)

Hello,

This upgrade would be an exception to the usual rule to simplify CVE
patching. It needs more justification that a simple cherry-pick from
master. I expect to see:
- An analysis of the changelog highlighting changes outside of our usual
  policy and their consequences to our user's code.
- A link to the CVE backport attempt that lead to this upgrade
  suggestion.

This is a bit of work but we need those info to defend the exception to
the rule.

Regards,
--=20
Yoann Congal
Smile ECS

