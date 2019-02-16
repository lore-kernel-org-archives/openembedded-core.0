Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id BA7D67C771
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 13:42:00 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id l5so12105482wrw.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 05:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=daQoEJwaTW2MTdnu31jHjkraaMmMssAQ6GDQ+9DgTm4=;
	b=RopmpBai+sK0QemvnYkZvrOw5Sj/s/piEMPcYgjyhUty+h4lu2vm+meiqNGAX6EAUC
	E1AyzeqiGeqcoJgAplLaV2LDjHs9TOtoD7ByWCUggosW42HahiGYYvU4FWc9DbTDX9Lf
	d1CrGcNPsR2n2YPM8afMmiuFTnXPRCcWFA4nTqJqa4FYmT86IuUrpRuXHvryyD6eyJJK
	OToeTgWHS5iHpKCqd1/efwhlwGgViZdq4nHaT4yX0MQMsvaWmi1mf2hbtugHM3jlGZzx
	htln1iEd5s0D6z4YlS3KJNVy7/NzSOAUKMa31w7wVoLvbJIDK3Q6b0tAom00jAAxKrbA
	oifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=daQoEJwaTW2MTdnu31jHjkraaMmMssAQ6GDQ+9DgTm4=;
	b=gnxerrpByjlDqe7PtpvhOfSRq+ix0viiubDO68eJ5yTLV2RseSWgC7tE6kfcYpTVhV
	xF0ml0cPzMmqKStQy606lWIjZ9LAgQx1J1KPhgvQHo/1EzUlZCzhG0Z107dRFiz5V6Fb
	T4JMebjEyHuGVflkEyjVbWuH1k418//0Z+OPLEiPjxpOxgYNi41VA+i8N69rfvoUIJ1L
	WzK0jMbOKqYKbfPqzdy9VzVln/h7KvXcdfKVY34NQpr4GCPOsgGnKjMMVkDu1hAnXqpN
	dKYoV72SiP/xyoXTPq98Itn3GOtlGRjXjn4OHrVfDCJkmL/fvwOhnl+ICwY+ZowlsiyD
	T+2g==
X-Gm-Message-State: AHQUAublizDG48JskrzH9h+3ta/apT0f7GWWcG5z4IxewKBKGZcAULOg
	Exp8uOjU4KNCcXB9xj7MvEDs5nM0rOY=
X-Google-Smtp-Source: AHgI3IZ9XmlAbeBjrFEdrxQy4iwiTsjQ7CR7+ZmSPDQjhX8maJAsH/SYTAG9TAglSVMuhTjpja+bFA==
X-Received: by 2002:adf:e60e:: with SMTP id p14mr10074471wrm.96.1550324521003; 
	Sat, 16 Feb 2019 05:42:01 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	f134sm11784396wme.31.2019.02.16.05.41.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 16 Feb 2019 05:42:00 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Feb 2019 13:41:55 +0000
Message-Id: <1550324515-12761-1-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v3] bmap-tools: update from 3.4 to 3.5
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
X-List-Received-Date: Sat, 16 Feb 2019 13:42:01 -0000

bmap-tools 3.5 was released August 2018 but has no release tarball, so
switch to using the git fetcher. Also pull in the fix for StopIteration
being transformed into RuntimeError for Python 3.7.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v3:
- Reinstate append of "+git${SRCPV}" to PV
- Add workaround for https://bugzilla.yoctoproject.org/show_bug.cgi?id=10113
  as suggested by Richard Purdie <richard.purdie@linuxfoundation.org>

Changes in v2:
- Drop append of "+git${SRCPV}" to PV

 .../bmap-tools/{bmap-tools_3.4.bb => bmap-tools_3.5.bb} | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)
 rename meta/recipes-support/bmap-tools/{bmap-tools_3.4.bb => bmap-tools_3.5.bb} (63%)

diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb b/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
similarity index 63%
rename from meta/recipes-support/bmap-tools/bmap-tools_3.4.bb
rename to meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
index 2aae9a3fe0d8..25c1c694817f 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb
+++ b/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
@@ -9,16 +9,23 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "https://github.com/intel/${BPN}/releases/download/v${PV}/${BP}.tgz"
+SRC_URI = "git://github.com/intel/${BPN}"
 
-SRC_URI[md5sum] = "883420183611aa137cbaf68a91ef0d7e"
-SRC_URI[sha256sum] = "0064891270c180c190f41925b0f6fb9cecac3056f1168d2592dbe90e5f226c0a"
+SRCREV = "db7087b883bf52cbff063ad17a41cc1cbb85104d"
+S = "${WORKDIR}/git"
+PV .= "+git${SRCPV}"
 
-UPSTREAM_CHECK_URI = "https://github.com/intel/${BPN}/releases"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
-RDEPENDS_${PN} = "python3-core python3-compression python3-mmap python3-setuptools python3-fcntl"
+RDEPENDS_${PN} = "python3-core python3-compression python3-mmap python3-setuptools python3-fcntl python3-six"
 
 inherit python3native
 inherit setuptools3
 
+# We need the native dependency on python3-six at runtime
+# See bug 10113
+EXTRASYSROOTDEPTASK = ""
+EXTRASYSROOTDEPTASK_class-native = "do_populate_sysroot"
+do_populate_sysroot[rdeptask] = "${EXTRASYSROOTDEPTASK}"
+
 BBCLASSEXTEND = "native"
-- 
2.7.4


