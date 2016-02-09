Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id F1FD562137
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 14:22:41 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u19EMgqD020814 for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Feb 2016 08:22:42 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016020908224225-790914 ;
	Tue, 9 Feb 2016 08:22:42 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 9 Feb 2016 16:22:25 +0200
Message-Id: <cover.1455027565.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 02/09/2016 08:22:42 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 02/09/2016 08:22:42 AM,
	Serialize complete at 02/09/2016 08:22:42 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-02-09_09:, , signatures=0
Subject: [PATCH v4 0/3] IPK signing for gpg_sign module
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
X-List-Received-Date: Tue, 09 Feb 2016 14:22:43 -0000

v4 of this patch series is a complete refactoring of the IPK signing
logic on top of the gpg_sign module. It extends the module to add
support for both ascii armored and binary signatures, ipk package
signing and opkg package feed signing.

Ioan-Adrian Ratiu (3):
  gpg_sign: add support for gpg signature types
  gpg_sign: add local ipk package signing functionality
  package_manager: sign IPK package feeds

 meta/classes/package_ipk.bbclass       |  6 ++++
 meta/classes/sign_ipk.bbclass          | 53 ++++++++++++++++++++++++++++++++++
 meta/classes/sign_package_feed.bbclass | 10 ++++++-
 meta/classes/sign_rpm.bbclass          | 12 +++++++-
 meta/lib/oe/gpg_sign.py                | 51 +++++++++++++++++++++++++++++---
 meta/lib/oe/package_manager.py         | 19 ++++++++++--
 meta/recipes-core/meta/signing-keys.bb |  6 ++--
 7 files changed, 146 insertions(+), 11 deletions(-)
 create mode 100644 meta/classes/sign_ipk.bbclass

-- 
2.7.0


