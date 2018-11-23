Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 35D756C65F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 11:03:26 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z5so7623283wrt.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 03:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=OUZnucDHYDoF7b37xiJwQ1KrRi7HMuntf+e4MucoUHY=;
	b=Qps+2pyg5B9SjtwXH/jC1QL0yZ1GVoAl38pKfLSS3h1OzYM9agvj92sI4yswZbXj/h
	o7CWuEWR34T8uq8lQ/DGBT5WA3HdsE7T7Kue072aEGsFhCk5gQMhZ5INQTHmW0b+mhbQ
	middK01XTfjq0kKp1U8GvzlS5kWxuGKYasDGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=OUZnucDHYDoF7b37xiJwQ1KrRi7HMuntf+e4MucoUHY=;
	b=Fws/ffn93GwouYv3BKSXQZNg7Y/o3x6Bus1Q3aEsCn/hsOtlJz0klB8nE5UEzoEI2R
	pKjdmDGotxiVEvypxn9IrfpJGctOLbxdk+QtPNflssVEVRpqXRU3OWZM0V0B8oMFcmMO
	mIBBWe+A3nCD11Uv1bw2gtfmGa5pJhQJtC34MfNdy09IY/SHxe5rUpC1Op05Jp31S3+n
	S7J8VznR8xpAsEEPgA0VMhPL5GBjiALcgd0Rks45QzUDNqveBdmUVHHUDKDaMXheECGS
	xLtBkO/jwzCjWzET5o6xzOis7BPF4mFL4jQW58AFRJRTD+2W2iHpc8V+xN3k/o/HSrQs
	lauQ==
X-Gm-Message-State: AA+aEWZUPD3TAjFisv4pmOlDXDXbM+eUMbKIu/tn2fNS5w9MVMInesuX
	XweFmnbu0lPIdViWu7MctibvEA==
X-Google-Smtp-Source: AFSGD/WuXI7kD377PM7YxD0Z7EY78r84wMO+bvywJyoHoOQAWcfXPTWjdIFuDu7dKWABgxvjiCAiKg==
X-Received: by 2002:adf:fc09:: with SMTP id i9mr12951915wrr.299.1542971006878; 
	Fri, 23 Nov 2018 03:03:26 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	60sm28272105wrb.81.2018.11.23.03.03.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 23 Nov 2018 03:03:26 -0800 (PST)
Message-ID: <443c9e2d322a127fac430d1f17c58e2358c6635c.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: "Yu, Mingli" <mingli.yu@windriver.com>, ross.burton@intel.com, 
	raj.khem@gmail.com, randy.macleod@windriver.com, 
	alejandro.enedino.hernandez-samaniego@xilinx.com, 
	openembedded-core@lists.openembedded.org
Date: Fri, 23 Nov 2018 11:03:24 +0000
In-Reply-To: <5BF75811.2060104@windriver.com>
References: <1541657297-30997-3-git-send-email-mingli.yu@windriver.com>
	<1542188171-116604-1-git-send-email-mingli.yu@windriver.com>
	<5BF75811.2060104@windriver.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [PATCH v2] python3: add tk support
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
X-List-Received-Date: Fri, 23 Nov 2018 11:03:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-11-23 at 09:29 +0800, Yu, Mingli wrote:
> Ping.
> 
> Thanks,

Why are you sending ping requests for both v2 and v3 of the same patch?

Cheers,

Richard


