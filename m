Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41220.1795611566469651774
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 04:59:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@antispam.mailspamprotection.com header.s=default header.b=hXXJm/+i;
 dkim=pass header.i=@valla.it header.s=default header.b=IOmSnefd;
 spf=pass (domain: valla.it, ip: 185.56.87.9, mailfrom: francesco@valla.it)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com; s=arckey; t=1795611566;
	 b=YtV4Ab69aOrB4+2XqWKZKq85TmcrZcRImP/dJDd8buBKgmO/+QgyZeP7QrH5+trBtzRUexovxp
	  W3b+tMgGXxBIQTjTRPWqR7RDenEqQzWnwJTw3kSqFdSPTd5PdVLut7Lqagi91RgeSRPYZdXfeg
	  DIe9q5agiSSnDKQ6Y+0AmVgGC+JeFB7pyq0Oliu9jLw4qPyU3r5LFzPEznepZmHZ437XDGK+PG
	  eMcqW99Rlx3FOMNuMMshbBL3GwCM0zaeJYiXWctuWNN6G18BEqYkhPC2nLJ+LDwGI6GJiuA9/X
	  qBHjVJ6EX64h485ndiiTThXjli13pb5HtUS3fiOas7OHCQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com; s=arckey; t=1795611566;
	bh=QuQgbDQmP1E2Jgbqj2NBaayhAOpUGA7JNV11If97tgw=;
	h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:DKIM-Signature:
	  DKIM-Signature;
	b=TahO72+uLIs9yFYOmmpl6YRJsM3qIFVbclhbIBtHNJImAIOyemv6tozUpAjT2efumYWD01DiTA
	  x6ukuiUU3SbMu+wfN+2IMlSI9lKXW8b4+2YhOUt3Ui6XUWrkgbdFylb+9s6GLJdta/43qi5JVw
	  gGnhTLmlOMsMMZeow3bKo1vO/bOMIV1P0q4aA2uEwk5+EBc3ZNVUpI9Ddrtw15e8EEt0hREG3A
	  DejC5vEssJktj8rum8ytErCRVcdk3MTO9bIuSulZ3LqS/rdyBWvhyKfvC/ds4vCTfG6VTRvI5G
	  M3vx4p4+QkKtztNjRBaPgytrnen8VanvWUQvWSPlaM+I3w==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=U6YEGr86FS8pGEZ9WICIL6AgGmhOGJ2ISCkakqu30aU=; b=hXXJm/+iVHxlRGi28OYoEIC8VS
	bViqblCfY5ibgL2lzzpDlsABYmobjZsuZHCJ5XsAYnMhnhocwjWwEmRpMk7IHge5E0tiMv1Ugp4VE
	HnrgXmvOxNbvzsLhd0RAwK94KwHmYDTdTvu5jVnfAF/kTiyO7fJa1Kgrlej8DmHWi/WQ=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xWCaq-0000000Au8R-03hZ
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Nov 2026 12:59:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=U6YEGr86FS8pGEZ9WICIL6AgGmhOGJ2ISCkakqu30aU=; b=IOmSnefdTYGkUg4O4w/JYfYZAW
	i6OANzr1yS+FzWkP/67FqWanb9pczbrPOBB1OkW5V6SC14+9KgRsvVGnIqw2ZsBvgn56aNOynfPKg
	LXnSv8EC0IcGndzI6LAXCSAZ+wF6LUQIrBxiXtsbLG0T3nWvavFg5CBubutJl4Ts/MQs=;
Received: from [95.75.16.213] (port=43379 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xWCal-00000000J3D-24YF;
	Wed, 25 Nov 2026 12:59:19 +0000
Date: Wed, 25 Nov 2026 13:59:17 +0100
From: Francesco Valla <francesco@valla.it>
To: openembedded-core@lists.openembedded.org
Cc: francesco@valla.it
Subject: Purpose and status of core-image-tiny-initramfs
Message-ID: <awbWWtZxSeJYwz87@bywater>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 5e8ba0b4de5c22fb90e3291ffd7891c3
X-AntiAbuse: ID - 5e8ba0b4de5c22fb90e3291ffd7891c3
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xWCaq-0000000Au8R-03hZ-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 12:59:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251182

Hello,

a couple of days ago I was searching for a small initramfs image to do
quick-and-dirty kernel testing and I stumbled upon
core-image-tiny-initramfs, which I never heard of. Attracted by the name
I tried to build it, but I received a build error that stated that
busybox-mdev was not found. I then opened the recipe and found that:

 - it contains VIRTUAL-RUNTIME_dev_manager ?= busybox-mdev, but since
   this assignment is only local, it does not propagate upwards
   (rightfully!);
 - it then tries to install ${VIRTUAL-RUNTIME_dev_manager}, which in my
   case solves as busybox-mdev, since I have INIT_MANAGER = "systemd";
 - it also tries to install initramfs-live-boot-tiny, being its only
   in-tree consumer, that RDEPENDS directly on busybox-mdev.

While I understand the behavior, I cannot say the same for the purpose.
Digging a bit, and judging from comments here and there, I believe this
is a somewhat old recipe used to obtain the smallest bootable initramfs
able to arrive to a shell. Such an image would be very useful for my
activities... if only it was building :)

Question: may I propose some changes for the entire setup, maybe
dropping entirely initramfs-live-boot-tiny and depending only on
initramfs-boot (less to maintain is better, after all) or is someone
depending on this exact setup?

Thank you in advance.

Best regards,
Francesco

