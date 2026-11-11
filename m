Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5606.1794387816603464513
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 01:03:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=HvLS4cNN;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a208d93758so31403525e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 01:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794387815; x=1794992615; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7fngxJDSFLy5oUlAiO4N/0ZmeR9umEvh7/cUDGmSha0=;
        b=HvLS4cNNnavcdihahm/mSFFLon9/mecn7U5VFIVpogcQsVIgTCZ2F2+Y07axBX6ZOA
         RwdY8972Kl1wg5e2N4Q2Vcs1Q34w9Ms0daVaOeDR9ipzxBtF3p1kWcAiDE3Ptk8Pd/0X
         wFjX89/vhGWSxw/aAqadc+vmoY+7Avs68yrTOL+YNjXoMVF9k47lJc+p2/Vdxb2yS44K
         yNbHXHvH1jxlr+zZ0ThepQb0+00q1oDHrmwqnD9mq4m5XqkSAXPKK3C/eaHfZeO0ZeVB
         JqRWBO3lJsFg8lOOyTRqjrLToE3UWqnnrPOELNPb7X2hAUU1qAaumUI09kwZY50KNuRG
         64gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387815; x=1794992615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7fngxJDSFLy5oUlAiO4N/0ZmeR9umEvh7/cUDGmSha0=;
        b=g4zmckxHNF1OoGemATU1L5QtoPXF9asVaMKIcRBP8F28O2WZi5+i1qBqxfFRM5vfE+
         Nq1/s1ND3nwKHb3X/qp8zLpcXGmlbuvb1Mw3+hGlvhhghdJQzsXtwvLbVFHpFoZ2TJbv
         5rR2b7X+W6eQWW5hKOcHGv2HuYna3A2oqFAG9Uzm5qK6N8e9QuQpNrIF/Yuh9W8BUlGS
         W+LMGJ7Sbce5r4C73g+VGQtEzvRcwIQV7zEAx6l2Wyc/pRTwXUWUnfk4MN2Y6YsOV5ny
         Jh9eMxWPfddHyTgrwUnUDO9h5IA8Tqsmi4rvyNLUT+nWksgx+FHfPZU+lNPTly1bgHef
         sbZw==
X-Gm-Message-State: APuU4Z+2htp0YO0nLEvtcVf/sspNGCsZh40H5QRdoKgBElg7JAD3MlMs
	j3xJ/5IrJngj4/xXdFBUJNwKhgV+AuYurCeFVKgCLcqzL3oc78lyp4NhIbD4Aj/Ny0ejb9mLC2g
	9pB/bNb8=
X-Gm-Gg: AYBFou1zIYUBRRB085wPfUaQVWOw31px/96eyllORBS7pRXSccZO+7WCxmf9wr/TYlt
	maNBSlIrKEeBRGus404aYhD8q8cpiFV21QsDGBZiJo8s9w3sEbkZBwBGueAj/Hs18YjSo/9kZCN
	JqkhbuS36fY5BoCDZlt3D3LrQm2dIy+7hYC30odnx0BgV/edyFryy5IfDgkMXluoRfQdJYVNanU
	0WcjZFwP8x9UepW0/u+J37pa9IO1SemcqWRwZLJTksHIWuh7cyS4qpxFMCjHR7HkZmwtVFzPs6r
	WP27Y4lRKHJ3JxpAK631Ae6OeTG7llD4WwQFcczBp0G93eFBZAmt4XXa5+EYmNDEdkIroDBJu9V
	/513AuwSzulrvKrs3kYKg0Jsi3lNqV5euqFqg05ZUG1PqN2WAltw/r21vpxVw3jNOCQCQ+NnBGT
	fJ/TizAPjLw2CJlj0b9vXugK3b1gJQagTmjiaUjEL11BMkcl0Fpdq3jDJJYgXjR876Qam5JZ907
	jJcSQ37L1Fr8ieHYWGUlTROp7XSnuIbrWe3Yvlr3gpNw6hYMACYzy30wUOxrimKaE4mhE3aOxxu
	TT7jZW5ofRfLeHrZgG3SjGJNNJzz/ivS+hWgrkvkQxmMTHNFC2uD4k4zZBOemrS+GjSvPCdenj4
	8EDrODZqnjlkTvdKZnAJIRMeFuPW7
X-Received: by 2002:a05:600c:354a:b0:4ba:6d8:df8f with SMTP id 5b1f17b1804b1-4ba0936f447mr29112015e9.15.1794387814777;
        Wed, 11 Nov 2026 01:03:34 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm147623675e9.9.2026.11.11.01.03.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:03:33 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 20/35] piglit: fix build with Python 3.14.9
Date: Wed, 11 Nov 2026 10:02:46 +0100
Message-ID: <52a50198adadc887f4d8fb532a95116adfccf884.1794387482.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794387482.git.yoann.congal@smile.fr>
References: <cover.1794387482.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:03:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249992
Content-Type: text/plain; charset="utf-8"

From: Ross Burton <ross.burton@arm.com>

Python 3.14.9 added bounds checking to the mtime argument, so piglit
passing the mtime as a string causes runtime errors:

    File "/usr/lib/python3.14/gzip.py", line 303, in _write_gzip_header
        if not 0 <= mtime < 2**32:
    TypeError: '<=' not supported between instances of 'int' and 'str'

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 66cf97860d9833b852298a6cd60334c372a18dc3)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...-reproducible_mtime-should-be-an-int.patch | 33 +++++++++++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb    |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-tests-serializer-reproducible_mtime-should-be-an-int.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-serializer-reproducible_mtime-should-be-an-int.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-serializer-reproducible_mtime-should-be-an-int.patch
new file mode 100644
index 00000000000..4578c296b0d
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-serializer-reproducible_mtime-should-be-an-int.patch
@@ -0,0 +1,33 @@
+From 58a5bea55a5f7972462124e7a8f1b1971ad5483d Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Thu, 22 Oct 2026 14:09:08 +0100
+Subject: [PATCH] tests/serializer: reproducible_mtime should be an int
+X-ARM-No-Footer: NoDisclaimer
+
+The mtime argument is an integer not a string, so parse it with int().
+
+Passing a string breaks piglit with Python 3.14.9, which does integer
+bound checks on the specified mtime.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/1269]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ tests/serializer.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/serializer.py b/tests/serializer.py
+index 5ee9a1578..f7fdadf43 100644
+--- a/tests/serializer.py
++++ b/tests/serializer.py
+@@ -140,7 +140,7 @@ def serializer(name, profile, outfile):
+     tree = et.ElementTree(root)
+     reproducible_mtime = None
+     if 'SOURCE_DATE_EPOCH' in os.environ:
+-        reproducible_mtime=os.environ['SOURCE_DATE_EPOCH']
++        reproducible_mtime=int(os.environ['SOURCE_DATE_EPOCH'])
+     with gzip.GzipFile(outfile, 'wb', mtime=reproducible_mtime) as f:
+         tree.write(f, encoding='utf-8', xml_declaration=True)
+ 
+-- 
+2.43.0
+
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 76596350628..5d7cdafb070 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            file://0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch \
            file://0001-tests-no_error.py-modify-_command-and-not-command.patch \
            file://0001-generated_tests-use-shape-in-place-of-newshape-on-nu.patch \
+           file://0001-tests-serializer-reproducible_mtime-should-be-an-int.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
