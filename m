Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id CDD9960043
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 20:21:12 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id n5so48190848wmn.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 12:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=VaXJf8s/O3I+w7wwzC6RRerfNkaNNGoq5yJh4OC/KNA=;
	b=jfaLl3B10KmZi4HKkqfkrWgAa2zYqdPdj8BE3e9Ij3nMPTPg0JlH4VMOkgTYwSKBte
	NiJp6BQGHOavbOkpaoAid96oVCA+C3Mtbyss/49ntu4t81VKxX6If+lFlVQmBIptwLAU
	4kn2B5EG4PtdXvVtM8KcPT2r9sCS1lMv8Bw8Tt6CEkOHlaaf2CyXaODQYvfaw24H/m58
	DC1ezBCBMBFPWgYkyXEkjVnhibr3WIzlBTS6JFELa9Bkamu9X93mVPvcEHugGg8eamht
	d1fJW2uaQLz6z/BDzn+6SLykO7YSWfeUrb6UKD8EYvPl9e3fHb3KsO4D+521AWNBsDHS
	FO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=VaXJf8s/O3I+w7wwzC6RRerfNkaNNGoq5yJh4OC/KNA=;
	b=I5B34+ZEmqI7WzFLREtIEid8dZ3Em3Jdl09Wh/wUwtsxmWFj8c5kFnsHorEzfQzWBs
	h14gCSjei21nmeCIublla3CSBudvfrV3/WPB2aDsGloS3QohiGr92XYSRMonzhNgFkUT
	f74DUXH+nLJcNurNyCT89N0YMYQtMOVVq9cDtZSnFgU8hMar7eAVui9sP72i7jpiKjtZ
	7dMVUVF+73TkI9uQnJzMBKup6CWYe2f0YcJ5HTV2zv48bLkeZS3kDXWXHoVa6mXcfx/w
	3yFq580d6rCICyfbNJUBJFbQSkOVswfh8Gje7GQ9TBf74Rh+azAr7Z/BRl1sOmcOYy04
	FCTQ==
X-Gm-Message-State: ALoCoQkuqEtI7vKuCxBudQ4jWHyfQRouBJCsrV1VAKyNRXU/nRWd+0acH9RfGValM/DPIrqMmFq664aI6iPd4HlRYntjqdc9+g==
X-Received: by 10.194.6.37 with SMTP id x5mr44716317wjx.178.1453321272935;
	Wed, 20 Jan 2016 12:21:12 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	fx8sm26467626wjb.13.2016.01.20.12.21.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 12:21:11 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 20:21:05 +0000
Message-Id: <1453321265-14564-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH] bitbake: set libexecdir to prefix/libexec
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
X-List-Received-Date: Wed, 20 Jan 2016 20:21:13 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/bitbake.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index fc57a58..fba4d17 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -41,7 +41,7 @@ export systemd_user_unitdir = "${nonarch_libdir}/systemd/user"
 export bindir = "${exec_prefix}/bin"
 export sbindir = "${exec_prefix}/sbin"
 export libdir = "${exec_prefix}/${baselib}"
-export libexecdir = "${libdir}/${BPN}"
+export libexecdir = "${exec_prefix}/libexec"
 export includedir = "${exec_prefix}/include"
 export oldincludedir = "${exec_prefix}/include"
 localedir = "${libdir}/locale"
@@ -55,7 +55,7 @@ bindir_native = "${prefix_native}/bin"
 sbindir_native = "${prefix_native}/sbin"
 includedir_native = "${prefix_native}/include"
 libdir_native = "${prefix_native}/lib"
-libexecdir_native = "${libdir_native}/${BPN}"
+libexecdir_native = "${prefix_native}/libexec"
 base_libdir_native = "/lib"
 datadir_native = "${prefix_native}/share"
 bindir_cross = "/bin"
-- 
2.6.4


