Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0675E7E830
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 16:45:06 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p74so78859458wme.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2019 09:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=pHo8UhHMo8/THxwIbPVZQTGpR6XQyWw5ps5mqHi3KLg=;
	b=AEZRyLK9QmA0uEJgQQcl7FjqJfPFABCcn/oN7N0wDvb3V8JgcH8QyoFh4vb82acP2T
	yuoyrJbpb3jGQYP00TaCpARtZBWEhZEf5xqzQChZGJ88gdeA6rLoo+pAidj9lr8g38gB
	JbP0XvDFwahueJqUZ/fvwZF3wAzDu/73Iu8DQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=pHo8UhHMo8/THxwIbPVZQTGpR6XQyWw5ps5mqHi3KLg=;
	b=nQC4JMrzQKuF136pvh/dNFM8qvZhb4ZpRatCaZdlk2cT/wOOGKPZYo5s6qQf2WD82l
	Yo4ZYsgESQaAJAS6ejSb0bfu62uZ/SMgzkh2Grj+YMk9aMzobcjV0wfxodRajcSkISlm
	Oy8wy1DP4mPz25Ro1MbxUUCmac6w46oEhKLJHr19nyL4TWMT+P+HUVPhlPv8Ndjeopxr
	bhU3S6+4CcmSaVeCPxtom07TutfkDlg6dEDk776HLW8vgiUHqcRBGM2JGfAP4sW9cn8L
	U+6nrdUd9Olh+39uim2Y+TG7LbaxE2ssjrWCR4A8mQ8/cRHqhXM5gNcbUUo48I/xR8dH
	Hklg==
X-Gm-Message-State: APjAAAW4nJG4i/ku1iB9kvBdUDfyt/iDBjp0vQDllOu9hSU9Y19tzOxO
	qsd75L+F/+0Dr4MY9jCKeuRvbQ==
X-Google-Smtp-Source: APXvYqxzS8Zong4P7KoJQeQfojXL+RYEXupbMSo91kRnEfd99R5KvmkPWGcIOv20x7a8ldlfTSx5Yg==
X-Received: by 2002:a1c:cb0a:: with SMTP id b10mr5548292wmg.41.1565109907723; 
	Tue, 06 Aug 2019 09:45:07 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d10sm109686807wro.18.2019.08.06.09.45.06
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 06 Aug 2019 09:45:06 -0700 (PDT)
Message-ID: <a04d174b658606469146520d5881eaf35bb4a9f9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Tue, 06 Aug 2019 17:45:05 +0100
In-Reply-To: <20190804151446.39088-1-raj.khem@gmail.com>
References: <20190804151446.39088-1-raj.khem@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] glibc: Update to glibc 2.30
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
X-List-Received-Date: Tue, 06 Aug 2019 16:45:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-08-04 at 08:14 -0700, Khem Raj wrote:
> - Drop backported patches
> - Move common pieces between cross-localedef and glibc into a common
> file
> - Move latest checksums to glibc-common.inc and remove duplicates
> from glibc recipe
> - Detailed release notes [1]
> 
> [1] https://sourceware.org/ml/libc-alpha/2019-08/msg00029.html
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

It failed under testing in gst-plugins-good:

http://errors.yoctoproject.org/Errors/Latest/?filter=9382629d4bbcd26196c36d31ffdf097b30023150&type=commit&limit=150

Ross pointed out this was reported here:

https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/issues/635

Looks like we need to tweak the headers?

Cheers,

Richard


