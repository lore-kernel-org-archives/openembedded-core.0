Return-Path: <spopovyc@cisco.com>
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
	by mail.openembedded.org (Postfix) with ESMTP id 9EE8177D3A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 11:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1040; q=dns/txt; s=iport;
	t=1490960822; x=1492170422;
	h=from:to:cc:subject:date:message-id:in-reply-to;
	bh=tHt8dqWKX5I/S0/RGE/WZuYCHrC976+qHBJWesR5mXc=;
	b=B7z7hKJVQL6hF636U/+b53jGXEbvsAqVZ+MjNbvLnVjC76wyFKO8+1xy
	05oeNA4ZyW19wHxLmrhERGiZFbMqIvwgil4wjeYYMTsaunTkg5MLL19fM
	tdku6Kiph63SYUbnm0BKEpw4A6ooZPzbPBnTvqiKoEtvj9qbYHIv0jQ28 Q=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0DIAQD1QN5Y/4YNJK1dGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBBwEBAQEBg1RhgQuLZYIPpReCD4IOJoV8AoNGPxgBAgEBAQEBAQFrKIUceYE?=
	=?us-ascii?q?4GYoADa94il0BAQEBBgImE4Y7ig+FGQWWGIZShn2LU4F9hSyIV4E6k3EfOD5HO?=
	=?us-ascii?q?yAVhVCBSkA1iVsBAQE?=
X-IronPort-AV: E=Sophos;i="5.36,251,1486425600"; d="scan'208";a="401751789"
Received: from alln-core-12.cisco.com ([173.36.13.134])
	by alln-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
	31 Mar 2017 11:47:01 +0000
Received: from sjc-ads-6963.cisco.com (sjc-ads-6963.cisco.com [10.30.218.83])
	by alln-core-12.cisco.com (8.14.5/8.14.5) with ESMTP id
	v2VBl0g3018193
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Fri, 31 Mar 2017 11:47:01 GMT
From: Serhii Popovych <spopovyc@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Mar 2017 11:46:56 +0000
Message-Id: <cover.1490894407.git.spopovyc@cisco.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1490892244.13980.368.camel@linuxfoundation.org>
X-Auto-Response-Suppress: DR, OOF, AutoReply
Cc: XE-Linux <xe-linux-external@cisco.com>
Subject: [PATCH v3 0/2] automake/autoconf: avoid path to perl interpreter hardcoding
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
X-List-Received-Date: Fri, 31 Mar 2017 11:47:02 -0000

Hi,

This is updated series of changes to autoconf/automake
where I address all questions from previous review session.

Please review again.

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
2.5.0


