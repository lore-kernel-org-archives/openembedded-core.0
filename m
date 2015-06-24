Return-Path: <niqingliang2003@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 88D9875A2C;
	Wed, 24 Jun 2015 02:08:38 +0000 (UTC)
Received: by igblr2 with SMTP id lr2so66413403igb.0;
	Tue, 23 Jun 2015 19:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=QecNKfQH8uzRauQw4WkvwigYWQYErFZ1UUXdgchtf34=;
	b=hO4F9kVttDGyByvYnhJJq3czspLJHXU0KiohSb6oBwjTmff93l+rj9DH1wFeZ/vT43
	aq1WtSJAW9xgjxPQGKIc3+Nk0Jbba4XyOLVdTATn0kZB+cikp5mvusZtdPGv6q2JwYDY
	qx3ZZKjVWK4c8zxIi/W+1Ox+XyslcARlOQN7wY9r5kLuuOnTXplGPhqEbHlPQRgKn+dg
	3wNtDfsTJhHLlOl0t+lhf1SuRYWU91QXXrg+BQngjzW3UwjR3DdTZr8bWJPbBaRGeAYr
	Y5//BlU0tonBv0ku5c+Tt+Z4LkPnPJZEQzZP0YteB9mF5k5xUPKz47e08g8908USayNV
	25Bg==
MIME-Version: 1.0
X-Received: by 10.107.16.159 with SMTP id 31mr22495ioq.62.1435111719985; Tue,
	23 Jun 2015 19:08:39 -0700 (PDT)
Received: by 10.36.24.74 with HTTP; Tue, 23 Jun 2015 19:08:39 -0700 (PDT)
Date: Wed, 24 Jun 2015 10:08:39 +0800
Message-ID: <CADwFkYc6Q=wT0Tv55xre35o514x7MVb-Uc9=toy-KKnHG+5wkw@mail.gmail.com>
From: Yi Qingliang <niqingliang2003@gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org
Subject: zImage-dtb
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
X-List-Received-Date: Wed, 24 Jun 2015 02:08:42 -0000
Content-Type: text/plain; charset=UTF-8

Hello,
    has someone used the "zImage-dtb"?

    the "zImage-dtb" will concatenate multiple dtbs append to zImage.
    How the kernel select dtb in running time?

Yi Qingliang

