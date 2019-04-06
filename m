Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 20A5C7D6B7
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Apr 2019 16:20:03 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id d1so4731342plj.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Apr 2019 09:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PJl3JShqdjBDhAjcmWPuOtRlQ7amGRK/IoSJ1XRzak0=;
	b=Z2fa826gVwlmkcjgeGHOR4bVIGyaZ8tWZXWCsy3CLw89s1SaTmoTosNzwLW7sfuTPY
	eBHpEFZ6GqSqugrqpavwLzMFmySItBH7X/xVoS2wDSrJ9lCb0xypfsoCJSVGaI0FFynO
	yT3ugQmNi2+gYfauoI3I/V8Eai/VHzF7SUC141e5nst2Idhgacr8Dk2cMKa8oRxV60Q7
	hgQIe4Ufc+GxDDU7sOb4gndfI7LPwJ/7taXrtGg9VaTksxCTjKRJYIQf6OHAdLlap/EF
	+ep0jJsVTKU+qI7hmVL9TvM83LqkVNQ47lFepWBRLRLK/BOiIESfLkUWez0oMsToLrbC
	UIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PJl3JShqdjBDhAjcmWPuOtRlQ7amGRK/IoSJ1XRzak0=;
	b=fW6d0vDjaK2uytYIbGowmYaww9ytx/QHIKmv3PzhQcKiDFJd42l3yLtTSRmwr5TCjK
	AwMtMWJq8xuXif0Piv3ZwYf/tY2rQM1ZDtfSoB8T60SGP5yrcz5VQSE9VeAhv8+OnGtT
	1n2HvaJ56kdgouddoQujkn4tozU06iRUx59qdT02JmfDJPmfd+QKXOjy9JPCetjvGuPF
	VHPAKil8rzIX1vwFBjSql+DzavedVib+5bcz4AkqhltcA/HbXSZ1sG1YAp1b9HhZ0W4r
	LcsQ9Ynzwo/FY6QegtPbWuFfAkIi0/xBB44gF8iQA7E2cHUgQoshdAnJeefjatf7yZxH
	psIA==
X-Gm-Message-State: APjAAAUCcxb3IA4Grd9CWV6fbnch5K25vipVuVYTyCloXwVrTKxJQlYr
	yR71cBKBfazhZKA/D9jO7mJEPluNJTM=
X-Google-Smtp-Source: APXvYqy0jqWI891kbrBR5O4qveFU1vypV8aeuOKKNaMC53/G/rBAf8W1c/ys3XI7yrFM/u/fx0qQ8w==
X-Received: by 2002:a17:902:6b8a:: with SMTP id
	p10mr19737121plk.109.1554567603580; 
	Sat, 06 Apr 2019 09:20:03 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::8ec8])
	by smtp.gmail.com with ESMTPSA id
	19sm28393435pga.88.2019.04.06.09.20.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 06 Apr 2019 09:20:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  6 Apr 2019 09:19:48 -0700
Message-Id: <20190406161948.9151-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] gstreamer1.0-python: Remove --enable-introspection
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
X-List-Received-Date: Sat, 06 Apr 2019 16:20:03 -0000
Content-Transfer-Encoding: 8bit

This option is not available and recently it is reported as error

do_configure: QA Issue: gstreamer1.0-python: configur
e was passed unrecognised options: --enable-introspection [unknown-configure-option]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.4.bb
index 8d45ca2668..3358352128 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.4.bb
@@ -18,6 +18,7 @@ S = "${WORKDIR}/${PNREAL}-${PV}"
 
 inherit autotools pkgconfig distutils3-base upstream-version-is-even gobject-introspection
 
+EXTRA_OECONF_remove = "--enable-introspection"
 do_install_append() {
     # gstpythonplugin hardcodes the location of the libpython from the build
     # workspace and then fails at runtime. We can override it using
-- 
2.21.0


