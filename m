Return-Path: <Konrad.Scherer@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8CD8F6CA61
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2014 15:41:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1LFfc2e018530
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2014 07:41:38 -0800 (PST)
Received: from yow-kscherer-d1.wrs.com (128.224.146.215) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Fri, 21 Feb 2014 07:41:37 -0800
From: Konrad Scherer <konrad.scherer@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Feb 2014 10:41:36 -0500
Message-ID: <1392997296-30273-2-git-send-email-konrad.scherer@windriver.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1392997296-30273-1-git-send-email-konrad.scherer@windriver.com>
References: <1392997296-30273-1-git-send-email-konrad.scherer@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] native.bbclass: Delete populate-lic task for all native packages
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
X-List-Received-Date: Fri, 21 Feb 2014 15:41:38 -0000
Content-Type: text/plain

With commit 3d59d0bed756f64d0092caa3892239c779c4a341 the populate-lic
sstate files are now arch independent and not stored with the
native populate-sysroot sstate files. If the native sstate dir is
distributed then populate-lic step is still triggered.

Signed-off-by: Konrad Scherer <Konrad.Scherer@windriver.com>
---
 meta/classes/native.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 5a318d2..55d26d9 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -157,6 +157,7 @@ deltask package_write_ipk
 deltask package_write_deb
 deltask package_write_rpm
 deltask package_write
+deltask populate_lic
 
 do_packagedata[stamp-extra-info] = ""
 do_populate_sysroot[stamp-extra-info] = ""
-- 
1.7.9.5


