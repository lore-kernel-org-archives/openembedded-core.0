Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95EDCC19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 08:17:17 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.6717.1741335434345392144
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 00:17:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HLVY1udV;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: rybczynska@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2feb96064e4so3382740a91.1
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 00:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741335433; x=1741940233; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n+GuttVKFnq4/JnxFnryBeHbMyxKXxeby7Qsd+RAn9M=;
        b=HLVY1udVly8jxSAYxmA/OeSlqBJMmGnuah3hPnC/0a/bl2nJOEJEg/Z+A+2/x0IPcx
         QwiMG0dF+zNxc+qIwZhYm81omfbT8Bgiw4JWlDU9IJRHQ+Gu4y2r1/eSsvrqVGscZYFP
         EzlbbAIyfgVNWQqP5iKR3qDm/QFscFNUedHv/atu2iaC/j18q2VKbSN2MVbGDqS1Zc1H
         uwB8tlgK9oI4nX0Q4vue3F8yaO6pQ1Mlo1VRoOdd4xVcZa1598HMhgAD2+BfGLKXYiVR
         P4jQkaPTV+3Ks1YJ3PQBwuwTz+cuTNkb+Rve95u6J6dNLcQKzJQdFGqvPaWWZsuSc4rJ
         HJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741335433; x=1741940233;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n+GuttVKFnq4/JnxFnryBeHbMyxKXxeby7Qsd+RAn9M=;
        b=mviADvZgvF9cpWPxlOcx1+INjLMHyXT1TpjsjMB/6N1DFjn9XQP0ELT9M1MxSThE0x
         eZ69ytK4TpsjhgA7a4oxu6kqtrv3xf3O2c9zny2/sE1mSEG2VQhSc3Sdrh7eOceTr83l
         lFmiwcio04e+fAZRuE6QmYtClGJM83tzB2wcsl/rMB+kPlVsV+BlQ/RUzQODHOOJwT4a
         TriEKhtkjtrZ3R5U69+BiClK79AWWbCr1dI3gOMVSJ+zSTg256CM1rpYEheIyJaR7p50
         JmfIrN2sTs8zcUn2ajRyjP0OaXnVL4Wl7Hu3NjCPYmcnXPwdu7M/1N9eNRb/ql0eIAwV
         qyAg==
X-Gm-Message-State: AOJu0YwFvGDbTFuy683SgodiAgqR0mvAQWN7y9DpK/qiytClM2NZv1yh
	/OHneICqgukO3PYgg3faF1K6h2H5iP5DJvcilu79NYog73vOsb6dLE4NuBTzAQN7uPDMjHWdVTR
	lNQsXLC2d0AmY1yB9NZP41lw/9bX3NDja
X-Gm-Gg: ASbGncsZatkGc7rut5aG4nAUbNrEkkHp6fLX0CW8L0liKlDQmaWCpKhdrhgatLR7cW8
	RoKG70Cy0GwRMBjw8JCO/H9bMe9BoJ1vNZiNBKQ0n0sESIcT2tb9LIcwvZ+YTlFcocmDBJmPITy
	ifFsBsWckm5b+wRKWeWXJTWGSy6g==
X-Google-Smtp-Source: AGHT+IH3EtJ7YagseIe6rkXx+dIeA1FXbpBJajdHTJ/E1lPK0Vtfi831FerJX8hnV7bdBE6Xqh47gl2DK1qGYusbS6w=
X-Received: by 2002:a17:90b:1807:b0:2ee:ad18:b309 with SMTP id
 98e67ed59e1d1-2ff7ce47de5mr3708440a91.3.1741335432840; Fri, 07 Mar 2025
 00:17:12 -0800 (PST)
MIME-Version: 1.0
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Fri, 7 Mar 2025 09:17:00 +0100
X-Gm-Features: AQ5f1JoBu6TWNH1Lx5iS_g-yL-NHgCQj_ssU9aYQllFvHxL1GQ1A5rtO14zsaHU
Message-ID: <CAApg2=Rzpkp+on0kG7LmH7Tmo2J_t6AmkQ96+pMJ47TZeo=5aA@mail.gmail.com>
Subject: CVE program survey for downstream CVE users
To: OE-core <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000e8d801062fbc3fa4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 08:17:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212414

--000000000000e8d801062fbc3fa4
Content-Type: text/plain; charset="UTF-8"

Hello all,
The CVE programme is running a survey for CVE consumers:
https://www.cve.org/Media/News/item/blog/2025/03/04/CVE-Data-Usage-and-Satisfaction-Survey

I think it is a great occasion to have your say on what works and what
needs improvement.

Kind regards,
Marta

--000000000000e8d801062fbc3fa4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello all,</div><div>The CVE programme is running a s=
urvey for CVE consumers: <a href=3D"https://www.cve.org/Media/News/item/blo=
g/2025/03/04/CVE-Data-Usage-and-Satisfaction-Survey">https://www.cve.org/Me=
dia/News/item/blog/2025/03/04/CVE-Data-Usage-and-Satisfaction-Survey</a></d=
iv><div><br></div><div>I think it is a great occasion to have your say on w=
hat works and what needs improvement.</div><div><br></div><div>Kind regards=
,</div><div>Marta<br></div></div>

--000000000000e8d801062fbc3fa4--

