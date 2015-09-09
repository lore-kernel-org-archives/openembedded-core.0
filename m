Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8B19574242
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 10:24:16 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 09 Sep 2015 03:24:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,496,1437462000"; d="scan'208";a="558203793"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Sep 2015 03:24:17 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id 2E0986A408F; Wed,  9 Sep 2015 03:23:25 -0700 (PDT)
Received: from 10.252.58.194
	(SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Wed, 9 Sep 2015 13:23:25 +0300 (EEST)
Message-ID: <64065.10.252.58.194.1441794205.squirrel@linux.intel.com>
In-Reply-To: <63981.10.252.58.194.1441792979.squirrel@linux.intel.com>
References: <cover.1441753511.git.raj.khem@gmail.com>
	<0b794c84466fef2ece1269e01820503b4bce0b52.1441753511.git.raj.khem@gmail.com>
	<63981.10.252.58.194.1441792979.squirrel@linux.intel.com>
Date: Wed, 9 Sep 2015 13:23:25 +0300 (EEST)
From: alexander.kanavin@linux.intel.com
To: openembedded-core@lists.openembedded.org
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Subject: Re: [PATCH 02/16] slang: Fix namespace conflict vis-a-vis posix_close
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
X-List-Received-Date: Wed, 09 Sep 2015 10:24:17 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

>> +Exposed while compiling on musl
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> +Upstream-Status: Pending
>
> If this has been submitted upstream (as you say in the cover letter for
> this patchset), please provide a link for the submission in the
> upstream-status. We can't afford to let the amount of 'Pending' patches in
> oe-core grow indefinitely.
>
> Same goes for other patches in this set.


Actually scratch the above, it was too hasty. What I really wanted to say
is that, ideally, you should first submit the patches upstream, have a
prooflink of that, and only then send them here with that proof in the
upstream-status. There are already too many eternal 'Pending' patches in
oe-core that never made it to upsream. We can't afford more of them.

Regards,
Alex

