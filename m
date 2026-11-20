Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8092.1795218448292028970
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 15:47:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=QWRKiq0f;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so13734845e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 15:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795218446; x=1795823246; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2F/M5vW459wemfFbpD+7Pj+47BGZns2ppcGlXcZqflM=;
        b=QWRKiq0fTm4gkTAzIn5iffVDUJ9Q2X+HNrW9P3ouNkvVd1UURYziUJc0EuBly46HYe
         A3d1SzXO5aJ8gNdjw6d5/tAue2FeHZ3W49q0dXHAnnut6Mtr3dmBdrkA6RVH1zr87yrq
         AcxAGWaNgbiCDA3EULg4EM69JVNWR+vvOUCDkOqgLee/uNDwXr/9wPFdOqJwvxyMChat
         ECYhB31FBH6V8Se3SiH3Qz4eCU61h/nyprX06fqE5/Wr7q0uDUXfnVM61VITRKXXYrzC
         YHD9TTElngdpFHpAe1wXV1XI7Gascx1AKRdsShcy495tEAUK4WqsGnk2fLKBwscwbxL+
         oG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795218446; x=1795823246;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2F/M5vW459wemfFbpD+7Pj+47BGZns2ppcGlXcZqflM=;
        b=apNUcrJ7PM4Ygnvcza1ceEgEsXzMABqxg/gO3Hs9V3NHa1WkNuKHyLnOp6/U0iNXib
         zyznIzPI2qDbRfZmnmxIjoBS4SeZX+iC2TGKMPr6vuiEjUSjqTAZjpWfDpfEXqmpfOQc
         iHr4Ubcnw+UKR0ZMSP2TdYMPd1Tv36TW9gRm4ORgmr7JjRlA2ahRYkXCQQCKzwML9xWr
         zgGuoeVK/qslGpTGHuKsQHzn1b9ciObsJZrvBUE0f6a6WKls7ukcIBLHYkc2Kl6lT3Ym
         XAdZfk5NfxDVBfjhwrTrX+nlMfnx7SnV+rzmMgzzAFyKgJtSCN1Sexy3YvFi3gI/YzGl
         8iYg==
X-Forwarded-Encrypted: i=1; AL+hErHAts14xzbsw0ZGdLr2Lctt1ShT5Zyzs9+FTFJmZdQyRErOzUvE4mKH0zcOyEaQGjqEsp0F6YeLZVhoPfgOgEmadA==@lists.openembedded.org
X-Gm-Message-State: APuU4Z9gsEdAK+nwkhlMHU9/XMEh35V+r/0kw3t3MER1Hli9mWKF0BOQ
	itl2ap/q/NBBBuvGiDNAGi11fHwOyv+r9roK/exyMPZ/vBgDhEDJZ9qL7CEqtCl0GwU=
X-Gm-Gg: AYBFou0NxKTGInikuYDYiuyuzIEFo+zukkA1Vk3Z/tr5pwdwoXWdIBpfFTZTVYZbrkA
	HEQHkvj8UNtK07Du/tYWHhaHA2XQ/sJFIuvFKuDOhoGlYBD1T1ofPC+E8kE4AmmGT3thtNBLtQs
	xWYJC2ZRoFbDvAxksaT/rL4qksaTD+GHkwYXV52z+ApDI1nICMw1/Od9buOaMDIVSYVNnUowVcV
	l+YVaJVjID4rUSf3MuK9WIdhO1GnJVcz+3S7pXTBpqqW/5/bNlP+J1s3W/3u6EHc+II8hjKRIjo
	lA0kDrHSxtdINZs/nMhm0FSTeBAV8K5xG3ftL0O/8yXbWrIunNjs3lxXpw9t8X3J2UOlpwWoWPX
	V2i9vOGyT3AH1WS4lF8QinTnYZekGhW6Br/JzLsJhAMbGOeJLt3RzEa9kKOacRuo8eqk4EKw4RG
	yveLRjorgEPsJ7hqietGag5CDHD+NDw5fYoFU3eipd+kcMI7fdoVrbJL5Y1OhOn9aIYyKC+YWG1
	NNG7Rp1y7LnE9jNeGT6eRn6Bmc25t9t+FzkWLl65nwmYhawyPkpaSJRpkUpNg7eQlxJdr1IFQOc
	MTEYXj2hPnY7d35sc9Zxd1NGGFugab+uQKItOMO01jIAiZjxeIe13NHUgRAGZWY0WhIykUfOw2Q
	PH/B4KhRHzA5J9c3J
X-Received: by 2002:a05:600c:4f84:b0:4bb:8701:a2df with SMTP id 5b1f17b1804b1-4bb88809950mr108418965e9.17.1795218446311;
        Fri, 20 Nov 2026 15:47:26 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00b03901bd7f693780.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b039:1bd:7f69:3780])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm174680705e9.13.2026.11.20.15.47.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 15:47:25 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Nov 2026 00:47:25 +0100
Message-Id: <DN0FTSP5AZ5C.2IFR6JMARUZDY@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH 1/3] expat: fix CVE-2026-113351
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <dkelaiya@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261105091719.1622520-1-dkelaiya@cisco.com>
In-Reply-To: <20261105091719.1622520-1-dkelaiya@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 23:47:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250829

On Thu Nov 5, 2026 at 10:17 AM CET, Darsh Kelaiya -X (dkelaiya - E INFOCHIP=
S PRIVATE LIMITED at Cisco) via openembedded-core wrote:
> From: Darsh Kelaiya <dkelaiya@cisco.com>
>
> Backport the allocation-tracking reset fix [1] from upstream PR [2],
> which is referenced by the NVD record [3].
>
> Snapshot retained allocations during XML_ParserReset() and exclude
> those bytes from the next document's allocation-amplification checks.
> Include the required counter extraction, accounting-settings
> correction and both upstream regression tests from the same PR.
>
> Retain Expat 2.8.3's XmlBigCount counters and adapt the accounting
> regression to its existing protection-setting APIs. Omit the PR's
> comment-only encoding-check change because the later check that it
> explains is absent from this source.
>
> [1] https://github.com/libexpat/libexpat/commit/a6cf8a6944b6c6d81e74c4cd9=
5faa29132e67aa3
> [2] https://github.com/libexpat/libexpat/pull/1431
> [3] https://nvd.nist.gov/vuln/detail/CVE-2026-113351
>
> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> ---
>  .../expat/expat/CVE-2026-113351_p1.patch      | 39 ++++++++
>  .../expat/expat/CVE-2026-113351_p2.patch      | 65 +++++++++++++
>  .../expat/expat/CVE-2026-113351_p3.patch      | 80 ++++++++++++++++
>  .../expat/expat/CVE-2026-113351_p4.patch      | 95 +++++++++++++++++++
>  .../expat/expat/CVE-2026-113351_p5.patch      | 70 ++++++++++++++
>  meta/recipes-core/expat/expat_2.8.3.bb        |  7 +-
>  6 files changed, 355 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-113351_p1.patc=
h
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-113351_p2.patc=
h
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-113351_p3.patc=
h
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-113351_p4.patc=
h
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-113351_p5.patc=
h

Hello,

FYI, I received patches for blacksail for
CVE-2026-117610 and CVE-2026-118370 (patches 2-3/3) but not for this one
CVE-2026-113351 (patch 1/3).

Regards,
--=20
Yoann Congal
Smile ECS

