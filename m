Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qa0-f48.google.com (mail-qa0-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id 29A2761013
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 20:48:54 +0000 (UTC)
Received: by mail-qa0-f48.google.com with SMTP id hu16so3987348qab.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 13:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding:organization;
	bh=1LBwWWxRnqOoBW740Iv0O8IDRmvz46fJNvCpsZyZ+vg=;
	b=fudCUIog5t9wYFFTC9jd9pYKqfaH8Yat3TtGqbCsQf0x9kw/S74tCfuKoztrmnPcv/
	yrYD6/C1WcwZ4Iqrvx41WEHECWVgreO9vpyGCU90qGe1enVO0irmyQ/H1uwBVFxf2f5n
	EoQ8v9ac50fKi/lzaiaPlzWtywhDaWADwI6d8Maz0OZxEQ/FuUs4vKy7YvOZQwrRRA47
	8JGlvdUued5EKMrpy6N8vTU2mmIFFz/X2oDxHOYbyY6Yn//LgpTTyNbP3XZQMCqsfkS6
	SyDI7WOP8pqQrsyFqipA05QaJjLAtzgXh2iI4ob8sGRwetmZVNYXmXa4H961Q/WCrfos
	pQBQ==
X-Received: by 10.224.88.193 with SMTP id b1mr1078040qam.81.1379623735618;
	Thu, 19 Sep 2013 13:48:55 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.209.11])
	by mx.google.com with ESMTPSA id h20sm13258086qen.5.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 19 Sep 2013 13:48:54 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Sep 2013 17:48:35 -0300
Message-Id: <1379623718-29690-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.rc3
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 0/3] U-Boot configuration rework
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
X-List-Received-Date: Thu, 19 Sep 2013 20:48:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This serie consolidate the UBOOT_MACHINE and UBOOT_CONFIG handle; the
code for verification of UBOOT_MACHINE has been duplicated and it must
be shared with UBOOT_CONFIG to allow better handle of it and error
reporting.

The patch simplify the U-Boot code and it has been tested with OE-Core
and meta-fsl-arm layers.

Changes in v2:
- Fix grammar in messages (added 'the' and dropped 'are') - Hans Beckérus

Otavio Salvador (3):
  uboot-config.bbclass: Use an annonymous python function
  uboot-config.bbclass: Handle UBOOT_MACHINE setting
  u-boot, u-boot-fw-utils, u-boot-fw-utils-cross: Use uboot-config class

 meta/classes/uboot-config.bbclass                  | 30 ++++++++++++++++------
 .../u-boot/u-boot-fw-utils-cross_2013.07.bb        |  2 +-
 meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb |  9 +------
 meta/recipes-bsp/u-boot/u-boot.inc                 | 11 +-------
 4 files changed, 25 insertions(+), 27 deletions(-)

-- 
1.8.4.rc3


