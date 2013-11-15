Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id D4E826DA27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 23:49:32 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id n12so2644538wgh.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 15:49:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=HdQlhk0Hc2fBQ+wVcOsEdyuD7ByMc1dPiTqRFnFwxkg=;
	b=LcSGMG3WJ7eNjEUs5v7mb2Hy1ofpl3eJKwAkgVxoeJbKs24j/0kKNoD6RF5tQHScs/
	QbzZ3Hu9JJhehDCw9RlpZVZFhYHYPKdXeY8QAeingIL4EQcW8R0fPEaBVXookaN/4dWm
	GyuQX9Bs+n+Oqv3R8cIHMD6RESYXt3LfYGu9gQV5fEZeEtbWKDquBHzcd304xW84xdI6
	jtkiUxc7FvbecCiieiXrzQKTd18P7VhzxgBcWWTfGieJtOHdPW2fAP0yaEZQ809r4z1d
	InC1KlHoYplJQ1vS64dcYJfVp5cIWhFaQjCx1v+Lqbiiv/ppl+x8aT/9BU8VHb+/UgJT
	bd2A==
X-Gm-Message-State: ALoCoQmC1teo9r5VniEVVSHelhQpYnUxiL/Hyvo61l3BoSOBMEAOVNl+OaPcLv5liz8ArVp33kEf
X-Received: by 10.194.232.133 with SMTP id to5mr8593296wjc.41.1384559374303;
	Fri, 15 Nov 2013 15:49:34 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id gm2sm20642wib.4.2013.11.15.15.49.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Nov 2013 15:49:33 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Nov 2013 23:49:23 +0000
Message-Id: <1384559364-27687-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1384559364-27687-1-git-send-email-ross.burton@intel.com>
References: <1384559364-27687-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/3] gdk-pixbuf: upgrade to 2.30.1
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
X-List-Received-Date: Fri, 15 Nov 2013 23:49:33 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gdk-pixbuf/{gdk-pixbuf_2.28.2.bb => gdk-pixbuf_2.30.1.bb}      |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.28.2.bb => gdk-pixbuf_2.30.1.bb} (94%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.28.2.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.1.bb
similarity index 94%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.28.2.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.1.bb
index d027fcf..b7aed7a 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.28.2.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.1.bb
@@ -19,8 +19,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://extending-libinstall-dependencies.patch \
            "
 
-SRC_URI[md5sum] = "04c04e5042acd85cff6c439aba1995f1"
-SRC_URI[sha256sum] = "183113c2eb2232963e88864a6a54fd963dbfeb1a3679fb0d3456f9e0b79e4617"
+SRC_URI[md5sum] = "e5ae32be7927c9bc94d8593a881eeb3f"
+SRC_URI[sha256sum] = "a3263b1e15668c009313bf04ab67420bec9f2b167c402a71a486307cadee8d30"
 
 inherit autotools pkgconfig gettext pixbufcache
 
-- 
1.7.10.4


