Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A206BC43334
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 10:52:20 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.23462.1656586338870978482
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 03:52:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FZ6EbFkI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id k7so2198872wrc.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 03:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=gDBbZsn12i+ojldFNczr8Of23PXYIeXCpM2H3D/iK04=;
        b=FZ6EbFkIcW6jr8snPaHFI9Dms4Ev0gBq6RonbN3czHMCv3InzgzxoyAU9oXy5OdXOS
         qHBESLB5ZnuDTkhNh0gO+jgeJDQv0WQ7bnqyAQvveskW6kq8xPr3B+L5dD2KpuEzSNmc
         UwofBSY+D+KDL/0J1uVLMtyV58RMnaMBV5CVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=gDBbZsn12i+ojldFNczr8Of23PXYIeXCpM2H3D/iK04=;
        b=GodfKSzajDYBRNMmcxS0oBRM0nfG8yqBSE6VbsUNRpjDBCO48PlLlBNAUPxv47GAyu
         fZD/cuMK9xWprMj4RwtuKKu5R4pb1Fp/KTpVRe0BckVZ8uKtdSKBKD4Qwp2rVNhceXCS
         k7PFbNY5MI9vOq100cP2m6x2Zd+4IH3NbKst1g0zT22L/R/1/AV4XDSwGbd/u4+s+e9R
         F4a8rlCrbmjWKaCQ6Sqsk7SgH6SfPwe+hQBX0JrVLjUV9ni4xPVXAdknghFKd6Wbzcn4
         xqILApgdlRoGoZN/+KSTFynODF32PRJDtXQ4IofiXtSqqi1L6+xYmQlAdrUnsi5qVy8o
         0lzQ==
X-Gm-Message-State: AJIora91wE0ZzIMPxJWqwWXZASPdMJ8Yj0Ep1Nv5UWjFKIHz30Qt2GDs
	F7SzNILFMM4e0eMsSqmuVzjbhA==
X-Google-Smtp-Source: 
 AGRyM1udOEiCXnPQ4SzKn+BUFAO3W/EANGRF88ToY2lJkJQZjfjtkeAn3qK8uRDie0BB1/6R2GaVZg==
X-Received: by 2002:a5d:55c7:0:b0:21d:407c:cf1b with SMTP id
 i7-20020a5d55c7000000b0021d407ccf1bmr1122896wrw.630.1656586337202;
        Thu, 30 Jun 2022 03:52:17 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f06b:8b84:2b52:384a?
 ([2001:8b0:aba:5f3c:f06b:8b84:2b52:384a])
        by smtp.gmail.com with ESMTPSA id
 l3-20020a1c7903000000b003a04962ad3esm2334291wme.31.2022.06.30.03.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 03:52:16 -0700 (PDT)
Message-ID: 
 <2dff7aa236f2afce4982074ab76d125dc16014f6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/3] V3 /proc/pressure buildstats
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Aryaman Gupta <aryaman.gupta@windriver.com>,
	openembedded-core@lists.openembedded.org
Cc: Randy MacLeod <randy.macleod@windriver.com>
Date: Thu, 30 Jun 2022 11:52:15 +0100
In-Reply-To: <20220622192105.2177756-1-aryaman.gupta@windriver.com>
References: <20220622192105.2177756-1-aryaman.gupta@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 10:52:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167410

On Wed, 2022-06-22 at 15:21 -0400, Aryaman Gupta wrote:
> Changes in V3:
> - In V2, it was assumed that heartbeat events arrived once per second
>   but on the Autobuilder, the BB_HEARTBEAT_EVENT is set to 60 seconds.
>   Hence, revert the requirement to restrict sampling only to heartbeat
>   events.=20
>=20
> - Make sample return a bool indicating that a new sample was collected,
>   and that the datastore should be updated.
>=20
> - Expand and explain why min_seconds has a tolerance of 0.01 seconds.
>=20
> While any testing is useful, it would be better if this change was
> tested along with a patch that caused rebuilds to occur.=20

Unfortunately I suspect this has broken the performance worker testing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/132/builds/427/step=
s/11/logs/stdio

Cheers,

Richard


