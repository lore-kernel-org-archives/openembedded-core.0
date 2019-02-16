Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 137D36C17F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 12:56:14 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id h22so8590317wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 04:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=ERn8sEvNP9iS4vsgVidJXK0g8lZuL5HpYdtk8ARUAQE=;
	b=g4CbEqexmMWkWUpRTq2d8+lmhiMdD50L0/Zl/ACG2biuOIwAvb2CM8RTzWg7X1sCgK
	ngKsYMGIncRz9x6CvApufm5vWkpfYrDs3EAtCDInJJA0Mpj1SF/QNI4kkURHiBbzDkRa
	v1FKQYpKdbxRNi1c0AOL9jKcmYRsmZAchzN4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ERn8sEvNP9iS4vsgVidJXK0g8lZuL5HpYdtk8ARUAQE=;
	b=LFszLCjnbi6VIQGpBWLkHK2j8LFlWeJqzwLYKTIE+Rrp6UL5ZnPiru6xksHvckzQmT
	qi+yAwsN24/vskNqm/g1kZxqqeJY57S07XRNNHb6sZc7LghoTg5YAZ7bFuYD+iOz0naz
	7uzDXCG3xlI+udVWSAE+m3JnyJuxP7fTdT54vE8fRzxsdiFfC26zBdGd4+fNQZGcOCeD
	+iZdElfdbMltMXgReA8d2FdsxKdhEQ0G8FehmCFKm6fTvWkZsylkZV0pEsOnh3MyY6ML
	N4feK0t6Tbz0N8ElvS/kBggTXbLVTVfMhI2ML4AB+NBLHxvgLzC57/65tUBktsE+nbc3
	GTZw==
X-Gm-Message-State: AHQUAubpbK0hfWeqOYDAPQ0yizWLTsRFUknRFpaJZGSwU61zp/ZUd7Fq
	+gzEGuu5tS9izUMb9P3lMygkWQ==
X-Google-Smtp-Source: AHgI3Iax3oMAm7GlPnVn9qG/ryIoyBQSYW7YtvACyIMN0J4ZnIWy0WkirHaXhDwSNPpUHyFFmiJTiQ==
X-Received: by 2002:a1c:be04:: with SMTP id o4mr2736460wmf.19.1550321775449;
	Sat, 16 Feb 2019 04:56:15 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x21sm12731180wmi.28.2019.02.16.04.56.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 16 Feb 2019 04:56:14 -0800 (PST)
Message-ID: <e2bdf45dff7d90095f65ee8497172e78908f4489.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Leonardo Rangel <leobsd@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 16 Feb 2019 12:56:13 +0000
In-Reply-To: <CAN7MDW_Ks88Y5v4=_Qmjs7zgbiVABMpdwLS3r1hTy=Fv8o6cHw@mail.gmail.com>
References: <20190208163512.24889-1-leobsd@gmail.com>
	<CAN7MDW_Ks88Y5v4=_Qmjs7zgbiVABMpdwLS3r1hTy=Fv8o6cHw@mail.gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH v3] Fix cp's target path for ext* filesystems
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
X-List-Received-Date: Sat, 16 Feb 2019 12:56:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-02-15 at 23:39 -0800, Leonardo Rangel wrote:
> Does anybody have other suggestions on this one?

It merged:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=89d4a8df074598cfb3a76e41db7c45d845afd961

Cheers,

Richard


