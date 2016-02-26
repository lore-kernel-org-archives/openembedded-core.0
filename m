Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A995677346
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 13:56:15 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 26 Feb 2016 05:55:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="55289693"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 26 Feb 2016 05:55:53 -0800
Received: by linux.intel.com (Postfix, from userid 48)
	id DDC7B2C8001; Fri, 26 Feb 2016 06:43:40 -0800 (PST)
Received: from 10.252.8.77 (SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Fri, 26 Feb 2016 16:43:40 +0200 (EET)
Message-ID: <57788.10.252.8.77.1456497820.squirrel@linux.intel.com>
In-Reply-To: <CANwerB2gBZKqfkXoaFH_dhkQAfDvN7TLeBceyOxsdVJzaxDgGQ@mail.gmail.com>
References: <1456483945-16340-1-git-send-email-net147@gmail.com>
	<20160226110428.GA2557@jama>
	<CANwerB0bs=0b0r_mj+VJ+rgYz56jKUuSiUgs7kdK+tD9f=Ot8A@mail.gmail.com>
	<CAJTo0LYS-u77Lg+Q4OWT9syYvQVP-631RQ+N9GRRoBKg+6r3Tw@mail.gmail.com>
	<CANwerB2gBZKqfkXoaFH_dhkQAfDvN7TLeBceyOxsdVJzaxDgGQ@mail.gmail.com>
Date: Fri, 26 Feb 2016 16:43:40 +0200 (EET)
From: alexander.kanavin@linux.intel.com
To: "Jonathan Liu" <net147@gmail.com>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ffmpeg: fix build when DISTRO_FEATURES doesn't contain x11
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
X-List-Received-Date: Fri, 26 Feb 2016 13:56:18 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

>> I'd call that a bug, and should be simple to resolve (pass expand=True
>> when
>> fetching getVarFlags in the PACKAGECONFIG handling code).
>>
>> Ross
>
> Feel free to submit a patch to handle the PACKAGECONFIG expansion and
> then I can update the fix.

I think you need to solve this in a different way altogether. Write a
patch for the upstream code that turns a floating, implicit xv dependency
into something that can be explicitly turned on and off, and then add a
PACKAGECONFIG option for it to the recipe.

Alex

