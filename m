Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2329.1792482917535146420
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 00:55:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Koxlvwn5;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso1915280f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 00:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792482915; x=1793087715; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LCTSZRBQh7FTce0saqZFFFPHdzpXWEcs7s9Q2QUK4PU=;
        b=Koxlvwn5c69vbDmdbIwUSWp1F9eudKE+lJdG+RCevBLJyfxFWI9txB6uKag8SFuoG9
         WJwwo+EtdmEMUl/h+i0DXfoCmRTy0xt7Spv1Me9zLyJhPNpx1dSfJq+ip83mj0GN5DV2
         5RJGAuCDas+0feSryC04SUVTMJuHY1K7t20yI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792482915; x=1793087715;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LCTSZRBQh7FTce0saqZFFFPHdzpXWEcs7s9Q2QUK4PU=;
        b=LiKG3Kbrx2N5bj9LlkKXFe6s2qjwfgD+vQLhq8mbbAaFPBulyykNs+OPqn/FlZbf2+
         2Ek7YL0U6u0okHPfoe3bG7981rqCIXZKdvEyjeJ35nEK/yWDxAfDVXlwAz5FndEGmsSq
         rcOnifp21zDHx7ZuC3KpJpxFZ8h/OtN55qIlEiBqtHBMcEbF1g6FC4QoVzKk3NSq+Muu
         UYsKzjI7G607kZmYLSF+b+mzcyVNuIn7m5c5ig7Sd+Ag805gR7aH8xautHRDQGP5exlC
         FK3rplLvMRX9RNpNe81Q92ucmZKfqMNpsb8nC5UWJP1VlYxfzjMvcEXvJDn2tlhUHmv0
         C5Jg==
X-Forwarded-Encrypted: i=1; AKwUvByqCwSKfIP1/9LotcCHxp5nIZx2EfVUr3VX2TpGeSdwulp4DmN8OOfZ9vWEdltW0cPvI8c28Upusi4gfIrMVspgvg==@lists.openembedded.org
X-Gm-Message-State: AFq9FYLv1998rH81oOEB9+KqiTTAmiDCdQpIBnxuqbyXfBYb7aNDaLmj
	iLUcGinJiaVhEBbSMCisx1A6eLrBZax0Wm7KCj06MkYTJJcCnSg0CieZHoFypMbfYXQ=
X-Gm-Gg: AYBFou11DvtcKPkuhEMJpA/fu+olQWcpGvLd4D/diX8ofF5aWbutGtNNItrnqClnVmp
	kD1RZPUa6ENAK5/Xo39Lgwm6U6iq+9y0HoqJBws1Sz7oXHsLkw7uA2Ka4XaoXy3ZXuU/yvbPv3O
	OuWJuTueKjKWkw3LcU4CC7AOjaGdxiqifzjsW2NabfoaSfFLKQrBqfGiXOXhj+ReQ2tiR5n9WBY
	gm5vs+3sQ8gGav0+cWlQE1ZU0XQMM1KlkqIHgXO+eW67WwNAfqdjTBw63YdisbLj4DKzUOTY37h
	LHjlWYtXGgiauyufjIXvryTiphs6nEJBgGIv/pSzx3Ak8SCF5RejQX6iV2V4Khc+BjIrVAJTCrP
	wTUNnG+UYZNKgyZ+c0Raobg3KAfF06yY3d47a/OIqaplEXODPQXQwTaX9vBsAhCyiDD6s2lAlrg
	+kUBtp8eSUpENDmmp4/wZVpZC4VFynkWAcWLOKgnZpxSTaTws8yYBu4Iy2lxxlA5eg4bWaG4j0V
	aoHCKwsXP6oDAvVXPoxD8UgsQFXTUnZt45rwGp+QOHe01fDYi2nt94vwsCgHFrWzMALgb0=
X-Received: by 2002:a05:6000:2384:b0:48e:bf0:377 with SMTP id ffacd0b85a97d-48e0bf0089cmr20386472f8f.7.1792482915542;
        Tue, 20 Oct 2026 00:55:15 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a02-8440-a50d-9979-1d13-70a0-c696-7744.rev.sfr.net. [2a02:8440:a50d:9979:1d13:70a0:c696:7744])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d82e8f7sm4418807f8f.48.2026.10.20.00.55.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:55:15 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 09:55:11 +0200
Message-Id: <DM9I5TPPZ27Z.1EJTKC86N46B0@smile.fr>
To: <jinwang.li@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [wrynose][PATCH 1/5] bluez5: Fix error handling for
 AVDTP_OPEN cmd
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <cheng.jiang@oss.qualcomm.com>, <quic_chezhou@quicinc.com>,
 <wei.deng@oss.qualcomm.com>, <shuai.zhang@oss.qualcomm.com>,
 <mengshi.wu@oss.qualcomm.com>, <xiuzhuo.shang@oss.qualcomm.com>
X-Mailer: aerc 0.20.0
References: <20261019082346.3287363-1-jinwang.li@oss.qualcomm.com>
 <20261019082346.3287363-2-jinwang.li@oss.qualcomm.com>
In-Reply-To: <20261019082346.3287363-2-jinwang.li@oss.qualcomm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 07:55:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248240

On Mon Oct 19, 2026 at 10:23 AM CEST, Jinwang Li via lists.openembedded.org=
 wrote:
> Return BAD_STATE instead of BAD_ACP_SEID when the SEID maps to a
> valid local SEP.
>
> Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
> ---
>  meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
>  ...ix-error-handling-for-AVDTP_OPEN-cmd.patch | 49 +++++++++++++++++++
>  2 files changed, 50 insertions(+)
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fi=
x-error-handling-for-AVDTP_OPEN-cmd.patch
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-c=
onnectivity/bluez5/bluez5.inc
> index d857c23a57..169269d377 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -76,6 +76,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/bluetooth/bluez-=
${PV}.tar.xz \
>             file://0001-src-device-Fix-stored-gatt-cache-DB-Hash-value-no=
.patch    \
>             file://0001-profile-Set-L2CAP-IMTU-for-OBEX-profile-listeners=
.patch \
>             file://0001-adapter-restrict-delta-0-RSSI-to-proximity-filter=
s.patch \
> +           file://0001-avdtp-Fix-error-handling-for-AVDTP_OPEN-cmd.patch=
 \
>             "
>  S =3D "${UNPACKDIR}/bluez-${PV}"
> =20
> diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-error=
-handling-for-AVDTP_OPEN-cmd.patch b/meta/recipes-connectivity/bluez5/bluez=
5/0001-avdtp-Fix-error-handling-for-AVDTP_OPEN-cmd.patch
> new file mode 100644
> index 0000000000..0d346a2258
> --- /dev/null
> +++ b/meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-error-handli=
ng-for-AVDTP_OPEN-cmd.patch
> @@ -0,0 +1,49 @@
> +From 4e0aba5a8ebd969b68cd3442e9f8066a4b15a366 Mon Sep 17 00:00:00 2001
> +From: Simon Mikuda <simon.mikuda@streamunlimited.com>
> +Date: Mon, 8 Jun 2026 13:29:23 +0200
> +Subject: [PATCH] avdtp: Fix error handling for AVDTP_OPEN cmd
> +
> +We have to return BAD_STATE when local SEP is available instead of
> +BAD_ACP_SEID.
> +
> +This fixes: AVDTP/SNK/ACP/SIG/SMG/BI-26-C
> +Upstream-Status: Backport [https://github.com/bluez/bluez/commit/7c1c90f=
7b6d0f653c581878a039e2d02362f33f5]
> +Signed-off-by: Simon Mikuda <simon.mikuda@streamunlimited.com>
> +Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>

Hello,

Simon Mikuda's SoB is not in the upstream commit.
Please remove it.

Regards,
--=20
Yoann Congal
Smile ECS

