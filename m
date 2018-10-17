Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 396BF7198A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 10:43:04 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id w9HAh5DA006753
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 12:43:05 +0200
Received: from dev.vm6.ccp.siemens.com ([167.87.21.7])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id w9HAh5ZY031006;
	Wed, 17 Oct 2018 12:43:05 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 01FAA10D56C8;
	Wed, 17 Oct 2018 12:43:01 +0200 (CEST)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Oct 2018 12:42:39 +0200
Message-Id: <20181017104243.801-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH v4 0/4] cmake.bbclass improvements
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
X-List-Received-Date: Wed, 17 Oct 2018 10:43:06 -0000

This patchset is unmodified from v3. It is just rebased on top of master which
already includes a fixed version of libproxy and piglit.

I built all cmake based recipes in oe-core (qemuarm64) and did not find any more issues.

Pascal Bach (4):
  cmake.bbclass: use CMAKE_SYSTEM_LIBRARY_PATH instead of
    CMAKE_LIBRARY_PATH
  cmake.bbclass: search both sysroot-native and host for native packages
  cmake.bbclass: move CMAKE_NO_SYSTEM_FROM_IMPORTED to toolchain.cmake
  cmake.bbclass: allow cmake to find hosttools

 meta/classes/cmake.bbclass | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

-- 
2.11.0


