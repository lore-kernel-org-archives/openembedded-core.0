Return-Path: <Paul_Woegerer@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 7A5996BCA4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2013 12:51:37 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1VHCYc-0002xz-NL from Paul_Woegerer@mentor.com ;
	Wed, 04 Sep 2013 05:51:38 -0700
Received: from SVR-IES-FEM-02.mgc.mentorg.com ([137.202.0.106]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 4 Sep 2013 05:51:38 -0700
Received: from atv-pwoegere-l3.atv.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-02.mgc.mentorg.com (137.202.0.106) with Microsoft SMTP
	Server id 14.2.247.3; Wed, 4 Sep 2013 13:51:36 +0100
From: "Woegerer, Paul" <Paul_Woegerer@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Sep 2013 14:51:36 +0200
Message-ID: <9990671.OfVBjYJR7C@atv-pwoegere-l3.atv.mentorg.com>
Organization: Mentor Graphics, Embedded Software Division
User-Agent: KMail/4.11 (Linux/3.10.10-25.g8038aea-desktop; KDE/4.11.0; x86_64; ;
	)
MIME-Version: 1.0
X-OriginalArrivalTime: 04 Sep 2013 12:51:38.0553 (UTC)
	FILETIME=[7EE10A90:01CEA96D]
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 0/3] lttng: update to lttng 2.3.0
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
X-List-Received-Date: Wed, 04 Sep 2013 12:51:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Since lttng 2.3.0 (Dominus Vobiscum) was released today I have updated the
respective recipes.

Tested kernel and userspace tracing with TARGET qemux86 as described by:
http://www.yoctoproject.org/docs/latest/profile-manual/profile-manual.html#lttng-linux-trace-toolkit-next-generation

Noteworthy changes:
http://lttng.org/lttng-toolchain-230-out

Paul Woegerer (3):
  lttng-ust: Update to version 2.3.0
  lttng-tools: Update to version 2.3.0
  lttng-modules: Update to version 2.3.0

 meta/recipes-kernel/lttng/lttng-modules_git.bb |  4 ++--
 meta/recipes-kernel/lttng/lttng-tools_2.2.3.bb | 31 --------------------------
 meta/recipes-kernel/lttng/lttng-tools_2.3.0.bb | 31 ++++++++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-ust_2.2.1.bb   | 31 --------------------------
 meta/recipes-kernel/lttng/lttng-ust_2.3.0.bb   | 31 ++++++++++++++++++++++++++
 5 files changed, 64 insertions(+), 64 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools_2.2.3.bb
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools_2.3.0.bb
 delete mode 100644 meta/recipes-kernel/lttng/lttng-ust_2.2.1.bb
 create mode 100644 meta/recipes-kernel/lttng/lttng-ust_2.3.0.bb

-- 
1.8.4



