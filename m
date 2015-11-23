Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 59C1D6011C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 09:42:35 +0000 (UTC)
Received: by lffu14 with SMTP id u14so103712071lff.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 01:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=jV2Mkav/x3/Kbe4x823Eq9JCP4ilURMsYsBz3s38orU=;
	b=nvqJQmuN7+OC5DQTCH8E5uCsczC/9GY0KcAvfIxiePUmHh1m0KS5VYlKphxiIXIhSo
	QRAk3XJy1IctuuG+ibSAxjMQ50inEHN1Fo+02eaJmZ6JY8QSIue8vqNURQCy/LglLcRq
	+mj0fPzGK0LM8m9I01mg1Eicu/HIsB2JvsUsVRhDvr9yVuCeh44UUnFqmPDpsxTM194Z
	/eW+C9yIuLMKvyxFHHgwkfmGSx8iPkfJZkGlAxlh8RYbQkSeKn07SB+ZxLlMs6B4KH7h
	66kHZviFDmlHHKYUTiRBtBqbECaeQvdtzje5xDTAKLu9e+e7Rm4olDBuc7FamM6caenc
	bOFQ==
X-Received: by 10.25.159.130 with SMTP id i124mr10532896lfe.144.1448271755900; 
	Mon, 23 Nov 2015 01:42:35 -0800 (PST)
Received: from localhost.localdomain (m77-218-250-52.cust.tele2.se.
	[77.218.250.52]) by smtp.gmail.com with ESMTPSA id
	kf8sm1699053lbc.46.2015.11.23.01.42.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Nov 2015 01:42:35 -0800 (PST)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2015 10:42:28 +0100
Message-Id: <1448271748-3210-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: =?UTF-8?B?W1BBVENI44CAdjFdIGluaXRzY3JpcHRzOiBkbyBub3Qgc2F2ZSB0aW1lc3RhbXAgZm9yIHJlYWRvbmx5IHN5c3RlbQ==?=
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
X-List-Received-Date: Mon, 23 Nov 2015 09:42:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ming Liu <peter.x.liu@external.atlascopco.com>

To avoid reporting errors for /etc/timestamp is not writeable in a
readonly system.

Reported-by: Niklas Soderlund <niklas.soderlund@external.atlascopco.com>
Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh b/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh
index b038fc5..6e5be79 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh
@@ -9,5 +9,5 @@
 # Description:       
 ### END INIT INFO
 
-# Update the timestamp
-date -u +%4Y%2m%2d%2H%2M%2S > /etc/timestamp
+# Update the timestamp for writeable system
+[ -w /etc/timestamp ] && date -u +%4Y%2m%2d%2H%2M%2S > /etc/timestamp
-- 
1.9.1


