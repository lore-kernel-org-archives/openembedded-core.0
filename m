Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18117.1793384059057029569
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 11:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=XAdkjmcT;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49d05d51553so6549665e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 11:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793384057; x=1793988857; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ZXZKDhLl73HM8wcVYpzy8cr3kwS2ROHbtHJ6fqstwY=;
        b=XAdkjmcT1ndKtAtXMVsiUfQ/g6KDnX3q7f+ejDKI570yvc0S9iOe0Sn9F57UIwLPCT
         SZ7pCbu+Fhy/VnnSugPcbPrm4Y/vE9da1NyLkHs/UDrYjJcpx2bO4lTRE81fzZISbzhx
         nZXduV4R9StCcmbs9pE2kFUQ1lMo92dTYOiWBQV31bzTQwJcgUyqZQf93XCgxbhgX+ga
         SCDYihUZ3aKtiEU5KH4928QDfCIgw80JFLE74q7xbKwZhzHkI7oV0I4TT/BWodksSLaG
         ZlZBHVmFD/ERdMVZKwcIoplFb6TfPlMdCYlpI23jGUi0ww8X42CKqJjLTeIYw2cFInQs
         KOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793384057; x=1793988857;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ZXZKDhLl73HM8wcVYpzy8cr3kwS2ROHbtHJ6fqstwY=;
        b=x7YY8vo+xIS0AzHCk4Gkl1HhSgW/UFDKGqRHnuDJo+3u58vQGocgat7q2i5gfnFR78
         nrMPk9fj+ZwbVSGd1zYpC5I6lobPTf0RsW/f09/iZbF8w9+pzD3LNbWS+cGYExYR018m
         5jGrd7qw/hUByiBJy3HqyeMpthW9FTNIDm/Mo7juWJ1pNtxKiVDqn5TLGBlKOdGj6eyr
         XCJaQAxB9/HB6BG4avso2KZP8/lPZ4u/k8EZPLwGMr9z9c1Oy4YDwfKtNEGCQ5GAQuzE
         PG7jsoRSucMfO5wa0iRiLyeNBmWwvGhJ4z5pOs4/VL4xdGbuxAKI+iZBR3/xJgflr8o1
         Ulmg==
X-Forwarded-Encrypted: i=1; AKwUvBxkTxDmrNwb/BlVO3ZDkblE2GMZJ5Qs0+LXNtLjOnAaGEb72YznIuab0ex+fKjvwBSXTLZg0Is6PkYiSLwwBB02Vw==@lists.openembedded.org
X-Gm-Message-State: AFq9FYLb8IQlIv0I5cRRgp+keQjEWy4MU6bMCKyKDin15cQf4a5X0jxB
	Wkd9x/Yy4BIsRUjhH/GXZqpZFNKYOJjTEa8WTxWGjYOS/YeVgZKTlQA6bTCixRfPMU9KX5loN4b
	e/RyZAIU=
X-Gm-Gg: AYBFou3BVBUdZtD5X0lmsiGa4CzU80IFD5JewjBXnshQGJK/J8khcJ8dExOpyy4n5vi
	HedXd9YMughOAWMBH9v6NefWmOmWf7yL6Q6j7OxVQUW656Th7cX21JynaKYA0oDLobkWxNMgHSq
	aQDhj7GlSEPgbFJQ+shnb1NQBoAwi/H3gFNmXw/qRPT/7WLISIUmz2uJP+pqAFR70vmYmZ5tHaj
	oYVPJJrCNvvO1SGwJbUVGIuNFGcpn8eVsHIZPHIvn+aTcqXJj1d4rGrGjDsjtIcClJSr0eOKdob
	XK7dV+jPN+vKSb0MhYueaQ2YcGOlFtD7PcM6FJrN+aRpotNAu05eg3LjAH0JHNfYguoHtG7xegO
	Swy+aN7VkRuWbyj57ow+CmyKL3qcD0bkOgOP0PCLub8jmWCqm7ZJAvjiq+IDTa2x8BL519ItO+p
	kgYoY8gHLk5lY2QS7bgQavPHFX38mNWyZPFgRUthlGVrHqjIEDqbZq5Zh8lq1nzRqkTvWB+7VMw
	tPLDKQeGQOdAlb7sXMQs60W6N/fq7kW9lgEm35QPTuw/CWMcLrsrAD/CbsVBJ+EDYAryD++w2WP
	GagdtxqdS9YolwvD6gdW4pXbOOe74P4ZvMcH7mtafVKk7ctck2HrBrc6Awa4o4zIBhoWEJ9u+Wg
	9qY+0XKlwV1Hu9b/b
X-Received: by 2002:a05:600c:3f14:b0:4a3:59ee:86b with SMTP id 5b1f17b1804b1-4ac14ec873emr68869415e9.4.1793384057158;
        Fri, 30 Oct 2026 11:14:17 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80ecbsm4627078f8f.35.2026.10.30.11.14.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 11:14:16 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Oct 2026 19:14:16 +0100
Message-Id: <DMIDL9WPJ77U.C0WBAFUQBDSV@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] libsoup-2.4: fix CVE-2026-1467
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <jason.stasiak@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260831211324.635049-1-jason.stasiak@garmin.com>
In-Reply-To: <20260831211324.635049-1-jason.stasiak@garmin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 18:14:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249066

On Mon Aug 31, 2026 at 11:13 PM CEST, Jason Stasiak via lists.openembedded.=
org wrote:
> From: Jason Stasiak <jason.stasiak@gmail.com>
>
> Backport fix for CVE-2026-1467 from meta-oe to OE-core.
> Update CVE patch to address a use case where a uri validation
> failure was not handled.
>
> (From meta-oe rev: 07d67228162018f5f619dce7183f85e79293378d)
>
> Signed-off-by: Jason Stasiak <jason.stasiak@gmail.com>
> ---
>  .../libsoup/libsoup-2.4/CVE-2026-1467.patch   | 276 ++++++++++++++++++
>  .../libsoup/libsoup-2.4_2.74.3.bb             |   1 +
>  2 files changed, 277 insertions(+)
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-146=
7.patch

Hello,

Sorry I took so much time answering this one. It has some non-trivial
changes from upstream and I pushed its review "for later" for 2 months
now :-/

Since you have another series on libsoup-2.4[0], can you merge this CVE fix
into its next version? ... and also applying the same review as the
series:
* metadata preservation (authorship, subject, ...)
* diff minimisation from upstream patch

[0]: https://lore.kernel.org/all/20261014161209.2227316-1-jason.stasiak@gar=
min.com/

Thanks!
--=20
Yoann Congal
Smile ECS

