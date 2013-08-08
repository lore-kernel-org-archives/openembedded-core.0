Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 46F676B0AC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 09:01:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7891tui015248
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Aug 2013 02:01:55 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 8 Aug 2013 02:01:54 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Aug 2013 17:01:50 +0800
Message-ID: <cover.1375952210.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/2] add perl database support packages
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
X-List-Received-Date: Thu, 08 Aug 2013 09:01:54 -0000
Content-Type: text/plain

In oe-core, only SQLite is supported, so we add perl-DBI and perl-DBD-SQLite.

Test Case:

1) vim local.conf:
...
IMAGE_INSTALL_append = " libdbm-sqlite-perl"
PERL_DBM_TEST = "1"
...
2) build core-image-sato and boot the target

3) run "sqlite-perl-test.pl" in target
...
root@qemuarm:~# sqlite-perl-test.pl 
Connect to SQLite's in-memory database
Create table tbl1(name varchar(10), id smallint)
Insert into tbl1 values('yocto',10)
Insert into tbl1 values('windriver', 20)
Select * from tbl1
-----------------------------------
yocto: 10
windriver: 20

Update tbl1 set name = 'oe-core' where id = 10
Delete from tbl1 where id = 20
Select * from tbl1
-----------------------------------
oe-core: 10

Test Success
...

//Hongxu

The following changes since commit 9de0ad47462c13ac4a2d73e12e92be6c1b4e0415:

  genericx86: ship all the driver firmware by default (2013-07-31 07:00:00 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/perl-dbi
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/perl-dbi

Hongxu Jia (2):
  libdbi-perl: add version 1.628
  libdbm-sqlite-perl: add version 1.40

 .../perl/files/sqlite-perl-test.pl                 | 69 ++++++++++++++++++++++
 meta/recipes-extended/perl/libdbi-perl_1.628.bb    | 27 +++++++++
 .../perl/libdbm-sqlite-perl_1.40.bb                | 40 +++++++++++++
 3 files changed, 136 insertions(+)
 create mode 100755 meta/recipes-extended/perl/files/sqlite-perl-test.pl
 create mode 100644 meta/recipes-extended/perl/libdbi-perl_1.628.bb
 create mode 100644 meta/recipes-extended/perl/libdbm-sqlite-perl_1.40.bb

-- 
1.8.1.2


