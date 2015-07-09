Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2ADA06017E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 11:34:09 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 09 Jul 2015 04:34:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,439,1432623600"; d="scan'208";a="602954796"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 09 Jul 2015 04:34:11 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id A316D6A4087; Thu,  9 Jul 2015 04:33:29 -0700 (PDT)
Received: from 10.252.20.69 (SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Thu, 9 Jul 2015 14:33:29 +0300 (EEST)
Message-ID: <56502.10.252.20.69.1436441609.squirrel@linux.intel.com>
In-Reply-To: <1436426071-3790-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1436426071-3790-1-git-send-email-leimaohui@cn.fujitsu.com>
Date: Thu, 9 Jul 2015 14:33:29 +0300 (EEST)
From: alexander.kanavin@linux.intel.com
To: "Lei Maohui" <leimaohui@cn.fujitsu.com>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] parted_1.8.6.bb: add parted that not GPLv3
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
X-List-Received-Date: Thu, 09 Jul 2015 11:34:12 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

> Add parted-1.8.6 which is not GPLv3.

I have to say, I still can't support having this in oe-core. Providing
alternatives to GPLv3 software is fine, but not when the 'alternative' is
a very old, unsupported version of the same software, which inevitably
brings issues in functionality and maintenance.

But if Ross and/or Richard disagree, then I'll have to accept it.

> +Upstream-Status: Pending

"Inappropriate" is a better reason here, with clarification that the
patches are to make an old version work and upstream won't be interested
in them.

> +do_install_append() {
> +	/bin/rm -rf ${D}/${libdir}/*.la
> +	/bin/rm -rf ${D}/usr/share/info/dir
> +	/bin/rm -fr ${D}/usr/bin
> +}

What are you deleting here and why?

Alex

