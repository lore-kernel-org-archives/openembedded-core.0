Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2087660557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 13:22:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 21 Aug 2015 06:22:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,721,1432623600"; d="scan'208";a="788432908"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 21 Aug 2015 06:22:52 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id 00ACC6A4087; Fri, 21 Aug 2015 06:22:03 -0700 (PDT)
Received: from 10.252.47.114
	(SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Fri, 21 Aug 2015 16:22:03 +0300 (EEST)
Message-ID: <58077.10.252.47.114.1440163323.squirrel@linux.intel.com>
In-Reply-To: <55D70349.7080003@windriver.com>
References: <cover.1440145857.git.liezhi.yang@windriver.com>
	<74b4262e5df004800e56b273e7d7a3d64d7af9b3.1440145857.git.liezhi.yang@windriver.com>
	<CAHiDW_HqD908Y_F7i6kFNrLhD4UohnUp1FSMtF-aVnCoW=A7TQ@mail.gmail.com>
	<55D70349.7080003@windriver.com>
Date: Fri, 21 Aug 2015 16:22:03 +0300 (EEST)
From: alexander.kanavin@linux.intel.com
To: "Robert Yang" <liezhi.yang@windriver.com>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] btrfs-tools: 4.1.1 -> 4.1.2
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
X-List-Received-Date: Fri, 21 Aug 2015 13:22:53 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

>> Is there no PV change here?
>
> Thanks, I updated in the repo.
> -PV = "4.1.1+git${SRCPV}"
> +PV = "4.1.2+git${SRCPV}"

You can also rename the recipe to btrfs-tools_4.1.2.bb and remove the PV
altogether. The above form is only needed if you're taking something from
git that is not a pristine tagged release (i.e. when it is a tagged
commit+additional commits).

Alex

