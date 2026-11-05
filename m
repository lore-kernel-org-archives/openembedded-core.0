Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30060.1793868228914983000
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:43:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=aj/A20jq;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-491971ac844so219839f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868227; x=1794473027; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K3sqE3yeEQjI5W0uXKCKMluoqWqyJiJM1NMhhl34wqI=;
        b=aj/A20jqk7gsywW/Avs+va6PYYp7I7OGWs0lXB3TJWsY+3d6U/mDKKFBhpLoCnwZc6
         WinKSupsvSWWIXYdHmzOnYF4x4gJ0aoGVRQzsnvKlNapRmi1C4fyHS0Dr4baUq6o7+Lj
         psaI9hLQrKhXu80zCAqtHLTPZkfoGgS7bSRqzHKLGpVxhFKvP0Dh15wDnxv5Qyoqk9Le
         3k3lme+41KdUs7ch0rPKVri/adQoW0VTT+zBRqetzO6dsRM1zx950OpLjB32S5UfvkiE
         Uewi8C3lG/XeCxZTtrOheanBP8/3fONrNhxkyD7X5wOC65/umHc11jqOKgq3zF4nO8/a
         fgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868227; x=1794473027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=K3sqE3yeEQjI5W0uXKCKMluoqWqyJiJM1NMhhl34wqI=;
        b=mbUe/E450AjdytInPOgi2h22bjiNlWtpugcS194cBKU/nRsG7NBGYveMrjuwMzXD6b
         aMBHr6hyJZpGhfy2xY5oOM8ZxsfyGs/1ptq/UeomMYwW7u34X9l1518YmP/OKcPEZPdw
         GH2SrHjmdreXjTIpitHt6PoKLNpMwObCurR8l5AN8dvRXpbWmMQ48S+QCEJZzLq65CQ+
         o8rtnOx9gGm8fNlPA6sUfUJhXEhPoLfzr9fyyfNKwgYcgtGlAKEwgJ0Xs9GswqPMv5rq
         uWA8ryGkjTlm//POUWaHh9GJuoJGf9rZ9DiAvyafVlAI1lnEMYuN2X40Gl1n087OjX8h
         ap0Q==
X-Gm-Message-State: APuU4Z/qgK6vt3+l1kqKEZsO1IBKIzoSllLiF+n3LG4PPbji9mBWU0LO
	t+Uq/q6z4/xAyRxZvZt4i0vVfYrccqA4HQutn7yCmx1ixhYxEzKhiu8AjHU8SYDtYmRvnLoFJSZ
	8UGO/oNk=
X-Gm-Gg: AYBFou175jsUcBhqOBN/oRPPNk/HkvflpsygL58xqNf7nU2urn+4RogxgraIeVFSKkH
	hI/pwjBlByOCcqoc6Ljl4RKnggUtbWTXD1t0ualBikiiurt+/DWc2EV7JmuproUov0ZtGv68W07
	mXrRdOedLK1BDtMmKw+MUz55dbApRLbcVnUkV7nduRdibQE6QJ+nGCXRIOz6KbgZ4MSht4xjXGt
	1J5TMMDkJtdYLPQkrEeOaSKaSxNeZEh8S7g5fwWnz9y0SuC1tXvMLOSptSIGD8QIwHoLsAj92Rl
	4RoqiUNPmwbCaC32+3t00ofEVEYI/jpra31mevGhQMAKtjsocKhVbJZd38ajEvEQV+Wr7pY2QGl
	cR0iSVYw0joFjjf8s1IenOZEuAy/dQjyNPx+BBBbFYiy/SkL+ENtQMi+ITsSru2NDQAbD3QpUyN
	IVF8Rd4sE+zkk1oAxeVPqi2e7msrFMmxem2Zo2iS3n86Xlv0xHFQ/ugBceQ2CWVvyMw5KX+/86n
	IyoOUvMyUCQuTAPwLAs1UEc0hUcJbSO2wiK365WVuk3PLAPgunhEarUTo8weiokMPhC5w2OaDAP
	VXWAQSzy4zP58nCCRJgyAOcrKyzAmFpHp/vNgKan7m/AW9/+CQDktpjnqSggDL2qgHHsVY0PMSC
	VKy9t+3OI9SO7QrUmn3rkobMPrEtCeA7M36EHrNbah/7Br3jIqg==
X-Received: by 2002:a05:6000:46c3:b0:48e:4a8a:e17f with SMTP id ffacd0b85a97d-48e6e2bc7f2mr27519929f8f.4.1793868227029;
        Thu, 05 Nov 2026 00:43:47 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.43.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:43:46 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 18/60] piglit: fix build with Python 3.14.9
Date: Thu,  5 Nov 2026 09:42:37 +0100
Message-ID: <ea8fcc4f54d9a92c191b4d668d691a5e3bd08fd3.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:43:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249477
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
index cd1ae5d6d28..50c4c40111f 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -11,6 +11,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            file://0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch \
            file://0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch \
            file://0001-tests-no_error.py-modify-_command-and-not-command.patch \
+           file://0001-tests-serializer-reproducible_mtime-should-be-an-int.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
