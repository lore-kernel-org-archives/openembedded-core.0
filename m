Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id EEBC36B89A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Apr 2019 11:59:19 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id p6so9165987pgh.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2019 04:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=bgKajX2yurhIpDBQuGx5tTg5Wj0KKNyRNaChVkMANr0=;
	b=lo4SEEzcG95XvzQtBXMxlyFCGPAcm9mKqaiC2yIR1lOgtxA2U1kzlFKjU/c+ZGWKTP
	yZIbgcMBHKJrnIkJQH+522VvY4ZZ6wfIX7RbS3DZ571bDA63DprbBzko/qzo5cOtLsQ4
	8UgJbdFf7o8rZVlYW6154EjG5PI8MdVyVqtWS8ZTe++EVZsap2pLHlAsGvm8kbTBhza3
	hKxbMwlM8UraiF1vKGVFUn2TBCdQqOA8cMTjMhAjc6FkY0RZcqZbx7I2u5zfDqxFawF0
	ac60ZnVEry/TdfwABffGhS2TLQa+dcRNcUxXmaxQMPb6RFkxeYvYi5EiV8j9jvNxar83
	rqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=bgKajX2yurhIpDBQuGx5tTg5Wj0KKNyRNaChVkMANr0=;
	b=AODUqqtGQ3G0697M8lWAfU8aE0iSXmvUE+H5BebK8xebsnORU5M56x8BW24hwOWQJW
	My7mWa2WYg6DxyDtjcAi/LPKu2yWyydM3bskS+i2qHvrxENOXVk8RDrgXbPoMu00da/u
	5GsxQbcxA7lHrwOzUROAGjjsaJN6UDQPOfU/K9xpArFvLkTwHqiibkdPn2oiSCPIE+rm
	0DNvZKX6OgLOLPlQE8WcBzIbIlQAezsx8eUN3RVX6OW64iQrPhhLsVk463yi0zWWA2mk
	LtBCTD8X8Kwk6C3b2OgcciaTSXpvgX2GHAYNjrVWQWIjp05JW9tvRERmVSApDLMNN2Js
	bZXg==
X-Gm-Message-State: APjAAAWhIJMwV38LQMhGq5ldS81gmUqOeyN72eUlbpTxr1CANRYIRR6h
	Ag04PEcAlCtCHvzZ+CtgeyAt9gjz
X-Google-Smtp-Source: APXvYqxri8JRYAdVg3krmds39CtigbZZbcZyrRAb5Z2pYm6neie9pApRP3E26r1x7NmIhFTE6pFv1Q==
X-Received: by 2002:a65:4183:: with SMTP id a3mr35101880pgq.121.1554811160734; 
	Tue, 09 Apr 2019 04:59:20 -0700 (PDT)
Received: from localhost.localdomain ([116.212.180.67])
	by smtp.gmail.com with ESMTPSA id
	f2sm23773119pgc.30.2019.04.09.04.59.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Apr 2019 04:59:20 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Apr 2019 17:28:58 +0530
Message-Id: <cover.1554811027.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 00/16] Pull request for thud-next
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
X-List-Received-Date: Tue, 09 Apr 2019 11:59:20 -0000

please concider these changes for thud.

The following changes since commit 45032e30be70503faeee468159b216031b729309:

  build-appliance-image: Update to thud head revision (2019-03-27 23:22:49 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/thud-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/thud-next

Armin Kuster (1):
  Revert "boost: update to 1.69.0"

Chen Qi (1):
  pkgdata.py: avoid target-sdk-dummy-provides to mess things up

Mazliana (1):
  oeqa/manual/bsp-hw.json: add non-IA tests

Richard Purdie (2):
  resulttool: Allow store to work on single files
  resulttool: Allow extraction of ptest data

Sudhir Sharma (1):
  oeqa/manual: Add manual runtime 'compliance' testcases to json

Yeoh Ee Peng (6):
  oeqa/manual/toaster: transfer manual toaster test cases to oeqa
  oeqa/manual/toaster: updated test id naming
  resulttool/manualexecution: Standardize input check
  resulttool/manualexecution: Enable display full steps without press
    enter
  resulttool/manualexecution: Fixed step sorted by integer
  resulttool/manualexecution: Refactor and simplify codebase

sangeeta jain (4):
  oeqa/manual/sdk.json: Updated toolchain tarball to core-image-sato
  oeqa/manual/bsp-hw.json: test id updated and obsolete test cases
    removed
  oeqa/manual/compliance-test.json: test id updated and missing test
    cases added
  oeqa/manual/kernel-dev.json: test id updated

 meta/lib/oeqa/manual/bsp-hw.json                   |  264 +-
 meta/lib/oeqa/manual/compliance-test.json          |  194 ++
 meta/lib/oeqa/manual/kernel-dev.json               |   36 +-
 meta/lib/oeqa/manual/sdk.json                      |   14 +-
 meta/lib/oeqa/manual/toaster-managed-mode.json     | 2572 ++++++++++++++++++++
 meta/lib/oeqa/manual/toaster-unmanaged-mode.json   | 1170 +++++++++
 meta/lib/oeqa/selftest/cases/pkgdata.py            |    1 +
 ...bjam-native_1.69.0.bb => bjam-native_1.68.0.bb} |    0
 .../boost/{boost-1.69.0.inc => boost-1.68.0.inc}   |    4 +-
 meta/recipes-support/boost/boost.inc               |    1 +
 ...-arch-instruction-set-flags-we-do-that-o.patch} |   23 +-
 ...ucibility-add-file-directive-to-assembler.patch |  243 ++
 .../boost/{boost_1.69.0.bb => boost_1.68.0.bb}     |    6 +-
 scripts/lib/resulttool/manualexecution.py          |   61 +-
 scripts/lib/resulttool/resultutils.py              |   39 +-
 scripts/lib/resulttool/store.py                    |   23 +-
 16 files changed, 4467 insertions(+), 184 deletions(-)
 create mode 100644 meta/lib/oeqa/manual/compliance-test.json
 create mode 100644 meta/lib/oeqa/manual/toaster-managed-mode.json
 create mode 100644 meta/lib/oeqa/manual/toaster-unmanaged-mode.json
 rename meta/recipes-support/boost/{bjam-native_1.69.0.bb => bjam-native_1.68.0.bb} (100%)
 rename meta/recipes-support/boost/{boost-1.69.0.inc => boost-1.68.0.inc} (85%)
 rename meta/recipes-support/boost/boost/{0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch => 0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch} (93%)
 create mode 100644 meta/recipes-support/boost/boost/reproducibility-add-file-directive-to-assembler.patch
 rename meta/recipes-support/boost/{boost_1.69.0.bb => boost_1.68.0.bb} (56%)

-- 
2.7.4


