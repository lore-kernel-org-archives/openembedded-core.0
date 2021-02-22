Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.33642.1613995860911810204
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 04:11:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eG9341Cz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id n10so14121756wmq.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 04:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=VtmnfbFKDZ7GGSOiMQ9/lIMxspyylfszfTeXZHgnQFM=;
        b=eG9341Cz7lQZ3eECVVjotiyAlphsB/MGCGNWyAS/3YNCGJY/TEpR5cqovG8vM61LTe
         F1zpj4xjJFGhU/wGCamOSg+6JnAGWSIbM0w7QgT1lOrGHfoLWG0r8bn/crVcJceO8dOG
         A5cdBa4nT6tPJH2K/VFgsEjR9x4argjrckXdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=VtmnfbFKDZ7GGSOiMQ9/lIMxspyylfszfTeXZHgnQFM=;
        b=EiDqIGlUE5D7LnNGftQJqFvqGEpToPdOP3H9U4Y2BBQSSkFDGyVLESTYTUvkB1Uy0b
         j/N3vr/bTeqUFDBW3i0hPVsejMVdq/FCOn+JHP8Ago9aXRwQ/M6/dCG7niEDBlz6IxB2
         UkXLe2ymz2yQb+hJneuRRr72uONuhUpE+YZx944DlRt6wprOmI5SNl2IaxqPd+WSmD3D
         D7ManIJ6vG93O5n8UgPVL79MABcBMHXC89x2Awt3pePV7YXyDyf+BWXdU/bBVm6zZCW1
         o/vcvSDQxA3DWw2zxGPPCmBa1+xaGAw+kLjqNpFoKRraezFxL94eNKOwWKCCRzW8kpxg
         XguQ==
X-Gm-Message-State: AOAM530nEm3g/qvq1gB8cgq/8D3RMViqahfMNmUFBqDKsVfeQewNDTu7
	MmHvLo/mxeLiforXzswsgslawQ==
X-Google-Smtp-Source: ABdhPJx3/AN9yPevXsA+eeLsX54RCjpOzIFiEbwkmEYQytZchxHOsowh+t2IguGiWqr/XMaGyvYTjw==
X-Received: by 2002:a05:600c:410e:: with SMTP id j14mr9315940wmi.36.1613995859376;
        Mon, 22 Feb 2021 04:10:59 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6747:849:8224:46bc? ([2001:8b0:aba:5f3c:6747:849:8224:46bc])
        by smtp.gmail.com with ESMTPSA id c2sm28694044wrx.70.2021.02.22.04.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 04:10:59 -0800 (PST)
Message-ID: <a11def0a14d7abe4916213795cf2c469b39b6e42.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] busybox: update 1.33.0
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>, "Valek, Andrej"
	 <andrej.valek@siemens.com>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 22 Feb 2021 12:10:56 +0000
In-Reply-To: <6c3eae73-2ea0-6e54-3ee1-a450527f7d96@oleksandr-kravchuk.com>
References: <20210219220042.2384431-1-open.source@oleksandr-kravchuk.com>
	 <DB8PR10MB3977A450622E50F79787E7FE92819@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
	 <6c3eae73-2ea0-6e54-3ee1-a450527f7d96@oleksandr-kravchuk.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-02-22 at 07:46 +0100, Oleksandr Kravchuk wrote:
> I must have missed that. My apologies.
> 
> On 22/02/2021 07:36, Valek, Andrej wrote:
> > Hello Oleksandr,
> > 
> > Why are you upgrading to unstable version?

Could someone update the AUH regexes to ensure we don't get emails from 
AUH about this please?

Cheers,

Richard

