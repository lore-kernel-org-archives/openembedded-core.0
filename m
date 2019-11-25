Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id 65CD67FACA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 17:22:31 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id t26so128818wmi.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 09:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vVnxnIIQKoiNt0Tom1flb6Ju6AtnEtfILR1yngPTs54=;
	b=jm+244kmEFCF345n1lpSRZ6atkS0naKPp/qi1Ix+hNu2c3z8shMtEISNSl+f6lTwvP
	vB1V/9yNaF8egAsaiFSXl/gh4qVorCepKY8HVQooj5ub9a7nU4QL9XwewHXzQqo8RDnT
	nrsk2MJZADJhBbYIr8MtGDlB1Dn/u+xUlZLEP17mDHjEfJY2RUJPMjrcwtrmvcQ1JD6+
	nCwbshLSM9oWi7408ErkdosXpSkO45572zQ38Cpy9mffpXj7MFNgJf6CZEpa1Xqe6tqy
	Ymmf/6zBssYIGaPMuiyr/hSb0HRWpoFmDmmDFzRlEDkHREQjWg3TSbaT6+9gDMhTP1G8
	4l9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vVnxnIIQKoiNt0Tom1flb6Ju6AtnEtfILR1yngPTs54=;
	b=jfKwqNOMeTLRF+SFNCMVwYLNQuMf8sE3wohha/wQ+tO0TbvDNmijfOnxfrpomjp7jS
	6q2LnG0EUWuS3wgyP3pE0XIH6LUFbRHhko/L1WTmKXNu9U9HmBI9gYkdnt9H2aZ9yBIE
	2JtgM2NEOl41QyaJFSwe/SrOdf4Rc+wa7gN9ga3vbeckW+JrFS9s7SBDXni8aColoHbS
	ngknNVNJvFGKJYuQW8WANMG+pMrrhpEHzdHpr+7xoTMhhhj/+3dJgUDZ7hQYgID6N4yZ
	wA1qmKDPXY0XxY7scdSPCM/L8WZdlvGehtHgKL/Bn85q1Y5OIwCheMhE4w/OGrD/0y+4
	X9+w==
X-Gm-Message-State: APjAAAUqhb2BBwmObQiiDTXm263iraxmegW3X3Ey93yHfK2NnfLZKse8
	AA7xee606LE7K9RUOJ3JkBjcgvy3
X-Google-Smtp-Source: APXvYqxjdhyXJuAuTb2Z07NNvsvQZ5TGsaU1qlefMgrdlYX9qCxsM0YoolEYKj63Ol1oyN78ZvJhUA==
X-Received: by 2002:a05:600c:c3:: with SMTP id
	u3mr28229765wmm.35.1574702551740; 
	Mon, 25 Nov 2019 09:22:31 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	f140sm9693357wme.21.2019.11.25.09.22.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 25 Nov 2019 09:22:31 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Nov 2019 18:22:23 +0100
Message-Id: <20191125172224.82269-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191125172224.82269-1-alex.kanavin@gmail.com>
References: <20191125172224.82269-1-alex.kanavin@gmail.com>
Subject: [PATCH 4/5] hosttools: no longer check for or provide host python 2 to builds
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
X-List-Received-Date: Mon, 25 Nov 2019 17:22:31 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/base.bbclass    | 5 -----
 meta/conf/bitbake.conf       | 5 ++---
 scripts/oe-buildenv-internal | 7 -------
 3 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 1cea3a22138..ff3fbb28c31 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -138,11 +138,6 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=True):
                 os.symlink(srctool, desttool)
             else:
                 notfound.append(tool)
-    # Force "python" -> "python2"
-    desttool = os.path.join(dest, "python")
-    if not os.path.exists(desttool):
-        srctool = "python2"
-        os.symlink(srctool, desttool)
 
     if notfound and fatal:
         bb.fatal("The following required tools (as specified by HOSTTOOLS) appear to be unavailable in PATH, please install them in order to proceed:\n  %s" % " ".join(notfound))
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 263d8aea4fb..e75bbcece09 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -481,14 +481,13 @@ export PATH
 HOSTTOOLS_DIR = "${TMPDIR}/hosttools"
 
 # Tools needed to run builds with OE-Core
-# python is special cased to point at python2
 HOSTTOOLS += " \
     [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp comm cp cpio \
     cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
     fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
     head hostname iconv id install ld ldd ln ls make makeinfo md5sum mkdir mknod \
-    mktemp mv nm objcopy objdump od patch perl pod2man pr printf pwd python2 \
-    python2.7 python3 ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh sha256sum \
+    mktemp mv nm objcopy objdump od patch perl pod2man pr printf pwd \
+    python3 ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh sha256sum \
     sleep sort split stat strings strip tail tar tee test touch tr true uname \
     uniq wc wget which xargs \
 "
diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index 96bb0c3dc95..c17cf4da711 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -29,13 +29,6 @@ if [ -z "$OE_SKIP_SDK_CHECK" ] && [ -n "$OECORE_SDK_VERSION" ]; then
     return 1
 fi
 
-py_v27_check=$(python2 -c 'import sys; print sys.version_info >= (2,7,3)')
-if [ "$py_v27_check" != "True" ]; then
-    echo >&2 "OpenEmbedded requires 'python' to be python v2 (>= 2.7.3), not python v3."
-    echo >&2 "Please upgrade your python v2."
-fi
-unset py_v27_check
-
 # We potentially have code that doesn't parse correctly with older versions 
 # of Python, and rather than fixing that and being eternally vigilant for 
 # any other new feature use, just check the version here.
-- 
2.17.1


