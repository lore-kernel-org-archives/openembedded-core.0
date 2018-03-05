Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0E6DF71AC1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 17:21:08 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id u49so18086946wrc.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 09:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=2zih1aFVJJQemYZsQjpOpmKpREPnP1wqI10RfkotmsI=;
	b=xVTmDSKIT81FBoGPTZwt70slWcS27PdnJSsz4J7NUaM77/FMmDVu/3xDgGbwjQcc79
	h9JZBod/F+RKJs3xS2ZEEda89rESoDtZb81+Yx8KR7pQL9DfHEWPuKMhTN/OYIFagPOo
	8WrgOxOvaauTLAir449IrXOYC3u9BdAmF+v9enLFoBXjXQwmwDkuTvcyKxgzvz9xTcdM
	ydlE0YhXTzdnG5SJwB1ChPPCRwO3RM5QqxwBlrQh+YCJqQKgUmUwfT9+FVDZUmyI7J3f
	dmyrGZdIMN4dOIpYdSzpMLkjQDpyIzRu0n4WyA3O07W929KKZ+UxBmoe+n45XVkeMfWj
	tfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=2zih1aFVJJQemYZsQjpOpmKpREPnP1wqI10RfkotmsI=;
	b=B08KH4godA0VIpNyt4JzILkgke5HurjqWX223cg7f2LLXsstR04l0jsR76kzeWo+qQ
	L4GOpw84+cByC0z7VhCT/xdmU56mepsE0vyhQPQrCCDuEc5JF/HIxUXK/7WQAv7aUIZ8
	nDgjmvCHwjxLrSdpb2dW764zPhGZ6Z7YrTJYFalSmkmt+mIXHugtTFi4RxGHcdyXt3ju
	DgTdQJGbNBV64a66Yj2lZyfz6aCAoU0nZcF0tmxluLYU7pWHiOd0XJ5mfvTDF63Z9hXj
	kcbogArEcZ7evttm5IOmk3CQuLc9mbIOmdxWVwRuX5xUjeyF7hwgpDIYuIGDV4MI3w4t
	o7lQ==
X-Gm-Message-State: APf1xPBhuOoDEJNOKALk5nQeXV8VLwkAh+Q4pOEg+0xfnLURK/HbZOe2
	v2whj6e7qH9dfrF0XmiO0vRYtH7Z
X-Google-Smtp-Source: AG47ELsSce2xm2waP0NJzb96S5NQX74UM1H+oKh4KKNUE5SIu244L3jhTxSa7Ao3a7Lxw/OpS1VzTQ==
X-Received: by 10.223.142.3 with SMTP id n3mr12991338wrb.151.1520270469644;
	Mon, 05 Mar 2018 09:21:09 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m190sm10082047wmb.6.2018.03.05.09.21.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 09:21:09 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 17:20:35 +0000
Message-Id: <20180305172046.21729-18-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180305172046.21729-1-ross.burton@intel.com>
References: <20180305172046.21729-1-ross.burton@intel.com>
Subject: [PATCH 18/29] sysklogd: refresh patches
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
X-List-Received-Date: Mon, 05 Mar 2018 17:21:09 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/sysklogd/files/no-strip-install.patch | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/sysklogd/files/no-strip-install.patch b/meta/recipes-extended/sysklogd/files/no-strip-install.patch
index 00fba71017e..d426c83bf25 100644
--- a/meta/recipes-extended/sysklogd/files/no-strip-install.patch
+++ b/meta/recipes-extended/sysklogd/files/no-strip-install.patch
@@ -1,10 +1,10 @@
 Upstream-Status: Inappropriate [configuration]
 
-Index: sysklogd-1.5/Makefile
+Index: sysklogd-1.5.1/Makefile
 ===================================================================
---- sysklogd-1.5.orig/Makefile	2009-06-09 13:02:41.000000000 +0200
-+++ sysklogd-1.5/Makefile	2009-06-09 13:03:06.000000000 +0200
-@@ -127,8 +127,8 @@
+--- sysklogd-1.5.1.orig/Makefile
++++ sysklogd-1.5.1/Makefile
+@@ -127,8 +127,8 @@ clobber: clean
  	rm -f syslogd klogd ksym syslog_tst oops_test TAGS tsyslogd tklogd
  
  install_exec: syslogd klogd
@@ -14,4 +14,4 @@ Index: sysklogd-1.5/Makefile
 +	${INSTALL} -m 500 klogd ${BINDIR}/klogd
  
  install_man:
- 	${INSTALL} -m ${MAN_PERMS} sysklogd.8 ${MANDIR}/man8/sysklogd.8
+ 	${INSTALL} -o ${MAN_USER} -g ${MAN_GROUP} -m ${MAN_PERMS} sysklogd.8 ${MANDIR}/man8/sysklogd.8
-- 
2.11.0


