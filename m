Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id DF89B7169F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 09:02:29 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 29 Apr 2015 11:02:29 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 69C8728BA1D;
	Wed, 29 Apr 2015 11:02:29 +0200 (CEST)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Apr 2015 11:02:17 +0200
Message-ID: <1430298142-9117-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [daisy 0/5] Fix security related bugs
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
X-List-Received-Date: Wed, 29 Apr 2015 09:02:31 -0000
Content-Type: text/plain

Fixes a number of security related bugs for daisy branch.

Sona Sarmadi (5):
  Qemu: CVE-2014-2894
  libpng16: CVE-2015-0973
  coreutils: parse-datetime: CVE-2014-9471
  elfutils: CVE-2014-9447
  e2fsprogs: CVE-2015-0247

 .../parse-datetime-CVE-2014-9471.patch             | 43 ++++++++++++++++
 meta/recipes-core/coreutils/coreutils_8.22.bb      |  1 +
 .../e2fsprogs/e2fsprogs/CVE-2015-0247.patch        | 58 ++++++++++++++++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb |  1 +
 .../elfutils/elfutils/CVE-2014-9447.patch          | 50 +++++++++++++++++++
 meta/recipes-devtools/elfutils/elfutils_0.155.bb   |  1 +
 .../qemu/files/ide-CVE-2014-2894.patch             | 46 +++++++++++++++++
 meta/recipes-devtools/qemu/qemu_1.7.0.bb           |  3 +-
 .../libpng/libpng/libpng16-CVE-2015-0973.patch     | 47 ++++++++++++++++++
 meta/recipes-multimedia/libpng/libpng_1.6.8.bb     |  1 +
 10 files changed, 250 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.22/parse-datetime-CVE-2014-9471.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2015-0247.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils/CVE-2014-9447.patch
 create mode 100644 meta/recipes-devtools/qemu/files/ide-CVE-2014-2894.patch
 create mode 100644 meta/recipes-multimedia/libpng/libpng/libpng16-CVE-2015-0973.patch

-- 
1.9.1


