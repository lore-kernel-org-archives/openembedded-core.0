Return-Path: <spopovyc@cisco.com>
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8208E77E32
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 15:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1057; q=dns/txt; s=iport;
	t=1490975502; x=1492185102;
	h=from:to:cc:subject:date:message-id;
	bh=X61OiI9U8Q5ej+GJ3VhAel6mIJRUUTqCsNHllNpOw30=;
	b=eX1pd4572hk0Q1RR/YQU4AnMCKwtrWsVgzouaqhT3X+pO1mQYGxicYC3
	1WwBlrJFs2Anaau6Y4OvbSYrqIlcTqsZVBZYf3tlkj8gvmLj/WiA+91HX
	jmQmYfHrjIVIWxgpCpDfeLc8u4Fmvg8rjvkG7TnUYQZ+dSo5Cc0x8xWgo 4=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0DHAQB+et5Y/4oNJK1cGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBBwEBAQEBg1RhgQuLZYIPpRaCD4IOJoV8g0g/GAECAQEBAQEBAWsohhWBUYo?=
	=?us-ascii?q?ADbATilsBAQgoE4Y7ig+FGQWWGIZShn2LU4F9hSyIV4E6k3EfOD5HOyAVhVCBS?=
	=?us-ascii?q?kA1iVsBAQE?=
X-IronPort-AV: E=Sophos;i="5.36,252,1486425600"; d="scan'208";a="402798450"
Received: from alln-core-5.cisco.com ([173.36.13.138])
	by alln-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
	31 Mar 2017 15:51:35 +0000
Received: from sjc-ads-6963.cisco.com (sjc-ads-6963.cisco.com [10.30.218.83])
	by alln-core-5.cisco.com (8.14.5/8.14.5) with ESMTP id v2VFpYwe027027
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Fri, 31 Mar 2017 15:51:34 GMT
From: Serhii Popovych <spopovyc@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Mar 2017 15:51:27 +0000
Message-Id: <cover.1490973338.git.spopovyc@cisco.com>
X-Mailer: git-send-email 2.7.4
X-Auto-Response-Suppress: DR, OOF, AutoReply
Cc: XE-Linux <xe-linux-external@cisco.com>
Subject: [PATCH v5 0/2] automake/autoconf: avoid path to perl interpreter hardcoding
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
X-List-Received-Date: Fri, 31 Mar 2017 15:51:41 -0000

Hi,

This is updated series of changes to autoconf/automake
where I address all questions from previous review session.

Sorry for noise. Please review again.

Thanks.

Cc: XE-Linux <xe-linux-external@cisco.com>
Serhii Popovych (2):
  autoconf: Adjust shebang lines to remove interpreter path hardcode
  automake: Adjust shebang lines to remove interpreter path hardcode

 meta/recipes-devtools/autoconf/autoconf.inc        |   7 +-
 ...tion-in-shebangs-with-modern-use-warnings.patch | 120 +++++++++++++++++++++
 meta/recipes-devtools/autoconf/autoconf_2.69.bb    |   1 +
 ...tion-in-shebangs-with-modern-use-warnings.patch | 101 +++++++++++++++++
 meta/recipes-devtools/automake/automake_1.15.bb    |  13 ++-
 5 files changed, 238 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/autoconf-replace-w-option-in-shebangs-with-modern-use-warnings.patch
 create mode 100644 meta/recipes-devtools/automake/automake/automake-replace-w-option-in-shebangs-with-modern-use-warnings.patch

-- 
2.7.4


