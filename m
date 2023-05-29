Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 255CAC7EE29
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 09:41:13 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.46163.1685353268520680884
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 May 2023 02:41:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=Z5+jv451;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3f6a6b9c079so19866415e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 02:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685353267; x=1687945267;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bzU3eoCLyOxPb9MZt/ve/7SnZOC3vy7Qo+7drSOPCBM=;
        b=Z5+jv451rjp0MPRrRuFPJgL6VtbJKYBf6eRb+dYSqcAxrXyjCNaooERgqzHac9ZNj2
         rgMEKwkoStzkqE9HBJWqBPGTF3L517BdHpgnDTm7+yemq87nj6lqL7cbCc0RnoCiB34L
         czl3McY1FG8jAQUT74YjMFEhvrQ6s45wLwaXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685353267; x=1687945267;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bzU3eoCLyOxPb9MZt/ve/7SnZOC3vy7Qo+7drSOPCBM=;
        b=SjAw/DMMO9K8Qn7+b2ZE8m91PyXRtfcXD8+57HZTrAtBct/j5nl7qDcMeC5pyIikoW
         2n5aFBp84hpp9v8+GPp9xsrhOVo3svH3GNyLP6K1obTs4CngS13xYC6aICO1N/9h4aUu
         QK/2N5aDVnsm8xcacyOk3O4hc6sAW10vbCBsZbZACqpGh/X1i/TGjmz1vqRZ3kYmMAAP
         wZKCaAMq64NERefxGmoD+w3sVI5E0zJz4kKqGsDmfm/px2JeIpJQb5rrCXye5f+900pb
         K7qyRuLaWCi9uivjWMBA9kZOkjjI6IwzvkEA1jASwSafU0KcWpRxPKrgdyUFs8TFVAZ8
         HjuA==
X-Gm-Message-State: AC+VfDxuqETc8kZ9BcDF+qMoTRUxyYs5MAf8NUlUpWRCxo/Lcl4IplDP
	boEE7/ccFj0YZzgUiIbKAjg6Og==
X-Google-Smtp-Source: ACHHUZ4m3Ku3czyFU1MslkOg2+s2WTzE4b81sO5SKRcrBSKqV4kU4wxReu9UzLx3oDgK8tFfuqp3PQ==
X-Received: by 2002:a05:600c:2208:b0:3f7:5e3:c1f8 with SMTP id z8-20020a05600c220800b003f705e3c1f8mr1042890wml.2.1685353266946;
        Mon, 29 May 2023 02:41:06 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ec8d:e49e:8d5e:e7d5? ([2001:8b0:aba:5f3c:ec8d:e49e:8d5e:e7d5])
        by smtp.gmail.com with ESMTPSA id u4-20020a7bc044000000b003f6f6a6e760sm7128594wmc.32.2023.05.29.02.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 02:41:06 -0700 (PDT)
Message-ID: <4f049c921da7f473f90d63205de9391b153db51c.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] sqlite3: Whitelist CVE-2022-21227
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sanjaykumar "kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC
	at	Cisco)" <schitrod@cisco.com>, Martin Jansa <Martin.Jansa@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, Marta Rybczynska
	 <rybczynska@gmail.com>
Date: Mon, 29 May 2023 10:41:05 +0100
In-Reply-To: <SJ0PR11MB671709960318A78D507DF394DC4A9@SJ0PR11MB6717.namprd11.prod.outlook.com>
References: <20230528055252.3869703-1-schitrod@cisco.com>
	 <CA+chaQeCpJ-70Je8non8KADuDk8SZzysN7KiDFNFDd3-dVY6sA@mail.gmail.com>
	 <SJ0PR11MB671709960318A78D507DF394DC4A9@SJ0PR11MB6717.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 09:41:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181858

On Mon, 2023-05-29 at 08:39 +0000, Sanjaykumar kantibhai Chitroda -X
(schitrod - E-INFO CHIPS INC at Cisco) wrote:
> Hi,
> =C2=A0
> I have proposed second commit to revertRevert "sqlite3: update
> CVE_PRODUCT" - Patchwork (yoctoproject.org).
> =C2=A0
> Once above commit is added on master then we don=E2=80=99t require to add
> this commit.
> As CVE-2022-21227 is detected due to above commit only.

My worry is that we keep going around in circles on this. Are we sure
the CVE database won't list things that are applicable under sqlite3?

Cheers,

Richard

