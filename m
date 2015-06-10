Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 87FA973B90
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 10:09:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.01,1,1399996800"; 
   d="scan'208";a="96785858"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Jun 2015 18:13:25 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5AA7aLA019153
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 18:07:36 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 10 Jun 2015 18:09:13 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Jun 2015 18:09:11 +0800
Message-ID: <1433930954-31813-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [PATCH v4 0/3] These patches aim to make the spdx file be compliant with the SPDX 1.2 Specification.
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
X-List-Received-Date: Wed, 10 Jun 2015 10:09:14 -0000
Content-Type: text/plain

Those patches aim to make the spdx file be compliant with the SPDX 1.2 Specification.
If you want to use this feature,you need to do:
1. Make sure your fossology+spdx server works well.You can get spdx file with the following command.
   curl http://127.0.0.1/repo/ --noproxy 127.0.0.1 -k -F mod=spdx_license_once -F noCopyright=false
   -F jsonOutput=false -F fullSPDXFlag=true -F file=@xxx.tar.gz -o xxx.spdx

2. Add the following INHERIT statement and set the SPDX_MANIFEST_DIR at the end of your conf/local.conf file found in the Build Directory.
   INHERIT += "spdx"


Lei Maohui (3):
  licenses.conf: Modified parameters for new spdx.bbclass
  spdx.bbclass: Create the spdx file which is compliant      with SPDX
    1.2 Specification
  spdx: create a directory to save source code

 meta/classes/spdx.bbclass | 431 +++++++++++++++++-----------------------------
 meta/conf/licenses.conf   |  86 +++------
 2 files changed, 184 insertions(+), 333 deletions(-)

-- 
1.8.4.2


