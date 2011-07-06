Received: from stoexhub01.domain01.net ([83.145.59.142]
	helo=stoexhub02.domain01.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QeLhq-00031v-GM
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 08:35:30 +0200
Received: from localhost (193.235.91.228) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server id 8.3.137.0; Wed, 6 Jul 2011
	08:31:38 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Jul 2011 08:31:35 +0200
Message-ID: <cover.1309933834.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH v6 0/2] Linux 3.0 build support
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
X-List-Received-Date: Wed, 06 Jul 2011 06:35:30 -0000
Content-Type: text/plain


v6: All patches from v5 has been applied, apart from one. (patch 0001 in this
    series)
    - Updated the patch in question with the comments from v5. (HOTPLUG and
    PCMCIA_MANAGER related changes).
    - Added a patch to remove kernel-module-rtc-sa1100 from task-base. No
    patch supplied to add kernel-module-rtc-sa1100 to the affected
    machines. Thus, this patch can be dropped, if it risks too much.


===============

This patch series is the continuation of the series adding kernel 3.0 support
to oe-core. One patch from the original series were not applied to master by
mistake (patch 0001 in this continuation).

The second patch is to remove machine specific features from task-base, as
suggested in a comment to v5 of patch 0001. However, the rtc-module in
question, has not been added to the affected machines. 

Even if patch 0002 is not applied (as the affected machines are not fixed), I
think that patch 0001 should be applied.

Regards,
Anders


The following changes since commit f05b7ee7716d1e5cc1ba0bbab57e91c3a0569e9e:

  x-load: Update to 1.5.0 (2011-07-05 14:16:33 +0100)

are available in the git repository at:
  git://github.com/darander/oe-core kernel-3.0
  https://github.com/darander/oe-core/tree/kernel-3.0

Anders Darander (2):
  task-base: remove modutils reference.
  task-base: remove unconditional inclusion of kernel-module-rtc-sa1100

 meta/recipes-core/tasks/task-base.bb |   59 ++++++++--------------------------
 1 files changed, 14 insertions(+), 45 deletions(-)

-- 
1.7.4.1



