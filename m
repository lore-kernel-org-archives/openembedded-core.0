Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D93C3DA7F
	for <webhook@archiver.kernel.org>; Mon,  5 Aug 2024 09:41:46 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.4365.1722850903037730375
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Aug 2024 02:41:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QjNubj5w;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-428e0d18666so29855575e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Aug 2024 02:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1722850901; x=1723455701; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihhRqqxscul7Lv8zAj+Rwwf3mJOA40nrbKnHZ4Nv5KY=;
        b=QjNubj5wfs0eA3YB09D+QDLqcTSFxuBh1OsN5ki1k5jHPEzNZ4impafZgh4wwq+G1k
         vnob/4jiW/O+XBsjSp1ZgxdDJprmaINWA5l78AjMRC9tnUBFEZkWHF9lW/lnZjzbPP80
         RVZBx/OByr+hBy5ZrytftmGfqpOIToM7D5DSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722850901; x=1723455701;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ihhRqqxscul7Lv8zAj+Rwwf3mJOA40nrbKnHZ4Nv5KY=;
        b=a1xcbIglqfX70W1Ue4wcCXCrbTPCZ5hkXmGn+WVCHcYTBRmB95YiHEejrOVjkFpKrL
         CO+pQ7yqD5aEm00dXanTXYlhCj9zAjj45gJGccFWzCeI28AMAxzboRiwNgiOyTVhnvz+
         BYr+ND/qcP6AJtGmZm17PCegNaIWVQ7AicttImEy7tio50soOp9zvahbhsHsNxhZ2Bnn
         LlWdmvhLmJBaHFPSojpiI3iNODNAwesiphnPH1GDHfcTWHdD24wzTHqdY9Odza2+Utxo
         o7gv9YPwWifaY91Y0SekdD/Cung7uY2QgRIFH29R/2LLkAM0ay8AswWolxBdJGuEcXQl
         oHBg==
X-Forwarded-Encrypted: i=1; AJvYcCWXY2OpI5qHWJV6tfVSlObmig5QUO4dQ81YQEOxyoqokEdtB90dWaQT/K1dJe/RhaDHuWLTNGuIstbli5QL2hdaQ8ca2CpBT8clnBMOddtFttuRfoDtEiqJ
X-Gm-Message-State: AOJu0Yz2lQ8qrnBTkhxSajTJYkV3plByIgeQonbOkqMDIaEyEnvnWawa
	5HbelC9i1bmGi+0DixZgFBXM5mEs2T8LhlqUiz7UVGGzPdJO52fpydRj8xKpUys=
X-Google-Smtp-Source: AGHT+IG9fpnfn1eW6LnNlAFV7Xu7X2ISDi/2JO9ZxX5Ov4Ah0faH4x9tryRFaUuBrDcezE5z3fn0qg==
X-Received: by 2002:a05:600c:35ca:b0:427:ac40:d4b1 with SMTP id 5b1f17b1804b1-428e6b7be88mr75164055e9.27.1722850901280;
        Mon, 05 Aug 2024 02:41:41 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2d5c:bc31:7e94:c26e? ([2001:8b0:aba:5f3c:2d5c:bc31:7e94:c26e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbcf0cc83sm9361814f8f.1.2024.08.05.02.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 02:41:40 -0700 (PDT)
Message-ID: <098b11a557f7e76a341a2b2f465dbad896a8f513.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] binutils: Upgrade to 2.43 release
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Date: Mon, 05 Aug 2024 10:41:34 +0100
In-Reply-To: <20240805044317.4104470-1-raj.khem@gmail.com>
References: <20240805044317.4104470-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Aug 2024 09:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202989

On Sun, 2024-08-04 at 21:43 -0700, Khem Raj via lists.openembedded.org
wrote:
> Detailed changelog [1]
>=20
> [1]
> https://sourceware.org/pipermail/binutils/2024-January/132213.html
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

pixman failure on beaglebone so far:

https://autobuilder.yoctoproject.org/typhoon/#/builders/106/builds/8313/ste=
ps/11/logs/stdio

Cheers,

Richard

