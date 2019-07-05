Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id E4B027DD6E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2019 16:20:23 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id x4so10474247wrt.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Jul 2019 09:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=qplGpJeKdb8C58QEdnG7EG7N/uZn4Lxk2Z76BPQkkyM=;
	b=FXjLyYqBRl8FkhHEFWDAjpgm+lYOqh9CcVCpbucrrVxqAZyN3+ziKhlkmZEXj8fYpZ
	RdHTTfjIv4pUOqAQgcBSlP+PKC7ltW1aaFcsP0SDOkF14Msr4FuVTwXNsrhtT9MX3ITP
	XsRM8bFr6ZdSVTB9U2WmVYtYEfb+o20Jjn0ZBoyVFECv5GG1ZNwLsnyyhqIPEn2KsGqk
	OFSuLVys0/PmXYr3w6luRMrG5N1MwNFstISlK1BEzGMSVOGaa2iFxhVBifmLTro69QZC
	X59CI25j7zNw2LiJ0sR8+Iz/ikAvcySTz137jJDZG6ZTmcDwFy+P77KdconeeizjhM5q
	s7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=qplGpJeKdb8C58QEdnG7EG7N/uZn4Lxk2Z76BPQkkyM=;
	b=TQ1ugEET7i6SUsU/vlD4q/byM15OmkLfJdY4yUolgx7Mz+g7aR9AgC31v0Auz4nMKx
	vrYWrdii0FUdvwj0T42zlNu7McTkhoyMEyc6mrVLz/Qv6YwAGTB4AEdkaGu5qlI8XG4e
	8h6mep5HsCLu2tejcF0uJMUFCX6r/II5lQ/pZYov1PBnx83ax5y/n8GOi2Qg8xPXwAWk
	bJ2nWqItUMT9NWTLf9Ruz06ecwnhC7TER27mTB2CeWdAqmuy2vHZ5pTnez+oRGX26ilU
	to/m0AZwLuWqBOL2ZLJbGyPGvDxnqO5jNhkj+cFbY59DWf61R7JyZefzrYlMI+t9XVzL
	71zw==
X-Gm-Message-State: APjAAAXPB+1B1Yrn42k6ghsogf9lJAEBAhG/je7vw/591frHBgLJx8mI
	OtkYb5qisCUBgYOBy5aP0qTXyTCK3sQ=
X-Google-Smtp-Source: APXvYqzexZeoNeP/el61J44inHH3vrwA8utj7CkiYhWJkz4aNzeIa86jCi4nBHbfuRLUL50nuu6p+w==
X-Received: by 2002:adf:f591:: with SMTP id f17mr4892505wro.119.1562343624578; 
	Fri, 05 Jul 2019 09:20:24 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id r4sm9358102wrv.34.2019.07.05.09.20.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Jul 2019 09:20:24 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jul 2019 17:20:16 +0100
Message-Id: <20190705162018.28251-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190705162018.28251-1-ross.burton@intel.com>
References: <20190705162018.28251-1-ross.burton@intel.com>
Subject: [RFC PATCH 2/4] packagegroup-core-lsb: remove GTK+
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
X-List-Received-Date: Fri, 05 Jul 2019 16:20:25 -0000

GTK+ 2 is being removed from oe-core, so remove it from the oe-core LSB
packagegroup.

Also document the fact that GTK+ 2 is no longer part of the LSB packagegroup,
and point to meta-oe for the recipe if required.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 README.LSB                                                   | 3 +++
 meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb | 2 --
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/README.LSB b/README.LSB
index f68d07c9e03..922c9dd5aca 100644
--- a/README.LSB
+++ b/README.LSB
@@ -12,6 +12,9 @@ therefore provides compatibility with the following caveats:
   tests any longer. Users are recommended to group together to support
   maintenance of that layer. [http://git.yoctoproject.org/cgit/cgit.cgi/meta-qt4/]
 
+* GTK+ 2 is provided by meta-oe.  It is lnoted that GTK+ 2 is end of life
+  and use of GTK+ 2 isn't recommended.
+
 * mailx has been dropped since its no longer being developed upstream 
   and there are better, more modern replacements such as s-nail 
   (http://sdaoden.eu/code.html) or mailutils (http://mailutils.org/).
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index e8dc4215927..a821fd8bf33 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -218,8 +218,6 @@ RDEPENDS_packagegroup-core-lsb-desktop = "\
     gdk-pixbuf-loader-ani \
     gdk-pixbuf-xlib \
     liberation-fonts \
-    gtk+ \
-    atk \
     alsa-lib \
 "
 
-- 
2.11.0


