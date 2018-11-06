Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id BD0FA747FF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Nov 2018 20:17:08 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id s10-v6so12151776wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Nov 2018 12:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=3K3Zq1fqAZMPA5/zTatPSlYOZPPJcPy/u2Rk6kZe5K4=;
	b=I3asYNJxLZsLifzH292zAy1ZMndGEeDOMhzBV7JEybF5oQ/OGjgrTykiEhhDfctRSM
	hpbyfMykOWg1gOiwaHDOxH+oYdbx8FZ9H7zk3vMtYN948YJltBFYgZvIDZSYCQuUEe3K
	OiPsL6vu/0rFjY3GoDN3V82etNdROGrErH5UA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3K3Zq1fqAZMPA5/zTatPSlYOZPPJcPy/u2Rk6kZe5K4=;
	b=gky1IU4C5BQaZTvpAXa7XjJKUxoWVw893W+w18rIhpUZ041EAbpJ5akqQZzXMFgj48
	tbRNdwgQ2Oiwz3Ho2+JGhWpGbB3JMs2+6klKe/oJEvjUtKq8YXrOzkfgj3iiuthf99QS
	r0RqZO9Ca50KHzkYzpZLjEmmJYXf8Tr46g68PwqqNTztW3E4ZzPwQFZOIxY/S1LlI22E
	QXR3ijBq6EzxoI3G0p0haYfF8HrWZ1JHwmSFE3/CErOn1ICjPLCwyCNqTz/KIlLgH8FH
	fKO3yNeuW4Jp0+4HeqeS7q2H7N9s+iSFzwF4d/pDTqLDh9w+Stch+t4NeXGpgNZpQEoN
	QURw==
X-Gm-Message-State: AGRZ1gLmv8521p7GfQros/CXqt/rDfu8xV3pON9J4avc72HYXs6/xGqM
	HDXvOFC5jHmh2u1ue4n1LqXpYg==
X-Google-Smtp-Source: AJdET5dwcTzrdD1uOkTTFCUU4C1Bm9zxL3r4phhllOAXKM4Vk/AWXnDog5N8XU89+61hMFlH52HUyg==
X-Received: by 2002:a1c:c701:: with SMTP id
	x1-v6mr3193375wmf.116.1541535429069; 
	Tue, 06 Nov 2018 12:17:09 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a193-v6sm2594838wma.19.2018.11.06.12.17.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Nov 2018 12:17:08 -0800 (PST)
Message-ID: <1c2c46007b15295963b013b6633f19d778d71c38.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: akuster808 <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 06 Nov 2018 20:17:07 +0000
In-Reply-To: <a23468ed-d936-aab4-cdea-77a6937306c1@gmail.com>
References: <20181025151040.18615-1-richard.purdie@linuxfoundation.org>
	<a23468ed-d936-aab4-cdea-77a6937306c1@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [PATCH] yocto-uninative: Upgrade to verson 2.3 which includes glibc 2.28
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
X-List-Received-Date: Tue, 06 Nov 2018 20:17:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-11-06 at 09:52 -0800, akuster808 wrote:
> Richard,
> 
> 
> On 10/25/18 8:10 AM, Richard Purdie wrote:
> > This allows us to handle distros which contain glibc 2.28 such as
> > Ubuntu 18.10.
> 
> 
> I have this backported to sumo, any reason not try to get this in the
> next Rocko release?

No, it would be a good thing to test and include.

Cheers,

Richard


