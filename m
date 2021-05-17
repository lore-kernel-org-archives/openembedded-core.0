Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.16761.1621245200007436983
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 02:53:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JfjEbR54;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id p7so1952092wru.10
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 02:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=a4zgB1HPECaWkevS3T8e6dOPJNEAt5usDy97dkUz5h8=;
        b=JfjEbR54RPvBZAzlT2BwVDuZJ5uxXc2xg6rtG3vZj1iWLkTE5C3Gz16xpjsjqIDddh
         D54TwYZivtkoQRRBzbNf58bXjoe9xh218XytVR9+vAPnAyyktO9VahyXpB8QSPlz5OE/
         +GYyL19Ywy39E95YUmGoSeHR8TgQuGsc6Uzyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=a4zgB1HPECaWkevS3T8e6dOPJNEAt5usDy97dkUz5h8=;
        b=hAewYEN7x1I7wzYWZktXJd+i86BlcSDQDDb9GD9E0Xf1QVPuqR6BXkk/iiz/rz5Lda
         WBAYbz6ERXeKVl+nXubuFJASTFhDxQBm9BgBFKaYYcs3S+cybDz9OOPDLCWiQIbh64A3
         /8+WgN28qmTMTq5OdbdxbLjINUSNmDrsEgrV3dHeqof7ONn61Oo60Ng1H8SoRg11GCz8
         M2DjErhs8/14djFT0TTaWBDkVbqp0Xjn75iruCrwSdjqI/Qe6v7tVw0IE6C0OTpj3nwY
         +yQ6qJ6ugVhWiL2o0RBqfLS59RztWa8+L6tGa83rJ/FNRatcCvAAR40Wog8K0Aj3nPBq
         F+uA==
X-Gm-Message-State: AOAM532FS0bDUhD2LYD1B2vSAvbPdOCKyBBsa/DbuJj4PHsOTYM3rbQd
	Tw1BncN2C2ZrdwpcIYXAVO0d0Q==
X-Google-Smtp-Source: ABdhPJz3GdZVUsEyhIVqJAjtyPRL3I7ktw9QOQGrm87cOi8Np9AGUMQ72arKY4gkYGN9OdOqRpScVA==
X-Received: by 2002:a5d:5409:: with SMTP id g9mr2832773wrv.321.1621245198461;
        Mon, 17 May 2021 02:53:18 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc? ([2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc])
        by smtp.gmail.com with ESMTPSA id f12sm10337869wre.88.2021.05.17.02.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 02:53:18 -0700 (PDT)
Message-ID: <fb1f1b9e5fa4c1ead03164cd81737057fe8a45db.camel@linuxfoundation.org>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 16 May 2021 04:00:01 AM HST
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org, 
	yocto-security@lists.yoctoproject.org
Date: Mon, 17 May 2021 10:53:17 +0100
In-Reply-To: <167FD0D97D07961D.29970@lists.yoctoproject.org>
References: <20210516140505.04552960384@nuc.router0800d9.com>
	 <167FD0D97D07961D.29970@lists.yoctoproject.org>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-05-17 at 10:33 +0100, Richard Purdie via lists.yoctoproject.org wrote:
> 
> > CVE-2020-35517: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35517 *
> 
> Needs investigation.
> 
> > CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
> 
> Still being worked upstream, no fix (available patch is wrong).
> 
> > CVE-2021-20266: rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20266 *

This one has been fixed in our code. Whitelist for the recipe 
sent, CPE tweak may be possible, they haven't accounted for 
the point release for rpm (same as CVE-2021-20271).

> > CVE-2021-25214: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25214 *
> > CVE-2021-25215: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25215 *
> > CVE-2021-25216: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25216 *

Should all be fixed by the next bind version upgrade in -next.

> All need investigation.
> 
> > CVE-2021-25317: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25317 *
> 
> Needs investigation.
> 
> > CVE-2021-29921: python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-29921 *

Should be fixed by our python upgrade but CPE entry not caught up. We can 
exclude, sent a CPE update or wait.


Cheers,

Richard

