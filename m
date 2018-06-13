Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 60C5E789D7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 22:25:08 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id t134-v6so6333364lff.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 15:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=hFXDWo55JZBd7ej42JY5DUOZe8n+aDuHBJCGUUk+2D4=;
	b=BLYWwLao7d7nU0mxCh4zL+zriKYCS87gAHXEfAZ0mk/+cnfc/Hi9fr8xtylQzav/ap
	wPLX/YB3ACpekHW6izwZdmdcQqxBbmEskqN+f17Pc7XAWhY4uP4xxfPX2RqsmF/oGuJp
	igPRNET7YQ3XwS5vden6EFlzDAibuu1NeiycvFIWJN4evs9FXbVS0AXb+dQMxmthH1+V
	bpLc8BFI/ft9lWNImxSjvpKHaJDeeV6XfUWEF9w1n1xIAc6+R3AljO8t8T597RUyFvVz
	uIm8hfonTc2+3kal4VOgxIxKBr1uMwJyfSkYgbtS3REL1fgsWwkNAgEmPciSBO+s+tPG
	1rSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hFXDWo55JZBd7ej42JY5DUOZe8n+aDuHBJCGUUk+2D4=;
	b=g9mukgx27pfCBmy6mBQGWbOb8bDGA6JJJeue8ZHys2v7w+XJtXf0Acd/FJHFYSAFRc
	xO+zBFhzU6hDKwD1El0aAr2sV6sNwbwuBo4rbzJY/pwWl45tiL1eyQqt5s+qBlK6O0cs
	zsBAPpTkxZLlyRyxoYdzletCncxv8MRhWmHI7csA9wZISLQBRIeWyf7BAngoksE76oQD
	bZowymSri0UQJKrp+a561dMeSC6L5KGojNo+ha39vQnpg3NbEeWSuggoFAD+6dRQi89E
	7r2JtRBlTfZN+b8OCvrISXNiEwz/axZLoucaovMrQh+uqfYuzwyClfEAUhIHeFIt1NAv
	DWKA==
X-Gm-Message-State: APt69E1VVgKxOaqVDLeJmUcRTEc8qnABVfG0BnLb5h4qygC22yCFjSZa
	I9wjCnv0fNRAK1g375gy+l/vswAM
X-Google-Smtp-Source: ADUXVKJzO8TBFO5wv9TEG3TONNBtDaMN6lghPkpd2MeCtRejBPdZH36IKhM2Ywkrn23dfkDDeqLyyw==
X-Received: by 2002:a2e:458a:: with SMTP id s132-v6mr17780lja.92.1528928708505;
	Wed, 13 Jun 2018 15:25:08 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ae08:1403:ff00:124:d0e4:8f8e:79f3])
	by smtp.gmail.com with ESMTPSA id
	b204-v6sm788512lfb.12.2018.06.13.15.25.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jun 2018 15:25:07 -0700 (PDT)
From: open.source@oleksandr-kravchuk.com
X-Google-Original-From: dev@sashko.rv.ua
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jun 2018 00:25:05 +0200
Message-Id: <20180613222505.17242-1-dev@sashko.rv.ua>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Subject: [poky][PATCH] poky: add ubuntu-18.04 to SANITY_TESTED_DISTROS
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
X-List-Received-Date: Wed, 13 Jun 2018 22:25:08 -0000

From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 meta-poky/conf/distro/poky.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky.conf
index 9bd9ee58c4..19459b1791 100644
--- a/meta-poky/conf/distro/poky.conf
+++ b/meta-poky/conf/distro/poky.conf
@@ -71,6 +71,7 @@ SANITY_TESTED_DISTROS ?= " \
             ubuntu-16.04 \n \
             ubuntu-16.10 \n \
             ubuntu-17.04 \n \
+            ubuntu-18.04 \n \
             fedora-24 \n \
             fedora-25 \n \
             fedora-26 \n \
-- 
2.17.1


