Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Sen.Zhang@windriver.com>) id 1Sr2Ph-0001Ph-C5
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 09:41:45 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6H7UOjb015639
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 00:30:25 -0700 (PDT)
Received: from jesse-wrs-desktop.corp.ad.wrs.com (128.224.162.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 17 Jul 2012 00:30:24 -0700
From: Jesse Zhang <sen.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Jul 2012 15:28:56 +0800
Message-ID: <1342510138-21888-1-git-send-email-sen.zhang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/2] grub: two backported patch for bug 2777
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
X-List-Received-Date: Tue, 17 Jul 2012 07:41:45 -0000
Content-Type: text/plain

Hi,

Here are two backported patch from upstream for grub.

Fixed two errors:

    # grub-mkconfig 
    /usr/sbin/grub-mkconfig: line 98: /usr/lib/grub/grub-mkconfig_lib: No such file or directory

    # grub-mkconfig 
    /usr/sbin/grub-probe: error: cannot stat `/dev/root'.

The first patch is not exactly the same as upstream, since the upstream commit
contains a lot of trivial aesthetic edits.

The second patch is taken from debian instead of directly from upstream, since
the code base has changed.

Jesse Zhang (2):
  grub: fix grub-mkconfig_lib install dir
  grub: fix error stating the root device

 .../files/grub-1.99_fix_for_automake_1.11.2.patch  |  203 +++++++++++++++-----
 .../grub/grub-1.99/grub-1.99-lazy_stat.patch       |   64 ++++++
 meta/recipes-bsp/grub/grub_1.99.bb                 |    3 +-
 3 files changed, 217 insertions(+), 53 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/grub-1.99/grub-1.99-lazy_stat.patch

-- 
1.7.7



