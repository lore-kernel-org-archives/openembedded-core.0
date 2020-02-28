Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9B36F6196B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 16:58:22 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id e10so2297853wrr.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 08:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=BAFr9XdaNYs0o1ruXQW/nQA2ovHcUUIRLSJJwL8uPlE=;
	b=ACrn5+vmXA7TtA1NJThkZtmnnXp4MEO71sxfSV3Y/PFu0+4n2ui0KO8eYNMvFHogOh
	zNyEkICrQdr8qiHSci01LV5MZq6ont7pCIbLcpmoKdBzVW3pyNVCwnp7LU7ieHvadaCj
	XiFmgW76jjUpt1Xt5611hDf75f92S17FE3648=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=BAFr9XdaNYs0o1ruXQW/nQA2ovHcUUIRLSJJwL8uPlE=;
	b=hu/yDgTeu2SKaA42MYVUfLYKhEmLPzjYIcHF2tcNLDlzoYP8mgXipzMOd4ylbDdZnz
	U9bWes2tFXpZ7GmOyfLTfVdROF64aDAmUcTLKQuZfoiAc3+I2gu6qzYA+H09ZMJlBdSY
	EwDCTqlJqXdoRIcOVZgbHkmga0ToGRd2UjbyFTf/OPziWZPrafYgHuinvuDZ5y8hhCja
	Kd6a8bn5eRkU6vasAqDZBGAJAP/alzCoQpxaApMUAmC/LpyAHUkt9Fxto2xSBsrgquwR
	juWHuYl5jBu4Lz48D1hYUN2ZIKorwheR8q1lEVrMxiwdVPZT4VhT8AIQ4nXF8t70dbUl
	+OKg==
X-Gm-Message-State: APjAAAVtNKo8Bto4ngZrvkBACV42uXnQL23gPaZ73DAuxVVvfK+9mKX0
	uN/PndJzmWpZJwEgY42TTJKA07jpgIA=
X-Google-Smtp-Source: APXvYqx6GlmN2nbI+F8R6xdkfOaTkY9qyBsO0mZzOUwKWedICh3wTpWJH6STO7aXlY3yVz5/sjvOyw==
X-Received: by 2002:a5d:4b82:: with SMTP id b2mr5644766wrt.102.1582909102942; 
	Fri, 28 Feb 2020 08:58:22 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z8sm12629742wrv.74.2020.02.28.08.58.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 28 Feb 2020 08:58:22 -0800 (PST)
Message-ID: <5f4a8b6691dbf40a2058b5a94f265541049f0733.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mingli.yu@windriver.com, openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2020 16:58:21 +0000
In-Reply-To: <1582863612-310553-1-git-send-email-mingli.yu@windriver.com>
References: <1582863612-310553-1-git-send-email-mingli.yu@windriver.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Subject: Re: [PATCH] rng-tools: only print the success message when initialize entropy sources
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
X-List-Received-Date: Fri, 28 Feb 2020 16:58:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-02-28 at 12:20 +0800, mingli.yu@windriver.com wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> There is below message when check rngd service status
> in qemu env.
> [rdrand]: Initialization Failed

It looks like upstream aren't keen on the patch and I'm not sure we'd
want to carry it. Whitelist this "error" instead?

Cheers,

Richard


