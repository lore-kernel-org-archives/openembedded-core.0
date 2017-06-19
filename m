Return-Path: <zeenix@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 943D5780B8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 15:12:42 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id u195so61389802wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 08:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=e/kKRUJCEJNHcd+MqDXKDm6XDeP5wRnvVSxGsGvuR30=;
	b=ZX0P4l+ryDogG356uKWvlELI4rwwmgkdk4K0oTXO43gy1o8FLxX6uBK0VV+ycFg+FL
	USnKUCw0a0toV5XZGN0IyUzm1g5tU+KdYx/XyRgdsdmAEk6tMxCpYmQ9u+HUFJu+ZhEX
	8UyvfQJg3l8TQOdJcXqk2k3Jp7R0YOf5r1CficEK8/I8eefW8z6+4L0RLqlX4GbXfzgU
	Ux6JnT50j2WoTcWwMwEbMtf38RWctRNDEtrudzXian+9qhnhskcOno0lEVA4qpwaEpRM
	5p5VZg78utFMMzwYBfnNfVhG21CAOhzxvDqoL0etLLz/wo9UHbrb7wxhKisVW01P4gwa
	uJxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=e/kKRUJCEJNHcd+MqDXKDm6XDeP5wRnvVSxGsGvuR30=;
	b=hNczxHhIz1dh+9pOj6RmqxvSb/vXaf/7Rxtd5w7JBtbQu3lJM+5v89nc/+2AoaPfap
	ZhBpWKGZ7Q395z/Y3D5vh0vMidSVgLvSbAM/sXnTRYbfrYlAioogwHOuhpebsy/WSInq
	Ba5Nxq8h3zDrvnk5FQiHNewA/+ScGoOSQqyakgwJIdTazwnTcT+pFKJjnJgdMsdGmd1K
	iOgrxA8QKcZv/ykUNqZtfZsWpJUO6frguFeIFcBBJRjkg7MoDSAgKmNN/UT/DMoLj5QM
	OXcpLEjd3f1ct5doxXanhabzBus70X3ZNAw4Vrjm5fYGcrWdCjqx/wfSYAjZ9KBaiful
	ZAng==
X-Gm-Message-State: AKS2vOxdhG9towy4YX2GGeM+h40aIKYFHpbiIMEk5/WXkFd7nOzcpwIZ
	SUtlvz9LZjfe/VechaE=
X-Received: by 10.28.166.137 with SMTP id p131mr15450343wme.43.1497885162870; 
	Mon, 19 Jun 2017 08:12:42 -0700 (PDT)
Received: from zeelaptop.luxoft.com (h-79-136-12-196.NA.cust.bahnhof.se.
	[79.136.12.196])
	by smtp.gmail.com with ESMTPSA id c55sm7996108wrc.7.2017.06.19.08.12.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Jun 2017 08:12:42 -0700 (PDT)
From: Zeeshan Ali <zeenix@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Jun 2017 17:12:06 +0200
Message-Id: <20170619151210.7692-1-zeenix@gmail.com>
X-Mailer: git-send-email 2.9.4
Subject: [PATCH v3 0/4] oeqa: fix runtime testing using systemd-boot target
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
X-List-Received-Date: Mon, 19 Jun 2017 15:12:43 -0000

I'm sending this on behalf of Erik. Apart from adding the missing bug reference in patch 1/4, I also added a 'sync' call as part of the reboot operation to ensure that reboot (after extraction of big rootfs) of target doesn't take much longer than expected by testimage.


