Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1T9S1M-0008Or-C7
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 04:40:45 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q862SJQR007465
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Sep 2012 19:28:19 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Wed, 5 Sep 2012 19:28:19 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Thu, 6 Sep 2012 10:28:19 +0800
Message-ID: <bf48698a64cdaac1a880d07de0c164715a7e2ee8.1346836639.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1346836639.git.kai.kang@windriver.com>
References: <cover.1346836639.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 3/9] perl: package modules Pod-Html and Tie-Hash-NamedCapture
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
X-List-Received-Date: Thu, 06 Sep 2012 02:40:45 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Package modules Pod-Html and Tie-Hash-NamedCapture.

Without module Tie::Hash::NameCapture.pm, call "use English;" will fail.

Module Pod::Html is required by LSB perl test 4.1 case
all/tst_perlModPresent.pl 1.

[Yocto #3031]

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-devtools/perl/perl-5.14.2/config.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl-5.14.2/config.sh b/meta/recipe=
s-devtools/perl/perl-5.14.2/config.sh
index 75dc2d0..ed946d3 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/config.sh
+++ b/meta/recipes-devtools/perl/perl-5.14.2/config.sh
@@ -846,7 +846,7 @@ netdb_net_type=3D'in_addr_t'
 nm=3D'nm'
 nm_opt=3D''
 nm_so_opt=3D'--dynamic'
-nonxs_ext=3D'Archive/Extract Archive/Tar Attribute/Handlers AutoLoader B/D=
ebug B/Deparse B/Lint CGI CPAN CPANPLUS CPANPLUS/Dist/Build Class/ISA Devel=
/SelfStubber Digest Errno ExtUtils/CBuilder ExtUtils/Command ExtUtils/Const=
ant ExtUtils/Install ExtUtils/MakeMaker ExtUtils/Manifest ExtUtils/ParseXS =
File/Fetch File/Path File/Temp FileCache Filter/Simple Getopt/Long I18N/Lan=
gTags IO/Compress IO/Zlib IPC/Cmd IPC/Open2 IPC/Open3 Locale/Codes Locale/M=
aketext Locale/Maketext/Simple Log/Message Log/Message/Simple Math/BigInt M=
ath/BigRat Math/Complex Memoize Module/Build Module/CoreList Module/Load Mo=
dule/Load/Conditional Module/Loaded Module/Pluggable NEXT Net/Ping Object/A=
ccessor Package/Constants Params/Check Parse/CPAN/Meta PerlIO/via/QuotedPri=
nt Pod/Escapes Pod/LaTeX Pod/Parser Pod/Perldoc Pod/Plainer Pod/Simple Safe=
 SelfLoader Shell Switch Term/ANSIColor Term/Cap Term/UI Test Test/Harness =
Test/Simple Text/Balanced Text/ParseWords Text/Tabs Thread/Queue Thread/Sem=
aphore Tie/File Tie/Memoize Tie/RefHash Time/Local Unicode/Collate XSLoader=
 autodie autouse base bignum constant encoding/warnings if lib libnet paren=
t podlators'
+nonxs_ext=3D'Archive/Extract Archive/Tar Attribute/Handlers AutoLoader B/D=
ebug B/Deparse B/Lint CGI CPAN CPANPLUS CPANPLUS/Dist/Build Class/ISA Devel=
/SelfStubber Digest Errno ExtUtils/CBuilder ExtUtils/Command ExtUtils/Const=
ant ExtUtils/Install ExtUtils/MakeMaker ExtUtils/Manifest ExtUtils/ParseXS =
File/Fetch File/Path File/Temp FileCache Filter/Simple Getopt/Long I18N/Lan=
gTags IO/Compress IO/Zlib IPC/Cmd IPC/Open2 IPC/Open3 Locale/Codes Locale/M=
aketext Locale/Maketext/Simple Log/Message Log/Message/Simple Math/BigInt M=
ath/BigRat Math/Complex Memoize Module/Build Module/CoreList Module/Load Mo=
dule/Load/Conditional Module/Loaded Module/Pluggable NEXT Net/Ping Object/A=
ccessor Package/Constants Params/Check Parse/CPAN/Meta PerlIO/via/QuotedPri=
nt Pod/Escapes Pod/Html Pod/LaTeX Pod/Parser Pod/Perldoc Pod/Plainer Pod/Si=
mple Safe SelfLoader Shell Switch Term/ANSIColor Term/Cap Term/UI Test Test=
/Harness Test/Simple Text/Balanced Text/ParseWords Text/Tabs Thread/Queue T=
hread/Semaphore Tie/File Tie/Hash/NamedCapture Tie/Memoize Tie/RefHash Time=
/Local Unicode/Collate XSLoader autodie autouse base bignum constant encodi=
ng/warnings if lib libnet parent podlators'
 nroff=3D'nroff'
 nvEUformat=3D'"E"'
 nvFUformat=3D'"F"'
--=20
1.7.5.4



