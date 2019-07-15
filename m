Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6369B7C5F0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 08:23:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6F8NOiY005618
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 01:23:35 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Mon, 15 Jul 2019 01:22:53 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Jul 2019 16:35:37 +0800
Message-ID: <cover.1563179644.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/1] msmtp: use alternatives to manage /usr/lib/sendmail
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
X-List-Received-Date: Mon, 15 Jul 2019 08:23:44 -0000
Content-Type: text/plain

Changes in V2:
* Use alternatives instead fixing the postinstall. This avoid inconsistent /usr/lib/sendmail link.

The following changes since commit 80ab79168ede2786868cbd354f0950c949f73527:

  gnome-themes-standard: remove (2019-07-11 09:32:50 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/msmtp-lsb
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/msmtp-lsb

Chen Qi (1):
  msmtp: use alternatives to manage /usr/lib/sendmail

 meta/recipes-extended/msmtp/msmtp_1.8.4.bb | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

-- 
1.9.1


