Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id A5E6B7FD93
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2020 14:32:37 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id m24so4923299wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2020 06:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=q+Y4vCK8E0cMLkV0uAz107jXBdJkttNBID9vwQS+swY=;
	b=bPRsTTR7Ca457r/zS0xKukL1kEFZTc3Wvgq9i/xk3b5T5Dq7QEGNuGp7rE8Su9Hs1d
	Z6xuT/T3oNjc6rjaP/GEJb4r0B0LNqameAPOKriF5WPLzSpj3T5L9ZsFkuUxkFqa6FpO
	dGdTMO3wTXseUiHUr8CRew8pxjrz4Ec/FBC8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=q+Y4vCK8E0cMLkV0uAz107jXBdJkttNBID9vwQS+swY=;
	b=MEAFIf0xyPfGakrEAXs6Hui9HtIl6+Zkqsqlg+FendCQJ/fJrp1GLrbUOuoK3/9Wxs
	uQKZUzQ30iIkW9vWrPQA0DprGsL66+cr1dRpqo/blqz3N1fSEPlxj8746SDdVzezeu3M
	WFPpjvYtKkBiTkTJ9uI5zvWPVQfVa5FXMxKhhvCPkqquz5zhZC/AeS5bJfLo+UID3SRf
	UZfhc4aXjZjhq57Ul+J2+bf9ykmoQeWslQBw16Add1lqrVECEZiW3JbWe4wph39XIhfD
	QqqjdxyT/OFjqpVUO/lqrAKOrRSbeqcQd70+5FBaP/FCaITIFMohD5nK/vYl3c3wutGH
	BIrw==
X-Gm-Message-State: APjAAAUQB0nuy9FkbZbZHM78h45rWgCWenV2CU/s46plKQo8GPqTDZQZ
	EpYZrXPQahvARdVIRxs75ud0yvgJSpE=
X-Google-Smtp-Source: APXvYqyCbMBBr3AvTFRfV4O3ee/+NxcyK+tmDNybnPTLgYwKQd37cCaBPNjyWDgvmvDgLJK13oOwvg==
X-Received: by 2002:a7b:c935:: with SMTP id h21mr10172734wml.173.1578753158339;
	Sat, 11 Jan 2020 06:32:38 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	k13sm6589162wrx.59.2020.01.11.06.32.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 11 Jan 2020 06:32:37 -0800 (PST)
Message-ID: <754f919ba3bd33ec8c3debfb7e2f993a28ef3aa3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Bunk <bunk@stusta.de>
Date: Sat, 11 Jan 2020 14:32:35 +0000
In-Reply-To: <20200111141021.GA21350@localhost>
References: <20200110165302.27426-1-git@andred.net>
	<20200111141021.GA21350@localhost>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/16] site updates (autotools / coreutils)
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
X-List-Received-Date: Sat, 11 Jan 2020 14:32:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-01-11 at 16:10 +0200, Adrian Bunk wrote:
> Are these values not part of what is being checked for rebuilds?
> 
> I was surprised that after the latest pull on master including these
> changes nothing was rebuilt (except perl due to an unrelated commit).

Already ahead of you, its a bug:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=13729

Cheers,

Richard


