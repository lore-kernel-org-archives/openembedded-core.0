Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B5D0C369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 11:25:17 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.6301.1744889112213342168
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 04:25:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q9koJi1a;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso4471485e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 04:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744889111; x=1745493911; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wDZ2uslurh42Jh9ofC0DWc9UE8SIRbxVvxTdRKQ+KcY=;
        b=Q9koJi1auqYgvlCwB22DnB8SQbC5zMya8u2CB5rJf6oIt+KCxOlZh2tkxEe4roCyxb
         CCaCI/pnF+WOnPE7fA+z3g9MOjLAJcsrmADFQJIgi7wyp9suNNiILTwTE/INeI0OGPJ/
         5Ki+P1vTHxYBY5h/d+DjuiDCqaYccO7ajm//NHQiw0nZSEFu895GRVIpycmJlfNZMyby
         k/6OxwjKi4+kHLaftc5MTiaUHHBKNVSCE52ocBZQFLWQ5jnC8xRrBtO3vzwfMQkt16b0
         7Q+nVlm17NzxrnwzjIoxkFeBGljxChu2tYqe1L24CWCDBlrdCCXTa2zQHslpdA40BtKW
         3Rgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744889111; x=1745493911;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wDZ2uslurh42Jh9ofC0DWc9UE8SIRbxVvxTdRKQ+KcY=;
        b=NKRcH1oySxbLxQe3lTw9ecUqT4Txmj9vke4RZDPN3Y2gWDWJvWBV2Xv6Zyn9ZOEr6L
         v74+oFevsmClHsniwtEKzwVaIfGHbc4/R0B+B1sgp7AwLP9rc9yUeiHeQvObjdmxOf1/
         aAQSI2bZSpCrNFQTrIIIj1qRQAIemUAeDL3pXZcJaNDl/yY2i2dJ4Iy2l9f0VVZA1idI
         WbCYvVX5ZXIJQRSII3me68pg6isoow0kZZqTYN9OuvdDqH+/jD8iI+nWpQywg7A8uRuk
         kShiNxsCHQqbIni8roHNfBnJvqbkF522EETUGvb2gkUtj18h+kUxIwRDQjX2Otwuxqcw
         ahQg==
X-Gm-Message-State: AOJu0YzL8434wmFe7ebGIirGkM4RjyF54W/Ux9bHBq4UoG6X+fdiYrvK
	JXLz7V3uX82py7hlLwUtxxaG/YK3dgT5oY0SF4vHIYsAGWm4i6q/X4k94sVP
X-Gm-Gg: ASbGncuBDaWIi5pc/V0bGfu0KDDnm2nuWHnkUXG3p17ATxKJeY4VWeYUYFzZg6qefiH
	gvMWP2foFVACFRcoZvbL5ko5d3GRcNfZpDwDaKF/N0W8nbfNFKOQ+dwywxRbuTI7ba+2aIoz0Rp
	c7QXsoM+Pl5L/jM34GkrkAVBZEkdkpAVFbROxmoGGmy5MwRmLtq/vTvf52oluF393ARlEu5VQpf
	g0kdxNSRmIZ++uGRJpOLESTkCI+EdpD+jz9UquMK3dzETwI5wX7eAXGdNxOc/NpnhoUw5mOgxjE
	gykb53cyB3WwmLo3LWZ2O/mRWBiiUZeuGedRf+5Xhb0QyxZp
X-Google-Smtp-Source: AGHT+IEBkHS/g98lex1lIaSYdO/tsbmTQxfh3GfjlX2T/a4aE4CFfIy8vUEa8714HeakhHe64/wLlA==
X-Received: by 2002:a05:600c:4e4c:b0:43b:bb72:1dce with SMTP id 5b1f17b1804b1-440634ae300mr24193715e9.5.1744889110555;
        Thu, 17 Apr 2025 04:25:10 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4c8216sm50681375e9.7.2025.04.17.04.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 04:25:10 -0700 (PDT)
Message-ID: <a4e0b8b0-95f6-413d-8f98-f750611b6e61@gmail.com>
Date: Thu, 17 Apr 2025 13:25:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][scarthgap][PATCH v2 1/5] libsoup: Fix CVE-2025-32910
To: Vijay Anusuri <vanusuri@mvista.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250417104258.64180-1-vanusuri@mvista.com>
 <5d660e04-3839-4af3-a2d3-398e199448bb@gmail.com>
 <CANQUz19f9DEyCkbHkaGk4wbeX2OaRMdx3AqcVAiE=uaT+jWCGQ@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CANQUz19f9DEyCkbHkaGk4wbeX2OaRMdx3AqcVAiE=uaT+jWCGQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 11:25:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215071

Your reply makes me wonder if my feedback from yesterday reached you:
https://lists.openembedded.org/g/openembedded-core/message/214981 -
don't know if you disagree with it, or maybe you just haven't seen it.

On 4/17/25 13:21, Vijay Anusuri wrote:
> I have renamed one of the patches in the v2 patch.
>
> Thanks & Regards,
> Vijay
>
>
> On Thu, Apr 17, 2025 at 4:45 PM Gyorgy Sarvari <skandigraun@gmail.com>
> wrote:
>
>     This seems to be identical to v1.
>
>     On 4/17/25 12:42, Vijay Anusuri via lists.openembedded.org
>     <http://lists.openembedded.org> wrote:
>     > From: Vijay Anusuri <vanusuri@mvista.com>
>     >
>     > Upstream-Status: Backport from
>     https://gitlab.gnome.org/GNOME/libsoup/-/commit/ea16eeacb052e423eb5c3b0b705e5eab34b13832
>     >
>     > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>     > ---
>     >  .../libsoup-3.4.4/CVE-2025-32910.patch        | 27
>     +++++++++++++++++++
>     >  meta/recipes-support/libsoup/libsoup_3.4.4.bb
>     <http://libsoup_3.4.4.bb> |  1 +
>     >  2 files changed, 28 insertions(+)
>     >  create mode 100644
>     meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910.patch
>     >
>     > diff --git
>     a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910.patch
>     b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910.patch
>     > new file mode 100644
>     > index 0000000000..32e0c86e62
>     > --- /dev/null
>     > +++
>     b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910.patch
>     > @@ -0,0 +1,27 @@
>     > +From ea16eeacb052e423eb5c3b0b705e5eab34b13832 Mon Sep 17
>     00:00:00 2001
>     > +From: Patrick Griffis <pgriffis@igalia.com>
>     > +Date: Fri, 27 Dec 2024 13:52:52 -0600
>     > +Subject: [PATCH] auth-digest: Fix leak
>     > +
>     > +Upstream-Status: Backport
>     [https://gitlab.gnome.org/GNOME/libsoup/-/commit/ea16eeacb052e423eb5c3b0b705e5eab34b13832]
>     > +CVE: CVE-2025-32910
>     > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>     > +---
>     > + libsoup/auth/soup-auth-digest.c | 1 +
>     > + 1 file changed, 1 insertion(+)
>     > +
>     > +diff --git a/libsoup/auth/soup-auth-digest.c
>     b/libsoup/auth/soup-auth-digest.c
>     > +index 350bfde6..9eb7fa0e 100644
>     > +--- a/libsoup/auth/soup-auth-digest.c
>     > ++++ b/libsoup/auth/soup-auth-digest.c
>     > +@@ -72,6 +72,7 @@ soup_auth_digest_finalize (GObject *object)
>     > +     g_free (priv->nonce);
>     > +     g_free (priv->domain);
>     > +     g_free (priv->cnonce);
>     > ++        g_free (priv->opaque);
>     > +
>     > +     memset (priv->hex_urp, 0, sizeof (priv->hex_urp));
>     > +     memset (priv->hex_a1, 0, sizeof (priv->hex_a1));
>     > +--
>     > +GitLab
>     > +
>     > diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
>     <http://libsoup_3.4.4.bb>
>     b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
>     <http://libsoup_3.4.4.bb>
>     > index b2e32b892a..757e6432f7 100644
>     > --- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
>     <http://libsoup_3.4.4.bb>
>     > +++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
>     <http://libsoup_3.4.4.bb>
>     > @@ -18,6 +18,7 @@ SRC_URI =
>     "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
>     >             file://CVE-2024-52531-1.patch \
>     >             file://CVE-2024-52531-2.patch \
>     >             file://CVE-2024-52531-3.patch \
>     > +           file://CVE-2025-32910.patch \
>     >            "
>     >  SRC_URI[sha256sum] =
>     "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
>     > 
>     >
>     > -=-=-=-=-=-=-=-=-=-=-=-
>     > Links: You receive all messages sent to this group.
>     > View/Reply Online (#215059):
>     https://lists.openembedded.org/g/openembedded-core/message/215059
>     > Mute This Topic: https://lists.openembedded.org/mt/112311177/6084445
>     > Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     > Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     [skandigraun@gmail.com]
>     > -=-=-=-=-=-=-=-=-=-=-=-
>     >
>

