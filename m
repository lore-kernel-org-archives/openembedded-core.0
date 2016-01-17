Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9DBF377011
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:44 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id n128so142176774pfn.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=JG0oPWhqhrHcMBF4ehkmDTgF5r8n4H3yBLGmIm+p4oQ=;
	b=zLRaNbNvcg0qGwUB/GXTKFGOvk3e1/EXU/LNlDDjrr/2PRE37kq4+w4RHrKYNCUJrN
	9BNSb4SQpmK0CUQVAckss8G7Jd/Q7hue3/HKqvz9ipyt86cikEXtVzcJJef2Z+n3U24Z
	OW7sYPuVBp+g03vBhjxlWGncOyQFTr1rP8ECij/se9SpbT60uhNMQfLttpWTXcOxctME
	tJ5V0mAXUGxzZzsODrLGoWgyXqE8rjA/ZgpwS3HjgPzHcbWroK81/+3Wh9MWsaZwqbJu
	fvHnPyYuhO9bj5rjhwe/6XjVqLZ2/ulcCcL1J6iblITxaZM+wFDqfSXzBi6IwHJtwCGR
	eS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=JG0oPWhqhrHcMBF4ehkmDTgF5r8n4H3yBLGmIm+p4oQ=;
	b=Oqp7emObri0RNrU8NO/zJJJgmLNSU5Z0raEyeWosS9BZNJBfP3zjvWo33D0/OXNxd1
	315dp6/PXjyK74jE4Q56ajygwbzn2KfLChGtcX8NsLUOWUz95wbIBk2ZxVNAeC2Mjy6H
	cPBQdVllJkdO0KWy0dayrh0EtgugeowCVj6L3NBFPfwRI69ePa6/gXzEErTgjYZYWRkF
	/fQOz3U9BAz0wE64BPGUwI89RVZ077499uJUw4vlxd7QT5nIrH4ee7Tub/OcEpJfduE1
	Uks6c41GrHCrL8FNeCrO/gt0vQTIlb/HQ+dQKY94+QP2klp+9BAk8GGanw7wM/dXq9G3
	e+WQ==
X-Gm-Message-State: AG10YOQWumqQCWWiwrNRKXmLzOqddecBOq82FL/X1h6evxeotsFThlvFHmgJ04F76OhZVg==
X-Received: by 10.98.19.130 with SMTP id 2mr24977184pft.31.1453030665449;
	Sun, 17 Jan 2016 03:37:45 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:23 -0800
Message-Id: <c0c515e6ef1eac3b0f67c2d58ab0dcb02e8aaaf6.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 50/73] libsolv: Update to 0.6.17+
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:45 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/libsolv/libsolv_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/libsolv/libsolv_git.bb b/meta/recipes-extended/libsolv/libsolv_git.bb
index 78a2d51..cd7cf77 100644
--- a/meta/recipes-extended/libsolv/libsolv_git.bb
+++ b/meta/recipes-extended/libsolv/libsolv_git.bb
@@ -7,10 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 
 DEPENDS = "expat zlib"
 
-PV = "0.6.14+git${SRCPV}"
+PV = "0.6.17+git${SRCPV}"
 
 SRC_URI = "git://github.com/openSUSE/libsolv.git"
-SRCREV = "b1ea39233f86cd62fbab1964d7497244f6be0087"
+SRCREV = "6ea235973e942436c8815dadddf2c318a8b5ca7d"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.0


