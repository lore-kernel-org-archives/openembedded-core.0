Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id CDCB47DA6D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 21:09:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44gr9k1HYlzLC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 23:09:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1555103354;
	bh=CDpeE0qilOoaFkBc+QqzD1jd62xVQDg63LuGr9quymU=;
	h=From:To:Subject:Date:From;
	b=UkUe76gc6hMm+65IeG8epc3iyUH7Ek6xsPghYEEbrE2j4OPSTEOZf9+9N7eM9noCQ
	fF8wPmyfj/zMxIlZSr+46zGzLOjZVuPP03dZRtNOSMBYVip0FNqYVTl1xLXjnUqceE
	Ycr7rT21tiwiY73CaLNFqXR7R5TBl7Xf9RCios6ytRgchU9MjyzjJR72F02TSdyW1u
	dLzapa1V7eAdwg7k2lwCf1DI2/1C1q3pZk0RQIoRWJbrnNADUZsG2Lhb0eSQQ9mo1v
	hu2pYfTwOftAjL1AuCEo8MQIL7Z5QIl44RSQorZEJuONRZDGVCo86sJTsH+44ZQJmV
	ffMyDHIKB6Ik45PZ+LXDBPqpVhW09uKePDDDKBLSoFApnTkTqWrynMvrHh7+wFYxE+
	7150TJxfuPYEprXKfuua8113PIaiTTuBRujRiob1ulOeKWWtUeRQkhrRytZCfauSPz
	cgt2G2x8v8GsnqqtdqL8hezTcKq7S9NE8CVhIjTQvDPQKDYhGtMiWkHpHvsoMlvOyL
	w05OYZPFfYeJk5cVDrMay7ewqvmz1hJU0wfzOXWxlP8D5qGNeHy9eSO19KOVsJ5xiG
	SFxFw0UVpALl6DhNb7dafkc9+w9R8m3JRMK4zDqjLq0j4zjyEz8ywzDytt44Q5dRiP
	+izMlHgrFWLYoEaE9SsqEv9I=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Apr 2019 00:09:12 +0300
Message-Id: <20190412210912.21432-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] Set XZ_COMPRESSION_LEVEL to -9
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
X-List-Received-Date: Fri, 12 Apr 2019 21:09:15 -0000

It is consistent with other compressors also using their
best compression.

xz is currently the option that offers best compression,
using settings even lower than the default is surprising
and makes it harder to choose the best available compression.

For anyone who cares about compression time using a different
option like gzip or bzip2 is the logical choice.

For decompression, better compressed is actually faster
to decompress.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/classes/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 95aa1674cf..1c44ec4a80 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -54,7 +54,7 @@ def imagetypes_getdepends(d):
     # Sort the set so that ordering is consistant
     return " ".join(sorted(deps))
 
-XZ_COMPRESSION_LEVEL ?= "-3"
+XZ_COMPRESSION_LEVEL ?= "-9"
 XZ_INTEGRITY_CHECK ?= "crc32"
 
 ZIP_COMPRESSION_LEVEL ?= "-9"
-- 
2.17.1


