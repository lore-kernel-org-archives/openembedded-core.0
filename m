Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0D65C774D6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 22:29:18 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 3so8201128pgj.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 14:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=I0dae5A74cU0uVXYjx0nnPX8wXsKJitt30JAgCELi8s=;
	b=nvUwjCqKbJRvk4NJxznPFlvB6NX6RfYWZR5tYWZ1Oih5xdkmdtoV3xJbQrPeNp1n2c
	PsT5w366EDko5+UHPXg/iMXJaEi6jJN1tVCL2E/ZsXsnG8MWOYAQpMWR5X0Awzhvw8Zn
	WjeQR+aCdAw3LjjZmyYKUdwQDON0mAvbFzpCtQjuyWav3qS52ljm40MfMjMwURfUl3Zu
	bhTOms08iw17xBZ0k/WThX3hdz3zIcIR8CIj7bkhsGgp00CHH8WnQkzf6u+OnK02QtA7
	m8eH2PRNcNmN1+YHOLLeV51sEFChJAo2p4ZWLi3idXkcl2VPNJHcQ0nXAQ9I4icVL3Zj
	jdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=I0dae5A74cU0uVXYjx0nnPX8wXsKJitt30JAgCELi8s=;
	b=QjX6Ogqt3azsUpJt1HTkrxgVdAcn6q+v0/nLL1CJCqLAAXtw4396xHvPIU6Mb9Takj
	enJK/XZxOqQ6qRJAEotx7FBDrF4oDEzIDr2rO0fsjc235EeVzzAjImCcUkgYkq9so5Am
	22z+lL7Vqfy4IhDuEt0ykIqIcuCYmYEBJBWogtfgaNXh0FeL+C//bVFd+Gcqv8k5LT4p
	HxEVjyRCyO5MkrkEl55lwymGHzJUnZb99qGKXwJePzl5xE1wRAjPbfx97ridgswMU1Cr
	Ei23kDRxkIqINDZkzMp0QQMtypYFbSoZ6jZXTRvGaXxdAE52CCIThARpLUdwDJnshGB3
	77hg==
X-Gm-Message-State: AIkVDXJ2jR1oE61h4XOd8XsUn9CqLRRs9yESxbaiBgQvgRuO93MJ8ujRl0lRgAKuhl1OAw==
X-Received: by 10.84.143.165 with SMTP id 34mr15684904plz.2.1485556159191;
	Fri, 27 Jan 2017 14:29:19 -0800 (PST)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	z70sm13688851pff.26.2017.01.27.14.29.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Jan 2017 14:29:18 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 14:29:09 -0800
Message-Id: <1485556151-9063-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/2] replace USE_LDCONFIG with ldconfig distro feature
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
X-List-Received-Date: Fri, 27 Jan 2017 22:29:19 -0000

Andre McCurdy (2):
  bitbake.conf: replace USE_LDCONFIG with new "ldconfig" distro feature
  systemd: check "ldconfig" distro feature when setting PACKAGECONFIG

 meta/classes/package.bbclass              | 5 +----
 meta/conf/bitbake.conf                    | 2 +-
 meta/recipes-core/glibc/glibc-package.inc | 9 +++------
 meta/recipes-core/systemd/systemd_232.bb  | 2 +-
 4 files changed, 6 insertions(+), 12 deletions(-)

-- 
1.9.1


