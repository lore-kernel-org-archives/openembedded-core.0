Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f181.google.com (mail-lb0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id DDB236E681
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 17:39:53 +0000 (UTC)
Received: by mail-lb0-f181.google.com with SMTP id k15so77139556lbg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Mar 2016 09:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=6t8KFUXDPZZ9Y3VJlZSQk78k+zVX5g8M4OMupYnGxao=;
	b=yqLtchvokNYZSb4ERC7ttf1RszPGlP/UYI60Jcee1aGB1FXyIK1Oo3pcltGcQ4ZRFi
	Q4coKdTv477yclCvpJjPOlV2NFI6guHgpr28iu9OEf1HUgawZbJepDIQL+XqeYkEDdyb
	ni77BRngPD8QELdX8grs+UaVfWQJN/tQkNM5L4XBWiO+DkRkUaSEPc5I1BAUR+2Lrz00
	/pA9VcJ7fR2HwhmJ5dN0+pVu5x70jL8u9V/qdJOPaMMPZE9wuviXWRU4Mgpgq/9Y9atL
	GNf/zyWPPTnVJehJqSe5anczHQF0CqlXj0/2P9Vwmh56Zpt6RE6KBFDwdoZHAky4t2i3
	/98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6t8KFUXDPZZ9Y3VJlZSQk78k+zVX5g8M4OMupYnGxao=;
	b=Wdv9yxCzIVC23a+6S7vOudPffBod8uhNRBGcDjSspDcRmVWQIv5tnHKDGue7jh9bXB
	MxtVn3SmWv4tTlswjSvmyO04ydNllXjwDMAAZi4XZLYRqo+oPSw/f+rSKhCzKZESOeGH
	Go/FSQadf518alwHOc4/8m4J9+iEilk+eAsFxJ+qralzeqBOz64hUAMhcg/1QxScUDiE
	68Br4U4bGy/6cDoy5Cc6+wb2YmajFjDIFifQj7Fz1kQJ35cIwxYqaYXvZ4+qPfF3DIKd
	w6sKpE+uN8Q3JhaQPnRpMvVmxWFV6PpQhgzhMO3jP2SkyL8HZqLYxfAErb4m1xx+VGkC
	PoIg==
X-Gm-Message-State: AD7BkJKG5D2Y5jpOidUdHqVqmrJh1RLN5kkdlYpnGGC156vxERNt2f5IDOotHZU4II6hyQ==
X-Received: by 10.25.23.94 with SMTP id n91mr9740136lfi.3.1457545192648;
	Wed, 09 Mar 2016 09:39:52 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	mt7sm1414601lbb.25.2016.03.09.09.39.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Mar 2016 09:39:51 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Wed,  9 Mar 2016 18:39:50 +0100
Message-Id: <1457545190-31889-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] perl-rdepends: Remove circular dependencies
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
X-List-Received-Date: Wed, 09 Mar 2016 17:39:55 -0000

Packages should not depend on themselves, otherwise it could lead to
circular dependencies on the package manager.

I have added a line on the proposed bash script that should add this
check on future versions.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta/recipes-devtools/perl/perl-rdepends_5.22.1.inc | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl-rdepends_5.22.1.inc b/meta/recipes-devtools/perl/perl-rdepends_5.22.1.inc
index 7f886f34ab68..033d4e354611 100644
--- a/meta/recipes-devtools/perl/perl-rdepends_5.22.1.inc
+++ b/meta/recipes-devtools/perl/perl-rdepends_5.22.1.inc
@@ -7,6 +7,7 @@
 #2 find . -name \*.pm | xargs sed -i '/^=head/,/^=cut/d'
 #3 egrep -r "^\s*(\<use .*|\<require .*);?" perl-module-* --include="*.pm" 
 #| sed "s/\/.*\.pm: */ += /g;s/[\"\']//g;s/;.*/\"/g;s/+= .*\(require\|use\)\> */+= \"perl-module-/g;s/CPANPLUS::.*/cpanplus/g;s/CPAN::.*/cpan/g;s/::/-/g;s/ [^+\"].*//g;s/_/-/g;s/\.pl\"$/\"/;s/\"\?\$/\"/;s/(//;" | tr [:upper:] [:lower:] 
+#| awk '{if ($3 != "\x22"$1"\x22"){ print $0}}'
 #| grep -v -e "\-vms\-" -e module-5 -e "^$" -e "\\$" -e your -e tk -e autoperl -e html -e http -e parse-cpan -e perl-ostype -e ndbm-file -e module-mac -e fcgi -e lwp -e dbd -e dbix 
 #| sort -u 
 #| sed 's/^/RDEPENDS_/;s/perl-module-/${PN}-module-/g;s/module-\(module-\)/\1/g;s/\(module-load\)-conditional/\1/g;s/encode-configlocal/&-pm/;' 
@@ -275,7 +276,6 @@ RDEPENDS_${PN}-module-constant += "${PN}-module-carp"
 RDEPENDS_${PN}-module-constant += "${PN}-module-strict"
 RDEPENDS_${PN}-module-constant += "${PN}-module-warnings-register"
 RDEPENDS_${PN}-module-corelist += "${PN}-module-list-util"
-RDEPENDS_${PN}-module-corelist += "${PN}-module-corelist"
 RDEPENDS_${PN}-module-corelist += "${PN}-module-strict"
 RDEPENDS_${PN}-module-corelist += "${PN}-module-vars"
 RDEPENDS_${PN}-module-corelist += "${PN}-module-version"
@@ -283,7 +283,6 @@ RDEPENDS_${PN}-module-corelist += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-cpan += "${PN}-module-b"
 RDEPENDS_${PN}-module-cpan += "${PN}-module-carp"
 RDEPENDS_${PN}-module-cpan += "${PN}-module-config"
-RDEPENDS_${PN}-module-cpan += "${PN}-module-cpan"
 RDEPENDS_${PN}-module-cpan += "${PN}-module-cwd"
 RDEPENDS_${PN}-module-cpan += "${PN}-module-data-dumper"
 RDEPENDS_${PN}-module-cpan += "${PN}-module-dirhandle"
@@ -885,7 +884,6 @@ RDEPENDS_${PN}-module-fatal += "${PN}-module-autodie-scopeutil"
 RDEPENDS_${PN}-module-fatal += "${PN}-module-carp"
 RDEPENDS_${PN}-module-fatal += "${PN}-module-config"
 RDEPENDS_${PN}-module-fatal += "${PN}-module-constant"
-RDEPENDS_${PN}-module-fatal += "${PN}-module-fatal"
 RDEPENDS_${PN}-module-fatal += "${PN}-module-fcntl"
 RDEPENDS_${PN}-module-fatal += "${PN}-module-posix"
 RDEPENDS_${PN}-module-fatal += "${PN}-module-scalar-util"
@@ -1079,7 +1077,6 @@ RDEPENDS_${PN}-module-i18n-langtags-detect += "${PN}-module-vars"
 RDEPENDS_${PN}-module-i18n-langtags-list += "${PN}-module-strict"
 RDEPENDS_${PN}-module-i18n-langtags-list += "${PN}-module-vars"
 RDEPENDS_${PN}-module-i18n-langtags += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-i18n-langtags += "${PN}-module-i18n-langtags"
 RDEPENDS_${PN}-module-i18n-langtags += "${PN}-module-strict"
 RDEPENDS_${PN}-module-i18n-langtags += "${PN}-module-vars"
 RDEPENDS_${PN}-module-io-compress-adapter-bzip2 += "${PN}-module-bytes"
@@ -1428,7 +1425,6 @@ RDEPENDS_${PN}-module-load += "${PN}-module-filehandle"
 RDEPENDS_${PN}-module-load += "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-load += "${PN}-module-locale-maketext-simple"
 RDEPENDS_${PN}-module-load += "${PN}-module-corelist"
-RDEPENDS_${PN}-module-load += "${PN}-module-load"
 RDEPENDS_${PN}-module-load += "${PN}-module-params-check"
 RDEPENDS_${PN}-module-load += "${PN}-module-strict"
 RDEPENDS_${PN}-module-load += "${PN}-module-vars"
@@ -2353,7 +2349,6 @@ RDEPENDS_${PN}-module-test-harness += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-test-more += "${PN}-module-scalar-util"
 RDEPENDS_${PN}-module-test-more += "${PN}-module-strict"
 RDEPENDS_${PN}-module-test-more += "${PN}-module-test-builder-module"
-RDEPENDS_${PN}-module-test-more += "${PN}-module-test-more"
 RDEPENDS_${PN}-module-test-more += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-test += "${PN}-module-carp"
 RDEPENDS_${PN}-module-test += "${PN}-module-exporter"
-- 
2.7.0


