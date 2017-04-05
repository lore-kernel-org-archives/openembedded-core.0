Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 98B3871DDD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 18:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491417998; x=1522953998;
	h=from:to:cc:subject:date:message-id;
	bh=uuMWCKiKDLqVVm/rf6xpRw0LhQJkfqUH76SlumaMrE4=;
	b=ntpC8tEYtw/jtp3qj4DF6z4AX0WDCLMfjBZ9Bjdj6bJI7qRZZV7rhPXx
	cjHIUOYHQHMVrArLlOt66rvkydNywg==;
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Apr 2017 11:46:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,280,1488873600"; d="scan'208";a="85178239"
Received: from yctb01.ostc.intel.com ([10.54.69.55])
	by fmsmga006.fm.intel.com with ESMTP; 05 Apr 2017 11:46:37 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Apr 2017 11:46:34 -0700
Message-Id: <cover.1491417681.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH 0/1] package_ipk.bbclass: Replace empty lines in DESCRIPTION with '.'
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
X-List-Received-Date: Wed, 05 Apr 2017 18:46:36 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This will deal with empty lines in DESCRIPTION while creating ipk packages.

Changes in v2:

- Firts version of this patch would fail do_package_write_ipk task if found an
  empty line in DESCRIPTION, this version will replace an empty line with a '.'
  as suggested by Ross.

The following changes since commit eff56e4f0d59b1d965a68e4f009b7f07717b7edd:

  bitbake: bitbake-user-manual: Fixed special character in -D output (2017-04-03 22:32:02 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/bug10677v2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug10677v2

Mariano Lopez (1):
  package_ipk.bbclass: Replace empty lines in DESCRIPTION with '.'

 meta/classes/package_ipk.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
2.10.2


