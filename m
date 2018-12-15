Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7696D7BD93
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Dec 2018 12:06:26 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id q26so8182689wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Dec 2018 04:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=NgsNowgkkkaQQ0lpCIu7nYwb3DCfKeeqZPRVTGo0eXM=;
	b=Li7nLExHsAwTCXT64yTEfcyXXBMjCyaBw573M+SpYFGBhGlPY5aMsiLN+lyRafba53
	QzEM6W0fCXsbXcEoMPRuLMpSmfrzFOtjrP7+7qqaxTrwSIoaXE8P7nGjCSIqy+Ke+Ly3
	MUks+R/LE/i8cgWh31L9XxXevfymGFEZibR78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=NgsNowgkkkaQQ0lpCIu7nYwb3DCfKeeqZPRVTGo0eXM=;
	b=cQIuvqjpWCuw+rk9B2Ck9w814EIIum4jQ3bcNDCO7Sr2rl9qjTxevqWu17D4WpB4nM
	lDP/CnbOGepA4P+Htt0IbECchvRckfEBMOGDtzRshITQG4lkWQSWy+BBQdf2xSRdNYYf
	h3VUtF5XDY8/rX1c9gaiqAHZ9OdL7MTTkkLpkPezhbbAzOhFJRVMg4fiW+VQTIIVIfAM
	w03WjT7VqmblLHGSd4byK8kelnz5gdatNpOkCmueXe94r4YbEPmvLNrg/6d8uRgLKRPv
	PfNSO/Ch+9O1sN7QtrxHPe+0E0psL9Skiyj2bn+b6qALPth6dgC94eOVpWbcU1Z5g2kt
	katg==
X-Gm-Message-State: AA+aEWYnC+zhm6bUMpycS4YrFbZCofBH/9XQ7QL8XfSfDCWYcNAlEWNy
	M16DCZf8qOPT7ir1LudNEyMI/Q==
X-Google-Smtp-Source: AFSGD/UP0Wvr2znb6V8W6xFPx6taWZ9/6ynIvl6iwLQ4qTBhdV5b3xEFtBOvYTfGOBz+URPrxOAvPg==
X-Received: by 2002:a1c:2e0c:: with SMTP id u12mr6119057wmu.81.1544875587138; 
	Sat, 15 Dec 2018 04:06:27 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	i13sm5040729wrw.32.2018.12.15.04.06.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 15 Dec 2018 04:06:26 -0800 (PST)
Message-ID: <b1a9a6e558ac1facea5ee69bd50c0b3cf6da21d8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Serhey Popovych <serhe.popovych@gmail.com>
Date: Sat, 15 Dec 2018 12:06:22 +0000
In-Reply-To: <CAMKF1spen8XMTfanhaHX6FybWC5hHjgr6ndH316dQoGpqozEtA@mail.gmail.com>
References: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
	<1544810082-22164-12-git-send-email-serhe.popovych@gmail.com>
	<CAMKF1spen8XMTfanhaHX6FybWC5hHjgr6ndH316dQoGpqozEtA@mail.gmail.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/13] gcc: More places to patch to disable ldbl 128 for musl on PPC
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
X-List-Received-Date: Sat, 15 Dec 2018 12:06:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-12-14 at 15:44 -0800, Khem Raj wrote:
> On Fri, Dec 14, 2018 at 9:58 AM Serhey Popovych
> <serhe.popovych@gmail.com> wrote:
> > There are four functions using TFmode type (128bit) that isn't
> > available when building with musl. Move each of them from common
> > ppc64-fp.c to individual files referenced from t-float128 that used
> > when ldbl 128 enabled at configure time.
> > 
> > For gcc-7.3 if -mfloat128 is given -mfloat128-type must be given
> > too.
> > 
> > Exclude ibm-ldouble.c when ldbl 128 isn't enabled at config time.
> > 
> > Build and boot tested with musl (no float128) and glibc (float128
> > and ibm128 on PowerPC64).
> > 
> 
> We should be dropping gcc 7 support in master for next release. Gcc 8
> one is ok
> probably worth submitting it to gcc upstream as well.

I'll probably merge the series and then remove gcc7...

Cheers,

Richard


