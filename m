Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6B4917C498
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 14:09:09 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id f188so13987950wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 06:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=bsyQDyst8tPVO/UQsWkt1VBdCwGPg5WZzVwXT12AFXU=;
	b=BuGzNQbnrHkTu28eEZTezJTSNu1oviXoc7qXlnNe+dUZw4vSLVUp+LlLpPdUIzqKpS
	z4Gq88kI1jG2E1wIMrYBZAJyDlE+LGwivfNI8vJtT2UBqppx7DxiKXu/yrhDUP7NBxrf
	lnwbLeW+YPix8VMIV3ygerY3vte3zAvuDgaF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=bsyQDyst8tPVO/UQsWkt1VBdCwGPg5WZzVwXT12AFXU=;
	b=X5aSuMlqCKfxpXk66ncSczZnkq/ODNIKkSuQJ6rjIZCroH+karCVDBfxZ+vfO69h5O
	61mTOgTMVsQzrSX8zfDVChpVPYPFcRR9Xn7a+yoKSitCoyRz4pDuKyne4pP3AJ6jKzUR
	4MITKdV3f3UmNzMNlXSg0KVlt2HhOyiW+cQA4Opkk8SvkWo1BdEEB3ZCttKCmvGSbZ3R
	f5fk1W3EUlr0B3b9GN1aQQavXAlMA3F349MnNDKkRgQg3O+lLK5nPF3K7GlJGIDGhzC2
	lgXwg7HmEMacppNnOWe8ch5vCiIHGOUubqXXpGuVG9iRIECUG/wcDdw2Rrh310pZnYWw
	NdOA==
X-Gm-Message-State: AJcUuke2yDnO2njIkvyFXsov/I9ahM73qIRtrI+qSn8bZpuGlQ7l3k9f
	v9MBUbAKm+X/UfB+L3w8An0NBQ==
X-Google-Smtp-Source: ALg8bN6c0DvhdhptcEpsbc3oZ4vtac/wCf2uX3TdmcmoNWMPoMUJ1OnXW30VA9EJCWBGbKdB8kNj9Q==
X-Received: by 2002:a1c:cc19:: with SMTP id h25mr17184259wmb.80.1548684550110; 
	Mon, 28 Jan 2019 06:09:10 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	m21sm50902305wmi.43.2019.01.28.06.09.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 28 Jan 2019 06:09:08 -0800 (PST)
Message-ID: <dc8e1f400fb4d66b30a84a1268ad7b60b342eec1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: He Zhe <zhe.he@windriver.com>, openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 14:09:08 +0000
In-Reply-To: <20190115024758.29054-1-zhe.he@windriver.com>
References: <20190115024758.29054-1-zhe.he@windriver.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH v2] ltp: Remove admin_tools test
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
X-List-Received-Date: Mon, 28 Jan 2019 14:09:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-01-14 at 18:47 -0800, He Zhe wrote:
> admin_tools test group has been removed from upstream. Backport to
> fix the
> following failures.
> 
> at_deny01 1 TFAIL : ltpapicmd.c:188: At denyed user to execute test
> job
> at_allow01 1 TFAIL : ltpapicmd.c:188: At did not allow user to
> execute job
> 
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
> v2: Add missing SOB and upstream status.

Rather than add the huge patch could we upgrade please?

I believe Petr sent a patch but it had some issues so perhaps you could
help fix those?

Cheers,

Richard


