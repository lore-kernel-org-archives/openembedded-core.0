Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 716CF745C5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 09:06:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w3K96BRb029737
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 02:06:12 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.197) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 20 Apr 2018 02:06:11 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Apr 2018 17:07:33 +0800
Message-ID: <cover.1524215181.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] Use oe_multilib_headers to avoid header file conflicts
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
X-List-Received-Date: Fri, 20 Apr 2018 09:06:11 -0000
Content-Type: text/plain

The following changes since commit 71b4ae25612d6dd3687fdd583ed0077e744899cb:

  glib-2.0/glib.inc: fix broken mingw build (2018-04-20 08:19:46 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/multilib_headers
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/multilib_headers

Chen Qi (2):
  glibc: use oe_multilib_header on bits/floatn.h
  linux-libc-headers: multilib_header asm/kvm_para.h and
    asm/bpf_perf_event.h

 meta/recipes-core/glibc/glibc-package.inc                     | 2 +-
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.9.1


