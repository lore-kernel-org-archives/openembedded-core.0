Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id C7369601A5;
	Sun, 31 Jan 2016 17:41:46 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id f81so134426874iof.0;
	Sun, 31 Jan 2016 09:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=7tkp6wzH5HjvUW9/EDxKTLtlKFSF5VIcDZZoTEPlvOg=;
	b=aIHjuJOUEsPJTwBJ5Ik5Bdxcp1PC+K7c9uxw4c0P4uy9uNpzGuuJbhH4VdUhQX5M1s
	H02wQp8Y7N+Ml3C5XsqiMumsB6/eQARUWUGzOmJHtL/5fRn5OpU7BlwdBigxhyZ8+Wuo
	Gw533w+MN/BxCZQwfIcz9IdPuNylCusk46x5ch9NVhWXimSh6vpoSKE+bFSR8HadE119
	f1GRzn9vDvhz2l1BFfpQbZPQ5s9be72dGZY1d4uset7k0nj0bQ5dxxbdtGkStiQAgAFs
	aAZco7m48Q/m+GgyBHU4ROz8kg2KIM+qiqdXVWq6tBk+8oIzu4F+9lukgeb783Q/XeIc
	x18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=7tkp6wzH5HjvUW9/EDxKTLtlKFSF5VIcDZZoTEPlvOg=;
	b=URURMn/HQFMHP3dKz3+ngohWcoJ2tWFKTWHY2kt0E1HSzcJhfpQ6/5b2wlbQRIrJpe
	JjSu7xx8j3fHoY5nL/dP7mnXS1/7VK+0EKHNf74t8Z7+ea8J7tQ04jWmFvYWv0AF95/v
	bZ23CbxFBpDflq8sIFXf8ZKDsh1RtnttpqyC52Rv5Olp5D4IbxaFEU6dvMFHFvJVOdIF
	uL8TsptwPLyVlInfbH841piD2Il/1ERq9P+2m9xblUWaozsUoj9EhCBhrRop9dX2ofNs
	xTB8XhpDOMGfkEKqGVNeF8jLme1UyVkG5JcrXND+VR/LrQ3T53rZ26eLJ+iK3pP5c49k
	jNjA==
X-Gm-Message-State: AG10YORy2UWJgllBdCT7T9U9ZSffRhMg8UlXc3Z+Wkiy7+b1pxHuOxnNGglTaw7RRkwr0DWpuLFLKO+kgA3Xpw==
X-Received: by 10.107.9.211 with SMTP id 80mr12824375ioj.112.1454262107172;
	Sun, 31 Jan 2016 09:41:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.46.219 with HTTP; Sun, 31 Jan 2016 09:41:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 31 Jan 2016 09:41:17 -0800
Message-ID: <CAMKF1sriCy0VxkkJHKsHaLy0K1N4Ns2E7o-rE_Lq8wSGXoy8hw@mail.gmail.com>
To: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>, 
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Glibc 2.24 _might_ require minimum kernel version 3.2
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
X-List-Received-Date: Sun, 31 Jan 2016 17:41:50 -0000
Content-Type: text/plain; charset=UTF-8

Hi

This is FYI, as I have sent a RFT for glibc 2.24, there might be another change
coming which is under discussion on glibc mailing lists which is on
supported minimum
kernel version bump to 3.2 since 2.6.32 will be EOLed this summer [1]

If anyone is planning on using upcoming yocto/OE release and sticking
to kernels older than  3.2 then please plan for upgrading your kernel.

Thanks
-Khem

[1] - https://sourceware.org/ml/libc-alpha/2016-01/msg00885.html

