Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id C1BE971BBA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Dec 2016 14:36:47 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id t196so196996676lff.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Dec 2016 06:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=+oEns7px3gEWDcgNMAAFB1JVSI8JE/sf//+eStxnE9M=;
	b=hEzOvnwo/FpvPXxdeNutmOD2bfj9TnJTaBGKRTtQG0gpWNPhTQ1MpYz7g4p4xJwAiU
	ZOxwNw230iQoTlIPEP60sDy4oW2r1RoHE4TE2u3m5iYsY318hInbsQfBMNlDfbOzcU3G
	eRmSJMdcpLx4EZR43Orsg5vQKP6gYUt6Ru0cj8mEMQlnzB0cI+Ay0UQBjhD0npxmaU+O
	0aQzF+7EoOiF918H4GRXI6M1T2z8HrMz6p7fPiwsJkqljoCRL36QK6DC1OdNwLPs7hND
	CRhNXA+8Pco6VqDAZmMu01Yh6PhXxciPcXYpCKbhLT2f5DDRE5c8Cdo4/gyxseoRskqB
	kZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=+oEns7px3gEWDcgNMAAFB1JVSI8JE/sf//+eStxnE9M=;
	b=YJa/XwK8FQ9+Oc0hgkvJXbTpSMCAM99sP/ZY5l+9DWQsOHrUdPKd3foQ6nKo344hj2
	GpbvyezKZ/kVi1uZ3JfxP7vlBZkSuEq7NGIUPgPxExwAEWj7tqtNFmxuNHqjT5VAtVwl
	smGZBe/3jd6d1abyXhw6IFZvgF2bjwPs24dQJ6uwfEjTuc+FNhStZJiVR5WSUvJpY3lX
	SSZ1NuxjQP7W6HaX3T1jgEc3HEuHf5bZBxG6z3B1nyWpHqSByhROqqaHmA+gwMnKOLFp
	XmWGbB5f7mIhuYZD7fpv0g4aLmuqzFqe76l8yt0ju8vQ5kB+WTrZhlSBI/I5UDKc1yzQ
	gbFw==
X-Gm-Message-State: AKaTC00Q/pA4lFGjPQJDJ941S7j5kTxCilxLJ8N7VYEA3QjwOhwGDhjlHXEOmb0o8k0JXQ==
X-Received: by 10.46.0.87 with SMTP id 84mr20927753lja.1.1480689408871;
	Fri, 02 Dec 2016 06:36:48 -0800 (PST)
Received: from [10.25.0.170] ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	u126sm807547lja.12.2016.12.02.06.36.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Dec 2016 06:36:47 -0800 (PST)
To: ed.bartosh@linux.intel.com
References: <1480068955-17053-1-git-send-email-kristian.amlie@mender.io>
	<1480069993.6873.98.camel@intel.com>
	<f1699a69-1949-9cb3-8bef-adf9b68f385b@mender.io>
	<20161125163103.GA4830@linux.intel.com>
	<e29489aa-8303-d8ac-be67-93d650d09f6d@mender.io>
	<20161128105236.GB15660@linux.intel.com>
	<ae35149f-dc2d-fea5-e59e-a65dd3dce0ec@mender.io>
	<20161128111825.GA16035@linux.intel.com>
	<420c72b7-b5dd-14f3-a4b0-c57eb3512252@mender.io>
	<20161130152923.GA4811@linux.intel.com>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <6132a02c-5934-8680-5970-3455f5af1842@mender.io>
Date: Fri, 2 Dec 2016 15:36:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161130152923.GA4811@linux.intel.com>
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
X-List-Received-Date: Fri, 02 Dec 2016 14:36:49 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 30/11/16 16:29, Ed Bartosh wrote:
>> ...
> 
> You're right. oe-selftest requires qemux86-64 target.
> 
> Even if you usually work in different environment it makes sense to run
> oe-selftest to ensure that your changes don't breake it.
> This is because our maintainers use oe-selftest results as one of the
> acceptance criterias. It means that your changes would be be rejected anyway
> if they break oe-selftest, so it's better to check it in advance.

This is taking some time due to unrelated issues, but in the meantime:

What are the thoughts on having a similar --exclude-path mechanism for
the standard rootfs building? IOW, the do_image_ext4 and friends?

Our usecase is that we use wic to build a complete image, using
--exclude-path to group things into partitions. And then we want to
build a regular ext4 image and use this as an update to the device, and
in this case we want the same content as wic generates, but in a raw
rootfs file instead.

As an alternative to do_image_ext4, it might be possible to use wic to
build a rootfs raw filesystem instead of a partitioned file, but I
haven't looked into that yet.

Thoughts?

-- 
Kristian

