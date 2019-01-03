Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3F4E871A8D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 13:59:16 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id r24so34874752wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2019 05:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=1hpjMb1ckBvoaZ+MpBq0FmqzucnlxL+sMKU5yKriZQ8=;
	b=OAqS29JWego9MT+7LqN2/yVPcSKtZiBqh21DLiFUDYjRUZWrNqoSmdI0Ftt3FE5YLG
	ZUd2jx2Q5FYH4+W+l5fKJ889e0ewJi1IYLG33tMDnJjVF8MP4g5COUPx3V9oabsuLNCs
	wTAkh7V/OTuTLhOuZdyWVmauhBFU1AFdkNM3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=1hpjMb1ckBvoaZ+MpBq0FmqzucnlxL+sMKU5yKriZQ8=;
	b=i5JKLSn+aJ66qJ4IgXHYaKjIpHYHU3ivQnMCnU3OpJNZQFWzlG4OJdNZATrrKYM2Kh
	5KNEwKw2LLcHZsyZIW2Lo0s7C9UycHUNWSkb2RDpALmvNCwgkNK651f6EwQFPNBt9uj8
	rm95EUwyGq7eeRykZ86v0GUDeyjd+Kx5EHRE1VTBP8Nc8U15C+PFU34kc1u6ywK8XHMd
	fLmQtwteTGLxdz/PDb5rkaTrvueAERakn9TaMPldQXM83jdQdG/w9zgGn0oVE/WBCE00
	5ZjSFkIedeywHIDHdA5aalccFbtbI3Dku6EbuQV41agwJf80sv4YJ8l18ZR94sOlF62y
	kTug==
X-Gm-Message-State: AJcUukcG2hTUyepHSseZ6uccc5vrKYb/7EQcBTt44zMUeLoMJXG1D2po
	NnXX0R3wFeBdx4rCEifzBAcKfw==
X-Google-Smtp-Source: ALg8bN5DV7cWjPVGqWBOfUEx/6LRo0ZjcqJLjcR0wLCl1ha/SJSgK6n5C9Uyrfw8Whpmmztk0bGDVQ==
X-Received: by 2002:a1c:7c07:: with SMTP id x7mr25313193wmc.82.1546523956834; 
	Thu, 03 Jan 2019 05:59:16 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	143sm53807933wml.14.2019.01.03.05.59.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 03 Jan 2019 05:59:15 -0800 (PST)
Message-ID: <81618ab958486def551d22764d960944fb09b73d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrej Valek <andrej.valek@siemens.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 03 Jan 2019 13:59:14 +0000
In-Reply-To: <8ac88775-35f9-e3f6-a0c6-f218aa697e70@siemens.com>
References: <20181207120605.11344-1-richard.purdie@linuxfoundation.org>
	<20181207120605.11344-2-richard.purdie@linuxfoundation.org>
	<fae0fb29acedc0c26cf9d5860e053d1427316cb8.camel@linuxfoundation.org>
	<857809ce-49de-16c2-f26d-805acc3601c2@siemens.com>
	<31abffa69bca5ee313a7d6c30dd7fc06011a14e5.camel@linuxfoundation.org>
	<8ac88775-35f9-e3f6-a0c6-f218aa697e70@siemens.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 2/2] nativesdk-*-provides-dummy: Fixes to allow correct operation with opkg
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
X-List-Received-Date: Thu, 03 Jan 2019 13:59:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-12-31 at 20:56 +0100, Andrej Valek wrote:
> Your previous solution is working for me, so I was not working on
> fixing
> this. I thought, that You will just add missing packages, and that
> is.
> I don't have setup for failing machine.
> 
> Is there any simple way to get all missing perl packages?

I reworked the patch a bit, tested and just merged a working version of
it:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=d4e27863f3874fb7dc543eed8dcf6a8c4d146fb5

Cheers,

Richard


