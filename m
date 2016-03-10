Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0E6CA6AC00
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 10:03:19 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u2AA3IbH006316; Thu, 10 Mar 2016 04:03:18 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016031004031916-1226944 ;
	Thu, 10 Mar 2016 04:03:19 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Mar 2016 12:02:54 +0200
Message-Id: <cover.1457603028.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.2
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 03/10/2016 04:03:19 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 03/10/2016 04:03:19 AM,
	Serialize complete at 03/10/2016 04:03:19 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-03-10_07:, , signatures=0
Subject: [PATCH v8 0/6] IPK signing for the gpg_sign module
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
X-List-Received-Date: Thu, 10 Mar 2016 10:03:21 -0000

Changes since v7:
  * Removed the PACKAGE_FEED_GPG_PUBKEY variable
  * Split the feed signing types into a separate commit and made it work
    also for rpm's besides ipk's
  * Minor whitespace & exception handling cleanups

Ioan-Adrian Ratiu (6):
  gpg_sign: add local ipk package signing functionality
  gpg_sign: detach_sign: fix gpg > 2.1 STDIN file descriptor
  gpg_sign: export_pubkey: add signature type support
  signing-keys: create ipk package
  package_manager: sign IPK package feeds
  sign_package_feed: add feed signature type

 meta/classes/package_ipk.bbclass       |  5 +++
 meta/classes/sign_ipk.bbclass          | 52 +++++++++++++++++++++++++++++
 meta/classes/sign_package_feed.bbclass | 12 ++++++-
 meta/lib/oe/gpg_sign.py                | 60 ++++++++++++++++++++++++++--------
 meta/lib/oe/package_manager.py         | 22 +++++++++++--
 meta/recipes-core/meta/signing-keys.bb | 15 ++++++++-
 6 files changed, 147 insertions(+), 19 deletions(-)
 create mode 100644 meta/classes/sign_ipk.bbclass

-- 
2.7.2


