Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id A0DCC77043
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Mar 2016 14:48:06 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u22Em48J004268; Wed, 2 Mar 2016 08:48:04 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016030208480455-926333 ;
	Wed, 2 Mar 2016 08:48:04 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 2 Mar 2016 16:47:30 +0200
Message-Id: <cover.1456929539.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.1
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 03/02/2016 08:48:04 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 03/02/2016 08:48:05 AM,
	Serialize complete at 03/02/2016 08:48:05 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-03-02_05:, , signatures=0
Subject: [PATCH v7 0/5] IPK signing for the gpg_sign module
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
X-List-Received-Date: Wed, 02 Mar 2016 14:48:08 -0000

This patch series extends the gpg_sign module to support ipk signing.

Changes since v6:
  * Added pubkey to signing_keys.bb and rebased on top of Randy's work
  * Made gpg version detection logic more robust
  * Simplified detach_sign() gpg communication (no more os.pipe)

Ioan-Adrian Ratiu (5):
  gpg_sign: add local ipk package signing functionality
  gpg_sign: detach_sign: fix gpg > 2.1 STDIN file descriptor
  gpg_sign: export_pubkey: add signature type support
  signing-keys: create ipk package
  package_manager: sign IPK package feeds

 meta/classes/package_ipk.bbclass       |  5 +++
 meta/classes/sign_ipk.bbclass          | 52 ++++++++++++++++++++++++++++
 meta/classes/sign_package_feed.bbclass | 17 ++++++++-
 meta/lib/oe/gpg_sign.py                | 63 ++++++++++++++++++++++++++--------
 meta/lib/oe/package_manager.py         | 17 +++++++--
 meta/recipes-core/meta/signing-keys.bb | 15 +++++++-
 6 files changed, 151 insertions(+), 18 deletions(-)
 create mode 100644 meta/classes/sign_ipk.bbclass

-- 
2.7.1


