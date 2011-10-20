Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RGnUr-0002nx-9k
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 09:57:01 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Oct 2011 00:51:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="64982185"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.6])
	by orsmga001.jf.intel.com with ESMTP; 20 Oct 2011 00:51:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Oct 2011 00:50:43 -0700
Message-Id: <3585b21f39489fa8eccc08df3adfbd81e7df4d48.1319096633.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1319096633.git.sgw@linux.intel.com>
References: <cover.1319096633.git.sgw@linux.intel.com>
In-Reply-To: <cover.1319096633.git.sgw@linux.intel.com>
References: <cover.1319096633.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL - v2 07/26] ghostscript: renamed x86_64 to x86-64 for patch to work
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
X-List-Received-Date: Thu, 20 Oct 2011 07:57:01 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../ghostscript/{x86_64 => x86-64}/objarch.h       |    0
 .../ghostscript/{x86_64 => x86-64}/soobjarch.h     |    0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-extended/ghostscript/ghostscript/{x86_64 => x86-64}/objarch.h (100%)
 rename meta/recipes-extended/ghostscript/ghostscript/{x86_64 => x86-64}/soobjarch.h (100%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/x86_64/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/x86-64/objarch.h
similarity index 100%
rename from meta/recipes-extended/ghostscript/ghostscript/x86_64/objarch.h
rename to meta/recipes-extended/ghostscript/ghostscript/x86-64/objarch.h
diff --git a/meta/recipes-extended/ghostscript/ghostscript/x86_64/soobjarch.h b/meta/recipes-extended/ghostscript/ghostscript/x86-64/soobjarch.h
similarity index 100%
rename from meta/recipes-extended/ghostscript/ghostscript/x86_64/soobjarch.h
rename to meta/recipes-extended/ghostscript/ghostscript/x86-64/soobjarch.h
-- 
1.7.6.2



