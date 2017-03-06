Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5AC1671DAD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 09:22:48 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id y193so69444571lfd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 01:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=ZriMCpWikkfdUy0Ty/nmhvpAKfiDWE2apL27CdVNvZk=;
	b=HK0kmsEaawdH3Vz8K7uKZcF4orj8HDjiIRyiiyEco27JcsCTD0BfNBPHSJ1Zykegl/
	A4ONcGunVfb6YUyuMvZsvxFVhSOACz6QxTx2idb4mQ4Ibt8Cx6QlVgegatGeRHWrPCOE
	caOoe5fI4/qfvTXf11PqbUqMFDmhkrjrY0YkY3nMuobgnqsBYPYBI/XV9T7TQ/6YaQAf
	7X1gtAVmyUWjUAJrSvq9/EhgMBLE7sA0P1YnMRJUoFcses/9T4uIeqMhQybO7CZNR+Fs
	aqkfTh6acX9PSqoQ+lnARFQ2lisKhjgvZN/bc6xIZH3tQ4646OyO1UhMGgMCY07/+bV3
	6owA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZriMCpWikkfdUy0Ty/nmhvpAKfiDWE2apL27CdVNvZk=;
	b=GLTR2aaGYe237yHETtv9bfZSl10XwhLcJUD2cndN9VacBXcHmeoLGMfbxBUm/MRDUX
	Yr9c9Edl/b/MyqZ2tVzlmrQ+Go4B9YB4/roydJVEBkk5h28g3w7EowN/9FcuX//HqP/u
	uqkUOLZCl6sHjPLgtQuJZPv0g0pLlnQf+CoDOIkPHgtLsAOR2wXVBg/1bOR1M1uwmHIH
	/GmQIjzuKZNkZFvXRdI6BccETNCbfnVBOmplpPIdj2R+BOjk4goObvqXKpjBYr5VN5PS
	A0RhuYD0PabKjKyWWbjRW8EUVjM1ZEClC1SGP4005CWYuWe3SFPX1KjTG8+tyqp9kOi9
	FbdQ==
X-Gm-Message-State: AMke39nJr4C0qsyC9l+HaTrnG9tv9Ixz5gvogS6TxZ2kE05PEN0O9q42ibNApY61Sf6m9/Gi
X-Received: by 10.46.82.145 with SMTP id n17mr1151323lje.133.1488792169575;
	Mon, 06 Mar 2017 01:22:49 -0800 (PST)
Received: from stout.office.pelagicore.net ([83.218.80.243])
	by smtp.gmail.com with ESMTPSA id
	p74sm4028025lfp.68.2017.03.06.01.22.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Mar 2017 01:22:48 -0800 (PST)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Mar 2017 10:22:37 +0100
Message-Id: <1488792157-27915-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] wireshark: update to 2.2.5
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
X-List-Received-Date: Mon, 06 Mar 2017 09:22:50 -0000

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 .../wireshark/{wireshark_2.2.4.bb => wireshark_2.2.5.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.2.4.bb => wireshark_2.2.5.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.4.bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.5.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_2.2.4.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.2.5.bb
index 29dfbfe..03ae3b9 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.2.4.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.5.bb
@@ -10,8 +10,8 @@ SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
 
 PE = "1"
 
-SRC_URI[md5sum] = "6d0878ba931ea379f6e675d4cba6536b"
-SRC_URI[sha256sum] = "42a7fb35eed5a32478153e24601a284bb50148b7ba919c3e8452652f4c2a3911"
+SRC_URI[md5sum] = "749e7ca7606ae7df5c1ca8c62f93ff31"
+SRC_URI[sha256sum] = "75dd88d3d6336559e5b0b72077d8a772a988197d571f00029986225fef609ac8"
 
 inherit autotools pkgconfig perlnative
 
-- 
2.7.4


