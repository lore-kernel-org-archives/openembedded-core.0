Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1TsrsD-0002Vq-7m
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 10:23:20 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0997m5N012857
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Jan 2013 01:07:48 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.131) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 9 Jan 2013 01:07:48 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 Jan 2013 17:07:45 +0800
Message-ID: <cover.1357695564.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] sstate.bbclass:specify function dirs to avoid race
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
X-List-Received-Date: Wed, 09 Jan 2013 09:23:21 -0000
Content-Type: text/plain

The following changes since commit 7e1f8faad0c4b6f490c26f87acc698dd6e002b15:

  perl: Remove bashism from perl-tests.inc (2013-01-07 22:37:37 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/specify_func_dirs
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/specify_func_dirs

Hongxu Jia (1):
  sstate.bbclass:specify function dirs to avoid race

 meta/classes/sstate.bbclass |    5 +++++
 1 file changed, 5 insertions(+)

-- 
1.7.10.4



