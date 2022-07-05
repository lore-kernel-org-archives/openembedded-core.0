Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B883CCA47F
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 14:28:39 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.84622.1657031315296726934
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 07:28:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WzV1DPhQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.171,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-qk1-f171.google.com with SMTP id z7so8781192qko.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 07:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=e2MdHtvhke1L23uvocfW97PPBXzHybBGjfvJov6GzTs=;
        b=WzV1DPhQZ7pyhBXqhsY8KFzNzHzvvw3c+t9V4S9uNuwVx2nDtfl3Xj0lvzUC5AGEMf
         phVO0x8fRjA4WRcpkoCzg2w1qMzBfoiAeun3WNZJlJ8MdcKUa2ptUJUrqI8SoqsLWMwg
         Qp9kVsoteejA22qFdXInvs4WaljrO25Z5KjTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=e2MdHtvhke1L23uvocfW97PPBXzHybBGjfvJov6GzTs=;
        b=hL06isACle8vvvC3cmTqpgKAvB2wMx/U8hjjwtijcIp56M9qaRnIV9oUmpiReSykrV
         8B1mZx6Wt64qPNVxql2RSGQWPSGkG7ZmQwTCO4gPtOHgWyyKay7JksPigeyQjfpuoyD7
         0foR/wffvosNQCu2ian3SkctZoT1NqGmAWm3UJNe6rH4rDq6vAe11z12NY5zYFXTI0er
         /bkLsC/mNVkBZDXBnf78NQikO2Gs0CL3hQepSHYECfdXgAdlAVdh1K8LqmHXDjdxPot8
         HhAZq+RpX12O32jTRmvctTg3ZyFTA2wrfC+PNOgvwS3s2Zd3GlMo+y/dMZ8HR3fF4lNA
         mUpw==
X-Gm-Message-State: AJIora/cPb80lzL1jSItrefQUQ2WV0t8Va/p+PRBmdW+wLiirCMDOOkL
	R7Gf/FS94doyKIY16gm8zEKL3FBY2nS5Cw==
X-Google-Smtp-Source: 
 AGRyM1t8zdA5no+3PzWL4YzqQ+0aCuJTZNLiDGqC1n89DjRduciDxnYa9ofk+r7vZkfZYrNLAfprWw==
X-Received: by 2002:a05:620a:4708:b0:6b1:68c8:541e with SMTP id
 bs8-20020a05620a470800b006b168c8541emr22444233qkb.748.1657031313990;
        Tue, 05 Jul 2022 07:28:33 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7dad:6fff:75bd:1ad8?
 ([2001:8b0:aba:5f3c:7dad:6fff:75bd:1ad8])
        by smtp.gmail.com with ESMTPSA id
 bx15-20020a05622a090f00b0031c56d5f7e1sm13697792qtb.92.2022.07.05.07.28.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 07:28:33 -0700 (PDT)
Message-ID: 
 <0ed020ff7414bd0ff7f5bbee514262e6a2e25318.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gperf: Switch to upstream patch
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 05 Jul 2022 15:28:31 +0100
In-Reply-To: <16FEF4EEEA73772B.1980@lists.openembedded.org>
References: <16FEF4EEEA73772B.1980@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 14:28:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167659

On Tue, 2022-07-05 at 15:23 +0100, Richard Purdie via
lists.openembedded.org wrote:
> Upstream merged a patch to handle the reproducibility issue, switch to
> their patch which is functionally equivalent.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  ...c6e57a308a05889c80c048dbc58bdc378dcb.patch | 203 ++++++++++++++++++
>  .../gperf/gperf/reproducibility.patch         |  26 ---
>  meta/recipes-extended/gperf/gperf_3.1.bb      |   2 +-
>  3 files changed, 204 insertions(+), 27 deletions(-)
>  create mode 100644 meta/recipes-extended/gperf/gperf/1862c6e57a308a05889=
c80c048dbc58bdc378dcb.patch
>  delete mode 100644 meta/recipes-extended/gperf/gperf/reproducibility.pat=
ch
>=20
> diff --git a/meta/recipes-extended/gperf/gperf/1862c6e57a308a05889c80c048=
dbc58bdc378dcb.patch b/meta/recipes-extended/gperf/gperf/1862c6e57a308a0588=
9c80c048dbc58bdc378dcb.patch
> new file mode 100644
> index 00000000000..6d1c1ad5d51
> --- /dev/null
> +++ b/meta/recipes-extended/gperf/gperf/1862c6e57a308a05889c80c048dbc58bd=
c378dcb.patch
> @@ -0,0 +1,203 @@
> +From 1862c6e57a308a05889c80c048dbc58bdc378dcb Mon Sep 17 00:00:00 2001
> +From: Bruno Haible <bruno@clisp.org>
> +Date: Tue, 5 Jul 2022 07:51:46 +0200
> +Subject: [PATCH] Add support for reproducible builds.
> +
> +Suggested by Richard Purdie <richard.purdie@linuxfoundation.org> in
> +<https://lists.gnu.org/archive/html/bug-gperf/2022-07/msg00000.html>.
> +
> +* autogen.sh: Import also lib/filename.h.
> +* Makefile.in (IMPORTED_FILES): Add lib/filename.h.
> +* src/options.cc: Include filename.h.
> +(Options::print_options): Print only the base name of the program name.
> +* tests/*.exp: Update.
> +
> +Upstream-Status: Backport
> +
> +---
> + ChangeLog            | 11 +++++++++++
> + Makefile.in          |  3 ++-
> + autogen.sh           |  5 +++--
> + lib/.gitignore       |  3 +++
> + src/options.cc       | 11 +++++++++++
> + tests/c-parse.exp    |  2 +-
> + tests/charsets.exp   |  2 +-
> + tests/chill.exp      |  2 +-
> + tests/cplusplus.exp  |  2 +-
> + tests/gpc.exp        |  2 +-
> + tests/incomplete.exp |  2 +-
> + tests/java.exp       |  2 +-
> + tests/languages.exp  |  2 +-
> + tests/modula2.exp    |  2 +-
> + tests/objc.exp       |  2 +-
> + tests/permut2.exp    |  2 +-
> + tests/permut3.exp    |  2 +-
> + tests/permutc2.exp   |  2 +-
> + tests/test-4.exp     |  2 +-
> + 19 files changed, 44 insertions(+), 17 deletions(-)
> +

I'll trim this header out as obviously I didn't backport all the pieces
for things like the tests since we don't currently use those and we
don't have autogen.sh in the release tarball.

Cheers,

Richard

