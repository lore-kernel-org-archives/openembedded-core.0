Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 56EA1612E5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 15:42:01 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u1HFg1VD010631; Wed, 17 Feb 2016 09:42:01 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016021709420152-1082884 ;
	Wed, 17 Feb 2016 09:42:01 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Feb 2016 17:41:33 +0200
Message-Id: <cover.1455721437.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.1
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 02/17/2016 09:42:01 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 02/17/2016 09:42:01 AM,
	Serialize complete at 02/17/2016 09:42:01 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-02-17_09:, , signatures=0
Subject: [PATCH v5 0/3] IPK signing for the gpg_sign module
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
X-List-Received-Date: Wed, 17 Feb 2016 15:42:02 -0000

This patch series extends the gpg_sign module to support ipk signing.

v5 is a rebase on top of Markus' refactoring of the gpg_sign module.
Most notably signature types have been reworked to function parameters
with default values in accordance with the refactoring.

Ioan-Adrian Ratiu (3):
  gpg_sign: add local ipk package signing functionality
  gpg_sign: detached_sign: add signature type support
  package_manager: sign IPK package feeds

 meta/classes/package_ipk.bbclass       |  6 ++++
 meta/classes/sign_ipk.bbclass          | 55 ++++++++++++++++++++++++++++++++++
 meta/classes/sign_package_feed.bbclass | 10 ++++++-
 meta/lib/oe/gpg_sign.py                | 45 ++++++++++++++++++++++++++--
 meta/lib/oe/package_manager.py         | 17 +++++++++--
 5 files changed, 128 insertions(+), 5 deletions(-)
 create mode 100644 meta/classes/sign_ipk.bbclass

-- 
2.7.1


