Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.9627.1599059186211032399
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 08:06:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CrLzdguK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id w5so5619176wrp.8
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 08:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=byY35K0viL7OmRo39hpMEskZebSHL20Grc/WdxsS51Y=;
        b=CrLzdguKxWbOCyj0TUdh5uM25JedP1XnEcbZYUFLLLorz3doZCLq0CnRynjYECWfma
         8ax5t6a7lqPbfp4WdUQ6tOG6dOrPm07vv/f9USk0qyj6kvAN5XlwHyFXW+iC4xYq5ZhJ
         eIgceTIJnuTWufOtdTGpsTTP1ZD6KMiADpBeY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=byY35K0viL7OmRo39hpMEskZebSHL20Grc/WdxsS51Y=;
        b=bfYBrPcL0SStDo+/mt2RQZB67NYzF+/SJNaX3On1tGMSTfjKG1fe8PjV3uITo3POtD
         zSInVVslDRAEz85RFqvic3ebiRdqaJq8MpKsoBDWY1EUro9b+YaniN/6hxer35qKabIr
         litbmwThKhtttKYB3FaJI2TiyvBBuEojVEYkY9PXu1pxslijCm14OaU1GZvvofoiTSf6
         N8Zz4RQ4dTx2YflQDWqh/0U5wa+BYx+qahq6XaJpN1Hfg1gvTptelWpXcqdae/U/EqvL
         EF23xEVk72eeFfeCiRiCNaAWSWtZpM77JGdYMt6EXtfc0q4JIRXYxxEGoYPWM2BYz+dM
         IK+A==
X-Gm-Message-State: AOAM530iRQmBW05wU/SfH5ohaFTy5VTzh5mLmxgDEXGaP5mF3DYgm3fn
	eekP+KzRmrJU0GvCPo2gFBuQAA==
X-Google-Smtp-Source: ABdhPJxNK9b79atieeghTGZY9VXsvJhrZkCBimH11+DFhborsVII/zdKVubI7AiXPO8CU3/R23pYYQ==
X-Received: by 2002:adf:ce85:: with SMTP id r5mr3688150wrn.205.1599059184522;
        Wed, 02 Sep 2020 08:06:24 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.a.9.e.c.f.e.5.5.1.2.c.8.4.d.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.a.9.e.c.f.e.5.5.1.2.c.8.4.d.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:9d48:c215:5efc:e9a4])
        by smtp.gmail.com with ESMTPSA id l21sm6734677wmj.25.2020.09.02.08.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 08:06:24 -0700 (PDT)
Message-ID: <64138ca6bde750284eeb6ea6db429ae5137ff780.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 4/8] dhcpd: move from meta-network need a client
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, akuster <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 02 Sep 2020 16:06:23 +0100
In-Reply-To: <46ac639e-669e-7b36-1770-9d2049ea1904@windriver.com>
References: <20200901152236.9377-1-akuster808@gmail.com>
	 <20200901152236.9377-4-akuster808@gmail.com>
	 <46ac639e-669e-7b36-1770-9d2049ea1904@windriver.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-09-02 at 09:38 +0800, Chen Qi wrote:
> The title uses 'dhcpd' but the recipe's name is 'dhcpcd'. [Patch 5/8]
> also uses 'dhcpd'.
> 
> One more thing to confirm. We are using dhcpcd to replace dhcp,
> right?

kea replaces dhcp-server, dhcpcd replaces dhcp-client.

I tried to fix the naming in the patches that merged.

Cheers,

Richard

