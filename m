Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E96BD73F5B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 06:19:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4C6JSZB019571
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 23:19:28 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.153) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Mon, 11 May 2015 23:19:27 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 May 2015 14:19:25 +0800
Message-ID: <cover.1431411478.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V3 0/2] populate_sdk_ext: two fixes
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
X-List-Received-Date: Tue, 12 May 2015 06:19:29 -0000
Content-Type: text/plain

The following changes since commit 7ffe10df73cc20d10fcd41b121074445273bd60e:

  license_class: license_create_manifest improvment (2015-05-09 22:26:02 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/populate_sdk_ext_2_fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/populate_sdk_ext_2_fixes

Chen Qi (2):
  populate_sdk_ext: install the latest buildtools-tarball
  populate_sdk_ext: consider custom configuration in local.conf

 meta/classes/populate_sdk_ext.bbclass | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

-- 
1.9.1


