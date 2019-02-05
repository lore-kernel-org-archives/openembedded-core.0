Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 205487C2E9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 15:12:38 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z3so4037943wrv.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2019 07:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=ymR0ycunQHr0TXt0n3slIdIiNqReXCDOfVIdHPJ141Y=;
	b=W7a9xkQkC7wV166+WM5s+I9dToSM9rc+ihtcliC9qEmlRLS7DhsWEWo8iQUcJJz88/
	likNh3XGxoEvHiGTf6fASJvq7lQdE9jHSHyXkU1nybPDHNGQpQ1VaS/zki9+IzFp4j3R
	9wFgdn6RJ0wHQ8tXfP4YQ6eTYP979k7Fig9z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ymR0ycunQHr0TXt0n3slIdIiNqReXCDOfVIdHPJ141Y=;
	b=GtfkGsYNtNHldI7r/jcSN0J3kq+fEFR4PnPpMX5xZzCnIshJhhXy0TVzvcJ1D1cPlS
	3g/tFEt+cjiWeEMYIKhUuPGoREOP3NMHzeOtfJIVvmt0yhOgppyNAZB9xTeJROtA4+Jk
	RnBrN3YhOADNv8U8HhXAJZkSVSeQ4hQGWmaZWrw7VE26jebvcFCeO9a6Fdl24TdviGmd
	5hASFhaW+rEyLD310Lu/eoVD/J8Ew9QsZ5j/9uy623I2Ed0PcwiO8HnFk47GwjUoDScN
	Uo2nHAaxJQ/+y11S6duLQZb0Kzx3+ApGEO8KtpfM88V66VJ78/bzJUptf9LqLrPuqMZl
	2crw==
X-Gm-Message-State: AHQUAuYoT1NMjnxa8n0J641Eze+5tegtN/rlBOusKNXyoHV3E/mZd6tt
	L99ZKc/VjFLG/XIBjK+7nNMCkA==
X-Google-Smtp-Source: AHgI3IYVYDsiVnrWy6qtB3mZj2CS/x3fTUXhvuy24dEtfbOg1nptEi1AjB4cf5/JVAi4HH+A99EDnw==
X-Received: by 2002:adf:eb12:: with SMTP id s18mr3964363wrn.120.1549379558731; 
	Tue, 05 Feb 2019 07:12:38 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t63sm11232129wmt.8.2019.02.05.07.12.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 05 Feb 2019 07:12:37 -0800 (PST)
Message-ID: <c063995d478bf52b08936f2e70caa754d30f97ba.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Tue, 05 Feb 2019 15:12:36 +0000
In-Reply-To: <20190205025727.1937-1-raj.khem@gmail.com>
References: <20190205025727.1937-1-raj.khem@gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/6] arch-armv8a.inc: add tune include for armv8
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Feb 2019 15:12:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-02-04 at 18:57 -0800, Khem Raj wrote:
> From: ayaka <ayaka@soulik.info>
> 
> There are some addtional instructions apart from bare armv8,
> also there is armv8.1, armv8.2.
> 
> Most the processor would support crc, except X-gene 1.
> 
> Signed-off-by: Randy Li <ayaka@soulik.info>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/machine/include/arm/arch-armv8.inc  |  1 -
>  meta/conf/machine/include/arm/arch-armv8a.inc | 28
> +++++++++++++++++++
>  2 files changed, 28 insertions(+), 1 deletion(-)
>  delete mode 100644 meta/conf/machine/include/arm/arch-armv8.inc
>  create mode 100644 meta/conf/machine/include/arm/arch-armv8a.inc

Renaming the file when other things use it causes failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/256/steps/7/logs/step1c

Cheers,

Richard


