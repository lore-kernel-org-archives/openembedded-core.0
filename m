Return-Path: <spopovyc@cisco.com>
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
	by mail.openembedded.org (Postfix) with ESMTP id 56F4977B1A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 19:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1245; q=dns/txt; s=iport;
	t=1490729167; x=1491938767;
	h=from:to:cc:subject:date:message-id:in-reply-to;
	bh=iqaYbn2K8L/qnWqYDNSCPH72aZFyu/1VBh06E7AvBHA=;
	b=HAkCNewkMW2s63wcQCpfMMe/b2so7cZ+SGjRpE3RxDWc3W2Pgyb1DfFs
	OolzR0aKlR+pfnH5B3d0BF9NnyX7oI+027OcxTlME1SHwrPvcGfqNcGwS
	pF56lJcnC1AFx1OaRurnYL5OLzrn/BSWcEJSNIjPwbVQfgOApDwbNqG15 k=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0DyAAAtuNpY/5xdJa1dGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBBwEBAQEBg1RhgQuNcaUOgg+CDiaFfAKDJD8YAQIBAQEBAQEBayiFHHmBOBm?=
	=?us-ascii?q?Jeg2vbopOAQEBAQYCJhOGO4oPhRkFlhCGUIZ8i1OBfIUqiFOBOpNqHzg+RjofF?=
	=?us-ascii?q?YVPgUpANYlSAQEB?=
X-IronPort-AV: E=Sophos;i="5.36,237,1486425600"; d="scan'208";a="404303653"
Received: from rcdn-core-5.cisco.com ([173.37.93.156])
	by alln-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Mar 2017 19:26:05 +0000
Received: from sjc-ads-6963.cisco.com (sjc-ads-6963.cisco.com [10.30.218.83])
	by rcdn-core-5.cisco.com (8.14.5/8.14.5) with ESMTP id v2SJQ46X032130
	(version=TLSv1/SSLv3 cipher=AES128-SHA256 bits=128 verify=NO);
	Tue, 28 Mar 2017 19:26:05 GMT
From: Serhii Popovych <spopovyc@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 19:25:53 +0000
Message-Id: <cover.1490728921.git.spopovyc@cisco.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20170328190227.6649.67586@do.openembedded.org>
X-Auto-Response-Suppress: DR, OOF, AutoReply
Cc: XE-Linux <xe-linux-external@cisco.com>
Subject: [PATCH v2 0/2] automake/autoconf: avoid path to perl interpreter hardcoding
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
X-List-Received-Date: Tue, 28 Mar 2017 19:26:06 -0000

Hi,

In this small series I would like to address build host perl
interpreter hardcoding in shebang lines of various
automake/autoconf scripts.

This allows to use newer version of perl interpreter from
some toolchain (e.g. devtoolset from SCL on RHEL6) when
build host version is quite old to be used with automake/autoconf.

Please review.

Thanks.

Cc: XE-Linux <xe-linux-external@cisco.com>
Serhii Popovych (2):
  autoconf: Adjust shebang lines to remove interpreter path hardcode
  automake: Adjust shebang lines to remove interpreter path hardcode

 meta/recipes-devtools/autoconf/autoconf.inc        |   7 +-
 ...tion-in-shebangs-with-modern-use-warnings.patch | 120 +++++++++++++++++++++
 meta/recipes-devtools/autoconf/autoconf_2.69.bb    |   1 +
 ...tion-in-shebangs-with-modern-use-warnings.patch |  99 +++++++++++++++++
 meta/recipes-devtools/automake/automake_1.15.bb    |  13 ++-
 5 files changed, 236 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/autoconf-replace-w-option-in-shebangs-with-modern-use-warnings.patch
 create mode 100644 meta/recipes-devtools/automake/automake/automake-replace-w-option-in-shebangs-with-modern-use-warnings.patch

-- 
2.7.4


