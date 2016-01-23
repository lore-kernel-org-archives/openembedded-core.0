Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7B4B577065
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 23:10:23 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id q184so3930491qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 15:10:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=golBVG4Y5EEhjIywG0qUEmCnak2nHhXAcT06YPfZvAI=;
	b=fngkCd+hfgFSfLOAe/+a8zFecKFRj5KbGKtnQh9P5i3ScGdjyMbNsBWBwwMaDQ8bxi
	IAIT0M8c8lgk06bzTTAuunK6xD454Kzako84Sga9+sVyyfkX115nmBFXwJQzucPV2d+T
	Tpvng598EMDr+rvNqr0en7hkZAFZ3wkth83dSFJXCnQxjZVEZgX5PWclRMXg4PiW+KBh
	+iG7SirK6V4WKNbJAtBx4Ko+yoTsOBBb2TP6HpQKqJTgnmrG/GcZ2lrQ2ORo9B8Q1N4D
	IYGqqhhRtKiu8RRTUTsNMS5XNQEqY0Q+mlbbwBWoXXU/IWkeGtatJGhnbMre9cfYEDV0
	R7gg==
X-Gm-Message-State: AG10YOTEjhM3KD4BQSiSL3VXlB5NgIjPSd5p8QdFR6nZFZttN1YX8PwQPjHandSxaALSaA==
X-Received: by 10.55.78.207 with SMTP id c198mr12489969qkb.34.1453590624562;
	Sat, 23 Jan 2016 15:10:24 -0800 (PST)
Received: from build-slave.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id 67sm5769501qht.14.2016.01.23.15.10.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 23 Jan 2016 15:10:24 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Jan 2016 18:10:08 -0500
Message-Id: <6180683641385982dbb76a9062302dac110f6224.1453589999.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
Subject: [meta-python][PATCH 11/13] python-daemonize: update to 2.4.2
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
X-List-Received-Date: Sat, 23 Jan 2016 23:10:28 -0000

---
 .../{python-daemonize_2.4.1.bb => python-daemonize_2.4.2.bb}       | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python-daemonize_2.4.1.bb => python-daemonize_2.4.2.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python-daemonize_2.4.1.bb b/meta-python/recipes-devtools/python/python-daemonize_2.4.2.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python-daemonize_2.4.1.bb
rename to meta-python/recipes-devtools/python/python-daemonize_2.4.2.bb
index e10c853..9c0bc8d 100644
--- a/meta-python/recipes-devtools/python/python-daemonize_2.4.1.bb
+++ b/meta-python/recipes-devtools/python/python-daemonize_2.4.2.bb
@@ -1,16 +1,15 @@
 SUMMARY = "Library to enable your code run as a daemon process on Unix-like systems"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=13e982bf1b7b164b9d6d1665dac83873"
-SRCNAME = "daemonize"
 
 inherit pypi
 
+SRC_URI[md5sum] = "bb5b341b94abc15d6788002cafaa9da4"
+SRC_URI[sha256sum] = "c21a94cd676d3fbb718af62e6f22209afc7000a9588169b6fb779d62b04e2378"
+
 RDEPENDS_${PN} = "\
                python-fcntl \
                python-unixadmin \
                python-logging \
                python-resource \
 "
-
-SRC_URI[md5sum] = "f08ad971573a1d83d2d4adab13f59448"
-SRC_URI[sha256sum] = "2fbe8a4af6bafb3f53d64b8c05c073bfff6c8bc829b83563f5774b0052fc656e"
-- 
1.9.1


