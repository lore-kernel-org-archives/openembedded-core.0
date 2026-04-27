Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 201DAFF8860
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 06:01:25 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36537.1777269675501270518
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2026 23:01:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=g1e7Ye14;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48909558b3aso97525505e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2026 23:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777269673; x=1777874473; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgoERV86P4ZZnQ/hLleSkLrRJjUDGPRLXGnKrogsnBM=;
        b=g1e7Ye14KTqQpn5k4wfxKl3hqU0StrpKNrpZQqMVskQToc2BJkKYSZSfizf9Xnt00x
         TRuNrxLvkZiawunQiyJkE26o4bS4jFCwj2lYFXU1lO0/7MA5TLsE6X322m6VzfaxjAdc
         0VqNcTkcK5GB8iXz35cXkMpSCETqw2M3efD3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777269673; x=1777874473;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HgoERV86P4ZZnQ/hLleSkLrRJjUDGPRLXGnKrogsnBM=;
        b=KD5eteFetQEYIdL8LP+ZDpuwZ59+zli390YhN9VJYYd4FU02djnxFi/SJO5JNEYShI
         jDf/BjvI6WApVo+VHRaf1PqePeqDJ6LEcIka6GVoWT0M7ShUfcLh/weAQCQRU/0eXs07
         r08ytm25DpiuMPR0/a2XGk/+FT1BhSJbJS/s4zVY4Bav8OSwJTACQl07KCVAOVgCk2r9
         ncBehI4aj7MyzXvBaYaK2OtTz3QSc9LsyyKTJYHGS6mhdb695++GAU7vl8Wf6e/sVymO
         X2PNtwv1Leqe3vNJmah8qHVVuAXTYQWl8Om9e2HQael4ZJIPvvR8wyJIaJJ48iukhjNz
         wTCQ==
X-Gm-Message-State: AOJu0YwUzaMb/S8QWHZW9wbgKKnDE+5IJXeRjf/uad6yQDYDddYbRX2N
	FC5dQUYzYvSLb0EA+aDnIdP9TdAcLw+rgd1h1aOk2MWC8WRl9kmroChInTrObfA0QD0IR54nAt4
	I0dKb01g=
X-Gm-Gg: AeBDietxkYPlW0d2TST+DgybsgBMV7qnR8HiQPHtE4ojh4j/78zrevLErzdzE6VPsY8
	OdXvMpbDgOKMGXH6yRxVYiLx4Ew56kVSZ8qp3Qn6mxcXYfuNsLpjk1h5yCCL66WtXHrC36zvhBx
	Ipwxqpuyj02wU1MGWkK0FsMmSHT9xoeOTvS9NWEk4nQM0cDDtEfxH9KvaagBs2e9qop1iF3G0L1
	qIQ3mykGXIM1a0gPH1Xp5ephFKBXYWyILb+ftt1hIxTga3m22V2H3izHXd3VhPXde1Qt+SmpP/w
	/XHQKHN5iX7oLE4HS6cN20aqNSRZ0uIYwlGSGiM46hSa48VQOGvmD1zw55z1kqRaMuPPXJZV/Ct
	p6FeUIOxfc8tTrMg6qjg75+wX9wBaEcHVoA9tL/mwDzs/hyV9z8ZjENeGuj2OaC9oqMCzhO3Tpy
	9XO65cZIRXdw0VeLJcdWS7avuxoJcFSw5htS5BCzjLTRJu9L6gN+xLxqy+05DG0JrJ3Gq630nvt
	7GuwHwlzE7NQpLmP34onSWOUrU=
X-Received: by 2002:a05:600c:3053:b0:48a:53ea:140b with SMTP id 5b1f17b1804b1-48a53ea1526mr233101445e9.28.1777269672892;
        Sun, 26 Apr 2026 23:01:12 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:90d5:aef4:c08f:dc6b? ([2001:8b0:aba:5f3c:90d5:aef4:c08f:dc6b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a6124d7e7sm453395055e9.5.2026.04.26.23.01.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 23:01:12 -0700 (PDT)
Message-ID: <421b362ec30b467e4490f21d605dc92f94030df7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gnutls: Enable p11-kit by default
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Apr 2026 07:01:11 +0100
In-Reply-To: <18A8A25C8BDA3521.1516946@lists.openembedded.org>
References: <18A8A25C8BDA3521.1516946@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 06:01:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235981

On Wed, 2026-04-22 at 10:02 +0100, Richard Purdie via lists.openembedded.or=
g wrote:
> I'm not thrilled to do this but the signs are that during the lifetime of
> the next project release, we're going to need this and it may be best jus=
t
> to do it now. U-boot is the current tool that is likely to but it feels l=
ike
> there will be others.
>=20
> We could just do this in the native case however I suspect if we're going
> to do it, we should do it for target and other cases as well for consiste=
ncy.
> Most other distros are shipping with this turned on. It can still be turn=
ed off
> for those who don't need/want it.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> =C2=A0meta/recipes-support/gnutls/gnutls_3.8.12.bb | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-=
support/gnutls/gnutls_3.8.12.bb
> index 92156c277c9..ba923daeb08 100644
> --- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
> +++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
> @@ -30,7 +30,7 @@ SRC_URI[sha256sum] =3D "a7b341421bfd459acf7a374ca4af3b9=
e06608dcd7bd792b2bf470bea01
> =C2=A0
> =C2=A0inherit autotools texinfo pkgconfig gettext lib_package gtk-doc pte=
st
> =C2=A0
> -PACKAGECONFIG ??=3D "libidn libtasn1 ${@bb.utils.filter('DISTRO_FEATURES=
', 'seccomp', d)}"
> +PACKAGECONFIG ??=3D "libidn libtasn1 ${@bb.utils.filter('DISTRO_FEATURES=
', 'seccomp', d)} p11-kit"
> =C2=A0
> =C2=A0# You must also have CONFIG_SECCOMP enabled in the kernel for
> =C2=A0# seccomp to work.

This breaks ptests for gnutls since it needs a recipe from meta-oe to
run the p11-kit tests. It was too close to release for that.

Cheers,

Richard

