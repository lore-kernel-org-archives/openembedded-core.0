Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1T8j7w-0007kI-B1
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 04:44:32 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q842W80u022189
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Sep 2012 19:32:08 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Mon, 3 Sep 2012 19:32:08 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 4 Sep 2012 10:32:15 +0800
Message-ID: <cover.1346666634.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3 V2 ] Remove dependency libidn from wget gs and msmtp
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
X-List-Received-Date: Tue, 04 Sep 2012 02:44:32 -0000
Content-Type: text/plain

The following changes since commit 37c8597e7600385367257e8a513e003947ebef5b:

  distro-tracking: remove xserver-kdrive (2012-09-02 05:52:16 -0700)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/deps
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/deps

Kang Kai (3):
  wget: disable iri/idn support
  msmtp: disable libidn support
  ghostscript: disable libidn support

 .../ghostscript/ghostscript_9.05.bb                |    4 ++--
 meta/recipes-extended/msmtp/msmtp_1.4.24.bb        |    4 ++--
 meta/recipes-extended/wget/wget.inc                |    5 +++--
 3 files changed, 7 insertions(+), 6 deletions(-)

-- 
1.7.5.4



