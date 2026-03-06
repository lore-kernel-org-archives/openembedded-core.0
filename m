Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B3BFFCC061
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 18:52:47 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2123.1772823162641832456
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 10:52:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FkEM+tZM;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48529c325f0so4563185e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 10:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772823161; x=1773427961; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0XdvE4bviy3/h8mbx82B4aMsl1ObLhm64VyYqkeGZ0=;
        b=FkEM+tZMLNrp9NWKhucqXATej9UzBFbwxYFX+/c7TNYFYzFBLT30638+gCH21HdD9d
         EsNNdBp4Bx1Ro8TScwtl/nf6v47ljXyUfn+UEeQi9sFZhH762iIdTfKr4UsCZsg5Zz8u
         U1tPEMlqHCkKWVgGMtHpnklFspQOcplWCV3OY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772823161; x=1773427961;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v0XdvE4bviy3/h8mbx82B4aMsl1ObLhm64VyYqkeGZ0=;
        b=ZgnOXXFdeuUjw5ZuB2ufeyylAcdscm4DQzYpj4aWvmX0g2GErvcw0Qva6HmzYoY66o
         ZSittC2EcML4C2sDGJ5dYv96GCcoBrI+9ZtGTx/32ZpPyE0ouIluJJMv8VxlzN0BV5ic
         FAJCSpOtYqFLHGmt2YbFusccM0En48mYVRzGc97xWuVu2aNYcREmBq08412QnTcVjPTR
         8xqeFeBJqurpyp0yJ+R3wX9QXJHxrJJMkV8Mbt5qlAASJ8k66/tB2Fd12Xj4JACNJxfh
         UDwaAOQ5bAAQwTV4DHreICE4HHNOLw6GX7uRqnmbaX0d/FsIamH6Nk5OH5DmYApc/FBO
         jILA==
X-Forwarded-Encrypted: i=1; AJvYcCXBq/UiPPDMSoF57BI+z5ewTrZ3YOl5RMyEjLPktQv6OolWBQC9NaUZp/ufVJP4K6O3t/ryYQjWX9KvbFsM5Em7XA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywr+IeWV2RHLN68aP2wj77qeG4AW9RlWYWIeoKBow2G/qiFRnfg
	mMb0O3SjrLNs/WIPOim3ke1KBx4RjvzLGmaQ5iR+hKbpCFs2MvvGPQeuEUjIApPYnTA=
X-Gm-Gg: ATEYQzynMJORKarG1cJG3VUQo89WkltuqJ0zjMHjfPc+zhs7hOifp2oJ2eMolEiLk0F
	REkYFeCYPPnn0BkUMdJa2h4dUyy3KTAns6TgS7TwlBgVMPPZ4XNmiaWSB6k5VefShEvH3xLr25d
	UQaxWOPumAcOZ9LkfNkX66RVUxPjC3Q5cT7+0lRHUluxIrMOoT670OQy524K75Sf7eWFy6TZUSq
	8d11eS4tBjeZfGVDV5s1aGFqJOlnkeISafp31gMjQ77FC1absiga+AtYBB6RfGP/hRsIod/fouJ
	QvIZ6E9V6EdA7i5N7Ss9/W4hPkRsZuRtfTR329Cl2qamfcAQO3DjiNqP3TSNaMO2w0xnK1iSBIe
	0cxpbV+RLtpBp0PRxadFa3TD1WTCMvLqid5JG6q1qBJviD6DmN2YrLDQ4fE/iCuDX2sU6Iu55Ob
	vYnzrvzNfMQZhAyTZwhf9zPwI=
X-Received: by 2002:a05:600c:64c7:b0:476:4efc:8ed4 with SMTP id 5b1f17b1804b1-48526923bbcmr46726015e9.11.1772823160788;
        Fri, 06 Mar 2026 10:52:40 -0800 (PST)
Received: from localhost ([212.133.41.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48529f01997sm11042975e9.14.2026.03.06.10.52.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 10:52:40 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 19:52:39 +0100
Message-Id: <DGVXD029L9TG.2EMNRFUGNCBVF@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH 1/2] libpcre2: Enable Ptest Support
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>, "Marko, Peter"
 <Peter.Marko@siemens.com>, "careers.myinfo@gmail.com"
 <careers.myinfo@gmail.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260211072322.79206-1-moins@kpit.com>
 <DGC07OORVFOQ.IN2M7A5FW055@smile.fr>
 <CAN01=z3YhR4u95F2HAncVV3pj+k5GxZVh2Hr2XV7mTxKEMTuNg@mail.gmail.com>
 <DGHXI0SQALG9.F3GW93KUXVTW@smile.fr>
 <AS1PR10MB5697ED75CACEF217DC9722B7FD6AA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM> <DGJ0I1AYCUMK.2QUHJL111LVBU@smile.fr>
In-Reply-To: <DGJ0I1AYCUMK.2QUHJL111LVBU@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 18:52:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232586

On Thu Feb 19, 2026 at 3:35 PM CET, Yoann Congal wrote:
> On Wed Feb 18, 2026 at 9:16 AM CET, Peter Marko wrote:
>> Could we add "adding/improving tests" to the allowed LTS backport items?
>> I think we're shooting ourselves in the foot here.
>
> FYI, I've asked the Yocto Project TSC about this.

Hello,

I'm sorry but we decided that standalone tests like this one are not
acceptable for stable inclusion.

For more detail, see "Clarification on ptest/selftest backports for stable =
branches"
https://lore.kernel.org/openembedded-core/DGVX4XQ6VLWT.1HOMXA78ZXLBG@smile.=
fr/T/#u

Regards,
--=20
Yoann Congal
Smile ECS


