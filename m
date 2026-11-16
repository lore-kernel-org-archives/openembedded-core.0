Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18026.1794788079417955411
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 16:14:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=Z0CHKkTQ;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so13259155e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 16:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794788077; x=1795392877; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=79XDe2zLjcNuck3LYXvL1UzbbjP121VdYIpDIVEgDl0=;
        b=Z0CHKkTQrNqtKMvS1r6ZDGmZXQnM3+WyDbpQNLCi9B6gJ5Olunj4WiLKvcZXQl4Eui
         zLAL9E3cIplJ1iWN4UP2tnRO4wyfcPI+tTk4bR1hF9fYPLA1vG/3wBwkvN7cOsM3QdJ+
         ixTpGtrw0rEkn1r3mxOPrkcZgfzG/nbbHhnubqay7giL7fdR/iFb+rTPaohESYnJOYaz
         ds5zoF36KAOYeOrI2maSrgJ4uxRJHLg98Pk0ZBJoQ/pgqWYksyC5RlTqlehQjkIpcm69
         Pu35yd1xx7aI9fxj4mbTq+G9KiIZL8LEzEMb7sff7c89A1PGYQ4omA1PNVddD/VZSA3L
         qmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794788077; x=1795392877;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=79XDe2zLjcNuck3LYXvL1UzbbjP121VdYIpDIVEgDl0=;
        b=K3IdlFg7ERYT5aNyH3oJsaeLC+aiD1orI5RFyGpQkMRhObUuDXgxH1pIjRpy5wosEj
         kKbcPHugWYwQlbN23r1DC/tVda/4vkrJoW5A780QnowM0EP/5vsD/F2vtUu44AIlo6LE
         DuO/pduymA0D7/lG0OCaNDCz7pO3WMmxwQNtoXSh06/VYnxKahNhmhlJlbmNDAxI2J6O
         xX2ONt0A0xhhiS5tI3sbxTCZzhdCG8OjhXdPJJVxRUfHPJ7u/rbF7wq/X3iQuolvJ47S
         LjU4gfMBd/mtiJ9m/Mm31U4jASvrzuWS1ZilAj67tjnOZE7fQhzFOYoLJd20GdwumX/m
         DcMQ==
X-Forwarded-Encrypted: i=1; AL+hErGGIbbfLOg3TsY7KQiT1OwbdSlHIbNgzJyxtnF54/bbx/c3SNwIYFZLLO/9CHo/bKSwXEoKZnkv3aM2OjHGt3ONtw==@lists.openembedded.org
X-Gm-Message-State: APuU4Z/j1eoFYo9PrpkTglQHQtODeT43SY3sOcSWGe22mG3OSxpQtb3W
	/l3Cn2LQGVwXdmDUJmrAHzweZdNbLTJQlP5QFqb4pNnRXF56j3p6jbaZALHHViP0BaE=
X-Gm-Gg: AYBFou2r/lc1tSE48oLiNRal+VdcReQnu/VQj3dLhLpckd7fI5DmQXtZAsENDYBQMxR
	GlyIWhkv9Fs/9RmLaWxkYnDkPL+alQ4iPCvmzuXMxqKc1GaFvFKW3Qpd7Ov/bX+chE4CGnR+Caa
	MmxDHIy0MjJujAajP2XDWaN7xgRd+Mkbaog6lQYilCUJf6mTzcABUO6RYXp6jZG81g7dXHLlAWC
	jbOm1N6tbI4jIRYW3LSLhCPdJgElhAdjvuamed5XHnfu3ZZhIxY2946qY9LcaGMbLrWFA7CMf6s
	HHX4LknFJlleZADX8QebkNZs6FQNJZdtCJSXH7TN5BbCi6QTcss4nvMUXjoPA/pzPJqv7MbnGHQ
	eicoDpTpka3pqmNqzxIdrunjrDv0rqNFJGC1awsuyFkl1EMXFSwmONICbxnSkXXOUeVO1EvHxOy
	LKG4OSRO96G/I3+izWhGHOcOMP7btAnCk3iv62pB7Rw8Cz8flEl3lCKq5lZIsiGC4kJG5A7HFII
	nI+PdQWmx/CJoiQMfEDbfds1HyAImQAcNXMqM7e/1B18w2o9ejilEgIuEml4zZ6fMTasF30W+xI
	Z7dTGxOqmIE5nzPjWUEBKvN43gVQ4wlS2PXgjeXPP8ca2tPrvFkjxb6y/B4vNtHw6CII/uCS9k3
	4nAAfqt7aeElSvwzt
X-Received: by 2002:a05:600c:3113:b0:4a1:d537:1c8d with SMTP id 5b1f17b1804b1-4bb55aabda0mr189694455e9.19.1794788077285;
        Sun, 15 Nov 2026 16:14:37 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49dc430fa15sm12707829f8f.13.2026.11.15.16.14.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 16:14:36 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Nov 2026 01:14:36 +0100
Message-Id: <DMW79VTU7UZH.9OJQQU5DBTZL@smile.fr>
To: <dkelaiya@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH 00/12] curl: Security fixes
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20261104073627.302002-1-dkelaiya@cisco.com>
In-Reply-To: <20261104073627.302002-1-dkelaiya@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 00:14:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250301

On Wed Nov 4, 2026 at 8:36 AM CET, Darsh Kelaiya -X (dkelaiya - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) via openembedded-core wrote:
> From: Darsh Kelaiya <dkelaiya@cisco.com>
>
> Backport eleven security fixes to curl 8.19.0 on Wrynose and add
> a configuration-dependent status for CVE-2026-19931.
>
> This series applies on top of my submitted five-patch curl v2
> series, "curl: backport security fixes" [1]. Apply all five patches
> from that series first.
>
> The source fixes address proxy authentication, AWS SigV4 reset,
> HSTS imports, control-response processing, cookie-jar loading,
> GnuTLS sends, IMAP APPEND, TFTP direction checks, hashed known_hosts
> matching and HTTP/2 push-handle share ownership.
>
> The CVE-2026-92386 backport includes the upstream correction for
> serialized cookie-jar record limits. The CVE-2026-87865 backport
> includes the follow-up that avoids repeated known_hosts scans.
>
> The CVE-2026-18924 fix replaces the earlier Wrynose submission [2]
> that failed compilation in the pull review [3]. It uses the available
> curl_easy_setopt() share setter with a CURLSH * cast instead of
> Curl_share_easy_link().
>
> For CVE-2026-19931, record not-applicable-config if either krb5 or
> negotiate-auth is absent from PACKAGECONFIG. Builds enabling both
> options retain unpatched status pending a source backport.
>
> [1] https://lists.openembedded.org/g/openembedded-core/message/248493
> [2] https://lists.openembedded.org/g/openembedded-core/message/245495
> [3] https://lists.openembedded.org/g/openembedded-core/message/246648
>
> Darsh Kelaiya (12):
>   curl: fix CVE-2026-86414
>   curl: fix CVE-2026-86409
>   curl: fix CVE-2026-87862
>   curl: fix CVE-2026-92387
>   curl: fix CVE-2026-86412
>   curl: fix CVE-2026-92386
>   curl: fix CVE-2026-107928
>   curl: fix CVE-2026-87864
>   curl: fix CVE-2026-92389
>   curl: fix CVE-2026-87865
>   curl: set CVE_STATUS for CVE-2026-19931
>   curl: fix CVE-2026-18924
>
>  .../curl/curl/CVE-2026-107928.patch           |  40 ++++
>  .../curl/curl/CVE-2026-18924.patch            |  57 +++++
>  .../curl/curl/CVE-2026-86409.patch            |  88 +++++++
>  .../curl/curl/CVE-2026-86412.patch            |  34 +++
>  .../curl/curl/CVE-2026-86414.patch            | 155 ++++++++++++
>  .../curl/curl/CVE-2026-87862.patch            | 147 ++++++++++++
>  .../curl/curl/CVE-2026-87864.patch            |  55 +++++
>  .../curl/curl/CVE-2026-87865_p1.patch         | 225 ++++++++++++++++++
>  .../curl/curl/CVE-2026-87865_p2.patch         |  89 +++++++
>  .../curl/curl/CVE-2026-92386_p1.patch         |  33 +++
>  .../curl/curl/CVE-2026-92386_p2.patch         | 146 ++++++++++++
>  .../curl/curl/CVE-2026-92387.patch            |  43 ++++
>  .../curl/curl/CVE-2026-92389.patch            |  56 +++++
>  meta/recipes-support/curl/curl_8.19.0.bb      |  16 ++
>  14 files changed, 1184 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-107928.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-18924.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-86409.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-86412.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-86414.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87862.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87864.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87865_p1.patc=
h
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87865_p2.patc=
h
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92386_p1.patc=
h
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92386_p2.patc=
h
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92387.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92389.patch

Hello,

I think there are a few issues with this series:
- patches 01, 03-07, 10/12 are needed for blacksail but no backport was
  sent for them (I don't think the curl upgrade master did is OK for
  stable)
- 8/12 is a duplicate of an earlier patch=20
  https://patchwork.yoctoproject.org/project/oe-core/patch/20261030085350.1=
3089-1-adarsh.jagadish.kamini@est.tech/
- 9/12 is a duplicate of an earlier patch=20
  https://patchwork.yoctoproject.org/project/oe-core/patch/20261030095124.3=
2916-1-adarsh.jagadish.kamini@est.tech/
- for both I plan to continue with the earlier patch, please
  review/compare it with yours to spot issues.
- I took 02, 11, 12/12 patches into my review series.

Please shout if you disagree with the above

For reference, patch number <-> CVE:
 [wrynose,01/12] curl: fix CVE-2026-86414
 [wrynose,02/12] curl: fix CVE-2026-86409
 [wrynose,03/12] curl: fix CVE-2026-87862
 [wrynose,04/12] curl: fix CVE-2026-92387
 [wrynose,05/12] curl: fix CVE-2026-86412
 [wrynose,06/12] curl: fix CVE-2026-92386
 [wrynose,07/12] curl: fix CVE-2026-107928
 [wrynose,08/12] curl: fix CVE-2026-87864
 [wrynose,09/12] curl: fix CVE-2026-92389
 [wrynose,10/12] curl: fix CVE-2026-87865
 [wrynose,11/12] curl: set CVE_STATUS for CVE-2026-19931
 [wrynose,12/12] curl: fix CVE-2026-18924=20

Regards,
--=20
Yoann Congal
Smile ECS

