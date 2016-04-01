Return-Path: <laurent.bonnans@hikob.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id D1F0173695
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 11:21:12 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id qe11so69968018lbc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Apr 2016 04:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=hikob-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to; 
	bh=FCsi9xxTXFlmfpPd6GziK3MnMjlRsJNIhSu6f5WE6uA=;
	b=kh8MJRjjlHyVJC68PVvsOAD5nL58qkjeloMCJe5zgyEHgZpN7kMHXcBH+55ARmxUXU
	0I+92+AdyeBGYFfDRbiNkQDg4gdP6m14saHbzvYPtxg6lc3eAGDF8fcqpnUWy2jVhqy8
	LkSEGC+SYYym19jP+59uUQ+DWIU5qAFD8uU/MWpkCkNa8x8fdUjvvGRb+07nb2LsDMDM
	rRvOZXWZHNATl/iES5x5yg4FiFJfGzLaAUex6vDWd2Q4eO6q0FudejXW1/AZ26witU/4
	H34yp8sSIQgo1lhx65UZcd81e476hU2UTCEwXideBS4mHYzg6M/WrxqzGtN6BG/UzEyY
	AwtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=FCsi9xxTXFlmfpPd6GziK3MnMjlRsJNIhSu6f5WE6uA=;
	b=H1mAPs1NBMaDyFATgjqSJcJXHfvUwAtGVRxhGlFYJ/T0nU2QKbcWTfMwVhkWIQj2Ko
	aO9Wg50l70tWmLT5CO9M0bOrue092r63qVjQDcArh2ebvRNogSJsGJOv8DfUVmliH5hq
	TZu83qHzF3gUg3arvy1GOdY3WzqFwpJ90rW53FA8tkQTimNMKGTYJCQstU9Xb9gHOHrv
	HIkLpdWnZMXKeXVX7TMXjoKrHduzadMmAlyUGLvVk4cPovmPTMZbD+JZCiMoPXVqecPH
	SYhFDMn01adcJU6rx5pWJsBXfcPU2nBZbH8c59MkkiU0ZZLE26yGP872Vk29xz7+JhJU
	0sXg==
X-Gm-Message-State: AD7BkJIB/OAuPtxQFAqI068p1JyDaqW75SyEJBT+SqpW9DpzQBMJo4i9UAJTL8Y+TbtO/oaLV+PYDBnhEYHvont7
MIME-Version: 1.0
X-Received: by 10.112.13.33 with SMTP id e1mr1365275lbc.79.1459509672132; Fri,
	01 Apr 2016 04:21:12 -0700 (PDT)
Received: by 10.25.211.21 with HTTP; Fri, 1 Apr 2016 04:21:12 -0700 (PDT)
In-Reply-To: <1459461285.21672.70.camel@linuxfoundation.org>
References: <cover.1459438792.git.laurent.bonnans@hikob.com>
	<8a3fd47fc059f25ec7110cb74a5759556bae165e.1459438792.git.laurent.bonnans@hikob.com>
	<1459461285.21672.70.camel@linuxfoundation.org>
Date: Fri, 1 Apr 2016 13:21:12 +0200
Message-ID: <CABBNMXXkshQSZkKruaBjQP=oejM79JLnkAcUW_EUNfSPLpaBxQ@mail.gmail.com>
From: Laurent Bonnans <laurent.bonnans@hikob.com>
To: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH 1/1] python: remove tests and sqlite3-tests modules
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
X-List-Received-Date: Fri, 01 Apr 2016 11:21:14 -0000
Content-Type: text/plain; charset=UTF-8

2016-03-31 23:54 GMT+02:00 Richard Purdie <richard.purdie@linuxfoundation.org>:
> Would it not make sense to keep these as separate packages but
> specifically exclude them from python-modules (and add a comment along
> the lines of the above as a reason)?

This sounds reasonable to me. It would require to slightly tweak the
logic of the generate-manifest scripts.

