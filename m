Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id CB68671B99
	for <openembedded-core@openembedded.org>;
	Sun, 12 Jan 2020 06:15:00 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id d5so2755335pjz.5
	for <openembedded-core@openembedded.org>;
	Sat, 11 Jan 2020 22:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VfJ2gSZ07RiZFgZLAiLGHm+gAKb7lDM/1Thz/mBkeGY=;
	b=XihDWqMZwbKwaOOMtpko2PsomGEZPItLXk1XA5XeINJkBcvvBGB2LhPj54exMv9I2/
	q2YYCBYHpM8N4zMRA/MXSlwqYxbQAZJdX44gvt+kKhRteAoC7as4FASqm7nEErIKi2ZM
	WUsRpo8/G7Ga38qZH2fFWk//TLNxdbTjkvpEDDHdyY05NeOjfaq7ExcdIx0shxHgRdQp
	PHWpD5jsUE7X9ty+ZAv+KKFq3QlRCWBdlhMAOh5hU6CNxY8UqSRmvCcMG24J2KdD414c
	zjf4844IlmrgJZPYnOrO2w/cdBejmyiytnrsoamfEZ6k5hqOTBJH7IbbqbsqTvdyHA8Y
	B9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VfJ2gSZ07RiZFgZLAiLGHm+gAKb7lDM/1Thz/mBkeGY=;
	b=tdeL0KbGBRVj77kJa6hwRPo88yQnunBephLLnUQi/mz8DOu2fkw0crwI2yjHo1/XT0
	am46KedOSVlYm2vJZOYnPm2enGJF9APqth+u3S8kr04o2TxGYAeZHBpaQ4D4fUR/Y6K6
	A4VURUKH/NlAEJ0gywWOq/vQL2wWDzqgqON6i2iXm31uwgsAVdZo+u++JW+tSSxzqUgI
	WSZ+hOith63dEd8Cfdxylv+Q6bwI6Mo5DZQhcPkJSwMPYkHioHA6uinDQOpNAiy0QHQO
	DErXB5mSt0s/BdrvTquky4EHUFuli9PYmZU04VH6DwIslrPB8fdLVuGVGNYsQtOSVWBU
	K/OQ==
X-Gm-Message-State: APjAAAUTEd7KY+ryAXGpzdrk1+Lj8HvKLsriNtBE0hSQWXaaPuUPj6qS
	qKRcRraLhGzggN6mF8n+3VzCSEca
X-Google-Smtp-Source: APXvYqwlwXPAyeSt66j67RBvUsVmT5jX0NxjfjZSLONa4cNNoo6PxmDK2QioRTxq5XSs5HAAdfGjfg==
X-Received: by 2002:a17:90a:cc02:: with SMTP id
	b2mr15306291pju.137.1578809701822; 
	Sat, 11 Jan 2020 22:15:01 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:3849:7200:d754:59fc])
	by smtp.gmail.com with ESMTPSA id g8sm8978559pfh.43.2020.01.11.22.15.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 11 Jan 2020 22:15:01 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sat, 11 Jan 2020 22:14:56 -0800
Message-Id: <20200112061457.10741-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200112061457.10741-1-akuster808@gmail.com>
References: <20200112061457.10741-1-akuster808@gmail.com>
Cc: Ferry Toth <ftoth@exalondelft.nl>
Subject: [warrir][PATCH 3/4] sudo: Fix fetching sources
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
X-List-Received-Date: Sun, 12 Jan 2020 06:15:00 -0000

From: Ferry Toth <ftoth@exalondelft.nl>

It looks like https://www.sudo.ws/download.html changed certificate
and directory structure. This breaks fetching sources.

Signed-off-by: Ferry Toth <ftoth@exalondelft.nl>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit f02e9f46ce54fed3c7ddfad7d1003a2fb7ba3a67)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/sudo/sudo_1.8.27.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sudo/sudo_1.8.27.bb b/meta/recipes-extended/sudo/sudo_1.8.27.bb
index bbca8395b9..43c27bf37f 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.27.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.27.bb
@@ -1,6 +1,6 @@
 require sudo.inc
 
-SRC_URI = "http://www.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
+SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-Include-sys-types.h-for-id_t-definition.patch \
            file://CVE-2019-14287-1.patch \
-- 
2.17.1


