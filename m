Return-Path: <armccurdy@gmail.com>
Received: from mail-ot0-f194.google.com (mail-ot0-f194.google.com
	[74.125.82.194])
	by mail.openembedded.org (Postfix) with ESMTP id 258DA75065
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 21:00:03 +0000 (UTC)
Received: by mail-ot0-f194.google.com with SMTP id t1-v6so10619173ott.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 14:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=fZlt2YEUzvs3DDKpz+oLYEe3TnMiGUywc1ZKoYv63ag=;
	b=hDrXTTjobc4FyMcz/Q1xIH/GoP0EI12ZrN8OTO+q/WU07UktbM7iUMS/MaVr17tsGl
	Dj8z/DdD0donh1okEnZKOffkGbxqCcHipMIax4tGWpNCfjB69FjqkSg1VpRBZVAajxVY
	/0Bpjc/Wgc1aZpViPLzPmFQcwQAR8GOufIrMJgr2hk0oVCWJlrxkozSr1GC4nD9Kb1ox
	TTiFf6fejGz2vnTmFvBHHGOSCfWa44m+fYuPtJ1iv1FGVq2TN13ZDoM6UpgAQ8+qK+ZY
	cYm8kPVZtFoUVtm79olGcmlTZB7oYkAyX7OR6r9a18ofKTUr0DimIZmBRzGOx45aIML3
	ZzwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fZlt2YEUzvs3DDKpz+oLYEe3TnMiGUywc1ZKoYv63ag=;
	b=FLZaEIKbKAXU1tN/DEyAU3mNA7ZEpW/x3Oh+mM9FK2QLqeosmRgVWe+Nv8FF1BezdM
	RrVceR7rD9yZhJMRS1Td+h0k/qPdvacPvDOShtBqWk0HK649W1Gu+9d5S0tiyKyRQt1t
	hJ+XMwS1j72jscVVqQ6Q/eFobS0+lllyF5tu5IDv8LmfvissVWmeCj0Z+gClv4yTL+RW
	ny/+/CJ8OBgJOemAP0KhiPiN+QlGMIgdsiLvs/2dayqEwk9kt5Km2gtHiY7ZqzRYf28X
	yueRiFhMnzRiryOvIB7yGB+l5arZYcNLFEmO/H2oNOGMq+U/ZtE/HDE/rYsq0DOLgsL6
	g29g==
X-Gm-Message-State: ALKqPwcHjLrb6vQHvqurzA75528zFPR9/aRQObxtYtPD+9bG6uym18Fg
	9VolmBMSOfo7W4LBGkKCrzjHyw==
X-Google-Smtp-Source: AB8JxZrKQGWpn+FjFB4GQ40yVEb15MOBgwxjxUXGNfhZ0/T+VF8HazNpfkpQpaobC0ODt5orwankPw==
X-Received: by 2002:a9d:4494:: with SMTP id
	v20-v6mr7133084ote.278.1526677204478; 
	Fri, 18 May 2018 14:00:04 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	e37-v6sm4698441otd.81.2018.05.18.14.00.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 18 May 2018 14:00:04 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 May 2018 13:59:57 -0700
Message-Id: <1526677197-17068-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] base.bbclass: update obsolete comment about rpm do_unpack dependencies
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
X-List-Received-Date: Fri, 18 May 2018 21:00:04 -0000

The previous comment was made obsolete by:

  http://git.openembedded.org/openembedded-core/commit/?id=2f31f1795bc0c85b1646bc7d9596bbe778cb84e5

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 7c42cf9..1a359a0 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -621,7 +621,7 @@ python () {
         elif path.endswith('.zip') or path.endswith('.jar'):
             d.appendVarFlag('do_unpack', 'depends', ' unzip-native:do_populate_sysroot')
 
-        # file is needed by rpm2cpio.sh
+        # Some rpm files may be compressed internally using xz (for example, rpms from Fedora)
         elif path.endswith('.rpm'):
             d.appendVarFlag('do_unpack', 'depends', ' xz-native:do_populate_sysroot')
 
-- 
1.9.1


