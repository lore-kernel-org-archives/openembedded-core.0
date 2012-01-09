Received: from smtp209.alice.it ([82.57.200.105])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RkO6X-0006oC-Mc
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jan 2012 23:54:13 +0100
Received: from mizar.localdomain (87.9.229.96) by smtp209.alice.it (8.6.023.02)
	id 4EF08A6301DA75C8; Mon, 9 Jan 2012 23:46:45 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon,  9 Jan 2012 23:46:12 +0100
Message-Id: <cover.1326148886.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 0/2 v3] kexec-tools packaging
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
X-List-Received-Date: Mon, 09 Jan 2012 22:54:13 -0000

* This patchset proposes to package separately
* kexec and kdump.
* Referring to oe-core, task-core-tools has been adapted.

Andrea Adami (2):
  kexec-tools: split packaging of kexec and kdump
  task-core-tools: adapt to kexec-tools package split

 meta/recipes-core/tasks/task-core-tools.bb     |    4 ++--
 meta/recipes-kernel/kexec/kexec-tools_2.0.2.bb |    7 ++++++-
 2 files changed, 8 insertions(+), 3 deletions(-)

-- 
1.7.3.4



