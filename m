Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ie0-f177.google.com (unknown [209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8E44B6FB30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 03:41:14 +0000 (UTC)
Received: by mail-ie0-f177.google.com with SMTP id y20so11142967ier.22
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 20:41:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=PxeOFsu+/egHSvEvDpx7srHjvenAmI1mmoFpFz354Os=;
	b=OyTF/85uirNKBfzSABY64qrlgLAufROzqaUC6zgADYo0yTXU2nmRpTAwCsk+BowFas
	ioQ+xwJad800oJvbEROTk/N5EXgxPXydUAb3qkhsUZlrCM79V3zrday9L+NNLOyj+2DY
	k/Y00gogF8PGiaQi4wgsbeIYkDYx5IyRV4dFQsxLbOUZNwrxsHnlbY1uEXwjnPTTUDyl
	uuIuLROLkKxukOBSKbm3ZZPwifK+dO2YXsmx+AYHm9RKaNzHXUz08d0kyPgLzkPzSNo8
	wuxWFU9IX/GWZ49Q+grCcy0d5w/9t2CCtTsrIEa4WoKfnbs8SjPW1eYt5v/eZV3W1Bsm
	mPmg==
X-Gm-Message-State: ALoCoQklNgCgq8sXy+UFaH4VLcDwQsLZs+wsB+5Qdhsgo4e3HEk2yKu0mDww7sRQ0qBlqPaEAw4+
X-Received: by 10.42.98.145 with SMTP id s17mr3973558icn.73.1401334875387;
	Wed, 28 May 2014 20:41:15 -0700 (PDT)
Received: from [192.168.141.83] (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158]) by mx.google.com with ESMTPSA id
	hh13sm20774646igb.20.2014.05.28.20.41.14 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 28 May 2014 20:41:14 -0700 (PDT)
Message-ID: <5386AC5A.8020601@linaro.org>
Date: Wed, 28 May 2014 23:41:14 -0400
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1401283598-9136-1-git-send-email-trevor.woerner@linaro.org>
	<CAMKF1spP_HOCbJOC19LVzqwX6oZwVC+qRRrjAhoe9oBv82BYAw@mail.gmail.com>
In-Reply-To: <CAMKF1spP_HOCbJOC19LVzqwX6oZwVC+qRRrjAhoe9oBv82BYAw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] grub_git: fix warning->error
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
X-List-Received-Date: Thu, 29 May 2014 03:41:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/28/14 15:57, Khem Raj wrote:
> Upstream-status should appear in component source patch header not
> overall OE patch header. 

Thanks for the clarification. v2 is on its way.

