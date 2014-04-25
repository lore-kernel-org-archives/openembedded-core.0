Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 66BC765DF2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Apr 2014 16:40:22 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id t10so2959102eei.33
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Apr 2014 09:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=gw9nFjtAGlnyDDfMmKjrZh7UMGvEvXOwZuWmPIB3mJU=;
	b=nl5kxqZH+MNnvqnPAxJIElcFiGg+VxkVLwzK1bgOGWqqAyDffXSBA2ItVms5orct+S
	WZhXFqmxX9l6d4TFKS65DK44xsLwiG5LWWIovIzBGbAuIXpdZFL36NTnXMp8BqCkCEt6
	9AjU/PCFSUlWOYl7EXJlG53oaoxtASPWWHgmVnSIA2meTKKGyHZRfG2zgycrdcFeA5jZ
	RtkcnWGDsxd4QP9OCG/YPHwKNLHrTTmyjDJVOwy63l4Mfzezj80C1OL4leWuBJWBUia+
	bhA84PFgybxMSZTWBCPzRG2DEQuNYrEmLlaP8YH9tPNDxl5h/0XXIzjNkygf7g52BURD
	Xs7A==
X-Received: by 10.14.204.199 with SMTP id h47mr6200851eeo.48.1398444023366;
	Fri, 25 Apr 2014 09:40:23 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w46sm26104639eeo.35.2014.04.25.09.40.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Apr 2014 09:40:22 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Apr 2014 18:40:25 +0200
Message-Id: <cover.1398443925.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/5] Allow arm tunes which support only thumb
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
X-List-Received-Date: Fri, 25 Apr 2014 16:40:24 -0000

Now with 1.7 open for new changes can we please apply first 4 patches?

The following changes since commit 866d2854139e0b00063dde06bc3a34d635ae2fc8:

  build-appliance-image: Update to  head revision (2014-04-24 17:54:58 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/tune
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/tune

Andrei Gherzan (1):
  tune-cortexm3.inc: Cortex-M3 doesn't support ARM instructions

Martin Jansa (4):
  feature-arm-thumb.inc: Replace inner quotes with apostrophes
  feature-arm-thumb.inc, arch-armv4.inc: Add "arm" to TUNE_FEATURES
  tune-cortexr4.inc: Add thumb and arm to TUNE_FEATURES
  WIP: feature-arm-thumb.inc: respect ARM_INSTRUCTION_SET when adding
    thumb suffix

 meta/conf/machine/include/arm/arch-armv4.inc       |  3 +-
 meta/conf/machine/include/arm/arch-armv5.inc       |  2 +-
 meta/conf/machine/include/arm/arch-armv6.inc       |  2 +-
 meta/conf/machine/include/arm/arch-armv7a.inc      |  2 +-
 .../conf/machine/include/arm/feature-arm-thumb.inc | 36 ++++++++++++++++------
 meta/conf/machine/include/tune-cortexm3.inc        |  2 +-
 meta/conf/machine/include/tune-cortexr4.inc        |  2 +-
 7 files changed, 34 insertions(+), 15 deletions(-)

-- 
1.9.1


