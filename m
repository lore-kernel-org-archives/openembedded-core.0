Return-Path: <ross.burton@intel.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id C4FA86ED34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 16:23:27 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id c41so3697937eek.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 08:23:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=h5/0Pc9KKFGNmPoioaPZtEq1CeXUxH4GQZhujTmuedg=;
	b=b+UwDobOPX3at8avC4ZPgBixPX3f7CkdBd7I57RPzqxKph2WAckSYUt0LRuynhVCJN
	eiwY7gui4VodhR0H9fnB3OP+6G6BuGZ+Xx0tMvl+H1MUqAvqK53u1zTp0uCumo1GTd+f
	NSmUR1WJ+XqR6h9VngBFvqPZaA8zjNOHYUASeT8TJHgeoH4wdjwbeV6XpbqEaVEeWF5A
	/OW4+ssFwz8LfRMB67H/EM78ADFGWhmXDXmVr0Es/2ECDUJKF0IAWlbp/KCN0uDigD8y
	CGBrtCsYREIJplW+AzXuklo6Zjqrg2RelqcLhwSD0Yb2hSWNVvn0shgLbVWRCx+Ckd3c
	CJpA==
X-Gm-Message-State: ALoCoQlHk546oxaYmXqM2KaUq6eSj51zOsA9O3opCQDOaYIMYA/RTz+rINre4aiQ/4y7zkJDfiJH
X-Received: by 10.14.95.2 with SMTP id o2mr4401310eef.69.1392135807745;
	Tue, 11 Feb 2014 08:23:27 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	o43sm69129566eef.12.2014.02.11.08.23.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Feb 2014 08:23:26 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Feb 2014 16:23:21 +0000
Message-Id: <1392135801-4898-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] package_rpm: fix small indentation error
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
X-List-Received-Date: Tue, 11 Feb 2014 16:23:28 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/package_rpm.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index e9a6ac8..07cd981 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -152,7 +152,7 @@ translate_oe_to_smart() {
 		# Need to reverse the order of the SDK_ARCHS highest -> lowest priority
 		archs=`echo "${SDK_PACKAGE_ARCHS}" | tr - _`
 		for arch in $archs ; do
-		        default_archs="$arch $default_archs"
+			default_archs="$arch $default_archs"
 		done
 	fi
 
-- 
1.7.10.4


