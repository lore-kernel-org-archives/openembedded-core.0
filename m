Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F395C43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 15:23:17 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.95544.1783092187364268532
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 08:23:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=a978qCmf;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4728c12ba97so425826f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 08:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783092185; x=1783696985; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jtwd5etqjlEgcCIYCp7EjRWKm+YfT9iXD1SWXmn5oX0=;
        b=a978qCmfQuwnux85ALLmv4xY3s+u4xpiG3L08n/LU4KXdaTfbmKOxlGg/x0n9suFBd
         y8IPPSQTbePNHU896DAXyqvztD2nmTQXX9JmkOjGYAQd0OogreeMu20u543cjUqjc4Qi
         GLhF8HHb0c1O1BuBZ6wFjdAXdIPOImOqDZbRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783092185; x=1783696985;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jtwd5etqjlEgcCIYCp7EjRWKm+YfT9iXD1SWXmn5oX0=;
        b=ECpCVF0bCYJyZRLJmydWmaVWqAAtcnrIJi/8D4qCcCOAjt27z41YQOXPjAGz2kLbR7
         4++vMxVwHnGV1032upT8ww9IavFceyX3EFsquIEGLiD91Ljeu72fId1nII4d4RuCJ7wc
         X8dWrrJAfMaXvZXQXbUctyMENBXd9ML7go1eCd12JnJ4fzEMgYr0v9I2QA7v9shBtkrt
         pSAmfLZeyBgcDpjVxITC1Ee8QFY9TV19lTOvPtIkPbxAr1tZ6qSTd+sHYkdp7NSDdXgp
         I61sbQovwEKRB5O/Ar6FSnRrAJ2iOxFlt9SScxh93VYGlFBoKc8FUXYbvg8ow6b9k13R
         0P6Q==
X-Forwarded-Encrypted: i=1; AHgh+RrHsCymXtjdTeUcfOHr/lDCedSS1RRUBl8B2YS7cLwLda54g+wotX7qjC32/pjWPXCK1N8/j/l2aZNOVynX+q6xGQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwtCABxHz3+7Lc/B6yRcvy6wL+lAgTjML1Ap9jl0BuXYXLHCM/P
	AUljh+sgWoS77Sle4sRfYyrHZOtTG/ENYHssGDxtnp0a2/NvWeH5OO7ZeX6rvsJSxBM=
X-Gm-Gg: AfdE7cm8c1MahqncJnL48DzhQRV9Q4EqRy/i44lDA5mrM0g+OQHVUfuNi9ouNVF+7gL
	PAz359Z5mVPl7nOAwKpWJUbubl1ULRznk+QZ5W2ocOIwPmGDJNQMYYK0UmRuj3+qBeXAkLuPtLa
	tbKmoq90pxkHm+GcZCNKWATZ1iFxzfPiW2Fmh+XH7YgiSPudvOyWdOX9SZgjZXWaKw4GPFcuLH4
	ZtVx4Hx3UnwPvrcgr8mB1HkU83ChyOGbH8Uv39Ez41dJ5KmcSWbztO1pZH8AtEOwzTgK0PcqJR+
	OkLJzoKPdHTLZ8EvPsXJ0jptXqUeQDwXFFoPURDUyCueeeJEKyLr3mNkx9kPktxFJ+SvfJxhDyA
	iEew4VfKfjuZpwiLvSDjo7w1gnzBOIwAsEkKUEnsVW5ZtFycKh2ZPCqdam6cFd2XC7MDAO3hmJg
	Ir8OnXGYSUy23VYsurqQ5zS1V+H+w0McuONXvRWC+yxKoI85Cz+3dMfVfE6bMKOG8o0EsRA664j
	pLI/Q==
X-Received: by 2002:a05:6000:240c:b0:470:80f7:9ef with SMTP id ffacd0b85a97d-47757798035mr15995439f8f.19.1783092185515;
        Fri, 03 Jul 2026 08:23:05 -0700 (PDT)
Received: from localhost (2a01cb001331aa0075403fb2c9c4e210.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:7540:3fb2:c9c4:e210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a558easm41850f8f.27.2026.07.03.08.23.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 08:23:05 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Jul 2026 17:23:04 +0200
Message-Id: <DJP1FDCSTP9C.3K8GUNLT3UJI9@smile.fr>
Subject: Re: [OE-core][wrynose][patch] gnutls: upgrade 3.8.12 -> 3.8.13
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Peter Marko" <peter.marko@siemens.com>, "Mathieu Dubois-Briand"
 <mathieu.dubois-briand@bootlin.com>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>
To: "Yoann Congal" <yoann.congal@smile.fr>, <vanusuri@mvista.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260629071648.1471849-1-vanusuri@mvista.com>
 <DJP1C6225M38.16SJEUGB4RO02@smile.fr>
In-Reply-To: <DJP1C6225M38.16SJEUGB4RO02@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 15:23:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240124

On Fri Jul 3, 2026 at 5:18 PM CEST, Yoann Congal wrote:
> On Mon Jun 29, 2026 at 9:16 AM CEST, Vijay Anusuri via lists.openembedded=
.org wrote:
>> From: Peter Marko <peter.marko@siemens.com>
>>
>> Solves CVE-2026-33846, CVE-2026-42009, CVE-2026-33845, CVE-2026-42010,
>> CVE-2026-3833, CVE-2026-42011, CVE-2026-42012, CVE-2026-42013,
>> CVE-2026-42014, CVE-2026-5260, CVE-2026-42015, CVE-2026-3832 and
>> CVE-2026-5419.
>>
>> Release notes: [1]
>>
>> Rebase patches and drop patch included in this release.
>> Add patches to fix linking with musl libc.
>> Increase memory needed to successfully run test key-openssl.
>> Drop code for previous release tarball problem.
>>
>> [1] https://github.com/gnutls/gnutls/blob/3.8.13/NEWS
>>
>> Signed-off-by: Peter Marko <peter.marko@siemens.com>
>> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> (cherry picked from commit 1193b0778a0f81bd75f7ec6f8f44fa44cf4b8f5e)
>> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> ---
> Hello Vijay,
>
> Sorry but the linked changelog lists new features and evolution not
> limited to bugfixes:
>> ** libgnutls: Allow fetching object type metadata for PKCS#11 keys
>>    A new library function, gnutls_pkcs11_obj_get_pk_algorithm,
>>    has been added to check the public key algorithms of PKCS#11 key obje=
cts.
>>    Object types other than CKO_PRIVATE_KEY are currently not supported.
>>    Contributed by Ghadi Elie Rahme (!2074).
>>
>> ** API and ABI modifications:
>> gnutls_hpke_kem_t: New enum
>> gnutls_hpke_kdf_t: New enum
>> gnutls_hpke_aead_t: New enum
>> gnutls_hpke_mode_t: New enum
>> gnutls_hpke_role_t: New enum
>> gnutls_hpke_context_st: New context structure
>> gnutls_hpke_init: New function
>> gnutls_hpke_deinit: New function
>> gnutls_hpke_encap: New function
>> gnutls_hpke_seal: New function
>> gnutls_hpke_decap: New function
>> gnutls_hpke_open: New function
>> gnutls_hpke_derive_keypair: New function
>> gnutls_hpke_export: New function
>> gnutls_pkcs11_obj_get_pk_algorithm: New function
>
> Thus, this upgrade is not acceptable on the stable branch, sorry.
>
> Regards,

And also, FYI, this upgrade was requested (and rejected) before:
https://lore.kernel.org/all/20260603074613.2846839-1-haixiao.yan.cn@windriv=
er.com/

Regards,
--=20
Yoann Congal
Smile ECS


