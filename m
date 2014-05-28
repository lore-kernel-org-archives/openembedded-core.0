Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A5BAC6FAC7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 07:59:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4S7xfCR006718
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 28 May 2014 00:59:43 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Wed, 28 May 2014 00:59:41 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 May 2014 15:59:35 +0800
Message-ID: <cover.1401263535.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH V3 0/2] socat: upgrade to 1.7.2.4
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
X-List-Received-Date: Wed, 28 May 2014 07:59:44 -0000
Content-Type: text/plain

Change in V3:

Tweak compile.patch:
- add the explanation of 'AC_DEFINE' in the patch header;
- remove the t.c_ispeed assinged line for AC_TRY_COMPILE;
- remove the SHIFT_NAME line;

Drop fix-xxx-SHIFT-autoheader.patch, and add socat-enable-termios.patch to
instead;

Remove 'do_configure_prepend' task, use socat-enable-termios.patch to instead.

Change in V2:
- Add descriptions about what was the problem that was encountered
  while upgrading to 1.7.2.4.

//Hongxu

The following changes since commit 894df445fa71a170397c6e0b4960a89ef20a4230:

  guile: Update to 2.0.11 version (2014-05-21 19:50:21 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/socat
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/socat

Hongxu Jia (2):
  socat: upgrade to 1.7.2.4
  socat: fix supporting cross compiling

 .../recipes-connectivity/socat/socat/compile.patch | 191 +++++++++++----------
 .../socat/socat/fix-cross-compiling-failed.patch   |  34 ++++
 .../socat/socat/socat-enable-termios.patch         |  39 +++++
 .../socat/{socat_1.7.2.3.bb => socat_1.7.2.4.bb}   |  18 +-
 4 files changed, 184 insertions(+), 98 deletions(-)
 create mode 100644 meta/recipes-connectivity/socat/socat/fix-cross-compiling-failed.patch
 create mode 100644 meta/recipes-connectivity/socat/socat/socat-enable-termios.patch
 rename meta/recipes-connectivity/socat/{socat_1.7.2.3.bb => socat_1.7.2.4.bb} (63%)

-- 
1.8.1.2


