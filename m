Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8F29C87FCF
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 17:21:32 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.1672.1754587285276760261
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Aug 2025 10:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IN8IjB/r;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-af910372ab3so390654866b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 10:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754587284; x=1755192084; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Oi9yalmJwwiIoQydlItIjHgz08vMUQj+IkUs/DsvtNc=;
        b=IN8IjB/rQ53rfSMSFLFuGJfti5NjmCPtTl/bNMPTJg/HfkmeymFDLKSflTe1G9ooHV
         Ky7rEcndGojYhuAuiH1yCt/vvdVIxRDvuyfuNHl3PS/5PR+7E4yysh22OehbVjwW8pVx
         Fw/vymfbgFTJuTCzGuLreUY3KOb7H6cljWJcXwuULUI65a3DLlu+YqVQ6z0zG/MjASgw
         0J+EqqpED0ZFkxl08TYt6R9/xl0mY3V9/Ou3bFbold/xuj7/iF5Klo3Qlcjj/T1clwAX
         JTEzthnhLEJy8oJxZXqk8UxuiC7tTQn16ErDli7xARdwSWsvlkiCw/bRgOC1vJ49odRX
         O/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754587284; x=1755192084;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oi9yalmJwwiIoQydlItIjHgz08vMUQj+IkUs/DsvtNc=;
        b=b5e8bXnThw736Ti8W2NdVAtdWZbS04pEPV+NDw6Sd964m6IcpTwdI/LSc2xUClALiP
         lZT1hBgXfpeFW1DHlvkTtv91B8qsw2cSCFfoYfhDnE6CPiQ+AdijcfnS8matHH5xulRI
         gXuf9ZhATt3+uoP9NZKsDq26vaDsm3nb85FnbUVAoRddJYnggCuPDc0Rk54izRp+hkj3
         JLMPbKXpXz/dXXvEHo5it/b3LOqwWPJ/iq7BpIhfuNHHl9afbxRH2ZoRRBzsgp7HLNAt
         suB/Bh77LY1hFm9OWLTM83xpO23sANpjtaWF9Tng2XLpdwE1Ahz5FowLGfQyhtDfDBIH
         UYtQ==
X-Gm-Message-State: AOJu0YzIXZtFE9+nz5oChKvKrGX2hoA05j5MGTrtXHWY+4QrowZ6CuMR
	w2BMTu9ub8Kfz6Wlid242iAMpWpFekvScthcJQa8ad9YsPqImdAQge1b
X-Gm-Gg: ASbGncth90I2FxHka4FEBinqSi3AuM1e00PtNGR/KVnTE+7tRYm803+5ll9zMnyilzF
	rHgpaK+x3mitMNYyS0En6cWGWTiaUR95jCt+vvff5GHXSFeylmkPu+iB9jYdUPDF0FDsY85ESjG
	HSnBE08ChBulP1m1j0ZoutyHqB7jZuqiojxsI7GbdKRlB7fLuWIFiKosBO889+aJOe3EX1Xq8iz
	0A9waSWJkDp19JcmEsZ0oUc0+n8bcudtPUTPuKLQXTNxCpYrUGfhnbpKqhjmkZKt1Qi2xKkq5Uy
	VCG9BXQYxnUOIv0uwisv7nHe6uvA1h0jRO1GMONH9xXs2SD/k7QX1HfHjumIW4A4SL24q1QIKTn
	regcCz+lh7uGvnOBHxpe71nM8nLN/lkXyHpG/dWOZ
X-Google-Smtp-Source: AGHT+IHyUhSCcJEth++1eHf8/aML0RqdP/zwW8fMCgonJsD66pz5NAnqYkdJm3rwEHMbdA86xKQkbQ==
X-Received: by 2002:a17:907:961a:b0:af9:6d09:74ab with SMTP id a640c23a62f3a-af9a3eb04b2mr391873966b.25.1754587283210;
        Thu, 07 Aug 2025 10:21:23 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21ac0asm1336161066b.99.2025.08.07.10.21.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 10:21:22 -0700 (PDT)
Message-ID: <8ceb5385-6c7c-4b2b-88c6-5e0cc73434e7@gmail.com>
Date: Thu, 7 Aug 2025 19:21:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] webkitgtk: upgrade 2.48.2 -> 2.48.5
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250803073541.2210769-1-skandigraun@gmail.com>
 <CAMKF1sr2zYyuzewOE+miSNdfpE2haU4iAbybpzmxRvXtX6pGbA@mail.gmail.com>
 <69f256e1-0ef3-4212-9e2b-f141de7ea2ef@gmail.com>
Content-Language: en-US
In-Reply-To: <69f256e1-0ef3-4212-9e2b-f141de7ea2ef@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 17:21:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221571

On 8/7/25 12:41, Gyorgy Sarvari wrote:
> On 8/7/25 09:01, Khem Raj wrote:
>> Not a blocking issue but Interestingly it fails build with
>> clang/qemuarm - https://errors.yoctoproject.org/Errors/Details/874909/
>>
> Hmmm... will take a look at it.
This doesn't look like clang specific, rather arm specific issue - I see
it with gcc also.

It's assembly which I'd rather not touch - I have added a patch to
revert the breaking commit, and filed a bug with the project.
Thanks for the heads up.

