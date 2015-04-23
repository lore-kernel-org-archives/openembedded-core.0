Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id D493B6AC24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 14:46:15 +0000 (UTC)
Received: by wgyo15 with SMTP id o15so20887470wgy.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 07:46:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=M6gnu+x9Io918Ttyn+cXXkmD+/XvdEeyQDf33qqeb2w=;
	b=P/ueVPA51Jydf5Pv/4csY1RhgK9zSRg6ano0uDgSi0oui0yot+6e9hD4EtoLPRojU9
	xk5G4RFQ0UorgU0xQIyly6aKDbAQzBXJKeOqtujXaqGqSXexHHbqjh4IPwivIpR4+phG
	a2v462d+3bfeBCILfEWa10FbIMIXQvrIyRHPst45tBfANpNUAbIO+iIV24/T157bES94
	lrcdHLSKVwod1MXxrv0IX50FmpTU+SO6CeNPcwvNiUaSbFjfO4DgCr7BLBNqszjxTO1p
	Gq6vkfeVrL3Ed672s4/7hc/0ii8/CZd/5rPeoqI/Eh3VofKzs8kQ+IXw2K55eg/PSkge
	qUZw==
X-Gm-Message-State: ALoCoQk5hRmPvMU+SNKF6eadqUST0BvC/1q3qaLrxb/5vsboxzKVpkDU2Vsn2AEeZwH6ek1EsNUt
X-Received: by 10.194.89.7 with SMTP id bk7mr5944732wjb.127.1429800376144;
	Thu, 23 Apr 2015 07:46:16 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id e2sm12460907wjy.46.2015.04.23.07.46.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Apr 2015 07:46:15 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Apr 2015 15:42:42 +0100
Message-Id: <1429800162-18262-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] ptest: add recommends to ptest-runner
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
X-List-Received-Date: Thu, 23 Apr 2015 14:46:18 -0000

If you're installing ptest packages into an image there's a good chance
you want to run the tests.  Assist with this by recommending
ptest-runner in the -ptest packages.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/ptest.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index 4e6f075..101ab9d 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -12,6 +12,7 @@ PTEST_ENABLED_class-nativesdk = ""
 PTEST_ENABLED_class-cross-canadian = ""
 RDEPENDS_${PN}-ptest_class-native = ""
 RDEPENDS_${PN}-ptest_class-nativesdk = ""
+RRECOMMENDS_${PN}-ptest += "ptest-runner"
 
 PACKAGES =+ "${@bb.utils.contains('PTEST_ENABLED', '1', '${PN}-ptest', '', d)}"
 
-- 
1.7.10.4


