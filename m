Return-Path: <andrei@gherzan.ro>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id AC716602DA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2014 15:08:32 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id m10so2524433eaj.26
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2014 07:08:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=N3DmUJuqSmN6Yqtoqt9LoeYzz7l6C1UNIvk7CHQo/qg=;
	b=Ui2ACgjbEhp5yw+wKJvRZUCH/djctsWJwhb1UUyKv6FRAW+/085c+jUHUaq7KCQt+W
	WT1FKjxPfkRT1Q270dMrVtvua+Vd1rhOhsaTECjJRsKc7gOQWliZlWzgc4DFMOUy0/Dn
	JpzkNjo01zkTnR9DCAyT7LC9WFLJX4nt8yWvAbBVEx0zcRrAfwofkkHAm2chkB8SWy/X
	uSUpznURnW1G9MKOGwDcddZgdeHVA5PpLdSHfgjIPByEyXZNLGrXFNLlUsb9olWadHMb
	wPUcfkOhQDNi0QxdQ7d8axKIMA5wuBMILjJxFmoSeUqMZb4aetuXcdLxs+1jzpLYcJTD
	U/WQ==
X-Gm-Message-State: ALoCoQk1d2Bx+nCFzWcoqD5meHL8gqfftXBfHk4QBgaCivfUvtvNUXnVpDkjePz4t1mlTGHq1q+M
X-Received: by 10.14.202.137 with SMTP id d9mr16304497eeo.23.1389452913283;
	Sat, 11 Jan 2014 07:08:33 -0800 (PST)
Received: from localhost.localdomain (5-13-221-193.residential.rdsnet.ro.
	[5.13.221.193])
	by mx.google.com with ESMTPSA id v7sm23505814eel.2.2014.01.11.07.08.32
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 Jan 2014 07:08:32 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Sat, 11 Jan 2014 17:08:17 +0200
Message-Id: <1389452899-633-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 0/2] Cortex M3 tune fixes
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
X-List-Received-Date: Sat, 11 Jan 2014 15:08:33 -0000

Andrei Gherzan (2):
  feature-arm-thumb.inc: Use thumb instruction by default if
    TUNE_FEATURES thumb
  tune-cortexm3.inc: Cortex-M3 doesn't support ARM instructions

 meta/conf/machine/include/arm/feature-arm-thumb.inc | 2 +-
 meta/conf/machine/include/tune-cortexm3.inc         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--
1.8.1.4


