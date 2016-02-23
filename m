Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 11F13772C8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 18:54:36 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id c10so120618635pfc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 10:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=NvMQ+lrvMk0fr6dINOYp6jOATHKnYF8tSjAeSgmWlr8=;
	b=xSgugjMD1PJl0OUdbiIm/90I29cHkULIID+CM1GRsyw4w6r3JrV6F9SvoXJo5IIQU3
	6MpKj9w+4albDLaM7OWuZMqNDZulY0L7p+5WzjeFgpladYG6JTU1YoevunwK+4IKYqZJ
	kgkpZ5rF3UFLSE5ugU8Fxm1+cU9dAjlD1BFIT9LSPNp9k3hViANzSlioHv5wmPejeqR9
	vTxp+JCHgh8Gg9omk5GnNmeyWoCm9rL/AEJ/IgrN8XG9/05afSr0LFH/2BqQrR0pEdh0
	zHkms82xvce+FPlwL1Vj3vVrlp1gEdFqY7AvTkccojWWYD5enPEfnpVJcB//qLCVWEqu
	ox7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NvMQ+lrvMk0fr6dINOYp6jOATHKnYF8tSjAeSgmWlr8=;
	b=g6LmqX5qiaQYHDhHrVhemNzca6zjiXZbjhlPoNsZoef6HPbls4ZW7r8/AicYsC8aL+
	JYdj2bD4DDFwFNVY6twUlgp4bWjBb8XrTj6wXe5OEIkbY4HKNjc9dQN0pAjbeD/hAw3V
	9j9RnztKwNYTNeftKOoN1A1VQosye1nbew76H0SKa2vQgd9vxgI4brpO1KSnFi1m8zlw
	em1NeGmNlC4csWSBp3l3gQLTqC9d2A+FW7PI6GJSZnE1oBFwjI27HOjWriZAR/vIV0Nk
	rchDJG+Bw/XLZhOeJz3djOzz1NP6/QjT75wYp56vRKbU4KpUsneooh89+SJ+Jj0Xxt02
	CGPw==
X-Gm-Message-State: AG10YOSFi1OEZQph6AI7SAhv8hCPWDojiODlOK+xgne+IROo2VlLojqXlJZt7N4Qmx/W4A==
X-Received: by 10.98.68.73 with SMTP id r70mr49157902pfa.136.1456253677411;
	Tue, 23 Feb 2016 10:54:37 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	ll7sm40535922pab.6.2016.02.23.10.54.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 23 Feb 2016 10:54:31 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Feb 2016 10:54:24 -0800
Message-Id: <1456253665-2420-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/2] harfbuzz: update 1.2.0 -> 1.2.1
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
X-List-Received-Date: Tue, 23 Feb 2016 18:54:37 -0000

Overview of changes leading to 1.2.1
Friday, February 23, 2016
====================================

- CoreText: Fix bug with wrong scale if font scale was changed later.
  https://github.com/libass/libass/issues/212
- CoreText: Drastically speed up font initialization.
- CoreText: Fix tiny leak.
- Group ZWJ/ZWNJ with previous syllable under cluster-level=0.
  https://github.com/behdad/harfbuzz/issues/217
- Add test/shaping/README.md about how to add tests to the suite.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../harfbuzz/{harfbuzz_1.2.0.bb => harfbuzz_1.2.1.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.2.0.bb => harfbuzz_1.2.1.bb} (87%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.1.bb
similarity index 87%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.2.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.2.1.bb
index 2ef7d4d..f88e634 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.1.bb
@@ -12,8 +12,8 @@ DEPENDS = "glib-2.0 cairo freetype"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "59e3464e78a9864dff09f608a6befdca"
-SRC_URI[sha256sum] = "79ff5305153d15931fbdda80c9612783b0283dee44f4c2af71aa37353daaa685"
+SRC_URI[md5sum] = "c50034739e4b5ea85d46199bf7859ea6"
+SRC_URI[sha256sum] = "0c189aa386c5ea8d7c315adf273f56f48f412081a367b3f92abc2d0855fa2226"
 
 inherit autotools pkgconfig lib_package
 
-- 
1.9.1


