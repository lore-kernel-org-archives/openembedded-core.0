Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.529.1624914916626209564
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 14:15:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VK8c/Nh5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id b3so22950173wrm.6
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 14:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=KKsKK+LPtwzOLWO79ACr3lCM6b9LSF5nMGbef/GxSJs=;
        b=VK8c/Nh5kYDeIChjW4JxbpjmrI7bYWQO3V0GWkbum/Nhuoxqdv1Q5C2hShxGH4QvsM
         miiE609yukhZo/rnU4loRUgKxdfjU8yyZsrUOp1Gxsn440BF9FE1H2e883AVPDhaB42F
         qdFB208n7rvcTG7+LR6onwpfS3/r7n3UUlpms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=KKsKK+LPtwzOLWO79ACr3lCM6b9LSF5nMGbef/GxSJs=;
        b=Z/puz8HAxoFP5Br7ggIqbCLAVTri/YB960UQGgSK+SBjQlgat/vui1Gco064ep+Ps4
         JOpx9pSJD3AhDt9+LB6oZKEqgxGzaVnAiB77nwTluq8R2lJGGAl70Mg2dYpbgofkRCxJ
         Ufjd/+8OuBdeiMmBj+5AogM8hystf2kdNEcZE9IMxR1L4Vp2XzpYHI3RmZz9dcYgUX1q
         j+VW9bt1vn8W4D1oFrgKJmZswzajhn1cGPMKvAOLpiK3v6bFlxbyTpz8N5e6AJ30RSxP
         0VxpAERTiRqGupOg5LkkKhrW91jeSdW0AmQTg+RsR1L9Wglu3gdZPaLtn7zincKbBuYb
         mngw==
X-Gm-Message-State: AOAM531FlfgyRhZfFDzY2fkx054y0axQ/jhRRczJf0IxxPd0kNPoN1zW
	TKdo6zF3jQSL2sTeziE6jOkd1g==
X-Google-Smtp-Source: ABdhPJwOHFpmUuyRqw126+Crbhfx/uZrtKvnS0lXwxJcBy6wrDZIobQbKaoXgSskxX3NigQdFDmZwA==
X-Received: by 2002:a05:6000:154f:: with SMTP id 15mr21282377wry.208.1624914894901;
        Mon, 28 Jun 2021 14:14:54 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e4cd:1977:5709:51f0? ([2001:8b0:aba:5f3c:e4cd:1977:5709:51f0])
        by smtp.gmail.com with ESMTPSA id n12sm7746999wrs.12.2021.06.28.14.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 14:14:54 -0700 (PDT)
Message-ID: <3b78ccd543f08e049c99c955e3e9543b74ca7016.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/8] PEP8 double aggressive E401
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Persian Prince <persianpros@yahoo.com>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Jun 2021 22:14:53 +0100
In-Reply-To: <dac32a25-a656-d59b-d9f7-ad7474dc4ef0@gmail.com>
References: <20210628055915.1107-1-raj.khem@gmail.com>
	 <CANNYZj_27HL2PMRW-2E5sf+LjBCL_gKQQbyu5ogvE4NsnTWZcQ@mail.gmail.com>
	 <CAMKF1sqdn9E--goYuo3qNAT0-DMT25dSyFZvb1Sxmq_eGn=A-Q@mail.gmail.com>
	 <CANNYZj9QZ5sojh=-oB_RRrbYoyxQ7JE_gHz46QYXWdRERwNMJg@mail.gmail.com>
	 <1709447933.2675529.1624908347132@mail.yahoo.com>
	 <CAMKF1som60jePF_rDsxL23364L55uTU5GejodiTY6amNbp1GpQ@mail.gmail.com>
	 <CANNYZj9EGpuL43yGADeGXfjhhGB8EnghfzC8Zee4N=gUdBi4Dw@mail.gmail.com>
	 <dac32a25-a656-d59b-d9f7-ad7474dc4ef0@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2021-06-28 at 14:08 -0700, Khem Raj wrote:
> 
> On 6/28/21 12:47 PM, Alexander Kanavin wrote:
> > I just generally disagree with the idea that changing a = b to a=b, or 
> > import a,b to import a\nimport b helps readability or reduces confusion.
> 
> I understand that this seems change for change's sake. Consistent coding
> formatting goes long way in improving quality of code and reviews too. 
> this also help folks who are new to project due to it being a familiar 
> format.
> 
> > 
> > I'm reading a lot of python code all the time, and never once have been 
> > confused by inconsistent whitespace.
> > 
> > Can the linter fix anything else, which has actual benefit?
> > 
> 
> linters always find interesting issues all the time, however the payoff 
> only happens once code is clean enough to run them. otherwise looking 
> through tonne of issues you want to ignore is manual effort and can not 
> be sustained.
> 
> Persian Prince,
> 
> I think it would be better if we have a selftest to run linter on AB
> to have this effort sustained in general.

We do have it run on the AB:

https://autobuilder.yocto.io/pub/non-release/20210628-15/testresults/oe-selftest-debian/pylint.log

We disabled a number of the warnings we were not interested in and haven't
had the time to investigate the other more important issues it flags (as yet).

Cheers,

Richard

