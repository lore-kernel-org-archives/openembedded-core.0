Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1UFfwS-0007ia-2F
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Mar 2013 08:17:41 +0100
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2D70vk2021226
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2013 00:00:58 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 13 Mar 2013 00:00:57 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Mar 2013 15:01:32 +0800
Message-ID: <cover.1363156578.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 0/1] rm_work.bbclass: inhibit rm_work per recipe
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
X-List-Received-Date: Wed, 13 Mar 2013 07:17:42 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The following changes since commit 365eb9b5d22208c967dcd91d8ab52faed20f04b5:

  bitbake: bitbake-layers: fix duplicated help info (2013-03-10 04:36:52 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/rm_work
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/rm_work

Chen Qi (1):
  rm_work.bbclass: inhibit rm_work per recipe

 meta/classes/rm_work.bbclass |   13 +++++++++++++
 1 file changed, 13 insertions(+)

-- 
1.7.9.5



