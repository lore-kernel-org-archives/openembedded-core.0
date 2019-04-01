Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id B91937D1F1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 22:28:53 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id a184so1072689wma.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 15:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tIiZDtMhVio+Uie44SUqQK45N65n77xqhIzJQDxPqxU=;
	b=CTqd8V9OXxEoMcLK/RMuYOEnDz5c5uwigaGMDjDFRmdOcbkirbkljNiERHbtT+qM/F
	52qXwVIrUlrkN5gVzmK0xJRdMgQ16+kOztKd74ul54btzi00F9H9a+vdsu1bdOIPS5XC
	CApCg+xvKqQy+eSOKgYQM2+FJGARqVi0T1/KITLv3/I7Pfzdej4z39ysKou9v+eQt1eA
	4mdjrb6SByypDq/Vd4Izw/0hkqgu3LvBVaPCaPAADGEm+43weDszgu7e2/tRWcAlkpbq
	ETaseRLbeqbcMJJxd/i4VX6FJOTdmL4b/4oCpr4owiEShfwgtFueO10W1RNnnDI9Wihw
	KPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tIiZDtMhVio+Uie44SUqQK45N65n77xqhIzJQDxPqxU=;
	b=Jieir5XjdxJr9BAFCTDaFzjzAeqRCACttutoIS6PU30tPyMpU1Jke1wX9jmTAXrsQK
	AculZgDolWSBKsCYx1G/wYe+mHL7Y0+TT3DkbKYPqTI+FKZUJduFNcf/cHcQ6oefkGQ2
	4rqwV8KAQn1dw5SrxoGTt1t9fOvvLf9pTIaYeWaWxvbKNjyYqjFn1FhdQefFZnYXmuGp
	aQWJBlJvWsVb6/+rGUFPYEjKWW+n8mjGX6xQk1OO230YbnIkjWxrkld0LHeM4rZpZc1t
	RLW6l66ZMDUiSMU9qtAIH6gNJ0iaI2nqbPq1MnZu0BvzISXvKHSZuOsvGlHCSzcuSNR1
	OnPA==
X-Gm-Message-State: APjAAAW1neRm6ONg6aaS0GgoVtYygp7qjbNz2588wLp3LLSxsyjo+I14
	zw64Xb0U5UOvS18BVjpUpR8IHvS1
X-Google-Smtp-Source: APXvYqyfjDJ/kaMeUE6ZAy0ZATn6qXeEAp2uBwFBlc2zJz7NTjwLqPnvfGjRCBrw4iMQdOM9JZKu1g==
X-Received: by 2002:a1c:415:: with SMTP id 21mr1139606wme.109.1554157734134;
	Mon, 01 Apr 2019 15:28:54 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F2CB726DBA214FD42F76D3D.dip0.t-ipconnect.de.
	[2003:f0:7f2c:b726:dba2:14fd:42f7:6d3d])
	by smtp.gmail.com with ESMTPSA id
	g8sm19531254wro.77.2019.04.01.15.28.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 01 Apr 2019 15:28:53 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Apr 2019 00:28:43 +0200
Message-Id: <20190401222843.31010-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] glib-networking: remove PACKAGECONFIG for gnutls
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
X-List-Received-Date: Mon, 01 Apr 2019 22:28:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* with patch suggested in [1] build complains with:
  | ERROR: glib-networking-2.58.0-r0 do_configure: QA Issue: glib-networking: configure was passed unrecognised options: gnutls [unknown-configure-option]
* it turned mandatory - see meson.build:
  | # *** Checks for GnuTLS     ***
  | gnutls_dep = dependency('gnutls', version: '>= 3.4.4', required: true)

[1] http://lists.openembedded.org/pipermail/openembedded-core/2019-April/280693.html

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-core/glib-networking/glib-networking_2.58.0.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.58.0.bb b/meta/recipes-core/glib-networking/glib-networking_2.58.0.bb
index f3190e1cae0..a4138d67cc6 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.58.0.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.58.0.bb
@@ -7,14 +7,11 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SECTION = "libs"
-DEPENDS = "glib-2.0"
+DEPENDS = "glib-2.0 gnutls"
 
 SRC_URI[archive.md5sum] = "75b14b7e73a67753be9ce307751c661d"
 SRC_URI[archive.sha256sum] = "bdfa0255e031b8ee003cc283002536b77ee76450105f1dc6ab066b9bf4330068"
 
-PACKAGECONFIG ??= "gnutls"
-
-PACKAGECONFIG[gnutls] = "-Dgnutls=true,-Dgnutls=false,gnutls"
 PACKAGECONFIG[libproxy] = "-Dlibproxy_support=true,-Dlibproxy_support=false,libproxy"
 
 EXTRA_OEMESON = "-Dgnome_proxy_support=false"
-- 
2.20.1


