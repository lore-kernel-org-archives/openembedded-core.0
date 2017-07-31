Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id EE2CD78589
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 17:16:07 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id t83so2200037pfj.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 10:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=na5GD88xt4yQjsO1zR4QV/Z5XkfhZYgn5mTpXeRkKBI=;
	b=DRNY+lPxwM1MB/oVMcuE1hxH5EFs4/lwk/m7ooGOiEWoNbl3fUSetb1YBeRajzhr+B
	qhyHHOr/l46DV7YPcUyPiH4W9RCRz4w4DZmKZbHmW3OBJBabR1yVbO0Fe6KR8TOo2YEJ
	etdouYoeIUfOxbosue+77EOdlEuBkT7AiZsmE35ZNzHaqEJ21VxAzVDL1SceDK3jarCt
	EjSLC1coiRXBefDCxXQ8JkMEKsleVmo/a8w4Fnvq+E5Ao8U+94kbwiW30jz4CJP4VFj6
	zd5Osl0hWlFvahnabAjkXgKvNvgDlcnCL86AfLCDBx+L/n9q8g3zcAsszwTqB4sAjQB6
	Nr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=na5GD88xt4yQjsO1zR4QV/Z5XkfhZYgn5mTpXeRkKBI=;
	b=Zj17hqTDxMeZkYi3RkJ4x2pEnIgvQcJsVZm3/YZcoiN4GGxNLwx2/sgUGOugMIqOuL
	/vGC/kxu+IpezwioFr2dZW4a6GydWCZGwB0W+5UIA1zyoz7CFGby/9hj8+uiPBj9udvb
	YmIRCrAkY196rZb7MkwXNNEsPD3Fc3+Rnu1N9MM6yp7NKd23lC5hCqf/fmeDDX+z0U2V
	DhinTT5eulhR0ji3SzCGDgaBPa4yzKaFyxEDLP2TQGuOOIGn4/92I68INaHUac56LsNG
	FQBnVRK8mo3IfBbqK8bxdgEJzU+A/7fA+Qi7gObhuZTHnYWq2n8BQeV1K9Snw+bHwj4b
	5sFQ==
X-Gm-Message-State: AIVw1118UzBFTQzcu96rmHWTbx9e5v4xmMN0MKI0rAUXSndWWLAO4bY8
	meBbum6xZq20VA==
X-Received: by 10.99.135.73 with SMTP id i70mr16591283pge.293.1501521369051;
	Mon, 31 Jul 2017 10:16:09 -0700 (PDT)
Received: from pahoa2.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	v62sm51191868pfb.170.2017.07.31.10.16.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 31 Jul 2017 10:16:08 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 31 Jul 2017 10:16:05 -0700
Message-Id: <1501521367-17192-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 0/2] Update armv8 tune file
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
X-List-Received-Date: Mon, 31 Jul 2017 17:16:08 -0000

This extends arch-armv8 support to enable armv8-a and crypto.

Add cortexa53 framework.

Boot tested on Odroid-c2 (cortexa53)

Armin Kuster (2):
  armv8: update to use armv8-a tune
  new tune: add base cortexa53 support

 meta/conf/machine/include/arm/arch-armv8.inc | 25 +++++++++++++++++++++++++
 meta/conf/machine/include/tune-cortexa53.inc | 18 ++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-cortexa53.inc

-- 
2.5.0


