Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1UKOQA-0004ya-BY
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 08:35:53 +0100
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2Q7Ioxf028051
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 00:18:50 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 26 Mar 2013 00:18:50 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Mar 2013 15:18:48 +0800
Message-ID: <cover.1364281933.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 0/1] xserver-nodm: change start runlevel from 2 5 to 2 3 4 5
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
X-List-Received-Date: Tue, 26 Mar 2013 07:36:02 -0000
X-List-Received-Date: Tue, 26 Mar 2013 07:36:02 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The following changes since commit 3c5f4d54d01887a117bf659fc9af6b2b892c2b08:

  separatebuilddir.inc: mxsldr should never have been added to this list, remove (2013-03-24 14:03:19 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/xserver-nodm
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/xserver-nodm

Chen Qi (1):
  xserver-nodm: change start runlevel from 2 5 to 2 3 4 5

 .../x11-common/xserver-nodm-init.bb                |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.9.5



