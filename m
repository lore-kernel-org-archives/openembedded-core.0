Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 31B0A60896
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 19:26:11 +0000 (UTC)
Received: by mail-pd0-f173.google.com with SMTP id p10so1037812pdj.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 12:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=mvVBLcoxIefhnk9LFw8fz09SUsMp70mqaXO2YPajvXA=;
	b=IzGH36nhBw5WODe9QRPMoGwhDVofN5AZnj+6QkKGKSyCZLX+DhUD20lL6XtlOTuvBL
	2KJ04ZkZVNqoPh6RKSz/y46D9pAZ9BtrH+u3EX+yPDbLfv+VSNQXwkghKZSWb5dQX/Cz
	boNk275KLn/6UdpUz1fYskEufWqA4ywOD06OGDQiBIPNSy3i3hmW20IS4Ov2C7zhPXql
	fNeGz/AGZ/JnQiSdbQgYTXzRZJc90qRiSUXqBDrkZAZj0MH7sBzt/U2cdIEw3gTd3pPy
	oZAGooJ4NDnpROgaAODE6EnapHDJkaIkH+zP68iHblVdpZIYQNwlGmDSdiLDboHNu6R2
	PztA==
X-Received: by 10.68.204.165 with SMTP id kz5mr1256726pbc.159.1377285971043;
	Fri, 23 Aug 2013 12:26:11 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id sx7sm1399287pbc.41.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 23 Aug 2013 12:26:09 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 12:26:13 -0700
Message-Id: <cover.1377285913.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3.4
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv3 0/2] Add ca-certificates recipe
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
X-List-Received-Date: Fri, 23 Aug 2013 19:26:11 -0000

From: Christopher Larson <chris_larson@mentor.com>

This is based on the meta-oe recipe, with enhancements, and prepopulates the
certificates for the nativesdk version, for later use in the
buildtools-tarball.

The following changes since commit 9b05c65450526522d7358d0c0901b594de546748:

  sstate: Fix the relative symlink replacement code (2013-08-23 16:59:04 +0100)

are available in the git repository at:

  https://github.com/kergoth/oe-core.git ca-certificates

Christopher Larson (2):
  ca-certificates: add recipe (version 20130610)
  nativesdk-ca-certificates: prepopulate ca-certificates.crt

 ...01-update-ca-certificates-remove-c-rehash.patch | 46 +++++++++++++++
 .../0002-update-ca-certificates-use-SYSROOT.patch  | 55 +++++++++++++++++
 .../ca-certificates/default-sysroot.patch          | 55 +++++++++++++++++
 .../ca-certificates/ca-certificates/sbindir.patch  | 20 +++++++
 .../ca-certificates/ca-certificates_20130610.bb    | 69 ++++++++++++++++++++++
 5 files changed, 245 insertions(+)
 create mode 100644 meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-remove-c-rehash.patch
 create mode 100644 meta/recipes-support/ca-certificates/ca-certificates/0002-update-ca-certificates-use-SYSROOT.patch
 create mode 100644 meta/recipes-support/ca-certificates/ca-certificates/default-sysroot.patch
 create mode 100644 meta/recipes-support/ca-certificates/ca-certificates/sbindir.patch
 create mode 100644 meta/recipes-support/ca-certificates/ca-certificates_20130610.bb

-- 
1.8.3.4


