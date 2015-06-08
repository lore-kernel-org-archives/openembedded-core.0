Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 47ED173E3B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jun 2015 10:25:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.01,1,1399996800"; 
   d="scan'208";a="96653355"
Received: from localhost (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Jun 2015 18:29:52 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t58AO3AJ029090
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Jun 2015 18:24:03 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 8 Jun 2015 18:25:37 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 Jun 2015 18:25:37 +0800
Message-ID: <1433759139-9297-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [PATCH v3 0/2] These patches aim to make the spdx file be compliant with the SPDX 1.2 Specification.
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
X-List-Received-Date: Mon, 08 Jun 2015 10:25:39 -0000
Content-Type: text/plain

Those patches aim to make the spdx file be compliant with the SPDX 1.2 Specification. 
If you want to use this feature,you need to do:
1. Make sure your fossology+spdx server works well.You can get spdx file with the following command.
   curl http://127.0.0.1/repo/ --noproxy 127.0.0.1 -k -F mod=spdx_license_once -F noCopyright=false 
   -F jsonOutput=false -F fullSPDXFlag=true -F file=@xxx.tar.gz -o xxx.spdx
   
2. Add the following INHERIT statement and set the SPDX_MANIFEST_DIR at the end of your conf/local.conf file found in the Build Directory.
   SPDX_MANIFEST_DIR = "/xxx/xxx/xxx"
   INHERIT += "spdx"

Lei Maohui (2):
  licenses.conf: Modified parameters for new spdx.bbclass
  spdx.bbclass: Create the spdx file which is compliant with SPDX 1.2
    Specification

 meta/classes/spdx.bbclass | 425 +++++++++++++++++-----------------------------
 meta/conf/licenses.conf   |  77 +++------
 2 files changed, 175 insertions(+), 327 deletions(-)

-- 
1.8.4.2


