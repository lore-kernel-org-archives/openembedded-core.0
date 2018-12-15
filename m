Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 491B47BE77
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Dec 2018 11:55:02 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id q26so8164692wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Dec 2018 03:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=+tJY9hnaoc046SC2kwoS7uJxaYMYcwP4S0ajmO2Fs4U=;
	b=e60yCDTZubkAWQtRDYVDdsIkTlCST2O+49JiTC6mTjgBubzgmokDmH10FrS/sDZxHR
	rGoq9GQIU/pt9MRHuPsJuhf5BMl086Pn4C3RUKAUsjzMWIEcrLwEWxBmosMTQ7VSxbX5
	pV8CkBtdWu1T5UsD/tMCgBj+gajGP2cM2Dxpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=+tJY9hnaoc046SC2kwoS7uJxaYMYcwP4S0ajmO2Fs4U=;
	b=cBF/xQhIDPxXg9uC2fiX44Dw6Mq9ndqFjYVokGMpJjd2zSRWELn5H0f5en4NoZaAZO
	cMJ3bWHdwowO/em14qiKn+mSLWIEbO8+POqVGHroU6XaX7j3XrBGObFMqpA3MLLuyv6x
	jE6rkdDiLRR3LtmJtsXgPf6gGFT+h96qhjH0DQZHWTzsKU037qTgzRG9IzXd7ZS0Jhqv
	XYMqURSQhaVJmWXLQEnbKqBLSHHl5EmvYfCvsPlf77Ke7JYHKCe+FsjMRgoJY6+G0IpN
	gKgDbWuGQOj6YE+676gbpSKTttcP/uqWFl/UbnK66nlWvwE7HOBKz5qDkT36+zvpuvVe
	bL3Q==
X-Gm-Message-State: AA+aEWbqtgnndXqGWkV2mpmpj3Mlzyhy4yyOJk9WlxXO5T4M+6EOMVEB
	y1JJKkmOyQSOREq+S1MmixgqFg==
X-Google-Smtp-Source: AFSGD/Xi71Epoazt7rNjh7QGm2DMCw68Wa8DdyJEHId1kJyewZ3F5YifdrNoay/savMlzIusoYRbbg==
X-Received: by 2002:a1c:91d1:: with SMTP id t200mr6077718wmd.111.1544874902688;
	Sat, 15 Dec 2018 03:55:02 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f66sm8181390wmd.28.2018.12.15.03.55.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 15 Dec 2018 03:55:02 -0800 (PST)
Message-ID: <3de0daf6d2af873d18c4e8a650be961038d856ff.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 15 Dec 2018 11:55:00 +0000
In-Reply-To: <20181214171034.1897-1-ross.burton@intel.com>
References: <20181214171034.1897-1-ross.burton@intel.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH] runqemu: formatting cleanups suggested by PyLint
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
X-List-Received-Date: Sat, 15 Dec 2018 11:55:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-12-14 at 17:10 +0000, Ross Burton wrote:
> Mostly whitespace fixes but also some r"" strings to clarify regular
> expressions.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/lib/oe/package_manager.py | 97 +++++++++++++++++---------------
> ----------
>  scripts/runqemu                | 46 ++++++++++----------
>  2 files changed, 61 insertions(+), 82 deletions(-)

I think your patches got a little confused!

(2 files, not 1)

Cheers,

Richard


