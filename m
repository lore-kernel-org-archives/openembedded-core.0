Return-Path: <niqingliang2003@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 77C3B609B2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 08:43:41 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id n3so6941152wiv.17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jan 2015 00:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=hmaJ+VUJIEU7SZ0koFciPvA5m4ikSbykfmbTBmXBBh4=;
	b=VirZ7U6libcG60PXGzFbna6/74ZbjYvgFC6uISqI9prycxrbzQ2JYrmfZwhndL2s+b
	oUnz4P/L2urGeFbDnyg10QF/R7gVXvsYS0qPWupa0fI43BLB77qq8jQh0doft/NQNb/U
	Twj3k2GjdSkAMHqZ76H9TUI+nBa86dakFr+fy3N2io+jFQVb1SkS2qxyhAKvtZSgT4Eo
	CVc32+SkKpESMXUvL1sAhpm9REwyTBTkJwZMfbB9wSTw5uKpGtxuXYDF7I1eNhsip2aB
	PdX/EkdU3CO9qAo1GxAXjo6SeUk2vFlHnMJIYIJZB9H9FPLrOfAGcYEyLCoKtDfibHUa
	nJ6Q==
MIME-Version: 1.0
X-Received: by 10.180.74.108 with SMTP id s12mr5257548wiv.28.1420620221894;
	Wed, 07 Jan 2015 00:43:41 -0800 (PST)
Received: by 10.216.24.130 with HTTP; Wed, 7 Jan 2015 00:43:41 -0800 (PST)
Date: Wed, 7 Jan 2015 16:43:41 +0800
Message-ID: <CADwFkYcEKLmZPWxzdV+CU61ahT0yzDjApuMsp2AXkEzWmXSr=Q@mail.gmail.com>
From: Yi Qingliang <niqingliang2003@gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: openssh on read-only systemd rootfs
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
X-List-Received-Date: Wed, 07 Jan 2015 08:43:43 -0000
Content-Type: multipart/alternative; boundary=f46d043c81e6afd505050c0beb97

--f46d043c81e6afd505050c0beb97
Content-Type: text/plain; charset=UTF-8

Hello,

in 'image.bbclass', I found some logic for openssh running on readonly
rootfs,
but only in sysvinit branch. do we need similar logic in systemd branch?

--f46d043c81e6afd505050c0beb97
Content-Type: text/html; charset=UTF-8

<div dir="ltr">Hello,<div><br></div><div>in &#39;image.bbclass&#39;, I found some logic for openssh running on readonly rootfs,<br>but only in sysvinit branch. do we need similar logic in systemd branch?</div></div>

--f46d043c81e6afd505050c0beb97--
