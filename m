Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.28610.1629975567732448094
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 03:59:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OjJsmXnF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id n5so4297845wro.12
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Aug 2021 03:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=x9RuzDocVPwvOKVqpBvAujgPFrDpMt2PjKKYv0nvZ1U=;
        b=OjJsmXnF8zdXD3rUVgDh4TM/nbb8FQcCiPMzHTYkEaV6PmGQoujOUwNnX6VQqNAR4q
         xahFq5O1fQVYx+P+rRw745pUxWjNzl96PabVTDaB9E3ysXKXXA8Po/Ybmf8ZnuZ4q/zL
         u8d0w5jqEjoBI+dubcCoHm5NknY/YMoeODMa4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=x9RuzDocVPwvOKVqpBvAujgPFrDpMt2PjKKYv0nvZ1U=;
        b=kuEr/LbjeW4cLawL/+T0W7V7vvYbv/pOZUOtvo0HNv8VGTVV3854CIFAKGZaOgZs7I
         W2s1FvnIcHaFsK5yhuErea5cxwveMnQ82/fjz8cdrVNhcR6gN5VMarHkey3fjLcf3Okz
         vr1domH/SpZo1MKLQLwwQkTJ6/wMb/tAVEOHQ8jlZUZLQWB8c4obExs733WqAzuj2LfP
         A1jieDpolEba8Yz/h5cqzquzWB06wWvk93IzrX1IgAsO5lDb/IJbkPLMSgjRrejGtov2
         F3Gc+mO0vYxWNIg6sGJUvJR/jJOWrAlTqRHOMB1mpNsvC6S9EnJkXBLIWYaDlhaBibS2
         6/LA==
X-Gm-Message-State: AOAM5337mmadT5gyMTivIgsYck7/mltcdp3uVBdeBr3XThSudmZQs0bG
	fyDCM3cMdHRojbrEqkhiJm8iDw==
X-Google-Smtp-Source: ABdhPJxYHPuscKmRmDp3kD3lYP/Nf7+nBviBlvlJ7nwx5/3HlpmWFYY0Azm5Reb+qEpEnUwj5PDKSQ==
X-Received: by 2002:adf:dc8a:: with SMTP id r10mr3055625wrj.371.1629975566179;
        Thu, 26 Aug 2021 03:59:26 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:a9d5:4a4f:480b:62d4? ([2001:8b0:aba:5f3c:a9d5:4a4f:480b:62d4])
        by smtp.gmail.com with ESMTPSA id j7sm7954339wmi.37.2021.08.26.03.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 03:59:25 -0700 (PDT)
Message-ID: <1b35875da7fb3481400f09bcefd532be90d098cf.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] vim: add option to disable NLS support
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Valek, Andrej" <andrej.valek@siemens.com>, "armccurdy@gmail.com"
	 <armccurdy@gmail.com>, "steve@sakoman.com" <steve@sakoman.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	 <raj.khem@gmail.com>
Date: Thu, 26 Aug 2021 11:59:24 +0100
In-Reply-To: <452907b1c72251c6a445882c7dea2ea2dc1b913e.camel@siemens.com>
References: <20210823101205.29267-1-andrej.valek@siemens.com>
	 <ce3005b3-6213-9528-2c82-c4f612f3b549@gmail.com>
	 <DB8PR10MB3977E6C2E704FF73707CA62492C49@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
	 <CAJ86T=V2zSGf3ebYWFh-2-QZ1w55Xsz+6nbkcR9jayh9ANyraQ@mail.gmail.com>
	 <DB8PR10MB3977DC6B069FA94E5EB4399992C59@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
	 <452907b1c72251c6a445882c7dea2ea2dc1b913e.camel@siemens.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2021-08-26 at 09:58 +0000, Valek, Andrej wrote:
> Hello,
> 
> Is there any problem, which should I fix?
> I would like to include this feature into dunfell if possible.

Autotools usually has a very specific option format and this isn't following it.
I know others expressed some surprise and I share that. It can happen if the
software is doing something unusual so it is possible but I wanted to go and
double check this as it looks odd. It may be both formats can be used and if
that were the case, I'd much prefer we used the standard format we use
everywhere else.

So basically this is held pending me doing some due diligence as it worries me.
I am however struggling to do everything needed at the moment.

The other issue is that nls is an option many other recipes have but we've
always handled it at the core level in the gettext bbclass. native recipes
explictly pass --disable-nls for example.

I also wanted to check if the recipe uses the gextext class (or should?) and if
instead we should be exposing the PACKAGECONFIG differently through that class.

Cheers,

Richard

