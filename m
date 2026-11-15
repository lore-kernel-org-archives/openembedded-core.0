Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75.1794703747565017468
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2026 16:49:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=gKPQaj1M;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso12145085e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 16:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794703746; x=1795308546; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ruO7+V0AVRpDjuuOAjzygCJFPdEtsiPMRMdQjRbYIU=;
        b=gKPQaj1MwhFE2+Ve2cBQFCSBbH07ntdxBazvaxrB7qjNWrLc4bTdLZl9MMR5ykTpdM
         GZ9gVkObrlTLaupOg9jOOXJcCS3tHxAc1wpw0viq+/L3goeIDNvlr/R7xI0shfsRxsp0
         MS7pMPdvnWvAgDzNagTRORS1wwHgAWIJs+37k+nvUH+hqamr/Pk5SoEJDj+c7LSb4FIZ
         g7Qie3gip22ZI+bX0ITy+INuelmcSqajOat1bFGn7yP86UH01bnb5uTALovR9+uncYz7
         FHDD5tb5GRYzkMr8S9ZMEkeKlCgflemQgf1tHqna6K8rHMERfuyJMudoTqKmPP3fJepG
         RWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794703746; x=1795308546;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4ruO7+V0AVRpDjuuOAjzygCJFPdEtsiPMRMdQjRbYIU=;
        b=ba4yuXHbMoeFeQrfA8pHUBn4ZMRcwMPV9VGHdT9BgwAs3GiqfbgjGQsRzc8GB0sW5C
         AlX5HCokBMdJyP8gUQIYzSTe7ipBuKbtbMiaIPc6mXO1D8v1T1H7SgqmfVq5wTryal7k
         bXxGvRKCf3pSGzJTrVuXelcR0epnfn4y2g4J1cXEJ+wNIycPiKvkZY6hC/7ajjK+NiJ0
         ZBtzS7UbgD0QVRjhfTgVX8ZRf+lZ6H1sKWU+hOlbegvs5Qa8cbk9Q539DWb9gdF8i+mS
         v0jmLmV8i0iMb50k1pnLkyG+Tj3Zerqm+AkteihLDhgfduJWPmkiuOQfowOvzqBOj6Ud
         tFHg==
X-Forwarded-Encrypted: i=1; AL+hErEsfXDzZ4qB6Br67hEw2i4wktytiXCOgmxn64kLVSt59nDL8t92mgh353evNIiJR8W2dpxODG2dDdVB/upJ4ssXMQ==@lists.openembedded.org
X-Gm-Message-State: APuU4Z+ubtLKJs/JhfPRqLgw+qYnmqwcYc8/kswmyjZb7C2QvHAo6uby
	80rID9e4A+p2qJJ2KBSYztH7VjVZRP5A3PDx9o1R1PNUcJ8FOmqijQ9AkvLem63Zhd4=
X-Gm-Gg: AYBFou0zP0FK3DdL67ZWgjGP3Lhpek4Sv2MfE0RiRLwzqehSvPeNL26DppOdJ+os5Iw
	Qynuml+Ru1OloiaqsAZ4Q2b/SnWzDAXpuv4aL6tR/KqftYE3Ej8IY4mLTGwE7O3V4vob3BW7Zsl
	D9eJRVpyJumhdD+ys6aZP9uTdGBAQlGgccT6SUYikoOSbutHLZ5B/oJXz6xX77tUx1SxNlnNStR
	88vnm0AIb/YEuHPYPMsR1TkqFC2eiuUbh8IOMTdSiMLkMo84VIzDt1kb8s64wdfOWv0zGdBzyrN
	EqzDfOqCb0n+9IRAAykJrjiUjFL9Vcm1FGqWmaaxlQm0KS2yIORs171HYXH2W6t9AJ/e3jpJlx1
	Qwn5T9WJHVyhcJKOxqTVIMCLeqITyM7h2So0VOzFIG1f17Dja0HyUcA9l3Q31FbX9uub4Wwhp8X
	dw+RO7fZx+HJCGMB9vIyfw1hrFSFBaZHWgGvonOjrCpXgnuFZAFsk2rgAMhh/lJIa2sqGgsDTJ/
	AphEkYn17ZCJecVn6zfzzILnIAMm+YvRcdfRFJZ5H1Q7n3zJSQ+2axrZxmNFNOoTAHKr94CiG1w
	EIqLb1sxgBQ/oWjIEeL8Rs9r+jra4uEwN4koC2tc+/3ZtIKZiJlqaGiQ3IwqNnZ/2EwELPb1P9m
	ybQaWMVEafcsp3meAqNzXX0H8iUZuHB67WX2mAA==
X-Received: by 2002:a05:600c:524d:b0:4bb:68b9:f615 with SMTP id 5b1f17b1804b1-4bb68b9f88bmr36040175e9.17.1794703745644;
        Sat, 14 Nov 2026 16:49:05 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2adf53sm275793515e9.15.2026.11.14.16.49.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 16:49:05 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Nov 2026 01:49:04 +0100
Message-Id: <DMVDDQCWAXQF.20EAFWN8LK8T4@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH ] attr: fix CVE-2026-54371
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hthakar@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261105053506.165590-1-hthakar@cisco.com>
In-Reply-To: <20261105053506.165590-1-hthakar@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:49:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250215

On Thu Nov 5, 2026 at 6:35 AM CET, Hetvi Thakar -X (hthakar - E INFOCHIPS P=
RIVATE LIMITED at Cisco) via openembedded-core wrote:
> From: Hetvi Thakar <hthakar@cisco.com>
>
> getfattr traversal and setfattr restore operations can follow
> attacker-controlled symlinks and access unintended files. This can
> lead to privilege escalation when invoked by a privileged process.
>
> Backport the upstream hardening commits [7] and [8], identified by
> the Debian tracker [10], while retaining attr 2.5.2. These fixes use
> interfaces absent from 2.5.2, requiring the following prerequisites
> in their dependency order:
>
> - [1] Add the visibility attribute header. The compatibility helpers
>   introduced by [3] include this header and use its hidden annotation
>   for internal declarations.
>
> - [2] Add xattrat syscall wrappers. These provide the getxattrat(),
>   setxattrat(), listxattrat() and removexattrat() entry points used by
>   [3] when the C library does not provide them.
>
> - [3] Add xattrat compatibility helpers. The hardening fixes use these
>   interfaces for directory-relative extended-attribute operations.
>   They provide fallbacks for older kernels and unsupported
>   O_PATH/AT_EMPTY_PATH combinations, using /proc/self/fd where needed.
>
> - [4] Add the directory-fd-based walk_tree implementation and callback
>   interface required by [7]. This allows getfattr to access entries
>   relative to directory descriptors instead of repeatedly resolving
>   their complete pathnames.
>
> - [5] Defer restoration until command-line parsing is complete.
>   This ensures -h and the -P option introduced by [8] take effect
>   even when specified after --restore.
>
> - [6] Add openat2 detection and a syscall wrapper. Commit [8] uses
>   this interface with RESOLVE_NO_SYMLINKS to resolve restore
>   directory components without following symbolic links.
>
> The main fixes then convert getfattr to directory-relative xattr
> operations [7] and harden setfattr --restore [8]. Restore retains
> upstream compatibility behavior: -P protects directory traversal,
> while -h prevents dereferencing the final component. Physical
> directory resolution fails rather than silently falling back when
> openat2 is unavailable.
>
> Replace the existing walker in place, avoiding the upstream
> old-walker rename and duplicate implementation. Include the relevant
> test changes from [9] to stabilize root-test output on SELinux hosts.
> Read the ptest TESTS list from the generated Makefile so conditional
> tests are installed according to the configured build.
>
> [1] https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=3D21b5e=
5b9d394612f44e384c8fa024aea5e8dac68
> [2] https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=3Dc62e9=
b55edd512ba3f87eaaaf5b822bd2a76bfe9
> [3] https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=3Dc4622=
83577f1a6479229c43184ad6af5921f439b
> [4] https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=3D9b37b=
117c5d5703aa7481f4c34f73b24c010ad25
> [5] https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=3D4fce1=
7388e014a06cca16914ab3b7e4a0d117856
> [6] https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=3D1cea2=
fc5e8b5c8a5f29abf1141399e01a57a3154
> [7] https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=3D641ea=
6fcc556c1f34b77efb9cd3f876dff0a0a07
> [8] https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=3D3fb06=
b9ba314d37035d0877e6de313de754f1ac8
> [9] https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=3D30333=
5494a326026bc37e8d83ca47fa1a4d8dde6
> [10] https://security-tracker.debian.org/tracker/CVE-2026-54371
>
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> ---
>  .../attr/CVE-2026-54371-dependent_p1.patch    |  48 ++
>  .../attr/CVE-2026-54371-dependent_p2.patch    | 197 +++++
>  .../attr/CVE-2026-54371-dependent_p3.patch    | 710 ++++++++++++++++++
>  .../attr/CVE-2026-54371-dependent_p4.patch    | 638 ++++++++++++++++
>  .../attr/CVE-2026-54371-dependent_p5.patch    |  63 ++
>  .../attr/CVE-2026-54371-dependent_p6.patch    | 140 ++++
>  .../attr/attr/CVE-2026-54371_p1.patch         | 390 ++++++++++
>  .../attr/attr/CVE-2026-54371_p2.patch         | 476 ++++++++++++
>  meta/recipes-support/attr/attr_2.5.2.bb       |  10 +-
>  9 files changed, 2671 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-support/attr/attr/CVE-2026-54371-depende=
nt_p1.patch
>  create mode 100644 meta/recipes-support/attr/attr/CVE-2026-54371-depende=
nt_p2.patch
>  create mode 100644 meta/recipes-support/attr/attr/CVE-2026-54371-depende=
nt_p3.patch
>  create mode 100644 meta/recipes-support/attr/attr/CVE-2026-54371-depende=
nt_p4.patch
>  create mode 100644 meta/recipes-support/attr/attr/CVE-2026-54371-depende=
nt_p5.patch
>  create mode 100644 meta/recipes-support/attr/attr/CVE-2026-54371-depende=
nt_p6.patch
>  create mode 100644 meta/recipes-support/attr/attr/CVE-2026-54371_p1.patc=
h
>  create mode 100644 meta/recipes-support/attr/attr/CVE-2026-54371_p2.patc=
h

Hello,

This is quite a big patch ("2671 insertions(+)"). Looking at it, I think
this might be just backporting most of the risky parts of the 2.6.0
upgrade, but then, we might just be better off simply upgrading to
2.6.0. Do you have thoughts about that? Are there definite breakage on a
potential 2.6.0 upgrade?

Obviously, a 2.6.0 upgrade would need serious thoughts/discussion but
this might be the way forward.

Note: This is a similar situation to the acl series (CVE-2026-54369 and
CVE-2026-54370, acl 2.3.2 vs 2.4.0), see [1].

[1] https://lore.kernel.org/all/DMVCJFB6GMSJ.278YTTU78ZCM0@smile.fr/

Regards,
--=20
Yoann Congal
Smile ECS

