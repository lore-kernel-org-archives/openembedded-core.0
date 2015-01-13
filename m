Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 987597246A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 05:44:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0D5iRNQ003248
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 12 Jan 2015 21:44:28 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 12 Jan 2015 21:44:27 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 13 Jan 2015 13:44:00 +0800
Message-ID: <cover.1421127484.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 00/10] Upgrade packages: libxml-parser-perl/elfutils/xmlto/gnupg/man-pages/dhcp/rpcbind
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
X-List-Received-Date: Tue, 13 Jan 2015 05:44:36 -0000
Content-Type: text/plain

The following changes since commit c45589a55c67bfd0bf9da5050141f4d18835e113:

  poky.conf: mark all CentOS 6/7 versions as compatible (2015-01-12 13:31:08 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/upgrade-packages-0113
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/upgrade-packages-0113

Hongxu Jia (10):
  libxml-parser-perl: upgrade to 2.43
  elfutils: upgrade to 1.161
  xmlto: upgrade to 0.0.25
  gnupg: upgrade to 2.1.1
  man-pages: upgrade to 3.76
  dhcp: upgrade to 4.3.1
  dhcp: not override site.h
  upstream_tracking.inc: update entries for bash
  rpcbind: upgrade to 0.2.2
  rpcbind: add PACKAGECONFIG for systemd

 .../conf/distro/include/upstream_tracking.inc      |   1 +
 meta/conf/distro/include/tcmode-default.inc        |   1 -
 meta/recipes-connectivity/dhcp/dhcp.inc            |   6 +-
 ...o-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch |  26 +
 .../dhcp/dhcp/fixsepbuild.patch                    | 112 ++--
 meta/recipes-connectivity/dhcp/dhcp/site.h         |  21 -
 .../dhcp/{dhcp_4.3.0.bb => dhcp_4.3.1.bb}          |   4 +-
 .../arm_backend.diff                               |   0
 .../arm_func_value.patch                           |   0
 .../arm_unwind_ret_mask.patch                      |   0
 .../fixheadercheck.patch                           |   0
 .../hppa_backend.diff                              |   0
 .../m68k_backend.diff                              |   0
 .../mips_backend.diff                              |   0
 .../mips_readelf_w.patch                           |   0
 .../non_linux.patch                                |   0
 .../redhat-portability.diff                        | 564 +++++++++++----------
 .../scanf-format.patch                             |   0
 .../testsuite-ignore-elflint.diff                  |   0
 .../{elfutils_0.160.bb => elfutils_0.161.bb}       |   4 +-
 ...ser-perl_2.41.bb => libxml-parser-perl_2.43.bb} |   4 +-
 .../xmlto-0.0.25/obsolete_automake_macros.patch    |  12 -
 ....in-drop-the-test-of-xmllint-and-xsltproc.patch |   0
 .../xmlto/{xmlto_0.0.25.bb => xmlto_0.0.26.bb}     |   5 +-
 .../{man-pages_3.75.bb => man-pages_3.76.bb}       |   4 +-
 ...bind-rpcuser-not-being-set-in-Makefile.am.patch |  34 --
 .../rpcbind/{rpcbind_0.2.1.bb => rpcbind_0.2.2.bb} |  11 +-
 .../gnupg/{gnupg_2.1.0.bb => gnupg_2.1.1.bb}       |   4 +-
 28 files changed, 416 insertions(+), 397 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/site.h
 rename meta/recipes-connectivity/dhcp/{dhcp_4.3.0.bb => dhcp_4.3.1.bb} (70%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.160 => elfutils-0.161}/arm_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.160 => elfutils-0.161}/arm_func_value.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.160 => elfutils-0.161}/arm_unwind_ret_mask.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.160 => elfutils-0.161}/fixheadercheck.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.160 => elfutils-0.161}/hppa_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.160 => elfutils-0.161}/m68k_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.160 => elfutils-0.161}/mips_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.160 => elfutils-0.161}/mips_readelf_w.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.160 => elfutils-0.161}/non_linux.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.160 => elfutils-0.161}/redhat-portability.diff (76%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.160 => elfutils-0.161}/scanf-format.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.160 => elfutils-0.161}/testsuite-ignore-elflint.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils_0.160.bb => elfutils_0.161.bb} (95%)
 rename meta/recipes-devtools/perl/{libxml-parser-perl_2.41.bb => libxml-parser-perl_2.43.bb} (88%)
 delete mode 100644 meta/recipes-devtools/xmlto/xmlto-0.0.25/obsolete_automake_macros.patch
 rename meta/recipes-devtools/xmlto/{xmlto-0.0.25 => xmlto-0.0.26}/configure.in-drop-the-test-of-xmllint-and-xsltproc.patch (100%)
 rename meta/recipes-devtools/xmlto/{xmlto_0.0.25.bb => xmlto_0.0.26.bb} (84%)
 rename meta/recipes-extended/man-pages/{man-pages_3.75.bb => man-pages_3.76.bb} (86%)
 delete mode 100644 meta/recipes-extended/rpcbind/rpcbind/0001-rpcbind-rpcuser-not-being-set-in-Makefile.am.patch
 rename meta/recipes-extended/rpcbind/{rpcbind_0.2.1.bb => rpcbind_0.2.2.bb} (83%)
 rename meta/recipes-support/gnupg/{gnupg_2.1.0.bb => gnupg_2.1.1.bb} (89%)

-- 
1.9.1


