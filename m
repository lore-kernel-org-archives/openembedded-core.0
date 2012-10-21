Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TPxqg-0003Rz-RS
	for openembedded-core@lists.openembedded.org;
	Sun, 21 Oct 2012 17:53:58 +0200
Received: by mail-wg0-f43.google.com with SMTP id dq11so1416024wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Oct 2012 08:40:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=WGmvOA0vElrP4Ht0oS5UGOlFO57dOtInEr/BvOlx1Q0=;
	b=GCutqCgm3ZUXoRoXZbx63T9fndA5g1KWgQnxdbMMmgZ8uLxpOtyCvKcXjZrTHHPHoo
	W5cX/kLSJXpr0sLNww13dqgmFyiFcq5+2MT9LlRMQ1PD9qO9QZK4LBBHWm49LZI6rWUN
	fQruKf2WbQyAN1KEq5sFVv5/bGGC1YBOz63dvZAXQWV2XMh2Fb03ke0T6dIrY8cE9KJj
	t/B6hp2V50kQFLdTB7iKI70XqnnHBYU9lnJx/Cj/k3B2b/rLU6us4d/OsjF4A2Jt9qIc
	Gw01mjyQpFxfeWHFqmbMoNK8a3fgjrVayIW+wekvEZ8TdMxu4YUTFQcV4w2EWuRD2cNV
	Gh6A==
Received: by 10.216.28.140 with SMTP id g12mr4199436wea.59.1350834035224;
	Sun, 21 Oct 2012 08:40:35 -0700 (PDT)
Received: from localhost.localdomain (5-13-211-28.residential.rdsnet.ro.
	[5.13.211.28])
	by mx.google.com with ESMTPS id dm3sm16532033wib.3.2012.10.21.08.40.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 21 Oct 2012 08:40:34 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Oct 2012 18:40:18 +0300
Message-Id: <cover.1350833713.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQlj2uabOsZ5FeEbKKj3p8bd5LbB1kYAT8KpGbg4p2yXHPqijsG5FtF+Hyzih1OpzACC9n8b
Subject: [PATCH V2 0/5] FIX #2431 and other opkg / ipk related fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 21 Oct 2012 15:53:58 -0000

V2:
Have rootfs_ipk.bbclass formatting changings in a different commit.
Thanks: Otavio Salvador <otavio@ossystems.com.br>

The following changes since commit caba9cbfce09f19eb27f4c6615c0c5c48e1a2952:

  kernel.bbclass: add kernel-modules to PACKAGES (2012-10-19 23:06:26 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ag/opkg
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ag/opkg

Andrei Gherzan (5):
  opkg-utils: Add needed python modules as RDEPENDS
  opkg: Add patch to fix removing packages with recommends
  opkg: Don't print empty PROVIDES
  rootfs_ipk.bbclass: Don't duplicate remove_packaging_data_files code
  rootfs_ipk.bbclass: Some extra spaces / tabs were removed / formated

 meta/classes/rootfs_ipk.bbclass                    |    8 +++---
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |    4 +--
 ...t-add-recommends-pkgs-to-depended-upon-by.patch |   26 ++++++++++++++++++++
 ...n-t-print-provides-if-nothing-is-provided.patch |   24 ++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_svn.bb             |    4 ++-
 5 files changed, 59 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg/opkg/don-t-add-recommends-pkgs-to-depended-upon-by.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/don-t-print-provides-if-nothing-is-provided.patch

-- 
1.7.9.5



