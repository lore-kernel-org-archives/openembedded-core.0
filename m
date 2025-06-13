Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD9A8C71148
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 16:24:06 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web11.1372.1749831838623081174
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 09:23:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ioI5BVWV;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.180, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-70f94fe1e40so37240187b3.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 09:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749831838; x=1750436638; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QH5zooVJDa8RK4OcjcUjren6/FS0TiYoubQXvc3luUg=;
        b=ioI5BVWV82nuXEhDtJJXBkXPDPs+Ep6mviV4jMcfnplF8SCZryp8NHjDbXc7/8aPo6
         wAidog0kRsnPMNZztpzuQhQ9COidmUn1N5J7Hq+Qtf2imXBBW3koI7eZs8DvWOQx3Qj1
         Q5db7j4lUpVFtU8n1UpmfHW3Iq+aXo0Z03d2EIu/tZF8OSC3ZhzYPGwMSnuEu3jnYykf
         aytS8ZDinv1QQpuWGOFtgRYifKB8OGlyr6N79EEwqu7pL7vlOd3Y5NRpOg/FbIp/DAzS
         zCtUKCDwG6DqAW74rqNSUzwSGoEYXsVge8pUS7DDjJMdDvDgpBdOCawUy7HQiNYKCbJf
         hWBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749831838; x=1750436638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QH5zooVJDa8RK4OcjcUjren6/FS0TiYoubQXvc3luUg=;
        b=DA9gJXvEVaSJIYvFNCgn7hzl47SIik3gkEiABnxAWvo6gyB1/ALwjWm+oZi2U22kuh
         kDJJLlmh/ihGkKDroEu7ciQVBR4Nlf3N0PUPx0+QnrZwSSRJrB3bxYsZe7uDbWm9CGqB
         tI1nNOT94WJyJSG3YATYGgwVrDGWB6kJNZcY+pKt4DaaC1B+C1cULM/Dv8RTWJg6rN3m
         L3vnr5J+59YQXiJOoDGsBFlkkuJkEabKw0NE+Xv9aK95bpj8pK1f3MZwkhvCKqhRY6SQ
         o5yZuK+NDsHUCqNoE9roD8buTwNkEzLMX/OxmWeBw2shICsc8dxivANdZIJtdaVn3z03
         Jk3Q==
X-Gm-Message-State: AOJu0YwQ69hlQQjB4PRVesS7NTj+820sHYkI1hPxLyUpT+zxP21BvUVc
	ulpwTmAoEB1SqE5o4El2ugnIoIE5W88l9aq9ixCL+h37qCsJsv+gGDMm7YT/CIGdFishDj8x67j
	ZxLBo4LGWVRkfYewTAC//ciNrF0sZehw6kLm8Mr9Z+w==
X-Gm-Gg: ASbGncsp0U+X0I8ATcQwesdIHHD26ZfjvkbKRQYpxuylaGK9ksKTU3Iyfz7S1fnAfwC
	Tn2PFeUqD2s4KLuoSlTdDLZAhkrZVPQzVST7nTz56tiv0hhljWBzLV/1UojOtMlm9jitZkpU9no
	9xzOUzX2r3XA3nP2ZuXRm8XfUUSwC61JiYBB/zbDLWVtXsXGBuv7SXGaCrKh9O8iXDz8sFjTBR8
	qQ=
X-Google-Smtp-Source: AGHT+IHkLfS5t3bSJtqBlgql5CJnzppCaD8bRJ5rARxZH9Gj/JJkoRCYDvbFYftVk4d669A2vpIHaLa2tFyDGu/YOUw=
X-Received: by 2002:a05:690c:700b:b0:703:b47a:7312 with SMTP id
 00721157ae682-7117494035emr5623517b3.15.1749831837679; Fri, 13 Jun 2025
 09:23:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250613034352.175878-1-changqing.li@windriver.com>
In-Reply-To: <20250613034352.175878-1-changqing.li@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 13 Jun 2025 09:23:46 -0700
X-Gm-Features: AX0GCFusQQ8mPCLlXda41zS7xiLVDh1AoB8KAktl4u5nag-XscTx53--46ZjLIQ
Message-ID: <CAOSpxdZwOjkN+OaHEzhv6qngpS+aGTx8OcdCWR9ewb9U5PSvfQ@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH 00/20] *** libsoup/libsoup-2.4: fix
 CVEs ***
To: changqing.li@windriver.com, Vijay Anusuri <vanusuri@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 16:24:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218617

Hi Vijay and Changqing,

Seems you sent similar patch series at just about the same time!

There is a good deal of overlap, but each contains some that the other lack=
s.

Also, Changqing's has a conflict in "libsoup-2.4: fix do_compile
failure" with a patch currently in kirkstone: "libsoup-2.4: Backport
auth tests for CVE-2025-32910"

Could you please work together to decide which I should take and
submit a new series?

Thanks!

Steve

On Thu, Jun 12, 2025 at 8:43=E2=80=AFPM Changqing Li via
lists.openembedded.org
<changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> Backport several CVE fixes from branch scarthgap, cherry picked from
> poky-contrib: stable/scarthgap-nut,  and do some changes accordingly.
>
> Ashish Sharma (1):
>   libsoup: patch CVE-2025-4476
>
> Changqing Li (17):
>   libsoup-2.4: fix CVE-2025-32907
>   libsoup-2.4: fix CVE-2025-32053
>   libsoup-2.4: fix CVE-2025-32052
>   libsoup-2.4: fix CVE-2025-32050
>   libsoup-2.4: fix CVE-2025-46421
>   libsoup-2.4: fix CVE-2025-4948
>   libsoup-2.4: fix CVE-2025-4476
>   libsoup-2.4: fix CVE-2025-2784
>   libsoup-2.4: fix do_compile failure
>   libsoup: fix CVE-2025-32907
>   libsoup: fix CVE-2025-32053
>   libsoup: fix CVE-2025-32052
>   libsoup: fix CVE-2025-32051
>   libsoup: fix CVE-2025-32050
>   libsoup: fix CVE-2025-46421
>   libsoup: fix CVE-2025-4948
>   libsoup: fix CVE-2025-2784
>
> Hitendra Prajapati (2):
>   libsoup-2.4: Fix CVE-2025-4969
>   libsoup: Fix CVE-2025-4969
>
>  .../libsoup/libsoup-2.4/CVE-2025-2784.patch   |  56 +++++
>  .../libsoup/libsoup-2.4/CVE-2025-32050.patch  |  29 +++
>  .../libsoup/libsoup-2.4/CVE-2025-32052.patch  |  32 +++
>  .../libsoup/libsoup-2.4/CVE-2025-32053.patch  |  39 ++++
>  .../libsoup/libsoup-2.4/CVE-2025-32907.patch  |  39 ++++
>  .../libsoup-2.4/CVE-2025-32910-1.patch        |  79 +------
>  .../libsoup-2.4/CVE-2025-32910-2.patch        |  60 +-----
>  .../libsoup-2.4/CVE-2025-32912-1.patch        |  20 +-
>  .../libsoup/libsoup-2.4/CVE-2025-4476.patch   |  38 ++++
>  .../libsoup/libsoup-2.4/CVE-2025-46421.patch  |  47 ++++
>  .../libsoup/libsoup-2.4/CVE-2025-4948.patch   |  38 ++++
>  .../libsoup/libsoup-2.4/CVE-2025-4969.patch   |  76 +++++++
>  .../libsoup/libsoup-2.4_2.74.2.bb             |   9 +
>  .../libsoup/libsoup/CVE-2025-2784.patch       | 137 ++++++++++++
>  .../libsoup/libsoup/CVE-2025-32050.patch      |  29 +++
>  .../libsoup/libsoup/CVE-2025-32051-1.patch    |  29 +++
>  .../libsoup/libsoup/CVE-2025-32051-2.patch    |  57 +++++
>  .../libsoup/libsoup/CVE-2025-32052.patch      |  31 +++
>  .../libsoup/libsoup/CVE-2025-32053.patch      |  40 ++++
>  .../libsoup/libsoup/CVE-2025-32907-1.patch    | 200 ++++++++++++++++++
>  .../libsoup/libsoup/CVE-2025-32907-2.patch    |  68 ++++++
>  .../libsoup/libsoup/CVE-2025-4476.patch       |  38 ++++
>  .../libsoup/libsoup/CVE-2025-46421.patch      | 139 ++++++++++++
>  .../libsoup/libsoup/CVE-2025-4948.patch       |  97 +++++++++
>  .../libsoup/libsoup/CVE-2025-4969.patch       |  76 +++++++
>  meta/recipes-support/libsoup/libsoup_3.0.7.bb |  12 ++
>  26 files changed, 1380 insertions(+), 135 deletions(-)
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-278=
4.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-320=
50.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-320=
52.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-320=
53.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-329=
07.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-447=
6.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-464=
21.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-494=
8.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-496=
9.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-2784.pa=
tch
>  create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32050.p=
atch
>  create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32051-1=
.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32051-2=
.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32052.p=
atch
>  create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32053.p=
atch
>  create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32907-1=
.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32907-2=
.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4476.pa=
tch
>  create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-46421.p=
atch
>  create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4948.pa=
tch
>  create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4969.pa=
tch
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#218553): https://lists.openembedded.org/g/openembedde=
d-core/message/218553
> Mute This Topic: https://lists.openembedded.org/mt/113619132/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

