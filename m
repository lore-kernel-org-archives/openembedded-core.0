Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED7BACD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 14:40:28 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.155916.1781620826698001325
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 07:40:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=jpjuuRPF;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso35135315e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 07:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781620825; x=1782225625; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WinBITT3lnajL6hy9Tk4qFj/stPo3etKb3UHV9TKOOc=;
        b=jpjuuRPFRKsYIU99VIoBmLHUNZ/vAPxmhkZM4JJXik7PbJ8SpM6mKSnu54YPlWlhKK
         WrWFtqmuo+MVD8Jaye5ys3i1L9PAFINW/86dI0Hg2I6moEs7zHyTCLeDevYo5I9RHjgp
         KcnMjo9v94Qwa2t/cvKQeuAdI7hXrCevqpIaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781620825; x=1782225625;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WinBITT3lnajL6hy9Tk4qFj/stPo3etKb3UHV9TKOOc=;
        b=NI1to2oZNcNrGXohMWW9YBo71eY3jwrOgeWSdNfkOTNwu/NhWIlUNDz34xVBafT2tX
         jAq2qJcwV9Ocj38shS+MymAm5hsiPIjW2pjSwjlKfLtVNKdK8r39854ROgsL78w0xW8i
         98gSuk7LkntlJPb0sLFRBS7XufTmSEwOlrZpdeiIJpaLRtwTg5WdpaLJyZ4AUKe6FZbN
         K5w2EKTXoK2G0Br/nR/QzDG+YjMPhMgX0JlqIaEFR6C3oh0qmla7c8NTG+mAW4BwGgbI
         ce9EGPO7ecTmkJOTIxWT8yiPyiu14D2rk84VW6XLN1+gScdBzkfFQv2oWo5T1XfQnve0
         MLGg==
X-Forwarded-Encrypted: i=1; AFNElJ/H0Bs+O3yUDgFjQ1XlMV5A9YVRRkuaUheyHup+yU0Ib196lsuZo8tKWOCbDoeZUiylVqa4t6McESz5bvCdm8dBBw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz4bBqB796IrJB1odaJRwyWdqG9shprLYmwKtintabm5kM4NBbC
	2u5DMOQqVRrHSxrG/YiTkyBpyPLb06pHLox9m2B59FQRV4o6xTSpCdJD34Lb+LwA3Bk=
X-Gm-Gg: Acq92OFuDbK/BLA2hBRo2kx/fpNuRQef2bOf3HHPvUowC0Bg6g3iN28cWaRqna8+Bpl
	L78qIqsvJol7XTD523sADDMtKt6IBVLu6VnOgjy5HBFavxi3OrD9jmi1l65Kaxgk2QxPVAlT6ga
	g67RU5zyEkP52foY03qV/FxBSzAnlJhC0uZjzL1N+64xsWcq9eDX25mVsUaa0CfLfiJGCXSuwjf
	GEAbmlotSvbX06IqRgoWIJ0bMPQgTWcG4HTzu5JuX7Q+YftH2VAmAUUC7mHbDYmty+k6YkylXrh
	0I5fe9tIvqwvPebKVGzkGVD8zeEvPnJzuqyL2Uywbc0W538xKaRlDGVT+ghVRme/1tPG3tpknOF
	N3f6nk2MTYJRkpuT0H6QRBOeZHHTFd/E6asjdfIV6xrAgBmSp/Fy+wFRXUcQmHBffUlV+lpEU84
	uOkGKNmjjWBilIM5A8SBLMtZMl+xhVuELOAaXovEfnldHA8NSXtz8BzkOC6z94bHY2prwt0wWkx
	dsXRU24MSWEBSQZ
X-Received: by 2002:a05:600c:c0d1:20b0:492:3172:bcf0 with SMTP id 5b1f17b1804b1-4923172bd22mr30257465e9.3.1781620824755;
        Tue, 16 Jun 2026 07:40:24 -0700 (PDT)
Received: from localhost (2a01cb001331aa00fdf7edbba0bd5f9d.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fdf7:edbb:a0bd:5f9d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa8b423sm83007965e9.11.2026.06.16.07.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 07:40:24 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 16:40:24 +0200
Message-Id: <DJAJVFJKICFA.NKWQQAQP6953@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH 1/5] sign_ipk.bbclass: add missing
 'd' parameter to raise_sanity_error()
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <rl@karo-electronics.de>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260602142132.976138-1-rl@karo-electronics.de>
In-Reply-To: <20260602142132.976138-1-rl@karo-electronics.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 14:40:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238904

On Tue Jun 2, 2026 at 4:21 PM CEST, Robin Lintermann via lists.openembedded=
.org wrote:
> The second raise_sanity_error() call in this class lacks the 'd'
> parameter which would lead to a python exception rather than the
> desired error message when the corresponding error condition is
> fulfilled.
>
> Signed-off-by: Robin Lintermann <rl@karo-electronics.de>
> ---

Hello,

We have a strict "master-first" policy so any patch needs to be merged
on all the more recent supported branches before merging on scarthgap
(in this case: master and wrynose).

This patch (and the other patches of this series by quickly glancing at
them) is needed on master.

Can you please sent it there first, and then, ping back here so I can
take them for scarthgap.

Thanks!

>  meta/classes/sign_ipk.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/sign_ipk.bbclass b/meta/classes/sign_ipk.bbclas=
s
> index 51c24b38b2..9f666998ba 100644
> --- a/meta/classes/sign_ipk.bbclass
> +++ b/meta/classes/sign_ipk.bbclass
> @@ -40,7 +40,7 @@ python () {
> =20
>      sigtype =3D d.getVar("IPK_GPG_SIGNATURE_TYPE")
>      if sigtype.upper() !=3D "ASC" and sigtype.upper() !=3D "BIN":
> -        raise_sanity_error("Bad value for IPK_GPG_SIGNATURE_TYPE (%s), u=
se either ASC or BIN" % sigtype)
> +        raise_sanity_error("Bad value for IPK_GPG_SIGNATURE_TYPE (%s), u=
se either ASC or BIN" % sigtype, d)
>  }
> =20
>  def sign_ipk(d, ipk_to_sign):


--=20
Yoann Congal
Smile ECS


