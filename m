Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7182.1794234476291159204
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 06:27:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=l2CUq3aI;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so6111095e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 06:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794234474; x=1794839274; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VxdfT24FmDU9GjxPgWm56HZFQkXmcr2/VLONhTvHcT8=;
        b=l2CUq3aIF6alh86kYOar3UiiZhSLZCUm23QMbM64p+5rGBc6oBgZjKmT7VR34bfVya
         n+pYmYe8rV3J594F4p4qDLmKV/FdAR88a0WbmzjxYEN9blQE4K1a41w8M3UGJfVjyV4U
         9is1l6dpWAn4Lqr56oC1rNYp3EkE+zUI6eGtFqj8xLBdEcdxc5tykCQq4O7UixSZE7Lw
         zzaWV3c9/c3DBiN7sSf6qRm1cOukIDziLk7JDeveumB2iSFufNJfEi6xl1mOiiUGDRKe
         /Mw+rrV4sBpGnzOm4XpELCD1JSaKnAVt9VbVH0khwK/MYmc1LakWcBbgjChyg/QyVpTk
         DaVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234474; x=1794839274;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VxdfT24FmDU9GjxPgWm56HZFQkXmcr2/VLONhTvHcT8=;
        b=lW7pBmxgs8V2xqy15fDwopIQeOaucjQsCfWg5ahNZCBEFycF0HCRP6iVq7B2n4PBR7
         ZhdfBQHuC4xjW7lMih0fHIss5xV+QWV+abHJdxvV9mcEHH0PccxzJr006t3dijGRvP1V
         8cJfia7Z2/3+z6nPSMmQMUqc7zeMV2onpGo6rFjmp1Iw6JQvkOchKDZhdCAfzkvOzldb
         QJRSteeALOZCgq0a6zZKgaJGKUTwHQJQDsA9BUxXPmyvut5jAWEFIwUXrI4h+O1jrrD0
         Wbc11w4mvZew/4e45jbhbMEW0nBs6zDLN+J30o5TQ67dZQzPMaL97MEUyGttM5zAli2m
         t8lw==
X-Forwarded-Encrypted: i=1; AL+hErHfqy2JKWUb4/q+lFqtqkqSFcsmnoppA57lkEQ0BmlBeKc/YzECWIyfZebDJTnd0ukacGuJutHC1P+sG7Etef8phg==@lists.openembedded.org
X-Gm-Message-State: APuU4Z8pIJo+MVhBnUPgfv+kaRSXQe+yaWVed7aVh0rSvem9EOBBT0Y0
	PMHNzliwj/RareRJhxR38ukU3NMFs6tcxroRRfWIjVc176ie9s1AFl8LDrBNZ2lv5W8=
X-Gm-Gg: AYBFou1KC5RV4di78ezKtAoTT0eJ8gavrB9yY2wIBNgRooezKIsDg7Axqjv+f94YRc0
	193r1n+YWg4v58BubNLYaXKZwAQj8sm901TCM0uDiVS4ZogmjQAHouvIHm7mG2fv0S1igAgYQCz
	SqG/tFXMWEOGeIAwmOq122W0KXbWQC8xSIBU3rg8/25fntKEwi3T1LJACqzrOL4xgswnoC7Z/Mq
	ZrzWEIoNWdKofQ6OnSKp9RFkxudIp94tru4XiBV5rAAtf3pqUYrpMjwSy+li0+gChRpaMJHkQRF
	niDQdgnXXOr6gfMNAvstXS+5FbFo7yjH+ntA7NZWIGKM+UWPx/qKh7u9+3FdkLaSWbnikNpvRgc
	coW1AN9UTwGBLkVnhMqC0xxXFq/414DXXOyoaq1GVzWL5HPLMVmHuGYjRjawoDLqgH+lov0JjyX
	TR2QWvX08DkOVDzPJdAvlan7IkYO7mOMhu/u6toRbQuIuClRkJtyxmK+fS1flND9MYkgmF6p41C
	7Gu0UyesAeDXry0N/n0U70/fOccVZtB4jVplQTmDDLq+J30iYT/d18PkEZTAoRPHT7Refak1OSB
	KUDT3hJtuVgmz93+rUCAzW5lVefOrZ3GOi9aS9+jGTdIipV6FZJka4ewldpJmnMQdfwaDmXsOkP
	neg2mNa3TyuctsQ==
X-Received: by 2002:a05:600c:3e11:b0:4a1:acaa:9d4c with SMTP id 5b1f17b1804b1-4b963c95365mr80608415e9.25.1794234474390;
        Mon, 09 Nov 2026 06:27:54 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee1ddc7sm196893165e9.4.2026.11.09.06.27.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:27:53 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 15:27:53 +0100
Message-Id: <DMQR1E6DTFI3.34X53FQPVC3FK@smile.fr>
To: <hthakar@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][blacksail][PATCH ] openssh: Upgrade 10.5p1 -> 10.6p1
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20261105042209.1168511-1-hthakar@cisco.com>
In-Reply-To: <20261105042209.1168511-1-hthakar@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 14:28:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249850

On Thu Nov 5, 2026 at 5:22 AM CET, Hetvi Thakar -X (hthakar - E INFOCHIPS P=
RIVATE LIMITED at Cisco) via openembedded-core wrote:
> From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

Hello,

> Release Notes: https://www.openssh.org/txt/release-10.6
>
> CompareLog: https://github.com/openssh/openssh-portable/compare/V_10_5_P1=
...V_10_6_P1

Those links contains:
* New warnings emited
* "Potentially-incompatible changes"
* "New Features"

Per stable policy[0], I can't accept it, sorry.

[0]: https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stab=
le-lts-patch-acceptance-policies

Regards,
--=20
Yoann Congal
Smile ECS

