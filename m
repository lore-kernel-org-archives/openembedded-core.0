Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2A70C615FA
	for <openembedded-core@openembedded.org>;
	Fri, 21 Feb 2020 02:53:54 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id ay11so250237plb.0
	for <openembedded-core@openembedded.org>;
	Thu, 20 Feb 2020 18:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=rr1LmQbqg5RfSX7YXIGnpUnmMgRxkZCjtsp4TO2hTE0=;
	b=S7u6VK/5BTq+YE3wVNE0hTklg6ZN/fJtvnpnT1LLkh7VtRwjb6qnHAxS/WBVZ+tm11
	SKefOQWQ/rmcm9HtDd8FwerZMsol7c6O/BBbLQC656IhCjVU92nzPrVOxDx+oH9uPjaz
	oC0f5fso1D6KEio6661vXOqhNF5sInG8caJ/RqkF5AKPYLezQgbCw89yEcEF4y+dqgu3
	wNym4wpXzl1uVyv0CdTw/IqPRds+8pxaw15rgYpAAiCUDFL0isrWm+PJu1LNpQ8EX40q
	aKYRyHBQE8LZZz5nKD92aDOf8fH9hYUTv094Pz+OX+ZHeNaABzcbQEExENF4icaJYPsO
	5Snw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=rr1LmQbqg5RfSX7YXIGnpUnmMgRxkZCjtsp4TO2hTE0=;
	b=C+oT9SeaJX7ccLxfq/VMSQm7bI9DyU7+7OgQdn8DNuV1b2PsvE9J5/ShbNTCT/NWFX
	RcoIiffxFvJ2ecA1EJRv0kQNxWHW1ftDKuYm/Ya19IclR7K8CxPUB+COVu7SCDd0bmT8
	6Q0KTIqQ4O1K56EBKbR9LYAkSrSqAlqGzrQ7kiLpC/ATXuXmsG0/p43ImmGAWjMx+lJi
	4cAqt6V6rIie6bA4XpWtnfdwSe8L+svx8W6kznkuPgoIOmoxpQ9zt2DJN0R+AfYJQr+i
	JpdiO21GsMpSdZr1aZHFC+ffLjQRWljeiiUV2UL+njOf54WtM4ZtOnjSc8fQ2HfMcJ8r
	EYsg==
X-Gm-Message-State: APjAAAVGWrK9drVfDsUlEW/Za7/wZodc9dPr68uXJf+i3UJLwpIqNZPR
	8HWCff6uP6gdhe6QsM9VnEPNWX52
X-Google-Smtp-Source: APXvYqwtMWSUElQHY8faqQikRJ78M4ZVSAuaDbkw3sa650EE5b6gk9d/aqqj1H5tyWvtlHXgMd2F8w==
X-Received: by 2002:a17:90a:9b88:: with SMTP id g8mr363961pjp.72.1582253635784;
	Thu, 20 Feb 2020 18:53:55 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:88be:17f0:935c:9e35])
	by smtp.gmail.com with ESMTPSA id
	y10sm925320pfq.110.2020.02.20.18.53.54
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 18:53:55 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 20 Feb 2020 18:53:19 -0800
Message-Id: <cover.1582253544.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [warrior 00/14] Merge request
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
X-List-Received-Date: Fri, 21 Feb 2020 02:53:55 -0000

Please merge these into warrior.


The following changes since commit a63d59f64a2d1f450a7639426cae8e0373a2d764:

  sanity.bbclass: Move sanity_info from conf to cache (2020-01-25 08:37:48 -0800)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/warrior-next
  http://cgit.openembedded.org//log/?h=stable/warrior-next

Anuj Mittal (1):
  cpio: fix CVE-2019-14866

Armin Kuster (2):
  python2: add ntpath
  timezone: update to 2019b

Bruce Ashfield (4):
  linux-yocto/4.19: update to v4.19.72
  linux-yocto/4.19: update to v4.19.78
  linux-yocto/4.19: update to v4.19.84
  linux-yocto/4.19: update to v4.19.87

Lee Chee Yang (1):
  rsync: whitelist CVE-2017-16548

Oleksandr Kravchuk (2):
  linux-firmware: bump to 20190618
  linux-firmware: add PE back

Otavio Salvador (1):
  linux-firmware: Upgrade 20190618 -> 20190815

Rahul Chauhan (1):
  libxml2: Fix CVE-2019-19956

Samuli Piippo (1):
  linux-firmware: update packaging for brcm files

Zang Ruochen (1):
  timezone:upgrade 2019b -> 2019c

 .../libxml/libxml2/fix-CVE-2019-19956.patch   |  38 +++
 meta/recipes-core/libxml/libxml2_2.9.8.bb     |   1 +
 .../python/python/python2-manifest.json       |   1 +
 meta/recipes-devtools/rsync/rsync_3.1.3.bb    |   3 +
 .../cpio/cpio-2.12/CVE-2019-14866.patch       | 316 ++++++++++++++++++
 meta/recipes-extended/cpio/cpio_2.12.bb       |   1 +
 meta/recipes-extended/timezone/timezone.inc   |  10 +-
 ...ware_git.bb => linux-firmware_20190815.bb} |  26 +-
 .../linux/linux-yocto-rt_4.19.bb              |   6 +-
 .../linux/linux-yocto-tiny_4.19.bb            |   8 +-
 meta/recipes-kernel/linux/linux-yocto_4.19.bb |  20 +-
 11 files changed, 397 insertions(+), 33 deletions(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/fix-CVE-2019-19956.patch
 create mode 100644 meta/recipes-extended/cpio/cpio-2.12/CVE-2019-14866.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_git.bb => linux-firmware_20190815.bb} (98%)

-- 
2.17.1


