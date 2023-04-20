Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 207C7C77B73
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 20:11:46 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.1658.1682021499164847859
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Apr 2023 13:11:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=HMr2w+K2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3f1738d0d4cso6522755e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 13:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1682021497; x=1684613497;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZDPSkcWwIv32eJLwd0PAJxT66K4cgjYNBICAwUKoHC0=;
        b=HMr2w+K25ARQeHZu+R104l+FQbU+2Y8xrDI8saVe74qnjzN7mUoDjNffj7C0V3/EDi
         A+QVd8rah7cyzqmauzkiXWU+nc8il/PDZepPA9gYuAxb1TNTl5H+shZ/nCW7KnQVsZ3z
         NRHsy2vh3QJ1l28PBM/BuSwhqyENYTrlgbD2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682021497; x=1684613497;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZDPSkcWwIv32eJLwd0PAJxT66K4cgjYNBICAwUKoHC0=;
        b=HTzizdVqng9JOnT3SL3UL3ovx2lFJw9LpdQRriAZSS7qQCLnGUSVUdtMNW4aDHh9M9
         Pohtdp75sa8wYWnMomtMtKBCdGutVQNfzpl5gdIonW7956iA06a9uRRRbWPaazsTcGZR
         NkDLMhRzrzY43/mtv12v6TphDX6rrT866VHJCQfM3sXBKYI589CKjC17lYyH0hqq+6Gq
         tElYnPQabxjs5ZKuJ6rIrOQS2s6UIZKr4M7wv+8XoEwCsT47F9JmcmNRL9VTahPKVb2W
         Z/fjrv6FaGcKLcBH7ZrynqywZAX7k402ckaDFPMl5OcrULnA013FRZodGPMp1SK72L2s
         M3MA==
X-Gm-Message-State: AAQBX9e9+MIg4vQk0YRNylp4vd63aGdreVpawX/+qgP+mcFvvBTnVSfi
	nuM1moNe0AenT6+aH45lbm/pvg==
X-Google-Smtp-Source: AKy350bDbTS/m1kgCWJrHWuEMtbRlaX1zHqY285qvL3aWnahpcEHoOEWFZqK5U1mbElbfEOO1JJ2Aw==
X-Received: by 2002:a05:600c:acc:b0:3f1:6ef6:c9d6 with SMTP id c12-20020a05600c0acc00b003f16ef6c9d6mr84217wmr.32.1682021497464;
        Thu, 20 Apr 2023 13:11:37 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:10d8:8852:10bb:43b4? ([2001:8b0:aba:5f3c:10d8:8852:10bb:43b4])
        by smtp.gmail.com with ESMTPSA id v19-20020a05600c215300b003ee20b4b2dasm2873721wml.46.2023.04.20.13.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 13:11:37 -0700 (PDT)
Message-ID: <db555f3f6c09c4576358846cba9e64d055422e59.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] openssl: set package level PERL5LIB
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Yang Xu
	=?UTF-8?Q?=28=E5=BE=90=E6=89=AC=29?=
	 <Yang.Xu@mediatek.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Apr 2023 21:11:35 +0100
In-Reply-To: <CANNYZj-0u9XVkCVHT+WjtFkQ_nYg9i4OUj311wK5GgRhp7ZZfA@mail.gmail.com>
References: <20230420052442.16443-1-yang.xu@mediatek.com>
	 <CANNYZj-C8ujMnqkZqyU8rgAF+rJ9Bwqc2bOLkuGu0d0cJpXfpg@mail.gmail.com>
	 <90b1e25cde406898154a05d03babc739120e643c.camel@mediatek.com>
	 <CANNYZj-0u9XVkCVHT+WjtFkQ_nYg9i4OUj311wK5GgRhp7ZZfA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 20:11:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180257

On Thu, 2023-04-20 at 19:20 +0200, Alexander Kanavin wrote:
> Thank you, I understand this now. I'm fine with the fix, but can you
> add this additional information to the commit message? So that it's
> available in git history if anyone needs to understand it.

I think there is something additional we need to do. If the path
compiled into perl breaks when it is installed from sstate, we should
make sure this path is *always* incorrect. That way things will work or
fail deterministicly.

Cheers,

Richard

