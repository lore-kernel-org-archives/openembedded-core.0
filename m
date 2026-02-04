Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E28A7E9D41B
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 17:07:08 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25706.1770224821214237728
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 09:07:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1PTbo7OZ;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4806bf03573so83495e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 09:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770224819; x=1770829619; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/qs/XafomaX6WGOgvm/9JjJqggrIJ1MkMoVwRX2FPF0=;
        b=1PTbo7OZKaXmlVCA0xRtzEP+Gf2ZwztseKcu6xmQbyA1X5Onf9cXWFBY71LImvyRc5
         haTK+MuuM3r9tCU9RIXS2qBwJBqTAEY95EI+iTp1IeB1wjXCHsML4gkr70FHDPcTdDCP
         wfBvzYuioFOwSaxCZf6OZ9f3v+Z6LOTb6TtE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770224819; x=1770829619;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/qs/XafomaX6WGOgvm/9JjJqggrIJ1MkMoVwRX2FPF0=;
        b=Gz63dl/btIVFroqCx8sTrFvX/V/qcem1VWbtxheFEGkgSD1XaTJcfxIhwt8aXwXPZH
         C52B2NS1rE5RVHFUaVNzcxmrP4nCGJAzAc8cCYHB78XGq+sZypUr+7YssLp6VImxmXan
         pWBW4n8onNCQzzI4nfiy5esU8psZ9Zl3kH9XKZl0wCDRBlJmujwL7OsXtqVfRG2w7nUB
         CYuERS8VEAwSBPHj6/ZPCD1WEakU5X3tMiy/23UzhxkG2M2/sGb3ANJ2xcChbNk/v8Y1
         hK5+igOcrAV+7XsrFD0DCa+E3ozX9ORRN+8ApihH+VmFUXzJmzTuYloOCBtxeclFtQWm
         zBaw==
X-Forwarded-Encrypted: i=1; AJvYcCXqUzgcv4vyOjhAoTEi+Ma5wNJfUYkuhuaBwO7y325XtnFq395ujKNQMNKHLMlb3JEShq0N49dQcKlrBs6qPyYrng==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx/sfKzt0yEEVgL2V+GFrDJFzFtYb1vJEQsIozeMsnGbxkwDJdG
	RL/BQpI54exNpXC+btxfGTTK5Ow1mZfuY9VXNIMGYzrXCGKGWyYdpq1mE3QNgNEmkLg=
X-Gm-Gg: AZuq6aISA5Ss4r4YiKUSINQkOlL7W/pVFwFe/+8SzX+yRNKG5AygDzK5tH/Mbk/GW6G
	rPzIM1y7lyghr1u1qOllTtAn+v1P+GygeWbKPYNhXtpnFwjeE738qLgpN12sVhG6RFebKsRiI6J
	k/MsSYe9cnIlVyZLPop39MBs4fWNrDrfLqPpMX75B3teCmy7qWLO35BSAEVnmmROo6szVaOvvZx
	5fEjOgyYOoJYW8l97NfjiKrmRJl+vVAH7EKLVLZMm/NpKKLU18Vz74viw+XSZCFz2h7ZHfDRFfi
	vvYOzNXr6L0OYt8dB/hG6N5i9HC/m83/wLSo5ovlxdboWey205BH5btLHimcuaHBXsh0K6zIptD
	A2xRkYswp7txv0ssoRN7sfGB77wrmqhd9xrom9WrBqftbKDbE4lWaEgWRS/0DUwM3a0TbJpPkAC
	g02JMn3qDJ2Pzr9NI5ZVWQ5itBNCsnAhJGKBF+Bh42X/tytPuw8EI5SgNYTomtW5Wu2tLH7ysTW
	K1BkClT8EMrkQ==
X-Received: by 2002:a05:600c:46d2:b0:483:885:f0b0 with SMTP id 5b1f17b1804b1-4830e99d428mr52357285e9.35.1770224819536;
        Wed, 04 Feb 2026 09:06:59 -0800 (PST)
Received: from localhost (2a01cb001331aa0002b8d20d4b496413.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:2b8:d20d:4b49:6413])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483108e3ed5sm44366315e9.5.2026.02.04.09.06.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 09:06:58 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Feb 2026 18:06:58 +0100
Message-Id: <DG6CBQSIDEHE.1FVOVPUAFWFE5@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] openssl: fix CVE-2025-69419
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260202123511.540058-1-hprajapati@mvista.com>
In-Reply-To: <20260202123511.540058-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 17:07:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230553

On Mon Feb 2, 2026 at 1:35 PM CET, Hitendra Prajapati via lists.openembedde=
d.org wrote:
> Upstream-Status: Backport from https://github.com/openssl/openssl/commit/=
41be0f216404f14457bbf3b9cc488dba60b49296
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../openssl/openssl/CVE-2025-69419.patch      | 61 +++++++++++++++++++
>  .../openssl/openssl_3.2.6.bb                  |  1 +
>  2 files changed, 62 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2025-69=
419.patch

Hello,

Thanks for the patch.

(Same as CVE-2025-15467)
As far as I can tell, CVE-2025-69419 does also impact whinlatter. Can you
send a fix there (either by then backport or maybe an upgrade?)

Thanks!

--=20
Yoann Congal
Smile ECS


