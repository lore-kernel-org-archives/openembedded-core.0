Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 57F4365D59
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 07:38:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s897cVPX005816
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 9 Sep 2014 00:38:31 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 9 Sep 2014 00:38:30 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Tue, 9 Sep 2014 00:38:29 -0700
Message-ID: <cover.1410248214.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] grub-efi: Replace _BSD_SOURCE macro with _DEFAULT_SOURCE
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
X-List-Received-Date: Tue, 09 Sep 2014 07:38:38 -0000
Content-Type: text/plain

The following changes since commit e72aac2ae9e5fce1715fa04b7e94034fd06892d9:

  alsa-lib: libasound should runtime depends on alsa-conf (2014-09-03 11:30:11 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/grub-efi
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/grub-efi

Robert Yang (1):
  grub-efi: Replace _BSD_SOURCE macro with _DEFAULT_SOURCE

 .../grub/files/grub-efi-fix-with-glibc-2.20.patch  |   32 ++++++++++++++++++++
 meta/recipes-bsp/grub/grub-efi_2.00.bb             |    1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/grub-efi-fix-with-glibc-2.20.patch

-- 
1.7.9.5


