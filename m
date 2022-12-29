Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA323C4332F
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 15:18:42 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.207261.1672327120243301548
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Dec 2022 07:18:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HRRbS2EB;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id m26-20020a05600c3b1a00b003d9811fcaafso6834780wms.5
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 07:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rnxnw7VqjDr648QuJc6TgnwFSC0sC42VlebPAuBPMh8=;
        b=HRRbS2EBs6NOa6/J9l5PG2iRBcEpZJED+FCXSVeGHRzn/x7CIPH95NMCg+HpaLJgQN
         BS5QTHG1dYquDnH8qfDz08W7nMIhaXe62HrDB/TmPNyRwc/ReY6WLYlLi+8eES89wLir
         OIV+afKtHuc6oz0+ssl/PWELJ5qQw8hbb1/+XpnQ85GzHCp1Q3/ZniAj06toKgGTrPj3
         7AwKJsiFqV5+ZmqfHGG1En74oT8BJKJGUXoFYmxITTyVlgrBWDt0adIKvGEe9bWdKKYl
         I4YEc/j2CrdmMgoB6Beqnp+PxzxkdDGE3sPNZY+Lf7OJpYuPwfUp6To/VZ8/rOmFAfy9
         djeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rnxnw7VqjDr648QuJc6TgnwFSC0sC42VlebPAuBPMh8=;
        b=QF2ZFjcfFHP4X07swJoCiK0pKpQareOA9bypZ/sUo1rR+L9vbGMVB8ISHyF4PbeTWk
         EdUaUUQTzozkHwzzkZiPDkj2jYN21kdIISJKn55eDL0pqy6T+IDzDU5pwvPRMoiPHNHU
         sDtlUjpY58uuDgJn2bYd4AB5chRyzNbvCxaqD3U5YTZX8qfcwhDKCOGQSI5UOu2tQ6e1
         EsxTsPiYOS5KUR93XyLSUQxxkouQt7WQZ5tmXyte3mS/eSA+FjdjyCGLWAXO863RcaIU
         sMuHsGoEUfM00Uk+iwFE5q5GptBYYx5QTJpKHcDIp0VNMsI79n/wOykVNbCFpS292HWF
         CAvQ==
X-Gm-Message-State: AFqh2koY89HkOZ20qDJYNjvHc6k8L1cOnxV0gbHzSmTftfbCEM9jkM0R
	RC4XpMuf8YIvb+yA4eJgecv/04GvV/x/IFIoqok=
X-Google-Smtp-Source: AMrXdXtZ4mMvlud+/v5J3BYXReH3e6XCaCArkbehBBBn+GGky0xKtqISqzFrV/X72s4IcfcsbL3lEBeP+b1GuJb41E4=
X-Received: by 2002:a05:600c:d9:b0:3d1:ed5f:b8ec with SMTP id
 u25-20020a05600c00d900b003d1ed5fb8ecmr1401639wmm.102.1672327117508; Thu, 29
 Dec 2022 07:18:37 -0800 (PST)
MIME-Version: 1.0
References: <20221229151110.224320-1-f_l_k@t-online.de> <CANNYZj-gY4N=95D39TcAy0OWoi+rOkb2pN1beZy_UOiY3BYRaA@mail.gmail.com>
In-Reply-To: <CANNYZj-gY4N=95D39TcAy0OWoi+rOkb2pN1beZy_UOiY3BYRaA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 29 Dec 2022 16:18:26 +0100
Message-ID: <CA+chaQfqN0JLgPk3zUE_QN6KRcm7-q2TWbYLyeMUAbg1AGw_5g@mail.gmail.com>
Subject: Re: [oe-core][PATCH] gtk-icon-cache.bbclass: replace += by :append
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c995b305f0f8ff9b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 15:18:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175103

--000000000000c995b305f0f8ff9b
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 29, 2022 at 4:14 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> But what is the actual issue? Did depends end up malformed, and how?
>

My guess is that it was caused by gnome-control-center inheritting
gtk-icon-cache before setting DEPENDS, so the DEPENDS from bbclass are
overwritten.

Moving inherit bellow DEPENDS would solve it as well, but I agree that
append in this case might be less surprising as many people aren't very
careful about inherit position inside the recipe.

--000000000000c995b305f0f8ff9b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Dec 29, 2022 at 4:14 PM Alexander=
 Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.c=
om</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div dir=3D"auto">But what is the actual issue=
? Did depends end up malformed, and how?</div></blockquote><div><br></div><=
div>My guess is that it was caused by gnome-control-center inheritting gtk-=
icon-cache before setting DEPENDS, so the DEPENDS from bbclass are overwrit=
ten.</div><div><br></div><div>Moving inherit bellow DEPENDS would solve it =
as well, but I agree that append in this case might be less surprising as m=
any people aren&#39;t very careful about inherit position inside the recipe=
.</div></div></div>

--000000000000c995b305f0f8ff9b--

