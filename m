Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 607FECC6B1A
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 14:26:05 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15073.1791987955552645093
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 07:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ndhMtmE+;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48dee593f18so406664f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 07:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791987954; x=1792592754; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TYujI2j8d1Y5UFfeX4dvBaunkyypesE5hl6yiwPCWgE=;
        b=ndhMtmE+0WJBuHbNQDNVRLmARz0zA2by12aGQ4dPP20vN7nMWIZSTqDLFD5agGT8ii
         bZL2z5P0XqSng9amwABtKa2/qP+0pCMRuC5b5rdfSRVzoyjLGWOV4XUE+oUndoT31gu6
         +JRNrmuuKLhbPOqXmqd19OxBBXZ/udVix5fxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791987954; x=1792592754;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TYujI2j8d1Y5UFfeX4dvBaunkyypesE5hl6yiwPCWgE=;
        b=G/aDJh+WqlPRPKgDDRIye0YBu+bmyQ2XM0jVuAKd1KhzP7LBZjHqRcS+tYOj+cqhSx
         pMfN6KQfYRSYZWLZB+F2aOGU0add+3KoATE0l20Ga4XDK+TB9lXhYXCfAB3Wc91FYymv
         7sLs9Ll1d12ySKRk3OLTupfHbrg2fD5qWzmKe19mhdYqsz2sgzfd8sdRGRbeSrawWyX9
         QtpCsJTANms8yHZk69kEUdgc2Fr/Xw06+07Uwrt9fuSpJE0ThU2g3ZnaV2Nt5aCdrHJM
         YHq/KF30hDFnQTqYnYEqTpWonmE4UsMyX0yzRTvANhM8d1s4PhQajlbvQQeKg/UQ4ryQ
         RI+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzZIO4FVJy/XLeBSvzyW22Qyw1RZ7syUec/d4SE5YLIk5QML5ue+F2ecZbGy/R/BYswcyv5ruPzraW+omMZ31BbNw==@lists.openembedded.org
X-Gm-Message-State: AFq9FYKWr7sN7P86UHtwtN6nfXliOHlHpFheKYAqWoWyutrmG9mWRRi3
	suatl48zaF5IDU0XQIEt0eE/NTNpBVn786pfCtJSD7T19MyMWUEvVAoxO185hCzXXcc=
X-Gm-Gg: AYBFou2hsCBV8GqV/nqqWxwbfOQlkZIXNQpvtgtSn/P0kc6chY9mlsJv5wh2AccsV1h
	1OuBSQEZrF80SjgtgFLBFQCLejRmwovXqbqI3A2twsSykP7d0NCYtcJdSqtNq9aknj0lrl47MQu
	bdF+rDXDT2ItY644ghkL3uJhQtW9/Y7mPxzfFGGwDMAyGY2m/dYj80+ZUjhlu6uZ9dUInev+yAY
	Z5m9y6l0KgXLmTo4eUQZkvyVMktZUvEqDhXPjFGdThOmY0I9FNkw921pic6itCLQrgWJyWfFceq
	1Q1PEHN0Za47x/F1NLcyixqNLH42p9Xs2pE4MGSJdCCKPailpKX4TxSSDTq0QzkE/eYj3q58EJO
	Zp0fSfWlLWn4FLQxNZT4I796/rv+HaTMhLF3645EIi57J+OU9unDlTTucts92YCRrQWczDfAM1t
	c6IwnH64JiTksAMqS/jYDTJlthl180XfZUo50r3hdTZ8DhP7OFVF58k/wtLZG0YTpK+BeoaX5yE
	cSOxMfTKyxCBsX42gzfy/J/tGnwf5zkvHnSFtq4bRY40mC/cd+eZvT2q+pu
X-Received: by 2002:a05:6000:4011:b0:48d:f1ac:ddf0 with SMTP id ffacd0b85a97d-48df1ace1acmr683091f8f.34.1791987953738;
        Wed, 14 Oct 2026 07:25:53 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de72c7e36sm6745920f8f.37.2026.10.14.07.25.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:25:53 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Oct 2026 16:25:52 +0200
Message-Id: <DM4MPOPTHX9C.2IO3PVJDW950C@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCHv2 1/6] bind: fix for CVE-2026-10723
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261012043822.12852-1-hprajapati@mvista.com>
 <DM4GZKPENPVJ.3SEPU48GQQGGI@smile.fr>
 <1979951.1791983373368474761@lists.openembedded.org>
In-Reply-To: <1979951.1791983373368474761@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 14:26:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247761

On Wed Oct 14, 2026 at 3:09 PM CEST, Hitendra Prajapati via lists.openembed=
ded.org wrote:
> Hi Yoann,
>
> I have back ported this patch series from 9.18 .
> All the patches are back ported from=C2=A0 respective Debian bug link. Pl=
ease check it.

I don't see what you mean by "respective Debian bug link":
https://security-tracker.debian.org/tracker/CVE-2026-10723 =3D>=20
https://gitlab.isc.org/isc-projects/bind9/-/commit/35e3d49d2222c13786a06021=
c7ed583d2a656e51 (9.18-branch)
(=3D https://github.com/isc-projects/bind9/commit/35e3d49d2222c13786a06021c=
7ed583d2a656e51
the gitlab.isc.org link is not reachable without an account)
the commit 35e3d49d2222c13 does not touch bin/tests/system/glue/setup.sh
but your patch does remove it. =3D> Still feels wrong to me.

Also repro_5874_nsec3_parent/ans1/ans.py is added, then removed in a
later patch. So, maybe, we don't need all the patches? Even more so that
we do not have ptests for bind.

Why not just cherry-pick from the 9.18 branch?


> I don't have any news for 9.18.51 release.

I do now: https://lists.isc.org/pipermail/bind-announce/2026-June/001296.ht=
ml
=3D> It won't happen as bind 9.18 is effectively EoL. The last version
should be 9.18.50.
That said, there are recent patches on the 9.18 branch. Can you look
around and maybe ask upstream about the status of this branch?

Thanks!
--=20
Yoann Congal
Smile ECS


