Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7C34571AB0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 13:30:13 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id b14so146569204lfg.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 05:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=x6/1WJDyS9XzrH2KjyDxC26jEAq+evX9UXiOx6hLWtI=;
	b=xNz3IecB+FlKmrUYY8h51trKVvJ3B4BlXhpTLSJMYdDzEke7ua9yXgRT37pJP25E5q
	VDkgaS6wSQLK2fB8B2Yy09HHnkIJeIrgHZJO/q4p/P2qQ3Pcuek5E8Kr/imUx0i+Vdpf
	EZEgUkMAxEw5znYmSKmLptROk7NnG1c1uJytC09W2tXqUm2s0dP4Lfoo1N+iN2UMOdu1
	h7YqLeY3PyyVEzQwJepSR8o6g5bMMySijD0vfZH9fYLzct7N62glPwua2GQfo9D34ZuR
	/jWbgWKzWjzaWXHPrl2W+ujPszgD2xr//gjim6Da1mQHXF3SsDwJnKSrw1jVcQxfAU5I
	2Oag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=x6/1WJDyS9XzrH2KjyDxC26jEAq+evX9UXiOx6hLWtI=;
	b=dBIHkPQQJ+y0iMJO8VYSJZuINgSc54tihe8t1ZmmSqd1XFgowdtyQoZAVvY3ncZmTi
	q8YEJ5VHC09t/DOTN6Z7Wygae1umAyS69Sy1OIJ++ZFQvp9bbVVe7Om1miwDRwOY4M1t
	v99FtOLKFvZbX/rfEvJvJMcWkq3AsgTn8IhG1BEUeIisikkNM2g6MUeIAsHUjw3EK4gF
	WVjLcmcV9Lx3f/P4Iln3RvCLHzQIeAz3bEiMEa7pkq8TcuYSizjfPcXYxuGTrAg70LuJ
	u7FcaWDmeV3dDU43t6v94fAkf+/4k4yB5OE6J1B8UDRu9fMUwSWWe6hID7z5v0/wxuXN
	iqTw==
X-Gm-Message-State: AKaTC00+YabrPmfvQL1fCaF+UeIZb35mt02bTugmXWrVUIpRL4C7ZI2b7vJdLvhPdrU6+A==
X-Received: by 10.25.192.20 with SMTP id q20mr12801447lff.5.1480512614662;
	Wed, 30 Nov 2016 05:30:14 -0800 (PST)
Received: from [10.25.0.170] ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	u77sm11340844lfg.22.2016.11.30.05.30.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Nov 2016 05:30:13 -0800 (PST)
To: ed.bartosh@linux.intel.com
References: <1480068955-17053-1-git-send-email-kristian.amlie@mender.io>
	<1480069993.6873.98.camel@intel.com>
	<f1699a69-1949-9cb3-8bef-adf9b68f385b@mender.io>
	<20161125163103.GA4830@linux.intel.com>
	<e29489aa-8303-d8ac-be67-93d650d09f6d@mender.io>
	<20161128105236.GB15660@linux.intel.com>
	<ae35149f-dc2d-fea5-e59e-a65dd3dce0ec@mender.io>
	<20161128111825.GA16035@linux.intel.com>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <420c72b7-b5dd-14f3-a4b0-c57eb3512252@mender.io>
Date: Wed, 30 Nov 2016 14:30:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161128111825.GA16035@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v1] wic: Add --exclude-path option to rootfs source plugin.
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
X-List-Received-Date: Wed, 30 Nov 2016 13:30:18 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 28/11/16 12:18, Ed Bartosh wrote:
> I'd appreciate if you also do the following before sending v2:
>  - check that your code doesn't regress pylint checks

Is there an official process here? Sorry, it's not very well documented.

Just running pylint3 manually on the scripts/lib/wic folder gives
identical results, however, running on rootfs.py alone, the rating
increases:

  Your code has been rated at 5.67/10 (previous run: 2.26/10, +3.41)

>  - add test case for your code to meta/lib/oeqa/selftest/wic.py
>  - check that your code doesn't break oe-selftest --coverage -r wic and
>    doesn't regress test coverage

In the interest of saving me some build time, am I correct in assuming
that I need the "qemux86-64" MACHINE target for this to work? It appears
to be dependent on syslinux which has COMPATIBLE_HOSTS set to non-arm
only. Sorry, I'm a bit new to this framework.

-- 
Kristian

