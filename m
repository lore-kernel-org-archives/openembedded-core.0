Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1QxzS3-0005Xj-Ai
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Aug 2011 12:52:23 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7TAlTsH007509
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2011 03:47:30 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 29 Aug 2011 03:47:29 -0700
Message-ID: <cover.1314604566.git.xiaofeng.yan@windriver.com>
Old-Date: Mon, 29 Aug 2011 15:56:06 +0800
Date: Mon, 29 Aug 2011 18:48:33 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 0/1] dropbear: Change the path to find configuration file and add s configuration file for dropbear
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
X-List-Received-Date: Mon, 29 Aug 2011 10:52:23 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

dropbear will check "/etc/pam.d/sshd" which comes from package "openssh" \
When enabling pam supporting. But if we only install dropbear \
package without package "openssh", then "dropbear" will not \
find a configuration file. The changes are as follow for fixing this bug:
- Change the path to find configuration file (/etc/pam.d/sshd --> /etc/pam.d/dropbear)
- Add configuration file "/etc/pam.d/dropbear"

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/dropbear
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/dropbear

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (1):
  dropbear: Change the path to find configuration file and add a 
    configuration file for dropbear

 meta/recipes-core/dropbear/dropbear.inc            |    6 +++++-
 meta/recipes-core/dropbear/dropbear/dropbear       |    4 ++++
 .../dropbear/dropbear-configuration-file.patch     |   18 ++++++++++++++++++
 3 files changed, 27 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear
 create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear-configuration-file.patch



