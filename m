Return-Path: <akuster808@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 157316FFED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 14:07:08 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id p65so5561622ywb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 07:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=kbfG0IVADov43qLqD7Glc2FVYzMCYKI/nhi1TiFf2vk=;
	b=D7fxWiFTVoMrROJ/uG9oG6NNg37A54brkbk9Uw1ejnaXu8mcf3zVeFMQais889nwIG
	0QIjfUnDlIUXx6t77t/g07IM6JnbTYqpP3y4ItsHAOWm6eeF/GvruzVIqRhHITFfMLhR
	OUg2yZ/tixEIdVKd1VbGNL+lG6/UnWp+X2ffg09evkD0gy58Dp5rO3SNw25zZTqvdsFF
	JvoXxRCH3C0xcTIbV1bSEM7WNca7aAiTixEitFQSwobw/EoFe8M/sGYiOGoQXLr8oipS
	ivIpJRZD06pFNsWHwQX3CUOX2UUXmRu2xZA65nehmSQ2IgNbdDfvq/T7PJV3rLrwe0jN
	YAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kbfG0IVADov43qLqD7Glc2FVYzMCYKI/nhi1TiFf2vk=;
	b=MTDBm1LMZk7IdboUs0i0mTcsa8Dqk87J/FoIZsKUFWtbooqxqHEtX133ot1PZpmMpb
	gzMSKGoLJ3DBtGWwCIQ3WBI13yiBY+sxMo5X89NSsQqRCjR9B0WeYrUuG0HhNcHDDIrG
	n5D8fAvuU6v0Fn/IUup8k57audPJNz/P7QUDbciURTVxCB5YQtLT8rpkWvXtFaQ4tOKe
	SjwNAOf57yGOk8h+1SVjn3Uaz9pn0f+UEohVH0wG2gZyfAk8eN1gfA7jtcQVXjcaljzQ
	FhE1McwFvOqHp1tHTYIYbIsUTMSJn9wwyr2ep7ALM4FodABqA5uUHx1CeBCPknDBRnD/
	7+fg==
X-Gm-Message-State: AD7BkJKbzAWCsRoLfx/pgoGWe8zP6/iiBwliKdzROaHD7k4G3NHN9i6BR7watcgyYPqNXQ==
X-Received: by 10.13.212.4 with SMTP id w4mr3247702ywd.321.1458782514895;
	Wed, 23 Mar 2016 18:21:54 -0700 (PDT)
Received: from Pahoa2.mvista.com ([64.2.3.194])
	by smtp.gmail.com with ESMTPSA id
	h68sm3123910ywd.42.2016.03.23.18.21.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Mar 2016 18:21:53 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Mar 2016 18:21:50 -0700
Message-Id: <1458782511-24274-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH 1/2] tzcode: update to 2016c
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
X-List-Received-Date: Thu, 24 Mar 2016 14:07:09 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../tzcode/{tzcode-native_2016b.bb => tzcode-native_2016c.bb}     | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/tzcode/{tzcode-native_2016b.bb => tzcode-native_2016c.bb} (68%)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2016b.bb b/meta/recipes-extended/tzcode/tzcode-native_2016c.bb
similarity index 68%
rename from meta/recipes-extended/tzcode/tzcode-native_2016b.bb
rename to meta/recipes-extended/tzcode/tzcode-native_2016c.bb
index 3a7dbf5..06b92ea 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2016b.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2016c.bb
@@ -8,10 +8,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=76ae2becfcb9a685041c6f166b44c2c2"
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
 
-SRC_URI[tzcode.md5sum] = "527e73bc90c70746799d61006bcf038e"
-SRC_URI[tzcode.sha256sum] = "e935c4fe78b5c5da3791f58f3ab7f07fb059a7c71d6b62b69ef345211ae5dfa7"
-SRC_URI[tzdata.md5sum] = "f638ec0d4d7a17f001ce475860255c85"
-SRC_URI[tzdata.sha256sum] = "6392091d92556a32de488ea06a055c51bc46b7d8046c8a677f0ccfe286b3dbdc"
+SRC_URI[tzcode.md5sum] = "ffb82ab0b588138759902b4627a6a80d"
+SRC_URI[tzcode.sha256sum] = "344b1bd486935bca2b7baa47db3b99b32211c45f31ec0d1ead8bacd103c5a416"
+SRC_URI[tzdata.md5sum] = "0330ccd16140d3b6438a18dae9b34b93"
+SRC_URI[tzdata.sha256sum] = "8700d981e6f2007ac037dabb5d2b12f390e8629bbc30e564bc21cf0c069a2d48"
 
 S = "${WORKDIR}"
 
-- 
2.3.5


