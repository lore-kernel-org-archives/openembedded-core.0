Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 2D7D07F8B1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2019 14:26:59 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id w18so17339171wrt.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Nov 2019 06:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=qzhcPzhbRcK3U+HEebUClC4GqRLxqaMypHSwoqOltTQ=;
	b=HsfexEHsIFyBjQq+bPgdVO8KZBzQJiDNRIgVcbZe5W7+AbHRnIAsZSN7F/ZTATByNG
	Fyd0qF/O7rS9IsnwzDNW1sgJg37o4APcPLZMVVmryKTCSelPXvTM742ex5JN00fz+zWE
	NnnP7NaAnCIRV59qf+BnSUGR2b/Kr7v0rFhjuSgqHg5HZo0ME3d4ZNk7VcnjAeN4Lg9a
	sj7R8VgjzAxo6UIebvfXrKR4X/WN2wetYk4pwlHqFZFQBWA8hkSa3WmNNVtNtswweMqv
	OOaYrsN7LcB8BNv7R4HNKh727UYPz5VzdJVdmsiBoNgiZdoNeIOz5vhBbLlU7/szc5C2
	Eqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qzhcPzhbRcK3U+HEebUClC4GqRLxqaMypHSwoqOltTQ=;
	b=EF+zgyDeJIVNerThEbLpw8WPJoeI0yNpUKXMA9ZHklZkqiRjliDpeBeT0yN8eVCG+v
	TD9igxY/wslmDV5S8yUK3zNrGGYNkx7emttx/8SwzSPbgo489PegQkAEmelGqlfSgbRH
	JVAndXP5d729jL6TDW04mtvjMTK05vWs/qPsnvHjWaKcllY2la35Ec/wfrB+35cATw8Y
	Vy5Q2IX7cvYF+rrjzxYvdmLBkLEbbQrCfBnkcpREqgh3FCfol7M66+vQ5xP+MHD8Ftdu
	HdoDy/qrC8Su5NPSyOaAbfnntnHsBBRf4JnJYVPvfGff8O4DlQ3OKUnkXwNb7AAshipi
	tgtQ==
X-Gm-Message-State: APjAAAXcw1CrEPPMu5U34UBEE+tVLkYs67wK2y7Jxl2C2JyYK4XQhgCg
	H4KI33GSrciX+KEe6htcEAigJ/eEaGw=
X-Google-Smtp-Source: APXvYqyIny3N36BI4kHwN4qSClT46Xhoi9OoVtO5AowCz+IQ31guOZmsvEM+lF5IRYxII2FmGoDdGA==
X-Received: by 2002:a5d:6cb0:: with SMTP id a16mr6039405wra.194.1572877619707; 
	Mon, 04 Nov 2019 06:26:59 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	d4sm26873251wrc.54.2019.11.04.06.26.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 04 Nov 2019 06:26:59 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Nov 2019 14:26:53 +0000
Message-Id: <20191104142654.20440-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191104142654.20440-1-ross.burton@intel.com>
References: <20191104142654.20440-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH v2 2/3] procps: whitelist CVE-2018-1121
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
X-List-Received-Date: Mon, 04 Nov 2019 14:26:59 -0000
Content-Transfer-Encoding: 8bit

This CVE is about race conditions in 'ps' which make it unsuitable for security
audits.  As these race conditions are unavoidable ps shouldn't be used for
security auditing, so this isn't a valid CVE.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/procps/procps_3.3.15.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/procps/procps_3.3.15.bb b/meta/recipes-extended/procps/procps_3.3.15.bb
index 9756db0e7b7..f240e54fd84 100644
--- a/meta/recipes-extended/procps/procps_3.3.15.bb
+++ b/meta/recipes-extended/procps/procps_3.3.15.bb
@@ -4,9 +4,9 @@ the /proc filesystem. The package includes the programs ps, top, vmstat, w, kill
 HOMEPAGE = "https://gitlab.com/procps-ng/procps"
 SECTION = "base"
 LICENSE = "GPLv2+ & LGPLv2+"
-LIC_FILES_CHKSUM="file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                  file://COPYING.LIB;md5=4cf66a4984120007c9881cc871cf49db \
-                 "
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYING.LIB;md5=4cf66a4984120007c9881cc871cf49db \
+                    "
 
 DEPENDS = "ncurses"
 
@@ -64,3 +64,6 @@ python __anonymous() {
         d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_sbindir'), prog))
 }
 
+# 'ps' isn't suitable for use as a security tool so whitelist this CVE.
+# https://bugzilla.redhat.com/show_bug.cgi?id=1575473#c3
+CVE_CHECK_WHITELIST += "CVE-2018-1121"
-- 
2.20.1


