Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1QlejC-0000WI-P1
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 12:19:07 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6QAEqJU003000
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 03:14:52 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 26 Jul 2011 03:14:52 -0700
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Jul 2011 18:08:02 +0800
Message-ID: <cover.1311671726.git.xiaofeng.yan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/3] Adding patches to support pam
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
X-List-Received-Date: Tue, 26 Jul 2011 10:19:07 -0000
Content-Type: text/plain

Hi Saul & Richard,

I modified my patches about how to whitespace and tab in .bb file according to your suggestion.

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/pam
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/pam

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (3):
  openssh: Support PAM
  dropbear: Support pam
  polkit: Support pam

 .../openssh/openssh-5.8p2/sshd                     |   10 ++++++++
 meta/recipes-connectivity/openssh/openssh_5.8p2.bb |   13 +++++++++-
 meta/recipes-core/dropbear/dropbear.inc            |    8 ++++++-
 .../dropbear/dropbear/dropbear-enable-pam.patch    |   22 +++++++++++++++++++
 meta/recipes-core/dropbear/dropbear_0.52.bb        |    2 +-
 .../polkit/polkit-0.101/polkit-1_pam.patch         |   23 ++++++++++++++++++++
 meta/recipes-extended/polkit/polkit_0.101.bb       |    7 ++++-
 7 files changed, 79 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh-5.8p2/sshd
 create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear-enable-pam.patch
 create mode 100644 meta/recipes-extended/polkit/polkit-0.101/polkit-1_pam.patch



