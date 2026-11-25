Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47036.1795627889818842981
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 09:31:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Doyl/VOQ;
 spf=pass (domain: gmail.com, ip: 209.85.217.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7cc0ccc2fddso2303592137.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 09:31:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795627888; cv=none;
        d=google.com; s=arc-20260327;
        b=X/xZ8y8qPS46QkW+YCytpIqhVdFiXbT5Dz2Dk3LTb9B3SvNklYV49wwKuYXt3s8ewf
         4HcyKLmX3C4T28eTv3LiaoMEAi74ArRnkcy6Wwe4d8oIkCnDcxZaxD4ELyl3nF0PfO38
         LGwqV72IBimAoed0qxx5O2nLblJmVBn2DJ3HkmFWEzBIY+g9f3xi88M6MZlvlTUqq1f/
         +8f3iQLN0m5xHCVgcXIKktPLkMfTbq1HGF7PLKPQ6sgdEAzHzFeVCYKrrYiwPD91bPjX
         /7ntZ0pJw7pmIoiW1ZwUFmZUrAPA8VRX23am2AizfUqe2hQtBOvsJ2DTw087DjHJGuZO
         +WPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pszRiSUQ5Ro2wKn4CtKS4DKgKQy93WqOwry8RSQYEuY=;
        fh=Il0ASnJRUjH+SDOrHFkyLHSeMBTLfkYSizEmg+3oP1M=;
        b=ezAjIj3DvzAbkRLKYyCypAnLcypBmHEhq5qUA6cjNHZM8qEFsIEGGPv/2gpbCzSUcU
         3NlXZT4VcimoOlVGedKXOS2e0RLZPJopiufol659G0PefGliLHUSJ8PQTurn0h6NDbRF
         YqNiIJael4wUTUm84Jvl2ZUHF+84zhKmWJxeEvBgw5M1okZdCOt0qPIugy2hVv0sh0GY
         sPvGleRa+xtlGOk+ACZQqqjZ0xibDzy0I4NviME369s1/PwVN7Aipo9wwgK2lqiduPSK
         mK0nGLvdmiBvIyyzwXSm9RLnjx6OC4y6ytRBshqjwMsMkt2eIKaH6rwxiDP0Yxypukz+
         4iIg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795627888; x=1796232688; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pszRiSUQ5Ro2wKn4CtKS4DKgKQy93WqOwry8RSQYEuY=;
        b=Doyl/VOQwmN8JBHr0hWAid2Iay20AOiAYEa1Mf47RptrWRO5BD2bOb4FKpmY5sjHjb
         srVtgXi9i5UDGWklwB9zCn6AKMF3eptLlZBzAvByvtBFkVu7lrNwEyrXRkz+nMhVakvk
         tz6CLa6V8zf0G3Pb2OPwtjqI/sgwsl8eV9U7MB0J7EbdxaJlvMuUC1uDla4GpoWowG+G
         W5U4cTUTaHnuFXpFa2oRiniyQZVNjbr/rzpVsvd8cqUQotMjB3QS6JKzi2UUCJ/Yb6Yz
         4rHfD9VB4zeyWIvVpH4RWH6XnCN/kRJ6mXuGWOCO/zFjH6Tm0oRUqW1RrWov8M9jHiHu
         Kopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795627888; x=1796232688;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pszRiSUQ5Ro2wKn4CtKS4DKgKQy93WqOwry8RSQYEuY=;
        b=x7nVbFD6VOyeRutlUvSvTQqE3lE672eaKLvZRXUuLo05V3okYohJvpQ+R4Tew2Se+Z
         pUb90RYTZwIYPbbEcPfI+4w0dhVXA1dIe+08iIsiF+vxU31mjghsRX2Xaksp4iMymOP9
         W8L9gP6k1b94xiZx/0S9v59tvw+cpMvmJKoVTGQkGvB7QslLqLnN3C9GbN+9qJvTdD13
         pRfuxCEOy/sa5VVlib88PY8k7NBW/xF0kW505mmJyDW57ZFO4NJDpJtyLzaZoy8yuMqK
         6/Zfe4g9/nl0EVwq0JL1xLbmciD7nEBUx/bvy3e+AUwjQ4LM5wqCXOdYAIEG6TKCfUM6
         Byhg==
X-Gm-Message-State: APuU4Z+obWwyx9IJXc4GCPE8HzwERP5XU0IIlPWazMLb2oKr+3PBivwq
	L0/wQXxr3/ZQeysfl74hh39mXHRbWCI4nw8gyQs8dii8RVKQJ4DKpHGVTXIp1sQJDQXDIoh7ssE
	OCCSvcisR3x1Ezv2lC6/cD/RkeUsv7CtTDmRU
X-Gm-Gg: AZFdTZcrCzH7bpnTYGVQGxZzP6LO8cB2qWv5jLlFLX8ZYNvUV2BpS2Zu1OP6iQd0v98
	0A5ywXtntFi9QtidhFzYFbuC1mw6Kc0Anjl8Z8qGl1SSslu8/YUrCjxWUFOS8f2Xx7EfoY3ZqIn
	MUtGuExaaCQl/UjR9jeRRhuioS7migOiZ3kRhtyMe/MqTHRtJ2daWRSrepObhWGXa4NqeHgdsC6
	FfWqqnC3/KhURVORx8b9dWKNiC0So5Ebu0lpfF8Y0yPO2K5gcckCwgyHCbngX0BusG9yaKyoHZd
	X+2HtHjf2+w4vSL4nDPVsb/sJ/531DW/nZSuHLeUxlnGOUxdMe+kZc54VkwLtFz/7xAnAPuXLTt
	Ao52ptthoJaLs9G9nIGVXZcI4IwPL0mNRKKlDtn2VYGrHuoAL5DkqsWXv3+39I/uKP5+OmvKC
X-Received: by 2002:a05:6102:2926:b0:7cc:9d47:9c9 with SMTP id
 ada2fe7eead31-7d73963f00dmr10163174137.35.1795627888372; Wed, 25 Nov 2026
 09:31:28 -0800 (PST)
MIME-Version: 1.0
References: <awbWWtZxSeJYwz87@bywater>
In-Reply-To: <awbWWtZxSeJYwz87@bywater>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 25 Nov 2026 18:31:16 +0100
X-Gm-Features: Aa3M54oNQuKJtbr635lT1a3GTX90bfUNyobQX4cGLJVQ7XBtrWkGCrt_i5H9o94
Message-ID: <CANNYZj-USJG+Ezn098_A5ypLfVMRJaFA-e_WMqkvLJ0fGPJsjw@mail.gmail.com>
Subject: Re: [OE-core] Purpose and status of core-image-tiny-initramfs
To: francesco@valla.it
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006f730606611d325f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 17:31:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251234

--0000000000006f730606611d325f
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Nov 2026 at 13:59, Francesco Valla via openembedded-core
<francesco=valla.it@lists.openembedded.org> wrote:

> Question: may I propose some changes for the entire setup, maybe
> dropping entirely initramfs-live-boot-tiny and depending only on
> initramfs-boot (less to maintain is better, after all) or is someone
> depending on this exact setup?


I don't think anyone is, given that it does not build, is not tested, and
has nothing depending on it. If you can propose improvements and cleanups,
please go ahead.

Alternatively, you can fix up the image if you think it's useful, and add
tests for it. You can review the following to see where the tests could fit:

meta/lib/oeqa/selftest/cases/uboot.py
meta/lib/oeqa/selftest/cases/wic.py
meta/lib/oeqa/selftest/cases/uki.py

Alex

--0000000000006f730606611d325f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, 25 Nov 2026 at 13:59, Francesco Valla=
 via openembedded-core &lt;francesco=3D<a href=3D"mailto:valla.it@lists.ope=
nembedded.org">valla.it@lists.openembedded.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
Question: may I propose some changes for the entire setup, maybe<br>
dropping entirely initramfs-live-boot-tiny and depending only on<br>
initramfs-boot (less to maintain is better, after all) or is someone<br>
depending on this exact setup?</blockquote><div><br></div><div>I don&#39;t =
think anyone is, given that it does not build, is not tested, and has nothi=
ng depending on it. If you can propose improvements and cleanups, please go=
 ahead.</div><div><br></div><div>Alternatively, you can fix up the image if=
 you think it&#39;s useful, and add tests for it. You can review the follow=
ing to see where the tests could fit:</div><div><br></div><div>meta/lib/oeq=
a/selftest/cases/uboot.py<br>meta/lib/oeqa/selftest/cases/wic.py<br>meta/li=
b/oeqa/selftest/cases/uki.py</div><div><br></div><div>Alex</div></div></div=
>

--0000000000006f730606611d325f--
