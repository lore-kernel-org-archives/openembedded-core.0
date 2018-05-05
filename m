Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id D679874D80
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 May 2018 00:14:49 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 82-v6so16446395pge.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 17:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=a8tdDY4NWb0/WFSGV8AOycfxIGYazx0m5OIim3ov2nk=;
	b=cZenbyqs/w3AP1sRRxz+ud5MyzoI+jtOGYI+pWIFAf1WwKmqMEdvn2ApoDLmmmgLqH
	PSn75LFkh+d4yOEqLC2lkz4baz/yZaNi+eVkeS1N4jcsXMKnkacgyKPclcZxWxFVu+yr
	/DkjcYhI1ouy1jvGiiElpvn4vHPIR7OX00Tu06Q8NrejZSzfbUJtfYCKwSMRhL3O2vCV
	DRF6bDdAvQYTV1C7uCv5l1tvqMQnYlu2urpa2UFGOM3U4A3dwXlCGYa+A8V7YdTkZDTB
	3k7t4osCN7Pmxw46rrCuCEkPhV3mrylizHJ9MxcgZyBeUL7MUKxHLfkuPt1wkbcgDyFu
	cCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=a8tdDY4NWb0/WFSGV8AOycfxIGYazx0m5OIim3ov2nk=;
	b=ghEzlI9Invm2tDAL85SzcI+kJoo/5cAeF8d/kXJ91hr0+CnpRqDb1rRAolZMMi9Ufy
	Cvi935ln8DdZzn69o2OZ5lbex+qyezxc9yjn0aPUgjbrkDiwW+NQrmx0p68sq+0bOS1M
	62l1lRjhq+RPrG35YM4nQ9XNmD8J8ud8XVoKgJBdmB+nwwFQNwhyFcD+yOmVZ5Co5ds1
	Zn7GrxBTZk7ipGVLx8xbxehr+5kc0YNmfHQiaHhfksQVMJX8GYnwS5hM5cwkFaZf/Llm
	2Cg3kOMLuu4PKpNh+VhYJLJ26911zY5ws+dtCw2z8w9ZdvhUieqwuoqUCxOuxu5YWD55
	aLFg==
X-Gm-Message-State: ALQs6tCSEHdSd1N3R3jJy/pCCwC+zvKbpBiXYVQ+OoQvX1jLggcGJfWZ
	nl4eo2o6hI8AkPuQW8DRArLecA==
X-Google-Smtp-Source: AB8JxZp+cJYlF08L8VawuTeM5a0paPBg3+XC1nwrOLTHtDKl0APa2o8UYUMuKjxPZi9Q5HBU282naQ==
X-Received: by 2002:a65:61ad:: with SMTP id
	i13-v6mr23655500pgv.449.1525479290869; 
	Fri, 04 May 2018 17:14:50 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	o88sm36468559pfa.29.2018.05.04.17.14.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 May 2018 17:14:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 17:14:18 -0700
Message-Id: <d5a6bebb0a96bd96bfa876f283d83e9233103d13.1525478935.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525478935.git.raj.khem@gmail.com>
References: <cover.1525478935.git.raj.khem@gmail.com>
Subject: [PATCH 24/27] Disable using GST_GL if gst does not enable it
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
X-List-Received-Date: Sat, 05 May 2018 00:14:50 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../webkitgtk/detect-gstreamer-gl.patch       | 20 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.20.0.bb  |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/detect-gstreamer-gl.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/detect-gstreamer-gl.patch b/meta/recipes-sato/webkit/webkitgtk/detect-gstreamer-gl.patch
new file mode 100644
index 0000000000..57ae48c141
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/detect-gstreamer-gl.patch
@@ -0,0 +1,20 @@
+From: Alberto Garcia <berto@igalia.com>
+Subject: Disable USE_GSTREAMER_GL is the package is not found
+Forwarded: no
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: webkitgtk/Source/cmake/GStreamerChecks.cmake
+===================================================================
+--- webkitgtk.orig/Source/cmake/GStreamerChecks.cmake
++++ webkitgtk/Source/cmake/GStreamerChecks.cmake
+@@ -43,7 +43,8 @@ if (ENABLE_VIDEO OR ENABLE_WEB_AUDIO)
+             message(FATAL_ERROR "GStreamer 1.10 is needed for USE_GSTREAMER_GL.")
+         else ()
+             if (NOT PC_GSTREAMER_GL_FOUND)
+-                message(FATAL_ERROR "GStreamerGL is needed for USE_GSTREAMER_GL.")
++                set(USE_GSTREAMER_GL OFF)
++                message(STATUS "GStreamerGL is needed for USE_GSTREAMER_GL.")
+             endif ()
+         endif ()
+     endif ()
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.20.0.bb b/meta/recipes-sato/webkit/webkitgtk_2.20.0.bb
index 50e2666578..e357c64214 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.20.0.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.20.0.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://detect-atomics-during-configure.patch \
            file://0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch \
            file://0001-Fix-build-with-musl.patch \
+           file://detect-gstreamer-gl.patch \
            "
 
 SRC_URI[md5sum] = "51cc47345c3ec53802718cd6fc9b746f"
-- 
2.17.0


