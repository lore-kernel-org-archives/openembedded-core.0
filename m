Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42463C433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Oct 2021 20:58:33 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.24.1635454712089568099
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 13:58:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VKoQ37+W;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 71so4702431wma.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 13:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=4NK0ofBlqH0kKGwEsnPbziMJfp+LrnNl2mzYQzT7cFo=;
        b=VKoQ37+Wyo9JDCBG692Mwf/7O9+tOeIK/YILjAmfnKY/2kowu8OSYCy4hHjwh6eitm
         2nx29VJLVLK1WojcI0b7RlHTQfSG5NC0LwlXJH6pCcPjjjYOIFumInMXcTuu2d8qI6EH
         tS06WIc0Qcgg0YKK33YjrPL3JFMnkMuKL6RAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=4NK0ofBlqH0kKGwEsnPbziMJfp+LrnNl2mzYQzT7cFo=;
        b=NptD4vo33GKBA2xqTsB9+jKbcXCSVZwLUvW5U2xUcH4WHpvTwrZfU5mmDQ4FfN3gq2
         waxUQPStX91zZrhTUE3Gi3vbYtbF/NuwKktlW7oOZq8D9mE855uVxxgdbQ+veJ450Jca
         SM8w3eaZa1N6H1j1oPSTrH9qV6ZxlgQEP2Rnzhz96X2njbBYyHg0ryvF4EL8RRGMVV83
         SR0/MrQRXYMzPwqI6/4uDpOFGiwK9jErvvhUfGHX5jPhGidrnhOTu2vJC89nr0QBLEsX
         NMu3YrTsczdHrh2teILfX/7bcKiZ4F3by6dLmY4JFTVERla2VQboVzEKNIlnFNFSnvYZ
         s6tw==
X-Gm-Message-State: AOAM530KRXAMBL+9iNxj0Bjp1Kos3vwD4DlvvCPK0/6BpajByrRLWefa
	0hW8vF2x4p2NEu5ianamdGvmtQ==
X-Google-Smtp-Source: 
 ABdhPJx1ogN1YqVaJdvqEY5tF+tnHs4HGKvztmcV4YI5zXx9j1E1kKLroSXk7bTa3ja/UDc5O0upMw==
X-Received: by 2002:a7b:c10a:: with SMTP id w10mr7020643wmi.126.1635454710483;
        Thu, 28 Oct 2021 13:58:30 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f597:af8e:ac:d124?
 ([2001:8b0:aba:5f3c:f597:af8e:ac:d124])
        by smtp.gmail.com with ESMTPSA id g5sm1114381wmi.2.2021.10.28.13.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 13:58:30 -0700 (PDT)
Message-ID: 
 <5a8c05846279f160ee2d5fe7ef7502c29e1bfee1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/3] SPDX: Add annotations to relationship
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <sakoman@gmail.com>, Jose Quaresma
 <quaresma.jose@gmail.com>
Cc: Saul Wold <Saul.Wold@windriver.com>, OE-core
 <openembedded-core@lists.openembedded.org>, Joshua Watt
 <jpewhacker@gmail.com>
Date: Thu, 28 Oct 2021 21:58:28 +0100
In-Reply-To: 
 <CAGDS+nkJ4en5JjLGSMuePSQUY+mvLiek4X67q5Go+LA8307ApQ@mail.gmail.com>
References: <20211027013050.137364-1-saul.wold@windriver.com>
	 <CANPvuRkxEFt7LHO_BAnQpEWU=T9ctFh45d+SzFfe=jBHUOH1aQ@mail.gmail.com>
	 <CAGDS+nkJ4en5JjLGSMuePSQUY+mvLiek4X67q5Go+LA8307ApQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Oct 2021 20:58:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157605

On Thu, 2021-10-28 at 08:47 -1000, Steve Sakoman wrote:
> On Tue, Oct 26, 2021 at 10:41 PM Jose Quaresma <quaresma.jose@gmail.com> wrote:
> > 
> > Hi all,
> > 
> > There are any plans or is it possible to backport the SBOM/SPDX to the dunfell branch?
> 
> I'm going to yield to Saul as to whether he thinks this is
> desirable/possible or not.

The packagedata changes are pretty invasive unfortunately and likely not
something you're going to want in dunfell sadly.

Cheers,

Richard


