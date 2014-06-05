Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B22C96A87C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jun 2014 08:44:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s558i7tM009480
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Jun 2014 01:44:07 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 5 Jun 2014 01:44:06 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Jun 2014 16:44:03 +0800
Message-ID: <cover.1401957639.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/2] oprofile: Add PTEST and Determine the root home directory dynamically
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
X-List-Received-Date: Thu, 05 Jun 2014 08:44:10 -0000
Content-Type: text/plain

root@qemux86:/usr/lib/oprofile/ptest# ./run-ptest 
PASS: libdb/tests db_test
PASS: libop/tests alloc_counter_tests
PASS: libop/tests cpu_type_tests
PASS: libop/tests load_events_files_tests
PASS: libop/tests mangle_tests
PASS: libop/tests parse_event_tests
PASS: libop/tests utf8_checker.sh
PASS: libregex/tests java_test
PASS: libregex/tests regex_test
PASS: libutil++/tests cached_value_tests
PASS: libutil++/tests comma_list_tests
PASS: libutil++/tests file_manip_tests
PASS: libutil++/tests glob_filter_tests
PASS: libutil++/tests path_filter_tests
PASS: libutil++/tests string_filter_tests
PASS: libutil++/tests string_manip_tests
PASS: libutil++/tests utility_tests
PASS: libutil/tests file_tests
PASS: libutil/tests string_tests

The following changes since commit e7114046be6e71fb326477dc882adb814ef6a751:

  busybox: fix meta-yocto's bbappend's FILESEXTRAPATH (2014-06-03 17:53:13 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/oprofile
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/oprofile

Chong Lu (2):
  oprofile: Add PTEST regression testing to oprofile
  oprofile: Determine the root home directory dynamically

 meta/recipes-kernel/oprofile/oprofile.inc          |  34 ++++++-
 .../oprofile/oprofile-cross-compile-tests.patch    |  98 ++++++++++++++++++
 .../{oprofile-root.patch => root-home-dir.patch}   | 111 +++++++++++----------
 meta/recipes-kernel/oprofile/oprofile/run-ptest    |  18 ++++
 4 files changed, 205 insertions(+), 56 deletions(-)
 create mode 100644 meta/recipes-kernel/oprofile/oprofile/oprofile-cross-compile-tests.patch
 rename meta/recipes-kernel/oprofile/oprofile/{oprofile-root.patch => root-home-dir.patch} (43%)
 create mode 100644 meta/recipes-kernel/oprofile/oprofile/run-ptest

-- 
1.8.1.2


