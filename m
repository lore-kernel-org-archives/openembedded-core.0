Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id D6160719E7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 10:33:46 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id g23so20607614wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2016 02:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BBS/td1MUdnZptkjKAC7IihCpIw8+dJQuUJyXG34lWk=;
	b=K7ZLEgQ9jmJC6/dP+74NEb4zQwB0icTwxfqHZb9at+jdxILuebTqYhNLaPVRKsK+kP
	Ex6t13IxkPE8wBZz8E4GpFjmUwAPdpiXI8nqqEAx5fVpmNtXumg7RV4WltZkEMQKeYPs
	CMtFgrcYFrYuijzMnZk0Td+qy/7ASmEbe8qI4N3WZ+zZhuLiiQQ39YQiS3KFz3Z3VtdK
	tcx01YWZU4JtkyrrMdg519u1k+1gF+Wt00BV5M+HUTdvxanDtnYxQzsgzhlwZh7spVfr
	eU4qdk+28buBcJ9CEGEUQS+k6LqPT9mIBwjGPDW7RJ17z7sEHFOC/a84gU3ujsrva4Bd
	wunw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BBS/td1MUdnZptkjKAC7IihCpIw8+dJQuUJyXG34lWk=;
	b=Tm3l43RtV/Xv9IpBMlSNAzoC8un+ABpHbtMhdZKtBsO6C7ajfX5wtwBBKL51d/bjvo
	0bEYg64v/mabj9au640YQ2fr/ms70pOms8yACTAXMriKyi1DCgN/ITu0M6pnrpWOGYE6
	Omzscev5I4orA+Thx85i0oPcO0hL45egdOhyUhD0B1RFwghOXLoo12odcRMciiXpUC/2
	L0Zt41H79Jk9NIZ5Zp7z0352fCBetF5LqRfNNBSk0N3iS4HL4oZo4x1xspTqQxe4bvDT
	BgNg+3cqjcodY32ZBONFuJqIfP192TJXmhqGGYsHNjiKeaz7Jz9gAKpLUEzhvlD+sgtc
	Q1xw==
X-Gm-Message-State: AKaTC01DhkwqaXxeXp4/EnwzRhy1jqgAbormSTQr9WK+yvwqWF9Xx50n/0iQwcyCfewelQ==
X-Received: by 10.28.184.88 with SMTP id i85mr1885710wmf.49.1481020427806;
	Tue, 06 Dec 2016 02:33:47 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local (mail2.zera.de. [62.225.102.139])
	by smtp.googlemail.com with ESMTPSA id
	f126sm3250654wme.22.2016.12.06.02.33.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Dec 2016 02:33:47 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2016 11:33:31 +0100
Message-Id: <1481020411-1975-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] liburi-perl: update to 1.71
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
X-List-Received-Date: Tue, 06 Dec 2016 10:33:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Old version was broken by perl update. It was found by investigating configure
errors in meta-qt5-extra/kf5:

| [superandy@mueller-a-nb-linux 5.28.0-r0]$ /home/superandy/tmp/oe-core-glibc/sysroots/x86_64-linux/usr/bin/perl-native/perl -e "use URI::Escape"
| \C no longer supported in regex; marked by <-- HERE in m/(\ <-- HERE C)/ at /home/superandy/tmp/oe-core-glibc/sysroots/x86_64-linux/usr/lib/perl-native/perl/vendor_perl/5.24.0/URI/Escape.pm line 205.
| Compilation failed in require at -e line 1.
| BEGIN failed--compilation aborted at -e line 1.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../perl/{liburi-perl_1.60.bb => liburi-perl_1.71.bb}            | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/perl/{liburi-perl_1.60.bb => liburi-perl_1.71.bb} (64%)

diff --git a/meta/recipes-devtools/perl/liburi-perl_1.60.bb b/meta/recipes-devtools/perl/liburi-perl_1.71.bb
similarity index 64%
rename from meta/recipes-devtools/perl/liburi-perl_1.60.bb
rename to meta/recipes-devtools/perl/liburi-perl_1.71.bb
index 8809a44..a800198 100644
--- a/meta/recipes-devtools/perl/liburi-perl_1.60.bb
+++ b/meta/recipes-devtools/perl/liburi-perl_1.71.bb
@@ -3,17 +3,18 @@ DESCRIPTION = "This package contains the URI.pm module with friends. \
 The module implements the URI class. URI objects can be used to access \
 and manipulate the various components that make up these strings."
 
+HOMEPAGE = "http://search.cpan.org/dist/URI/"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 
-LIC_FILES_CHKSUM = "file://README;beginline=26;endline=30;md5=6c33ae5c87fd1c4897714e122dd9c23d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c453e94fae672800f83bc1bd7a38b53f"
 
 DEPENDS += "perl"
 
-SRC_URI = "http://www.cpan.org/authors/id/G/GA/GAAS/URI-${PV}.tar.gz"
+SRC_URI = "http://www.cpan.org/authors/id/E/ET/ETHER/URI-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "70f739be8ce28b8baba7c5920ffee4dc"
-SRC_URI[sha256sum] = "1f92d3dc64acb8845e9917c945e22b9a5275aeb9ff924eb7873c3b7a5c0d2377"
+SRC_URI[md5sum] = "247c3da29a794f72730e01aa5a715daf"
+SRC_URI[sha256sum] = "9c8eca0d7f39e74bbc14706293e653b699238eeb1a7690cc9c136fb8c2644115"
 
 S = "${WORKDIR}/URI-${PV}"
 
-- 
2.7.4


