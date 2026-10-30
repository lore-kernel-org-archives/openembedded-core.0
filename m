Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8108.1793354668092420979
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 03:04:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=ZCyh9sP7;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e46e449e8so319615f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 03:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793354666; x=1793959466; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P/9RAaZBliYysa3TOVERIqAHqaCTqn+fxyQPn9mclsA=;
        b=ZCyh9sP7CDfPXUlXfp3l8B7rOipWlz/VVR2K7R7/6yDQ35LxyHQwXyju29QpEBtpdO
         +0rzdwRh3jyhiezzN3MoywpR2av04zrAlxMLfAI9ApaKELB8MpqzySWB5i/SbcGPvjLT
         +wJFoOsCNMQ+DfS7eBlduai9tmhW/mzsIszp5E6KqvNNmM1Z5IFIBsIixVJlmOF18A90
         zxEx/11i7gxVN/5+mVWBOP6l+Xe8EhBT0wWybA52Vqo/hNTfTbK7nwSLFOlUm8gQWmIY
         zu/clTTc9Kvi2VfXj/C8Szyb86L+9l34P7OGLZY65Bkx9MYw2UQb/5vKz3Dz1ulyDgkX
         WS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793354666; x=1793959466;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P/9RAaZBliYysa3TOVERIqAHqaCTqn+fxyQPn9mclsA=;
        b=yPmWiVyRyABhWLSw7jpiQaLNFpkuTBAPyKzD9WD1uacur0SgkeWq0XD4Eb7JOALDIv
         stkJ/Z3EPzSJbB0Rn4XtJG/3zZWksxyA7SFJRRBQNuOEKqJSYOgUEqX4pFpEMnCGNfML
         KJpT6Yx9rfCMsYOdJbz4g7v7yU0SanRIT4B/2XJsN7roOHuxzUKAjT8WsdrIze+P8XSG
         w5WjqOGo/3c5xURxVrelnr79/Idbrn3SJ100bOBWAhYBS6yAyJOQXFBXZlE8nRV3YUis
         loZO1kEvsfDQJRV2U6Ks8tL2Z3Lb7d/s/4DCDlwUo5ClVer//6BstRyu17Y+/ONq8/x6
         kqPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMj1BpqGZHLqX4AaGnEYAhQBcgQoGEJZzW6SMEX7N/un8DxE0ekEVEgyCXrBiCaVC2JEzFsGAiQtc1MR8vt3TegQ==@lists.openembedded.org
X-Gm-Message-State: AFq9FYJq635mNJR4qSfzLxJP2uQUvsDsjweb5EXtUcFHCbMGPe/jTVSU
	dVq1y4GfJ06tjHyVyuZuzPINUJeG61es5pocjU5SomMWxg78fHCE/Waxf1WO+HrtiZI=
X-Gm-Gg: AYBFou1hP9aRD+/WTTacnlCWd1YJnl+yANCFYZAFVzb86XIDiC7TBGQX9T0dL8LIEx1
	uIuT9bmDTYkVopyyZeEqFtOtjXkFrKEKBShCJtlEuChhCvvXC7Jq65S4zAxNEfBEqAV839VRqFz
	PpXcrVTFIw338f/MfQMWOfsUQmkTNGmEnygYFdcwNio4hhMtlt8juRf4EKFhHGaMYPECMQ/gPOH
	RAFTZs+D9pREGg3dfou6i6lIE1npexO22Kh/0Az4pkqh0USnSshLZB6Bw7vL3zMeDXGTGSeqds0
	rhZA4B00nY2LxOICZGIMkX4SUXVEBWVqDqQBB8ag3k/xb7HATuF8tMoR4OslF7O6cK+NugU4h6h
	R73BsGwW0l/fzryhOO2sqW7MdYkrPUGzLi+/JoTtlhoIjpC+vWQI5vVoPpXIdQbfKwptyoz+vGX
	JzFZAO/KNoz8mbnwjesQl0XL9Tq1s2jXEN1oeayeiO3ZO3+wwAsT25pVk8p7Ga41ao7KtYaxSPy
	PDkJroR1TG+IRheOha8vkvsT7LWpKG9LOKZLe34XvO3cnLb7/PyC5KntPVxhoqS/Q6Ss/K1vHAP
	t5FPLtdU268zKw8KYxoG0vQsBWfO1gbjlwo05fiXPRVoOnzENOwRz8fCIYUiHpx4cxdZqOsaqe/
	fEpDtL2ryNwNnLg8t
X-Received: by 2002:a05:6000:22c2:b0:48e:2980:d396 with SMTP id ffacd0b85a97d-48e6e50da28mr4046805f8f.37.1793354666048;
        Fri, 30 Oct 2026 03:04:26 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b789ecsm2374399f8f.29.2026.10.30.03.04.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 03:04:25 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Oct 2026 11:04:24 +0100
Message-Id: <DMI367I27X8Y.1QCWB126HTJ6L@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH v2 5/8] curl: fix CVE-2026-8927
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)"
 <devanshp@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261016130439.603118-1-devanshp@cisco.com>
In-Reply-To: <20261016130439.603118-1-devanshp@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 10:04:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249013

On Fri Oct 16, 2026 at 3:04 PM CEST, Devansh Patel -X (devanshp - E INFOCHI=
PS PRIVATE LIMITED at Cisco) wrote:
> From: Devansh Patel <devanshp@cisco.com>
>
> This patch applies the upstream fix as referenced in [3], using the
> commits shown in [1] and [2].
>
> [1] https://github.com/curl/curl/commit/1968b32afd8e41fbb87f8911d15c552c6=
b705385
> [2] https://github.com/curl/curl/commit/5c225384b8d52c67ce8259c6e4203bc57=
aacb567
> [3] https://curl.se/docs/CVE-2026-8927.html
>
> The test adaptations account for these earlier upstream changes:
> [4] https://github.com/curl/curl/commit/6cf3d7b1b161bc45501d17b401225befe=
3c43943
> [5] https://github.com/curl/curl/commit/a186ecf4bf0c8ebb3a9a826155b339216=
4ec257a
>
> Validation: ptests passed (866 tests, no failures). The release build
> skips test1647 because debug support is disabled. A native debug build
> with stunnel passed test1647 with the test compatibility changes below.
>
> Signed-off-by: Devansh Patel <devanshp@cisco.com>
> ---
>
> Changes in v2:
> - Rebase onto stable/scarthgap-review
> - Explain the test.h macro requirements in the backport changes.
> - Adapt CONNECT normalization and the expected error for curl 8.7.1.
> - Record target ptest and native debug validation.
>
>  .../curl/curl/CVE-2026-8927-dependent.patch   |  39 ++
>  .../curl/curl/CVE-2026-8927.patch             | 390 ++++++++++++++++++
>  meta/recipes-support/curl/curl_8.7.1.bb       |   2 +
>  3 files changed, 431 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8927-dependen=
t.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8927.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-8927-dependent.patch=
 b/meta/recipes-support/curl/curl/CVE-2026-8927-dependent.patch
> new file mode 100644
> index 0000000..d05699d
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-8927-dependent.patch
> @@ -0,0 +1,39 @@
> +From a07fc9a9855848da48a4533b85153c681ae1b1a0 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Fri, 25 Apr 2025 08:16:13 +0200
> +Subject: [PATCH] tests/buildinfo: former "disabled" now provides more in=
fo
> +
> +This tool now contains ON/OFF information about features in the build.
> +This way, runtests gets both positive and negative feature presence with
> +this. Allows for more flexibility and avoids having to duplicate the
> +names.
> +
> +Closes #17180
> +
> +CVE: CVE-2026-8927
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/1968b32af=
d8e41fbb87f8911d15c552c6b705385]
> +
> +Backport Changes:
> +- Add only the Digest feature flag needed by the tests. Keep the old
> +  disabled helper, which clears this flag when Digest is disabled.
> +  Leave out the buildinfo rename and other feature-reporting changes.
> +
> +(cherry picked from commit 1968b32afd8e41fbb87f8911d15c552c6b705385)
> +Signed-off-by: Devansh Patel <devanshp@cisco.com>
> +---
> + tests/runtests.pl | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/tests/runtests.pl b/tests/runtests.pl
> +index ddfab20e86..b40df554b2 100755
> +--- a/tests/runtests.pl
> ++++ b/tests/runtests.pl
> +@@ -637,6 +637,8 @@ sub checksystemfeatures {
> +             $feature{"Kerberos"} =3D $feat =3D~ /Kerberos/i;
> +             # SPNEGO enabled
> +             $feature{"SPNEGO"} =3D $feat =3D~ /SPNEGO/i;
> ++            # Digest auth enabled unless disabled by build
> ++            $feature{"digest-auth"} =3D 1;
> +             # CharConv enabled
> +             $feature{"CharConv"} =3D $feat =3D~ /CharConv/i;
> +             # TLS-SRP enabled

Reading the code more closely, I think it would make more sense to fold
this CVE-2026-8927-dependent.patch into CVE-2026-8927.patch with the
proper explanation (Like you did with the CONNECT line).

I generally don't like squashing patches like this but in those 2 cases,
I think this is the better option (the runtests.pl patch does not look
like the upstream patch anymore, and the CONNECT line is buried in a
very long cleanup patch).

Thanks!
--=20
Yoann Congal
Smile ECS

