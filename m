Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8AC047D419
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 May 2019 13:21:54 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id o4so12336384wra.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 May 2019 06:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=sx1faZYgY1QPK+bhl4DVNAJIAVAQr6brNvTAfK/VjCI=;
	b=LY2Jrc53SEf9xoiJUWxVqZNs0N60zfZav/Iv4tcq3neWJcXmZb42v2LrG1V7IVemzq
	GdNPSdRO4Q6wWNr1fY4djTMrsoR4HB6F8yhaHNFC+z6aj0dMd6sV0k9/NdLgvhZpkJsE
	RzGwZTlRc7ee3Cm3ik+AeoaKb6big/BQje4s0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=sx1faZYgY1QPK+bhl4DVNAJIAVAQr6brNvTAfK/VjCI=;
	b=LeQRPG2cIwAJBBozJ/LeSvept3DZFn6KnELNaXuRPPoaSWi2qvOtXbQXcMeTm2h+7/
	rtjfY22nDgulvE5SMYY+6eXbiYKnXNBYC+b0jBu6vifDIz6fkBfst2GxiUemmsL02qSU
	6MffH3Dbfoqav6LJXBB/IA6ykyuQWJNu2xgc6K+MK3LtuBoeGHQ2ezaIm3OGgW8Jz74I
	/mTquJq5TebCbordbshK/XefcgwyM2om6blXoK1lMSUltZka09+caA9srsfG10ahGQ8g
	Cucx/KTyO+CXl/MdfQyShdhgZnjRAVTXQIcWaqB5XXDyXPVnFFq2NG/Jom+pX000UjlZ
	Nv6w==
X-Gm-Message-State: APjAAAXx8C06zaEAqXuiW3yKUwpmL9nCN/bHBTwVXRDbWXciJpQLFxk1
	1KQBqNFjbWr/gmtIO9PzXOUqkw==
X-Google-Smtp-Source: APXvYqwkR10n5PpUUPzK84DCjeWYLbFv3eBaMyc6QjxvspWCNypP72bkC1iMrGlaZZXuHfVkEDCLzg==
X-Received: by 2002:adf:e5cc:: with SMTP id a12mr14814376wrn.78.1557667315238; 
	Sun, 12 May 2019 06:21:55 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a10sm1557483wrm.94.2019.05.12.06.21.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 12 May 2019 06:21:54 -0700 (PDT)
Message-ID: <736954077d40261a25f189a4d459c8cede0f8d99.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
Date: Sun, 12 May 2019 14:21:53 +0100
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: OE-Core status with gcc9
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
X-List-Received-Date: Sun, 12 May 2019 13:21:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I've run some tests and think we're now down to one remaining issue
with gcc 9:

https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/579
https://autobuilder.yoctoproject.org/typhoon/#/builders/55/builds/145

which is a kernel "make scripts" segfaulting on target on mips and
hence failing to build kernel modules. If we can get that one fixed
we're good from an OE-Core perspective to move to gcc 9.

I have to recognise the work Khem has put in getting us this close!

Cheers,

Richard


