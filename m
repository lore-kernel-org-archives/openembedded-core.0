Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7BCCB7169F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jan 2015 18:24:16 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id y13so12635445pdi.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jan 2015 10:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=HLEbq5ur7RCX9tqcomuLMcFGTnz83gQJgs6SCZkR5YA=;
	b=FhqyfV4ZPug3EzsYsFf+hOUTx0ingOdDKrmMOTBaxMjEF95+swZjAMiGofCc+1Ogu6
	BEmi3Us09Xb5zwb3rELk0DrMrMX7tbFyhMiatbfzzgLEL2B0ZskCpURYTOLOMuutrYNA
	w//rPCC3D2VNNEadmW65b9aKg054r/4bc32wsXJbQPe2IRfErCjbipjAlntuft12vxCD
	V/NwjWQkLCuP1vZBCWmvMB0Y3tSiuBaobQ3Ok6YavVHi1znv5J5RInt0PWW57AT1DMUu
	9IzmUxf6UZrovZ5TJehcPOBj9od0lfrY1biYNlAHDCVGDqKrTC4Vf6MqqS8QGhCXO1AR
	D87g==
X-Received: by 10.68.167.36 with SMTP id zl4mr16946513pbb.83.1420741457384;
	Thu, 08 Jan 2015 10:24:17 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id
	rl10sm5011251pbb.67.2015.01.08.10.24.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 08 Jan 2015 10:24:16 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jan 2015 11:24:08 -0700
Message-Id: <1420741450-28220-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 0/2] recipetool: add python buildsystem support
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
X-List-Received-Date: Thu, 08 Jan 2015 18:24:18 -0000

- Handles distutils & setuptools.
- Supports pulling metadata from PKG-INFO, .egg-info, & setup.py (via two
  different mechanisms).
- Doesn't handle python 3 yet.
- Optional dependencies via `extra_requires` are not currently
  handled.
- Implements scanning for dependencies by using the python ast to
  determine what modules/packages are being imported by the python
  code in question

See https://gist.github.com/kergoth/6cca6caa4e9b22a21f75 for the projects
I used to test this against, and
https://gist.github.com/kergoth/7fea9494e3cf60b382ff which is the result of
running recipetool create against every recipe that inherits distutils or
setuptools in my build environment.

https://gist.github.com/kergoth/7ad4b5102b2a5fe3a956 has my current TODO for
this feature.

Christopher Larson (2):
  recipetool: add python buildsystem support
  recipetool: add python dependency scanning support

 scripts/lib/recipetool/create_buildsys_python.py | 567 +++++++++++++++++++++++
 scripts/pythondeps                               | 250 ++++++++++
 2 files changed, 817 insertions(+)
 create mode 100644 scripts/lib/recipetool/create_buildsys_python.py
 create mode 100755 scripts/pythondeps

-- 
1.8.3.4


