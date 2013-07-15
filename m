Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D446C6A465
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 06:09:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6F69m3v014866
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Jul 2013 23:09:48 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Sun, 14 Jul 2013 23:09:47 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Jul 2013 14:09:45 +0800
Message-ID: <cover.1373868174.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH 0/1] msmtp: add GPLv2 compatiable version 1.4.12
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
X-List-Received-Date: Mon, 15 Jul 2013 06:09:48 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

We are using the GPLv2 compatiable version msmtp in our layer, I'm sending here
just to see if you are interested and take it, thanks!

--
The following changes since commit 4f5009dcbbeb27bdf5dcaebb3b457fecef410ebe:

  security_flags: Add addition recipes to the non pie list (2013-07-10 09:40:42 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/r_msmtp_0715_3
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/r_msmtp_0715_3

Jackie Huang (1):
  msmtp: add GPLv2 compatiable version 1.4.12

 .../msmtp-fixup-api-and-compiler-warning.patch     |  239 ++++++++++++++++++++
 meta/recipes-extended/msmtp/msmtp_1.4.12.bb        |   33 +++
 2 files changed, 272 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/msmtp/msmtp-1.4.12/msmtp-fixup-api-and-compiler-warning.patch
 create mode 100644 meta/recipes-extended/msmtp/msmtp_1.4.12.bb

-- 
1.7.4.1


