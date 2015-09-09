Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 96E8B76420
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 13:10:17 +0000 (UTC)
Received: by ioii196 with SMTP id i196so21021285ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Sep 2015 06:10:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0eCISGnpxNvboECVpTSsu7yt7YbsIV9wPWtVGEQL63M=;
	b=MuppuNcuJAKbYOFyM4Z3ScodBOt3//N2q4Tb9zF0ioecM5SlqrxIczTznPnUPeRYz1
	5dTVjH8HBnyQy4k8UPJHvky1IM+z1x0Oo/2GFfH7m3WMAI7A2TZ51rtnxzJMi+hpyQem
	QA78Vh8Vepowjls+E9ETZaV+Wei0HOJzcj0VV2ohZgbCE2AL9treEe1ERKHgKo6sLz9/
	sNhPGog9yRjJo7PWTJ3O472basvrJN2/GvpWt2gEFhSvabh35n9eRRhRO77Iny3A2n5p
	JgJJoZMYvDDfTLAot5CQ1pgea9STl58yVLsBgC7qJqYMR55jfjf4IMR1qbGFnrsLbnhH
	7LbA==
X-Gm-Message-State: ALoCoQkSW6K+VuGGD9s/tIB/eTlN8fVUGOw4tHgpdy/ATU6dZ1TD7wN2oh9fZmBkygVIBdhrB5m5
X-Received: by 10.107.46.158 with SMTP id u30mr54822861iou.56.1441804216049;
	Wed, 09 Sep 2015 06:10:16 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p57A56733.dip0.t-ipconnect.de.
	[87.165.103.51])
	by smtp.gmail.com with ESMTPSA id r4sm1593960igh.14.2015.09.09.06.10.14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Sep 2015 06:10:15 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Sep 2015 15:10:38 +0200
Message-Id: <cover.1441803055.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/4] some init/finish enhancements for initramfs-framework
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
X-List-Received-Date: Wed, 09 Sep 2015 13:10:19 -0000

While continuing my work in integrating IMA into the
initramfs-framework, I found that it is necessary to have more control
over the mount parameters. These patches grant that control using the same
boot parameters as in the Linux kernel.

For debugging I also found it useful to have more opportunities to get
into a shell.

I'm posting these patches because others may also find them useful. If
there's no time to review or merge now, feel free to ignore until
after the next release. In the meantime, I'll proceed with a local
copy of the two files.

The following changes since commit 8402958cd2cb87b8283c8ee4e2d08e1a6717d67a:

  pseudo_1.7.3.bb: New version of pseudo (2015-09-06 15:24:28 +0100)

are available in the git repository at:

  git://github.com/pohly/openembedded-core initramfs-framework
  https://github.com/pohly/openembedded-core/tree/initramfs-framework

Patrick Ohly (4):
  initramfs-framework: support rootflags and rootfstype boot parameter
  initramfs-framework: support ro boot parameter
  initramfs-framework: support init boot parameter
  initramfs-framework: support dropping into shell on failure

 .../initrdscripts/initramfs-framework/finish            | 17 +++++++++++++++--
 .../recipes-core/initrdscripts/initramfs-framework/init |  4 ++++
 2 files changed, 19 insertions(+), 2 deletions(-)

-- 
2.1.4


