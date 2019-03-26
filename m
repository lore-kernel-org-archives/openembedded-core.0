Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2E4277D00A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 16:56:41 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id q1so15263779wrp.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 09:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=BU2y63yvrc6ZHjIB4fU1F07hDyVy++zEk+26DI0mnmw=;
	b=FRpg7HGEuAqI308BEbH3h9b0r4cHUCQeHtgqGv6fkZzEeEn8fFHaA6IvEvm4aLZItN
	4vxZeuAnO3dcooRz6lFZFHIS5nDvRcuy9k0t308k+shTsQhrkyzbra+UcA76pGfJY9Yh
	ykHEoo0/TJgkL7iQity2oZSYoJCUnRz+SN8uY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=BU2y63yvrc6ZHjIB4fU1F07hDyVy++zEk+26DI0mnmw=;
	b=k3SMrqE2GjfmJqdtjZjpqjMKKTdOOCB5yXm10BxEi9dHdMTAX5BfIwOu43/4lphCyw
	CSQvi4XTLDaErKsRNPkY0/GyFbVufXGwv2rjB2e1bnkUtZZHgIcx5A5+BEjOPq8JHn70
	2YoRxfkkjYSC6AGNRN2BcSjkfXb8Pq1NT9B4hZ+aKqFnwKXZBqY4E+H1iYLK18q/gPyS
	fiCkgAX0qa3ilzsHeCbOOBrIWV2F40XwWak3brkGANMqjyiaYNpVyerqglModJS+CD5j
	farzdxNE9CPimD0HgWmpNIHytqx6zVSui98d7nVzNwCZTQ0uH9kGRtSS48l/Iwvh7yXS
	RI1w==
X-Gm-Message-State: APjAAAWBZ+M2XhdIgxNfSS2MLeqR/0+kvcJ6CpP8Oe6BEK8yyNpwA4XC
	prv1OtYFhgtbiEYMQ8LalvyuEg==
X-Google-Smtp-Source: APXvYqzyMdzXatt4506np4e3a+KiED/jvcgAA1WJY/i+7d1VRefCTPDUAtTmApJlqXu3OtYo2rFUKA==
X-Received: by 2002:adf:fecb:: with SMTP id q11mr19307858wrs.252.1553619401684;
	Tue, 26 Mar 2019 09:56:41 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c10sm26008884wrt.65.2019.03.26.09.56.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Mar 2019 09:56:40 -0700 (PDT)
Message-ID: <71c9baa46366314e747138cccb57aeed6aec1419.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Armin Kuster <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2019 16:56:33 +0000
In-Reply-To: <1553616791-19212-1-git-send-email-akuster808@gmail.com>
References: <1553616791-19212-1-git-send-email-akuster808@gmail.com>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Subject: Re: [PATCH] timezone: update to 2009a
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
X-List-Received-Date: Tue, 26 Mar 2019 16:56:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-03-26 at 09:13 -0700, Armin Kuster wrote:
> The 2019a release of the tz code and data is available. It reflects
> the following changes, which were either circulated on the tz mailing
> list or are relatively minor technical or administrative changes:

I tweaked the shortlog when merging to -next :)

Cheers,

Richard


