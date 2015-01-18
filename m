Return-Path: <kirgene@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1591F7178A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Jan 2015 22:55:55 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id e89so3602948qgf.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Jan 2015 14:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=wOx8xpe6fT4fxJkUqZN3EyCAXy68CgvqG/IPHINFP40=;
	b=emlIGCWkZtTPTvgYfRwfXDRBVqSm8SeSW1JjDkY1Hu1WWfGbzn1LmyChiyp9KFCHAb
	qywjZl5UJbk3YYp7BphR5u9EThYFGwNQ8YHudYfZLI6BVgrdlb2UNFCQSFjsi9j73FVs
	3DnAAq+AA+atPfpGS4Gsva27edCuoKYP9ZNvzxtMFBx/S+hNuvaGAVTdwqJix+58MmKM
	+3XcuTlx6KXmCAX12FhOTt0Dq1RUVxc309rooVHM8I+DMquFd0zuAKzrTmUhj4WNeQVP
	nMqVQnyoAs6MSX7z3xxN4j7LHWZ+CfLlZlS0zws7hlky7WTFO4CoWf6TriutiDisjHWA
	vTZQ==
MIME-Version: 1.0
X-Received: by 10.140.98.2 with SMTP id n2mr10740479qge.62.1421621755957; Sun,
	18 Jan 2015 14:55:55 -0800 (PST)
Received: by 10.140.28.227 with HTTP; Sun, 18 Jan 2015 14:55:55 -0800 (PST)
Date: Mon, 19 Jan 2015 00:55:55 +0200
Message-ID: <CADV-EXFaVwA2kjDo3e9VvO-sodxpxTo6HFDis1oD_36oq3NehA@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: RPM package generation architecture
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
X-List-Received-Date: Sun, 18 Jan 2015 22:55:56 -0000
Content-Type: text/plain; charset=UTF-8

Hi

I'm building RPM packages for ARM board.
I'm getting packages generated for 3 architectures: all, raspberrypi,
armv6hf_vfp.
I can't install any of these packages with rpm as it uses "uname" to
get current machine arch and "uname" outputs "armv6l" arch. Also "all"
should be "noarch" for rpm.
I want that packages have "proper" arch: "noarch" and "armv6l".
Could someone give suggestions on this, please?

-- 
Regards,
Yevhen

