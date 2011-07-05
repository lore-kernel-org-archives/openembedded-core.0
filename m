Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1Qe1K4-000327-1R
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 10:49:36 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p658jjda014939
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jul 2011 01:45:45 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 5 Jul 2011 01:45:44 -0700
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Jul 2011 16:40:37 +0800
Message-ID: <cover.1309785892.git.xiaofeng.yan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.28]
Subject: [PATCH 0/1] libQtOpenGL:Add libQtOpenGL to an lsb image
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Jul 2011 08:49:36 -0000
Content-Type: text/plain

Hi Saul,

I make "opengl" as a ditro-feature for installing libQtOpenGL to image.


Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/opengl
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/opengl

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (1):
  libQtOpenGL:Add libQtOpenGL to an lsb image

 meta/recipes-extended/tasks/task-core-lsb.bb |   18 +-----------------
 meta/recipes-qt/qt4/qt4-x11-free.inc         |    2 +-
 2 files changed, 2 insertions(+), 18 deletions(-)



