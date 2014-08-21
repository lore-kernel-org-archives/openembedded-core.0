Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9159470EA4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 20:44:44 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id y13so14644110pdi.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 13:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=yA5CgPPcE/u4wlP/Gn4DEUUHc6J+0fqtf/s4UUd6Ru0=;
	b=hMWADXDuXUOwPWbDSJmaoW4LFqqrP+NY/MXKso2rMvDStCnGzsm/itmyv3lfyuofQS
	dI0FkAGCddNX/qie+7zr28BvwLKZs+66158KXPJbvs3YRDI8BkkyMjTTulskUc2BD282
	/tu+SD5oxBVIH8wjcPH1C0vm8iE3onsWVnjlaVoQ/I+424vhWywC51ExU7UdoHNWOsRQ
	bWre47qF2sWNLoi3ChUhV3jW0M9+WRApDdLjeTnRknBxy8iAQaUlGjj/EjD4M7CnAQzu
	X0zFRv23qFdujGXSxTr2JEMsfeL/sXn73yAxRDMBHrO7v2Qz7YzT05T38NIkAyaqFYhR
	Cq4A==
X-Received: by 10.70.95.100 with SMTP id dj4mr1214515pdb.94.1408653885756;
	Thu, 21 Aug 2014 13:44:45 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	pk15sm40192804pdb.49.2014.08.21.13.44.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Aug 2014 13:44:44 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Aug 2014 13:44:40 -0700
Message-Id: <1408653881-7021-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH]] gpm PPC64 build issue
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
X-List-Received-Date: Thu, 21 Aug 2014 20:44:52 -0000

While playing with adding qemuppc64, I found a build issue gpm.

Armin Kuster (1):
  gpm: ppc64 build issue

 meta/recipes-support/gmp/gmp/gpm-6.0.0-ppc64.patch | 25 ++++++++++++++++++++++
 meta/recipes-support/gmp/gmp_6.0.0.bb              |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-support/gmp/gmp/gpm-6.0.0-ppc64.patch

-- 
1.9.1


