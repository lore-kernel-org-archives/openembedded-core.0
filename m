Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id ECCD57FAAE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 18:15:02 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id q6so3757661wro.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 10:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yzxoDVhIeJ3SIdGt9wFbGyt+WvZp3cdSPh1oZYRqw7s=;
	b=sYS8eoeNYHicv9IggP4denDrI+zSidMHtvdiCyvKNLw6dj3UcUbFI9On85u8ECUHLQ
	Na9sGtqmRWFjys7JlKSNWljoyBqX7Y6Fo/R8IU3/1fd4sJLjunV1hOYij1CkW8QiRDcR
	Zy7LIwN4lZ6cvzONJW6STKy8BYTkjNIjtzkoYEuaGv1sQqbZKB8WiP8tKynhcenqvReR
	NZX0i4DLgK/x8EZCaPed4xuvHNO6W3sWGbCgqsNSjGgbkH/dU675fF/1nskXWFNHlynW
	/XKHp20jtIBdjqxO4YyDv/CrkSt2P6XWNf8H2it4Zb7gFpyOEkMqCnHY4CuS4lLIdzKV
	8mxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yzxoDVhIeJ3SIdGt9wFbGyt+WvZp3cdSPh1oZYRqw7s=;
	b=U9jPzk//C0DC1UJe4F/po6rS4o5dQmkihhO6PhZLwansjY9iDXeKks11VZ7uqkejPG
	O+FQku0pHL7swHwu3s2ZQSzALUeGoEc0QxW/NnqR2lzYbg7hFYhwy44H3i7f6861u24t
	MsnGXXu1Vz4V6lsGouri2Ok7tpdwvcBFUgjNRv7Qm18EY4uv3jM+2Gw+VD28/ubVEQWg
	es5cQO+lEBsCFsMWnAd/igAMuEzceQkgQK7Ic9QQ7lFIQ19NC78acXuxNRVLIHESVd9K
	UiBH5Dq2sTWQ6C8R90Eq8K5WKEj2PJuwalpyyG/CjTufRdhXB13cr01JH8/uHcpkl09b
	CCow==
X-Gm-Message-State: APjAAAVA7Z25Ye4uSK1bOysAudd33q/P6pClHNUGtjSx7/tY4HUOAfKj
	it8aukHRGEWbTuW2GhHVHpdVOZSi
X-Google-Smtp-Source: APXvYqzT7Bu12L6kvfQeMIpfO1opcvxGNTsCciso2FZwWjRvzjIAL2nVV04fSlnpf6PzdS9zinTwkg==
X-Received: by 2002:a5d:5708:: with SMTP id a8mr8202947wrv.79.1576174503442;
	Thu, 12 Dec 2019 10:15:03 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	o66sm3147571wmo.20.2019.12.12.10.15.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Dec 2019 10:15:02 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Dec 2019 19:14:27 +0100
Message-Id: <20191212181436.1322-21-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191212181436.1322-1-alex.kanavin@gmail.com>
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
Subject: [PATCH 21/30] lttng-ust: update to 2.11.0
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
X-List-Received-Date: Thu, 12 Dec 2019 18:15:03 -0000

Remove patch as issue addressed upstream.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../lttng-ust-doc-examples-disable.patch        | 17 -----------------
 ...{lttng-ust_2.10.5.bb => lttng-ust_2.11.0.bb} |  9 +++++----
 2 files changed, 5 insertions(+), 21 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-ust/lttng-ust-doc-examples-disable.patch
 rename meta/recipes-kernel/lttng/{lttng-ust_2.10.5.bb => lttng-ust_2.11.0.bb} (89%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust/lttng-ust-doc-examples-disable.patch b/meta/recipes-kernel/lttng/lttng-ust/lttng-ust-doc-examples-disable.patch
deleted file mode 100644
index bff852799d0..00000000000
--- a/meta/recipes-kernel/lttng/lttng-ust/lttng-ust-doc-examples-disable.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-Don't build the doc examples - we don't need them and in fact they
-never successfully built in previous iterations of the lttng-ust
-recipe anyway.
-
-Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
-
-Index: lttng-ust-2.9.1/doc/Makefile.am
-===================================================================
---- lttng-ust-2.9.1.orig/doc/Makefile.am
-+++ lttng-ust-2.9.1/doc/Makefile.am
-@@ -1,3 +1,3 @@
--SUBDIRS = . man examples
-+SUBDIRS = . man
- 
- dist_doc_DATA = java-agent.txt
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.10.5.bb b/meta/recipes-kernel/lttng/lttng-ust_2.11.0.bb
similarity index 89%
rename from meta/recipes-kernel/lttng/lttng-ust_2.10.5.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.11.0.bb
index cfaad30b694..6d7c05e65e3 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.10.5.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.11.0.bb
@@ -15,6 +15,8 @@ PYTHON_OPTION = "am_cv_python_pyexecdir='${PYTHON_SITEPACKAGES_DIR}' \
 
 inherit autotools lib_package manpages python3native
 
+EXTRA_OECONF = "--disable-numa"
+
 DEPENDS = "liburcu util-linux"
 RDEPENDS_${PN}-bin = "python3-core"
 
@@ -26,12 +28,11 @@ RCONFLICTS_${PN} = "lttng2-ust"
 PE = "2"
 
 SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
-           file://lttng-ust-doc-examples-disable.patch \
            file://0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch \
-          "
+           "
 
-SRC_URI[md5sum] = "f0c86a9fa7dcfd0205fb42584a310b1c"
-SRC_URI[sha256sum] = "06f9ed9b2198855b1c7fcbf15fe57297ee259409ffa1b3bad87321412d98bc35"
+SRC_URI[md5sum] = "99823cfeb76562d753ffe67880e9cc59"
+SRC_URI[sha256sum] = "683280cfe5e12021e64c32cef9eeb0128f1f23dec32ba28adb5a2074be37c4d8"
 
 CVE_PRODUCT = "ust"
 
-- 
2.17.1


