Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.39676.1608558800289153733
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Dec 2020 05:53:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=csVlAI6+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id m5so11106576wrx.9
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Dec 2020 05:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=+fDbNwUtLaAWGha/i36ulwunzyO+gOnF1HejXlQPaCM=;
        b=csVlAI6+OooVlD+biUNQKmtx8FyCBiof6jo9kiUhDRj8wBuY5ZmsVCo4U9+Z0v62Yd
         OMduQ1JkLpL26NFt3lAALa5VoJCHVlhxJK/sTiDlclcs2joVYJ6U21g2Cd6eBdxdrE5O
         1BcN8bYXYngxfo0JSJQ92UIJtuEynanNYloI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=+fDbNwUtLaAWGha/i36ulwunzyO+gOnF1HejXlQPaCM=;
        b=kU70Q3+NeuVdRULU6c7Qs1UIYmrraz6DxHXtk3rNnpWPyZCcYzEKJMw5V6qFEpayPf
         e0Hjy8utuRBHt2DnDlBMvjdr2/BzQIPXttUch0qz5mBr0+EsQQeX25Qv9GNlVuv8gjwN
         zYB8P24qV6blZtGmJnj0H2/Y6hVEBKZH8c2rkta7N4HwV8BhQ5vw82Hbu0BgXaAzIRbl
         zSlTBQapFauhv1Rc8vIYu0JL4TNTfB1TTuIDXv0swLJVz/ZfkXvBfKzNLnxsLcJAx4rj
         l0zeJM+sjEDSACYhiq20QmmQYERyagqxCfocRqj84dUf8EpMYhneX50vgmr8Yc4e1uR2
         lm9A==
X-Gm-Message-State: AOAM533xKtSI7nbfXnixGr2dML7LgpHy1onJ6waWwCXrWPAqGxX9SpYE
	QHgoYoRxvoQmtJ37tNS6s11ui4F5AyPaXw==
X-Google-Smtp-Source: ABdhPJytK9MIreKXVHXCmdYDf8+lT/PZcYH9us8B019oywUk6qxqsk16FOn9BZQuRddEb5bvmr+EGA==
X-Received: by 2002:a5d:5442:: with SMTP id w2mr18649852wrv.418.1608558798961;
        Mon, 21 Dec 2020 05:53:18 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from b.b.4.9.2.e.e.0.9.c.7.7.e.d.7.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (b.b.4.9.2.e.e.0.9.c.7.7.e.d.7.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:67de:77c9:ee2:94bb])
        by smtp.gmail.com with ESMTPSA id u66sm23573278wmg.2.2020.12.21.05.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 05:53:18 -0800 (PST)
Message-ID: <68ef4c5466269bd5d8699e6be0481cfb2cdef478.camel@linuxfoundation.org>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 20 Dec 2020 07:15:01 AM HST
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org, 
	yocto-security@lists.yoctoproject.org
Date: Mon, 21 Dec 2020 13:53:18 +0000
In-Reply-To: <20201220172411.C95A0960256@nuc.router0800d9.com>
References: <20201220172411.C95A0960256@nuc.router0800d9.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2020-12-20 at 07:24 -1000, Steve Sakoman wrote:
Branch: master
> CVE-2007-3387: cups
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-3387 *
CVE-2007-4045: cups
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-4045 *
> CVE-2008-1033: cups
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-1033 *
CVE-2008-1374: cups
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-1374 *
> CVE-2009-0032: cups
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2009-0032 *
CVE-2010-3702: cups
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-3702 *

In case anyone else is looking, I've marked two of these at
inappropriate in OE and asked the CPE have version restrictions added
for the other four.

Cheers,

Richard

