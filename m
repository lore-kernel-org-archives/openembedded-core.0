Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 80F9E71AC6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 14:21:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2GEL6Q7005620
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 07:21:06 -0700 (PDT)
Received: from yow-cube1.wrs.com (128.224.56.98) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Mar 2017 07:21:05 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Mar 2017 10:20:51 -0400
Message-ID: <1489674056-21470-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/5] fix various doc pkg conflicts at do_rootfs time
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
X-List-Received-Date: Thu, 16 Mar 2017 14:21:06 -0000
Content-Type: text/plain

Not sure what changed recently to cause all these to show up, but
here we are.  There are several others outside of oe-core that I
need to also send.

 Error: Transaction check error:
   file /usr/share/man/man1/which.1 conflicts between attempted installs of debianutils-doc-4.8.1-r0.core2_64 and which-doc-2.21-r3.core2_64
   file /usr/share/man/man1/dnsdomainname.1 conflicts between attempted installs of inetutils-doc-1.9.4-r0.core2_64 and net-tools-doc-1.60+26-r0.core2_64
   file /usr/share/man/man8/syslogd.8 conflicts between attempted installs of inetutils-doc-1.9.4-r0.core2_64 and sysklogd-doc-1.5.1-r0.core2_64
   file /usr/share/info/bfd.info conflicts between attempted installs of gdb-doc-7.12.1-r0.core2_64 and binutils-doc-2.28-r0.core2_64
   file /usr/share/man/man1/eject.1 conflicts between attempted installs of util-linux-doc-2.29.1-r0.core2_64 and eject-doc-2.1.5-r1.core2_64
   file /usr/share/man/man1/logger.1 conflicts between attempted installs of util-linux-doc-2.29.1-r0.core2_64 and inetutils-doc-1.9.4-r0.core2_64

Paul Gortmaker (5):
  gdb: don't bundle bfd.info -- leave that to binutils.
  which: fix it so the manpage will respect alternatives
  util-linux: use update-alternatives for more manpages
  net-tools: use update-alternatives for more manpages
  sysklogd: use update-alternatives for more manpages

 meta/recipes-core/util-linux/util-linux.inc           | 4 +++-
 meta/recipes-devtools/gdb/gdb-common.inc              | 3 ++-
 meta/recipes-extended/net-tools/net-tools_1.60-26.bb  | 3 ++-
 meta/recipes-extended/sysklogd/sysklogd.inc           | 3 +++
 meta/recipes-extended/which/which_2.21.bb             | 3 +++
 meta/recipes-support/debianutils/debianutils_4.8.1.bb | 3 +++
 6 files changed, 16 insertions(+), 3 deletions(-)

-- 
2.7.4


