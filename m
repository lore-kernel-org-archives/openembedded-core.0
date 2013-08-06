Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 5538960886
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2013 11:18:14 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id q56so229876wes.21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2013 04:18:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=SHIvZ6Vc0w72MHXLbxZh93n3NWIZkRPFyVCPb+1TRBs=;
	b=W8WwRQFCZxm78yTBVqQuJHtAhfAGip0ACyypzau9TQgWJ2449yJ+hO3s21DaKjglWD
	ntEeHwOgxPdbMBq9RlVqeLYbymmpCdMU5uBGivJCHk+69qskL06aLn2HJNWfH7UjTvgH
	K68C/pOZT1LX3fnawC6HfDJjr/AQPtiG8zSCMbv0g5b7gp7i9qvTD9+V4sF/awqkhP9n
	DZ/h1S7CGxLHptYvqWYZpN0bomCfSh+bQMNo9W4+T7sz8w4c2ZeWm8N/f2VdVBtmaLq7
	SSirwVYbvdehqIY0Rkgxs33IOCsaxM47uJIFP+ZUpR/llUjH9pe5dj4ThbZq+15vIZWF
	TfVw==
X-Gm-Message-State: ALoCoQnRqIn5m5DE5m5cKm940WRKog1t+qB+Pxxr2O+C2tPiO2HQ8M0iRHNfOPwUDwih5/LlG9sy
X-Received: by 10.194.8.99 with SMTP id q3mr588799wja.91.1375787893842;
	Tue, 06 Aug 2013 04:18:13 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id hb2sm4966164wib.0.2013.08.06.04.18.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 06 Aug 2013 04:18:12 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Aug 2013 12:18:05 +0100
Message-Id: <cover.1375787843.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/2] Enable out-of-tree builds for Mesa
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
X-List-Received-Date: Tue, 06 Aug 2013 11:18:15 -0000

Hi,

Attached is a two-patch series to enable out-of-tree build for Mesa.

Ross

The following changes since commit 4cff3defb545643132b7233fcffb3fedc1bf182b:

  grep: Add patch for texinfo 5.1 (2013-08-03 10:33:14 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/mesa

for you to fetch changes up to 653b8f2da86101031731b208b84a4ca4f91b5074:

  seperatebuilddir: mesa now builds out of tree (2013-08-06 12:16:55 +0100)

----------------------------------------------------------------
Ross Burton (2):
      mesa: fix out-of-tree builds when Gallium is enabled
      seperatebuilddir: mesa now builds out of tree

 meta/conf/distro/include/seperatebuilddir.inc      |    2 +-
 .../mesa/0005-fix-out-of-tree-builds-gallium.patch |   42 ++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa_9.1.5.bb           |    1 +
 meta/recipes-graphics/mesa/mesa_git.bb             |    1 +
 4 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/mesa/mesa/0005-fix-out-of-tree-builds-gallium.patch

Ross Burton (2):
  mesa: fix out-of-tree builds when Gallium is enabled
  seperatebuilddir: mesa now builds out of tree

 meta/conf/distro/include/seperatebuilddir.inc      |    2 +-
 .../mesa/0005-fix-out-of-tree-builds-gallium.patch |   42 ++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa_9.1.5.bb           |    1 +
 meta/recipes-graphics/mesa/mesa_git.bb             |    1 +
 4 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/mesa/mesa/0005-fix-out-of-tree-builds-gallium.patch

-- 
1.7.10.4


