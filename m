Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 501BA75E2D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Nov 2015 19:55:11 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so39031742wic.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Nov 2015 11:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=9U7K2zZMHL0AEWAzDrRN6UTdiFRxSk2aSpa7Zm2Ha1I=;
	b=OSg3T2Agy2dpZ4ChjFkfQ6H7+ODhZ4z/cSzlTfqJ7zG4BXNmelYAvvmEx4jAphpHiC
	PJCQNqoAsFMB3ECyMT8zQMQF0xCAFW10Np3Gva9ujVxr13N9CoepFNx4anIENFjm6EDz
	AmCD3ZyIa5aGD3EFy6ywJx/oFrBhqBRL26WdeZ2sDxkA6+R7ewGdZm+QM6Ldox9+q4QU
	8PAMG33Vu1yDnzXt++BUUQIB7YsXiTkp7QypnL4QGH5Bd/vSCiLxXLJs1WMpa3/2+lvX
	q+HtrRkgLj96azcmP7KGkR5ISdrUhUanXpePknXnyUZdDFpX7RWtdn9QVL7IQR6t3IzX
	s/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=9U7K2zZMHL0AEWAzDrRN6UTdiFRxSk2aSpa7Zm2Ha1I=;
	b=a4FS+nxA+Pj1/+BtSgT77WaHhbeMhu3vgXGtoH4r+j23iLZuUJAkDDh3CRNFxlv2Fu
	2qf69l8cjgwhfDMBcCNNbLVHhx6Ph1NE2QhBy9RnMgD6U6bOdWr+QDJCKfTN4zjw54Ye
	ptK8fj53gAK1HYtCD+/TYWB7DI+SI8Ax6AJcYvX9DRKfII1bp4w4TVKqNHYxETd/RUQF
	9YmU2/Y3JW5zH/fzdFHIvaoDe7X1jqixQNA+jl3c24M4r8LEAEFHegioGgb9GsakZMk9
	tG4ccIv3IniUKkzMARoPh7H2R2/iN1l8tfYNf3CrKOt5nn0pe5NlLyLXYb/HAgFGvOPa
	Z8sg==
X-Gm-Message-State: ALoCoQkZcxu5R7CegT28olWpR01hrZ7g5mROmx75YVo30of2Fmqc05p73WdhFQY6y2FS27UBVTbx
X-Received: by 10.194.179.41 with SMTP id dd9mr3977313wjc.123.1446666911890;
	Wed, 04 Nov 2015 11:55:11 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id w9sm3206881wjf.20.2015.11.04.11.55.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 Nov 2015 11:55:11 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Nov 2015 19:46:58 +0000
Message-Id: <1446666421-2549-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/4] readline: rename patch to contain CVE reference
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
X-List-Received-Date: Wed, 04 Nov 2015 19:55:12 -0000

To help automated scanning of CVEs, put the CVE ID in the filename.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../readline-6.3/{readline63-003.patch => readline-cve-2014-2524.patch} | 0
 meta/recipes-core/readline/readline_6.3.bb                              | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/readline/readline-6.3/{readline63-003.patch => readline-cve-2014-2524.patch} (100%)

diff --git a/meta/recipes-core/readline/readline-6.3/readline63-003.patch b/meta/recipes-core/readline/readline-6.3/readline-cve-2014-2524.patch
similarity index 100%
rename from meta/recipes-core/readline/readline-6.3/readline63-003.patch
rename to meta/recipes-core/readline/readline-6.3/readline-cve-2014-2524.patch
diff --git a/meta/recipes-core/readline/readline_6.3.bb b/meta/recipes-core/readline/readline_6.3.bb
index 6ba1c18..fc362ae 100644
--- a/meta/recipes-core/readline/readline_6.3.bb
+++ b/meta/recipes-core/readline/readline_6.3.bb
@@ -1,6 +1,6 @@
 require readline.inc
 
-SRC_URI += "file://readline63-003.patch;striplevel=0 \
+SRC_URI += "file://readline-cve-2014-2524.patch;striplevel=0 \
             file://readline-dispatch-multikey.patch"
 
 SRC_URI[archive.md5sum] = "33c8fb279e981274f485fd91da77e94a"
-- 
2.1.4


