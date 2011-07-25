Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1QlGcJ-0007Js-8x
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 10:34:23 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6P8UAbc003230
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2011 01:30:10 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 25 Jul 2011 01:30:09 -0700
Message-ID: <cover.1311574519.git.xiaofeng.yan@windriver.com>
Old-Date: Mon, 25 Jul 2011 14:15:19 +0800
Date: Mon, 25 Jul 2011 16:23:27 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 0/3] Adding pam supporting
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
X-List-Received-Date: Mon, 25 Jul 2011 08:34:23 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Hi Saul,

I modified my patches according to your suggestion.
- Using spaces instead of tab
- The patches can work only when pam is enabled
- Using OE-Core instead of poky


Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/pam
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/pam

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (3):
  openssh: Support PAM
  polkit: Support pam
  dropbear: Support pam

 .../openssh/openssh-5.8p2/sshd                     |   10 +++
 meta/recipes-connectivity/openssh/openssh_5.8p2.bb |   77 +++++++++++---------
 meta/recipes-core/dropbear/dropbear.inc            |   78 +++++++++++---------
 .../dropbear/dropbear/dropbear-enable-pam.patch    |   22 ++++++
 meta/recipes-core/dropbear/dropbear_0.52.bb        |    2 +-
 .../polkit/polkit-0.101/polkit-1_pam.patch         |   23 ++++++
 meta/recipes-extended/polkit/polkit_0.101.bb       |    7 +-
 7 files changed, 146 insertions(+), 73 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh-5.8p2/sshd
 create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear-enable-pam.patch
 create mode 100644 meta/recipes-extended/polkit/polkit-0.101/polkit-1_pam.patch



