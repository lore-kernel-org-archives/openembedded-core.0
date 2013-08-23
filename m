Return-Path: <kergoth@gmail.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id 62C126065F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 17:20:05 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id t60so831317wes.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 10:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Nuci+qj/5ef/CeT0f13rzisjc6BiNtCIVBKRMl4uQYk=;
	b=xPs7iSoMsO73vtnLF1gsVPlJmGbs4unyBHfXJNWSrMfTjJfZSmOx3dICQ5Xyff5Jv1
	HhaltWknDRNCVnnPJBgzANlAe3vMq9te85U1WkuLR7SCQNqbxmEsSiHnEyxx1BZuDfNp
	cHyf6SOAMm6yvqcs6uBthEXJBrQT99cbR2IYSVy5sPnc+Nza7bQuXCJKUw1cvfFrwizf
	EQZSmrsDOZvp+DZ1eVYpA/iUCR/mpU3CcZROs8PWgL/nuHNsI930vhWl4aaLgw6zpq7i
	bzdH0ZIH87K3LoIk3+FYLQS6rangWiGCJn4Bg3KJgke2aNCef28tLuTvoV31r8o69dYh
	uo2w==
X-Received: by 10.194.78.78 with SMTP id z14mr570864wjw.32.1377278405793;
	Fri, 23 Aug 2013 10:20:05 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id z2sm1224919wiv.11.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 23 Aug 2013 10:20:05 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 10:20:07 -0700
Message-Id: <cover.1377278314.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3.4
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 0/2] Add ca-certificates recipe
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
X-List-Received-Date: Fri, 23 Aug 2013 17:20:07 -0000

From: Christopher Larson <chris_larson@mentor.com>

This is based on the meta-oe recipe, with enhancements, and prepopulates the
certificates for the nativesdk version, for later use in the
buildtools-tarball.

The following changes since commit d98f08a7ad95d0b17846276b028a6614f16b6846:

  genext2fs: fix memory corruption on powerpc (2013-08-20 07:11:44 -0700)

are available in the git repository at:

  https://github.com/kergoth/oe-core.git ca-certificates

Christopher Larson (2):
  ca-certificates: add recipe (version 20130610)
  nativesdk-ca-certificates: prepopulate ca-certificates.crt

 ...01-update-ca-certificates-remove-c-rehash.patch | 44 ++++++++++++++
 .../0002-update-ca-certificates-use-SYSROOT.patch  | 55 +++++++++++++++++
 .../ca-certificates/default-sysroot.patch          | 53 +++++++++++++++++
 .../ca-certificates/ca-certificates/sbindir.patch  | 20 +++++++
 .../ca-certificates/ca-certificates_20130610.bb    | 69 ++++++++++++++++++++++
 5 files changed, 241 insertions(+)
 create mode 100644 meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-remove-c-rehash.patch
 create mode 100644 meta/recipes-support/ca-certificates/ca-certificates/0002-update-ca-certificates-use-SYSROOT.patch
 create mode 100644 meta/recipes-support/ca-certificates/ca-certificates/default-sysroot.patch
 create mode 100644 meta/recipes-support/ca-certificates/ca-certificates/sbindir.patch
 create mode 100644 meta/recipes-support/ca-certificates/ca-certificates_20130610.bb

-- 
1.8.3.4


