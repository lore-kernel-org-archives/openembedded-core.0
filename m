Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QKcOa-0003o4-Pv
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 22:22:05 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p4CKIiwS020967;
	Thu, 12 May 2011 13:18:44 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu, 12 May 2011 16:21:15 -0400
Message-Id: <cover.1305229934.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
Cc: openembedded-core@lists.openembedded.org, dvhart@linux.intel.com,
	poky@yoctoproject.org, saul.wold@intel.com
Subject: [PATCH 0/1] kern-tools: error if features are not found
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
X-List-Received-Date: Thu, 12 May 2011 20:22:05 -0000

Richard/Saul,
    
I'll repeat the patch contents here, since they explain
the change

---->---->---->---->---->---->
Fixes bug: [YOCTO #955]

Updating the SRCREV to pickup the kern-tools change:

[
    updateme: error if features are not found

    Rather than silently dropping addon features, we emit a warning
    and then exit with a failure code. The caller can then abort a
    build and not simply miss features.

    Passing --no-strict to the script disables this new functionality
    if for some reason a feature description is missing on purpose.
]
---->---->---->---->---->---->

This takes care of one thing we hit during 1.0 development,
and provides a clear message about features that are not
part of the kernel being built.

In a test of a forced invalid feature, the output is:

| WARNING: addon feature "cfg/non-exisistent" was not found
| ERROR: required features were not found. aborting

.. and the build stops.

Thanks,
    Bruce Ashfield <bruce.ashfield@windriver.com>

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: zedd/kernel
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

---


Bruce Ashfield (1):
  kern-tools: error if features are not found

 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)



