Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0E13B607A4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 07:28:42 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 03 Aug 2016 00:28:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,465,1464678000"; d="scan'208";a="149808993"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga004.fm.intel.com with ESMTP; 03 Aug 2016 00:28:40 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2016 10:28:39 +0300
Message-Id: <1470209320-20006-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH v3] Add ${S} to do_unpack[cleandirs]
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
X-List-Received-Date: Wed, 03 Aug 2016 07:28:47 -0000

The second version of this patch broke usage of externalsrc. The resason was
that while externalsrc.bbclass mangles do_unpack[cleandirs] flag in order to
make sure that the source directory is never wiped, it was not able to cope
with the complicated Python expression used in the flag value in v2 of this
patch. Version 3 of the patch fixes the issue by moving Python code outside the
value assignment.

Markus Lehtonen (1):
  base.bbclass wipe ${S} before unpacking source

 meta/classes/base.bbclass | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

-- 
2.6.6


