Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.9857.1603276878104991481
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2020 03:41:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XhaIkQ42;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id e2so1549164wme.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2020 03:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=csG296/3W2aJLvxL7hEcb2sIYB2itJ6gYGkTDQZCjSo=;
        b=XhaIkQ42twARP+tBI60SZjvFbTbHbTrzRdfICKfpIacKJNgbSoqWn3R8QuApjygsbq
         HWybMjS/+/p7fPrJQGYn3aNfX3pZGaDF/9BMStniCuaHXOoUO3w4eRJpgxgNI0/UR70D
         vrXRuILgcl45Vxp/N0oRWyVJ3FygdqEYAwy+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=csG296/3W2aJLvxL7hEcb2sIYB2itJ6gYGkTDQZCjSo=;
        b=qO4I9D/fQJCqdGNL3xBLvYw8S7coxQSuSI/wfpcL+FQPALECjuFXjF3P+PaHtXPRSd
         sV+DqQYNG85CLv33mLG5FsVaNjSQgSa+OuiRZe99R2qLp+hNKGZXZiT0EV9sE2Ewj25R
         Pyt2QPTcHNyTTAXbfq14Yn48TK/JMmbk3MgTfaEPQux1Dkqtwxrkjb56COMPdozDnguO
         /6eajSZtk5UK6RgQCIV+wsPbMZuTS2NUNkqFqg4awcYFoIeyKSGGH9zNkswtiL6WEh0K
         iB0+w/vHqqhpWP2h2CekEwM2TlQuigcTt4iyWbUHwXQkvRgwsUhJUF48Ve5vnSLt3uvF
         BDYQ==
X-Gm-Message-State: AOAM5308qLzrBVM0Z+zyLDuuSTqyPVCUfsnz7vDjzEY2kzRaPMQomCmj
	17piLC9lK43gJDLn7svGkPPo6w==
X-Google-Smtp-Source: ABdhPJycuEU9btEVAnWCsIw8A3xMcOdkFV1YXLJ0F76trZtV5N4vwVS/MrfX10wO35RbHewbVlexDg==
X-Received: by 2002:a1c:bc55:: with SMTP id m82mr2746868wmf.159.1603276876525;
        Wed, 21 Oct 2020 03:41:16 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 1.4.2.6.b.f.7.8.7.6.9.2.8.f.1.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (1.4.2.6.b.f.7.8.7.6.9.2.8.f.1.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:f1f8:2967:87fb:6241])
        by smtp.gmail.com with ESMTPSA id c21sm2584964wme.36.2020.10.21.03.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 03:41:16 -0700 (PDT)
Message-ID: <c1d1aef4a2b900c727360463d929730d671d7f81.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] tcl: adapt to potential psuedo changes
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Martin Jansa <Martin.Jansa@gmail.com>, "Yu, Mingli"
	 <mingli.yu@windriver.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Oct 2020 11:41:15 +0100
In-Reply-To: <CA+chaQdwgNY7j6xBzzgeYXGv+V=BqiAxuy1_OovZTN88Bc7wbQ@mail.gmail.com>
References: <20201021092401.41424-1-mingli.yu@windriver.com>
	 <CA+chaQdwgNY7j6xBzzgeYXGv+V=BqiAxuy1_OovZTN88Bc7wbQ@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-10-21 at 12:11 +0200, Martin Jansa wrote:
> There is typo in the commit summary and doesn't base.bbclass do this
> automatically already?
> 
> See 
> https://git.openembedded.org/openembedded-core/tree/meta/classes/base.bbclass#n396

I think the issue is because the recipe is setting:

S = ${WORKDIR}/${BPN}${PV}/unix

but we want

${WORKDIR}/${BPN}${PV}
(no /unix suffix)

in the ignored paths so that code won't help?

Cheers,

Richard

