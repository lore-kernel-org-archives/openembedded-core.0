Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1TvpGJ-0003iH-3g
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 14:12:28 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0HCuhgI006570
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2013 04:56:43 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.131) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 17 Jan 2013 04:56:42 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Jan 2013 20:56:36 +0800
Message-ID: <cover.1358427029.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH V2 0/4]fix support postrm/prerm at image creation time
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
X-List-Received-Date: Thu, 17 Jan 2013 13:12:43 -0000
Content-Type: text/plain

There are defects to support prerm/postrm at image creation time.
Change with V1:
  1) gtk-icon-cache.bbclass: install hook instead of calling
     gtk-update-icon-cache directly.
  2) libnss-mdns: delete test $D, directly use $D/etc/nsswitch.conf.
  3) gtk-immodules-cache.bbclass: postrm use the same logic as the
     postinst.

[YOCTO #3633] is about 1) gtk-icon-cache.bbclass

The following changes since commit 9f263a60e3521b800121a6f527a7b30dc9b62432:

  oprofile: add AArch64 support (2013-01-16 16:10:39 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-postrm
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-postrm

Hongxu Jia (4):
  gtk-icon-cache.bbclass:fix support postrm at image creation time
  update-rc.d:fix support postrm at image creation time
  libnss-mdns:fix support prerm at image creation time
  gtk-immodules-cache.bbclass:fix support postrm at image creation time

 meta/classes/gtk-icon-cache.bbclass                  |   18 ++++++++++++++++++
 meta/classes/gtk-immodules-cache.bbclass             |   13 ++++++++++++-
 meta/classes/update-rc.d.bbclass                     |    6 +++++-
 .../libnss-mdns/libnss-mdns_0.10.bb                  |    4 ++--
 4 files changed, 37 insertions(+), 4 deletions(-)

-- 
1.7.10.4



