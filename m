Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0FB4F60797
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 10:49:33 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 12 Feb 2016 02:49:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,435,1449561600"; d="scan'208";a="651168144"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Feb 2016 02:49:34 -0800
Received: by linux.intel.com (Postfix, from userid 48)
	id 7A3D96A4006; Fri, 12 Feb 2016 03:37:25 -0800 (PST)
Received: from 10.252.9.169 (SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Fri, 12 Feb 2016 13:37:25 +0200 (EET)
Message-ID: <61992.10.252.9.169.1455277045.squirrel@linux.intel.com>
In-Reply-To: <cover.1455203165.git.bruce.ashfield@windriver.com>
References: <cover.1455203165.git.bruce.ashfield@windriver.com>
Date: Fri, 12 Feb 2016 13:37:25 +0200 (EET)
From: alexander.kanavin@linux.intel.com
To: "Bruce Ashfield" <bruce.ashfield@windriver.com>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] linux-yocto: -stable and BSP updates
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
X-List-Received-Date: Fri, 12 Feb 2016 10:49:34 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

> Here are the pending updates to the 4.1 and 4.4 kerne to integrate -stable
> updates
> and to backport the mainline galileo support patches.
> Bruce Ashfield (3):
>   linux-yocto/4.4: update to v4.4.1
>   linux-yocto/4.1: update to v4.1.17
>   linux-yocto/4.1: galileo backports and support

Shouldn't linux-libc-headers be updated to 4.4.1 at the same time?

Alex

