Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qe0-f43.google.com (mail-qe0-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id 310E860135
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 13:28:55 +0000 (UTC)
Received: by mail-qe0-f43.google.com with SMTP id gh4so5743970qeb.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 06:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=ak89sVbiAc7lq+4wltbWC+zQucVk+wcjqNmdpbn2Ruc=;
	b=EtZtsl/XHEY84Xqwscz9g2UzhczBFFH8O19j4zfCaQmGO5/GBDrHWgphTZnH3MfcuW
	ENIWvj4yVmhRx/7zFl/HQAAJg652J92CCiU+pVF0ioVPHtTOrMsfFOdoU5T8RZhEd3DZ
	dq9J0WS6uJxfNuSkucWXpauPAkciXb42Gpqtok6YFA5vAFHqtZ6tlmZaiOtBizbJKNYR
	FbW92wost4j5vFnJqz3YXS6ZFqteGn7oEoftJ9VuMEL4N0zvlY9XGU4WVDePgO4DWsNX
	gUUG9ChleHOuj+GwLufBzsaRzS5/3pyT93gIlQ5WJ3Dq7RsrJSVbyYS6Jyvu3P3fD9XT
	cJsA==
X-Received: by 10.49.2.68 with SMTP id 4mr3556206qes.64.1379597336230;
	Thu, 19 Sep 2013 06:28:56 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.209.11])
	by mx.google.com with ESMTPSA id fy7sm10866448qeb.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 19 Sep 2013 06:28:55 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Sep 2013 10:28:38 -0300
Message-Id: <1379597321-5447-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.rc3
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 0/3] U-Boot configuration rework
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
X-List-Received-Date: Thu, 19 Sep 2013 13:28:55 -0000

This serie consolidate the UBOOT_MACHINE and UBOOT_CONFIG handle; the
code for verification of UBOOT_MACHINE has been duplicated and it must
be shared with UBOOT_CONFIG to allow better handle of it and error
reporting.

The patch simplify the U-Boot code and it has been tested with OE-Core
and meta-fsl-arm layers.


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


