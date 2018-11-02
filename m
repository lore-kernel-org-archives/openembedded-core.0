Return-Path: <Arsalan_Awan@mentor.com>
X-Greylist: delayed 2177 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 02 Nov 2018 15:37:38 UTC
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id A738879F76
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 15:37:38 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-MBX-03.mgc.mentorg.com)
	by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
	id 1gIawr-0001CY-Qi from Arsalan_Awan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Nov 2018 08:01:21 -0700
Received: from PKL-AAWAN1-UBUNTU.pkl.mentorg.com (137.202.0.90) by
	SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) with Microsoft SMTP
	Server (TLS) id 15.0.1320.4; Fri, 2 Nov 2018 15:01:17 +0000
From: Arsalan Awan <Arsalan_Awan@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Nov 2018 20:00:50 +0500
Message-ID: <cover.1541168618.git.Arsalan_Awan@mentor.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2) To
	SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
Subject: [sumo][PATCH 0/1] wic/isoimage-isohybrid.py: fix booting from removable media
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
X-List-Received-Date: Fri, 02 Nov 2018 15:37:38 -0000
Content-Type: text/plain

From: "Arsalan H. Awan" <Arsalan_Awan@mentor.com>

The mkhybridiso image created using the isoimage-isohybrid.py
WIC source plugin fails to boot from a removable storage media
such as USB. This is due to the grub-efi bootloader filename
being deployed i.e.: "grub-efi-bootx64.efi" which must be
"bootx64.efi" in this case of a removable media.

Source: https://www.rodsbooks.com/efi-bootloaders/principles.html
Quote: "The fallback boot loader mentioned earlier (EFI/BOOT/bootx64.efi,
        or variants of that, depending on the architecture) is something
        of a special case. This filename was originally intended for use
        only on removable media, so that they could be booted to install
        an OS. (If not for that fixed filename, a factory-fresh computer
        wouldn't be able to boot anything!)"

The following changes since commit 30b055d2296f060a4ca054d042f353a2153fdd4e:

  externalsrc.bbclass: Set BB_DONT_CACHE for non-target recipes (2018-10-18 11:08:46 +0100)

are available in the git repository at:

  git://github.com/ArsalanHAwan/openembedded-core sumo
  https://github.com/ArsalanHAwan/openembedded-core/tree/sumo

Arsalan H. Awan (1):
  wic/isoimage-isohybrid.py: fix booting from removable media

 scripts/lib/wic/plugins/source/isoimage-isohybrid.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.7.4


