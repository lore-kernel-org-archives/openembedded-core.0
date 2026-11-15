Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7278.1794701372815025762
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2026 16:09:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=pOGshsKu;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so19148365e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 16:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794701371; x=1795306171; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OFAJFysZzuYXMpZtW2R8Dy1xVdMcybpkxM4+u24wThg=;
        b=pOGshsKu2DaYHG/ScDeg7mISW9cp7WgSWvB8NMNAHRaaD6W5aOJtQVEtQ1UVbmVz65
         c1rTWbdXOcn+h3S8GHcWSChU4FGeFldESu8lB6BW4G9C3A9wDOwRgd0MZxE4g8G94YwS
         8nSinYp87XhVp2Q9WjF//yBP2rJjKw79WzvzS+PnimlMZHbwOXiuhg13cmuN3y1g6Fqq
         kBYK0Kh5QsDQlsFIKDBoeJUb/rE3vCjvEGr28WSTjs252SfrPuzy7YOJc/iGn1S8hlG/
         mC3U0xQbfQM3M3d9beP4GSOhA0Reo68hQHSJle2OrUIhsfkftg2HxZQwP+JCB7fRmC2B
         8nCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794701371; x=1795306171;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OFAJFysZzuYXMpZtW2R8Dy1xVdMcybpkxM4+u24wThg=;
        b=1fFdidWhLt2LUyGNwb9+Iosfdwit74O6tR39v9lWZLMq1orx+C4yTClB4b5sE4BYrC
         pn1gVQmO1Nj6dwSz565OPhhFw07W5BYe3wwSK4+HAdj+UZlM3lsDUEDEK+0jF2ZXPGLV
         LzV9QGdIQ1YDBhoc5w34cVhVYiWBvQAL+Y/1mIm6QqjhHgE1W/0tH5mPWW2Bq3o+KVYr
         ne9lSwZVgUVhhHKoaH8sgxEKY8HnZmVY2jyfwmCL2CLLCIgYl2xKutqPkA9ImB6Xq2Iq
         v84JhG76BKD6Qi3OylnPI2tyZrjH/0Igs5COXwffQTuBgzrKAnBPDWxnNKqyI6o+zVUM
         ZgOQ==
X-Forwarded-Encrypted: i=1; AL+hErG+jlUMLPTbWktIwMjFB+fj8kSWsO4OGREj1SrPzSn4bj9wToEg0alEIhLb3y0WCp1M8CypFmbDk/sembkpJjhlOA==@lists.openembedded.org
X-Gm-Message-State: APuU4Z/ccDoo048YF65wcPkxbzrxuMEDJGKA1QSjiFZkVvVioqm7NoYb
	lM+F5P8p10+RAUWWb6pfB2I4+Bz9iSxuMHPLH1VJcmFsDove4qaVRC96+VOZ/WeyC94=
X-Gm-Gg: AYBFou2Pn6RtAJJs9Bpj5ebfXF+qxp8fMa4h4Yl0UTjybooH+7fvP0m6587f2+0cayH
	aj3GhmSKKAziHDU4r9uoufdjCRa+9QpJuxM8kD822bdCcZnzmzwoi0JuZ3tg7+0WFlvfPytGfDb
	ubfDLzjlLKWsWrgk9jsMwTF8PC1rhotWKFqiXQkwMijDOUKOkZ2Ufe/rl0reaHUO8aegoiARuqB
	LnNUlPCri2NkcWv7Dx3CUfEvf9TiJLtATkoYWWJLU47sb6/1b3WzqDC2OVSgxXHFHSqzn07Jc2a
	paaE2yenahm2jBw+LylYokSUMYlgR1ZzfdMTWR6oJvQT7TBPx6sFLPb2RVwBKHQ5DK9QbpVU5nL
	eJGutu2JcQ7xBUhqebGIqY0QIkalW4lxJjEqmxxK4fnIrQfl94Gh8FLf87qmj6nrSyKDJy1tlml
	Oubx3Wa4IgsvO7niKvzlmO0E4+k7LxtFavyjH1fuhUiRC354kWDIeNGDCYA6E9YvKujy8GhC9mD
	B+jnbquwW+qLfVc53sTO3CTtOKrGCdTfZRp92ADUnrIQj22SF7ou8AJDp6ynAaECkYgGENeNIjN
	AkrXhKxfuGmxS2oB/MPYrE4n7pHPI/bn2AsPafHkTn4munUNQsOmQnm6OrJ1wd930w+8K0n4Lbi
	uHrXl4oKFr1swLWcS
X-Received: by 2002:a05:600c:3e17:b0:4bb:69b3:2b42 with SMTP id 5b1f17b1804b1-4bb69b32d31mr16886765e9.16.1794701370900;
        Sat, 14 Nov 2026 16:09:30 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb52bab8bbsm191520515e9.13.2026.11.14.16.09.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 16:09:30 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Nov 2026 01:09:29 +0100
Message-Id: <DMVCJFB6GMSJ.278YTTU78ZCM0@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <dkelaiya@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH 0/3] acl: Security fixes
X-Mailer: aerc 0.20.0
References: <20261104055335.2080900-1-dkelaiya@cisco.com>
In-Reply-To: <20261104055335.2080900-1-dkelaiya@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:09:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250214

On Wed Nov 4, 2026 at 6:53 AM CET, Darsh Kelaiya -X (dkelaiya - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) via openembedded-core wrote:
> From: Darsh Kelaiya <dkelaiya@cisco.com>
>
> Backport the upstream fixes for CVE-2026-54369 and CVE-2026-54370 to
> ACL 2.3.2.
>
> CVE-2026-54369 adds descriptor-relative ACL APIs so callers can control
> symlink traversal. CVE-2026-54370 uses those APIs to harden getfacl,
> setfacl, setfacl --restore and chacl against path replacement races and
> unsafe symlink traversal.
>
> Retain ACL 2.3.2 on the stable Wrynose branch and backport the security
> fixes with the required _at APIs and helper dependencies. This follows
> OE-Core's focus on security and bug fixes for stable branches [1],
> avoiding a general recipe upgrade to ACL 2.4.0. Existing pathname API
> behavior is preserved.
>
> The new public acl_*_at declarations conflict with private helpers
> using the same names in GNU tar 1.35. Patch 1 backports the upstream
> tar rename before patches 2 and 3 introduce and consume
> the new ACL APIs.
>
> [1] https://docs.yoctoproject.org/6.0/ref-manual/release-process.html#sta=
ble-release-process
>
> Darsh Kelaiya (3):
>   tar: avoid name conflicts with new libacl APIs
>   acl: fix CVE-2026-54369
>   acl: fix CVE-2026-54370
>
>  .../tar/tar/Avoid-acl_-prefix-for-functions.patch     | 103 ++
>  meta/recipes-extended/tar/tar_1.35.bb                 |   1 +
>  .../attr/acl/CVE-2026-54369-dependent_p1.patch        |  69 ++
>  .../attr/acl/CVE-2026-54369-dependent_p2.patch        | 200 ++++
>  .../attr/acl/CVE-2026-54369-dependent_p3.patch        | 712 ++++++++++++=
+
>  meta/recipes-support/attr/acl/CVE-2026-54369_p1.patch | 719 ++++++++++++=
+
>  meta/recipes-support/attr/acl/CVE-2026-54369_p2.patch | 957 ++++++++++++=
++++++
>  meta/recipes-support/attr/acl/CVE-2026-54369_p3.patch | 109 ++
>  .../attr/acl/CVE-2026-54370-dependent_p1.patch        | 168 +++
>  .../attr/acl/CVE-2026-54370-dependent_p2.patch        | 761 ++++++++++++=
++
>  .../attr/acl/CVE-2026-54370-dependent_p3.patch        | 439 ++++++++
>  .../attr/acl/CVE-2026-54370-dependent_p4.patch        | 140 +++
>  meta/recipes-support/attr/acl/CVE-2026-54370_p1.patch | 299 ++++++
>  meta/recipes-support/attr/acl/CVE-2026-54370_p2.patch | 403 ++++++++
>  meta/recipes-support/attr/acl/CVE-2026-54370_p3.patch | 603 +++++++++++
>  meta/recipes-support/attr/acl/CVE-2026-54370_p4.patch | 213 ++++
>  meta/recipes-support/attr/acl_2.3.2.bb                |  14 +
>  17 files changed, 5910 insertions(+)
>  create mode 100644 meta/recipes-extended/tar/tar/Avoid-acl_-prefix-for-f=
unctions.patch
>  create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54369-dependen=
t_p1.patch
>  create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54369-dependen=
t_p2.patch
>  create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54369-dependen=
t_p3.patch
>  create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54369_p1.patch
>  create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54369_p2.patch
>  create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54369_p3.patch
>  create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54370-dependen=
t_p1.patch
>  create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54370-dependen=
t_p2.patch
>  create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54370-dependen=
t_p3.patch
>  create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54370-dependen=
t_p4.patch
>  create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54370_p1.patch
>  create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54370_p2.patch
>  create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54370_p3.patch
>  create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54370_p4.patch

Hello,

This is quite a big series ("5910 insertions(+)"). Looking at it, I think
this might be just backporting most of the risky parts of the 2.4.0
upgrade, but then, we might just be better off simply upgrading to
2.4.0. Do you have thoughts about that? Are there definite breakage on a
potential 2.4.0 upgrade?

Obviously, a 2.4.0 upgrade would need serious thoughts/discussion but
this might be the way forward.

Regards,
--=20
Yoann Congal
Smile ECS

