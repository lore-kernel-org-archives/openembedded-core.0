Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1TxclG-0001oH-QN
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 13:15:35 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0M9RqUW019349
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2013 01:27:52 -0800 (PST)
Received: from pek-wfan-d2.corp.ad.wrs.com (128.224.162.225) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 22 Jan 2013 01:27:52 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jan 2013 17:27:38 +0800
Message-ID: <1358846859-2005-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] bind: disable nslookup man page
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Jan 2013 12:15:40 -0000
Content-Type: text/plain

The nslookup is not shipped for now, we should disable its man page if
the binary tool is not installed.
    
[YOCTO#3754]

The following changes since commit 37e025f6f9c410005e0f1dee0767e38eaec01cbd:

  bitbake: hob: Hob should display warnings generated during parsing (2013-01-21 19:05:31 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/3754-bind
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/3754-bind

Wenzong Fan (1):
  bind: disable nslookup man page

 meta/recipes-connectivity/bind/bind_9.8.1.bb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
1.7.10.4



