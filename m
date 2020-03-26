Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.36336.1585228081183987689
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 06:08:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=PEdTFYDg;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=rbqv=5l=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48p4zJ5n9Zz3Q;
	Thu, 26 Mar 2020 14:07:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1585228078;
	bh=A0tUEtY8ln9JMWtfkS2xYMOw9xBli6b69dJVcIl72qM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PEdTFYDgTjyveQn+pud0+nhQVMwuTJV295gRpYgZEL4is3HxMFCdSo7jZeagabmke
	 fAoAr+mzKEPo3b5g2OoKU4ZcMzdeT3plfFvsOFtFXWdqCEBNw4YK9lRiWDo+zRaO2H
	 Qrj18URmlyR1ozJno1pky46bQiW3F5tAJFRg8fddtfUKBy+7c18Gt3tj4Y5AW07Rla
	 Wj5LRuodINEbxH7pwDJ+EjEMJXZ/8CKwkZEpW/4W+0gpc05EVmcL2aXW5oJsgO/BEa
	 LOqXYVvDD0eLRlwBJhmSf0HmZP1s5Ov6wrgKYMcNVba/txm/lJOy68ToKdaFQxiHxz
	 qbdbwmjvtx3TEDr6chlwH+afcV3vCINfBwu4hBvouLA12ByNBmI7AHJpjTVa/qwiTR
	 QTgbasLmrR2FRa7gAPkY/kQtHVelzj2fVYVJBBPv9kpudhTmceKsOgXcQXlam+aOYh
	 Upqex6D8q8sxlGRimXm1WyEFq4LLKQrp4X36KagZ8qsp8B5Oa+w2IflXmXRN0yZ9PL
	 LiAp36IpVjPI+KodH7vJZ/tMHezO5pNx3pi1e4IABm5jvpjWVIcQErXW14H1ZH2K9A
	 /ZrTlkk8uZJ0UsoOyUYywPhcS5dW2q/Wy4iuavPORZDenJody5RbHJmWT0nP99mzhj
	 ellYcP/KJfEW423Pw2FqwH1M=
Date: Thu, 26 Mar 2020 15:07:54 +0200
From: "Adrian Bunk" <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] glibc: Backport patch to fix ifuncs on risc-v and gcc10 builds
Message-ID: <20200326130754.GA17705@localhost>
References: <20200326062919.1929050-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200326062919.1929050-1-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

>...
> + configure    | 2 +-
> + configure.ac | 2 +-
>...

This shouldn't patch both.

cu
Adrian
