Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8C78C6FD1D
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 13:51:01 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.25831.1680184258973731581
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 06:50:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eF7WWBNI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id q19so16089755wrc.5
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 06:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680184257;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nodpsUoa53SExbVsuWnxxK1TuRoH11O5vM1ciQRyScc=;
        b=eF7WWBNIrVMI2a52XgRlOp0HY24PUCwKGO+6qUAexUsqxhe09zEPzMVN7TVlMLAvh8
         P6vdWJ5zEcIcm2lDnJ0N8RugOvCf7WYE2aXxCHgyEsxGevpBWm/2I1t7ET8CrFJE48ON
         7H3YNWdg9i7XwTg6EX8zxLGv1WlNAdAr+irgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680184257;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nodpsUoa53SExbVsuWnxxK1TuRoH11O5vM1ciQRyScc=;
        b=vJodGoMEjIHZNe2snB48nEKn9gHNeefX+yLE7mXMpAiZys/b5vphZAuI+181hIpMst
         aAeh4WOW/+ywqNox575vRXanYR8/G4XO2NAGTzB+UXkNP6NmDtqYZ87t3qVwj39l7SFM
         JcMF6a2HazTiAXY071dZJkjU6UhaTSumu11bRhivvyP1Vvrg9CiBmcpBSN6DzRUseGdu
         LQaQCSnqOKbV9U6Ib/t1G2X89Yb/f00ZAoOattCVK2GeQbg3UrtFDzpnZ+NISFFnmEZ4
         /vu7u/aAloEQ9rnkySM7KywFWqhgk5ZtbV8Ds7b0VnzYmfAJ8puTfrkBtN7MWUFolreG
         tThQ==
X-Gm-Message-State: AAQBX9dAE9XTuze09Fjr8wTIrec4j/2T3j41fnaiRYi8/aNWW6k9QVuP
	Ssgl/wAhlnBh5pfxg/M1d2FqKIAmtU3njnlT0Xw=
X-Google-Smtp-Source: AKy350aHIiIOkzFxS3iSXr4zaQRdTLLMSAdGPVtwrLiWhYtR7rbu2wlOYu3ZM1Ycs6/vsaZIrJdBYg==
X-Received: by 2002:a5d:460b:0:b0:2d2:59cf:468f with SMTP id t11-20020a5d460b000000b002d259cf468fmr4774638wrq.15.1680184257346;
        Thu, 30 Mar 2023 06:50:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:77e0:6cb9:7d92:358e? ([2001:8b0:aba:5f3c:77e0:6cb9:7d92:358e])
        by smtp.gmail.com with ESMTPSA id h5-20020a5d4305000000b002c3f81c51b6sm32797133wrq.90.2023.03.30.06.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 06:50:57 -0700 (PDT)
Message-ID: <a25c3a41d623242edf004723dc94518228cfc1da.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] systemd: Allow native build
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Zoltan Boszormenyi <zboszor@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2023 14:50:56 +0100
In-Reply-To: <20230330134214.2772913-1-zboszor@gmail.com>
References: <20230330134214.2772913-1-zboszor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 13:51:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179325

On Thu, 2023-03-30 at 15:42 +0200, Zoltan Boszormenyi wrote:
> systemd-native is a dependency for libgudev-native, which
> in turn is a dependency for libfprint-native, which is needed
> to build libfprint.
>=20
> The native systemctl binary is removed so it doesn't conflict
> with the script from systemd-systemctl-native.
>=20
> TODO? The new natively built systemctl binary may replace
> the script in systemd-systemctl-native, as it supports
> more options and works better than the script. For example,
> the current script does not create the symlinks in
> /etc/systemd/system for WantedBy=3D and RequiredBy=3D settings
> and does not support systemctl set-default some.target.

Which piece of systemd is libfprint needing?=C2=A0

We've had a request for systemd-native before and my opinion on it
hasn't changed, I'd much prefer not to have it.

Cheers,

Richard

