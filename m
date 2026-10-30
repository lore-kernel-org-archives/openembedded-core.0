Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17896.1793383550971702487
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 11:05:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=AS7OQDyv;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so8541635e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 11:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793383549; x=1793988349; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/vkDFjoAdycWLKfk2EQLwAZ0ti6xEpoVGoF6fA+UW38=;
        b=AS7OQDyvzubrVn9KDocLWu4xhmf4mZItcoYY1FBaOvsw5br7uYLPdeQtPFacpgjR62
         cW9d1Nz2H7y0r4M1K0oN7MhYrInmIG+S1+1JKnhJGq36524NWX0ExMKgsZswe7h1qN1q
         1XNuOJph2eaf4lFvlIyG8gjtQP1fStp7mGG9khln8h7xpFEOH0K2DH5YOCX1VqFHrs2/
         OzeESz8IjmE01lX/sE1KQZFM+an/742SNLw5AKQvViYJnHqd2ioSZuSmPksnlUSvS4O1
         5r/GTcgX+7rPpgSxY/8v1h1N0vn2eNMqsd73YVeleH4bISJzkoYQalYBXR46A9mg3cAl
         yp6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793383549; x=1793988349;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/vkDFjoAdycWLKfk2EQLwAZ0ti6xEpoVGoF6fA+UW38=;
        b=yQ1xziG3uFvbgbOKju2CBvlLD50rvDHcUmiuBRcFpGQmsob4t5jTOea6pNKrpzNuOB
         UOdv4uOkROO4+E2tchFhbyhw0yGfH5FtsjwpEYcZEcPFneh0trnW8Lmx44+N1LBQ13ju
         k2bXifgu4IUh/Nnhhvm+s1Cf3CxptTyEzuSVQaePENNleg4N/jMcRGaDpc3gmCcg5XkN
         MJleZZIFxKH0y7w1GGyZxsld5XtrKopEs7vZqiy+AJS9BGXcgEpnLmSpa9MAPBVso8pV
         MMwP6vZK9QyMQOBlm1FjlxKrzPU9irDjWad4w9RVZEToWZ6tzihtFazax4I6TZa8bYjL
         pmkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlgi7nz2j3ff3hLFie5wEuULSWvbqdgyXW8OP8bnUJR7mw5dsgAdt2YlPXhCdKrzkeUGatod6ccL/uBJHBKm1EHQ==@lists.openembedded.org
X-Gm-Message-State: AFq9FYIvi9RN2OZApxwRGWYTspgTHKmDx/8RZOk2N91keKvnQZEmXI0V
	w/P+7uSWwWu2MxCoJ7m0Utb+1fvR0DnFFlYCZg1wqGlIrQNp9ferYRcomoLXS596X1Y=
X-Gm-Gg: AYBFou2b3W9OaRdxo7n2AuxGOG/SFdXGyPA7cqHtSOnvWeccR/eU7fkSaWVPK22d36d
	S/5ZA/L1VAorvyTNQCbzsFDpY5kpQ8aa0vVuWSgg8lN/QkVZj5oeTPBi/0PLdC2JggmXJbLHl+1
	yvTHhjipsZqybMfQe/z6oQh0yAZPS/5TtyO95RpzvbqEXWda+jsD8hJLTb2/Y9Yv6IJwwmQUoQ3
	dmzyDqZny9JqL8TXo6CzxmJR3LgtnMEDMTxa3Z7AgZabY/s0NFVnXEskR/quscyCSqLD8vUzsb7
	u6PV+a48nVf5DWmUr0fN44K3CyK4aUTULv1ZleV0mdlzWNTJBkRN5kI1gloFmQXJzarD7HvI1de
	CSr/sCVYlID7Q+XbBT2YmOuauf+ixUsBim/ouSfcxS85BVArf8+t1KNrbs/3Zp66x45+yfgAtKI
	bPviJf2B+KC0tUCZhWDL91I1ya/nvpwVFdMVJXPVOwQ0rvia5yNw76SQ/vgiRdoD16/ePZ5fUXQ
	d+h3Q/CVf+1TY85Je2u+89a8oi7tmdAeu1BU584cGbOP0p5mgMxProfgzqC+kku+WFwLmtNkPJ3
	vFEtwxNFqaiUrFiX77IGC3By9UJ82MvNDTgNN84GwJAcyDG5U1afnwOVn+H16zrXeBrybujlJ/S
	aOGuxq60WgjSDEPR7t1deV/0yumcaZK0nfE8bUg==
X-Received: by 2002:a05:600d:e:b0:4ad:181a:4350 with SMTP id 5b1f17b1804b1-4ad181a44a0mr17615005e9.21.1793383549109;
        Fri, 30 Oct 2026 11:05:49 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf6c76507sm78907425e9.10.2026.10.30.11.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 11:05:48 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Oct 2026 19:05:48 +0100
Message-Id: <DMIDESIPEIRY.EBQY59ECLXD1@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH v4 1/5] apr-util: Fix CVE-2025-49506
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>
To: <hthakar@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261029101127.2240608-1-hthakar@cisco.com>
In-Reply-To: <20261029101127.2240608-1-hthakar@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 18:05:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249065

On Thu Oct 29, 2026 at 11:11 AM CET, Hetvi Thakar -X (hthakar - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Hetvi Thakar <hthakar@cisco.com>
>
> Backport the upstream timing-safe comparison fix [1].
> APR-util 1.6.4 identifies this issue as fixed [2].
>
> [1] https://github.com/apache/apr-util/commit/f77a20761cb15686f8d4de5b5ea=
fc534ae24b19e
>
> [2] https://nvd.nist.gov/vuln/detail/CVE-2025-49506
>
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> ---
> Changes in v4:
> - Drop the XLC-specific compatibility follow-up patch,
>   as it is not required by OE-Core's GCC/Clang toolchains.
> - removed other patch entries from SRC_URI
> ---
>  .../apr/apr-util/CVE-2025-49506.patch         | 310 ++++++++++++++++++
>  meta/recipes-support/apr/apr-util_1.6.3.bb    |   1 +
>  2 files changed, 311 insertions(+)
>  create mode 100644 meta/recipes-support/apr/apr-util/CVE-2025-49506.patc=
h

Hello,

I took the patches of this series into the review cycle.

Those patches are from 1.6.4. Have thought about upgrading to 1.6.5
instead? APR seems to have a nice stable policy but their git commits
are not easy to grok.
Can you look into the commit history to see if there is anything there
preventing us from upgrading?

Thanks!
--=20
Yoann Congal
Smile ECS

