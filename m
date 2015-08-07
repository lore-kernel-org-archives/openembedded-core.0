Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 94A1B7673D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 12:43:03 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 07 Aug 2015 05:43:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,629,1432623600"; d="scan'208";a="763994610"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 07 Aug 2015 05:43:03 -0700
Message-ID: <55C4A81C.2010905@linux.intel.com>
Date: Fri, 07 Aug 2015 15:44:12 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Randy MacLeod <randy.macleod@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1438265949.git.alexander.kanavin@linux.intel.com>
	<646c2c404c3064d5b7ce1d1351690caf1d482aa2.1438265949.git.alexander.kanavin@linux.intel.com>
	<55C433F9.5040403@windriver.com>
In-Reply-To: <55C433F9.5040403@windriver.com>
Subject: Re: [PATCH 19/21] epiphany: add a recipe from meta-gnome
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
X-List-Received-Date: Fri, 07 Aug 2015 12:43:04 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 08/07/2015 07:28 AM, Randy MacLeod wrote:

>> Epiphany is replacing midori as the browser in oe-core recipe set
>> and poky distribution.
>
> I just got caught up on oe-core and:
>     https://www.mail-archive.com/yocto@yoctoproject.org/msg24522.html
>
> Please move the midori recipe and dependencies to
> meta-oe when this change is merged to oe-core. That would help
> anyone that needs to provide a transition warning. Of course it
> adds more cruft to meta-oe but that's a separate problem.

Midori depends on an ancient, no longer maintained Webkit1 
implementation with known security issues [1]. Adding it to meta-oe 
requires that:

a) webkit-gtk is at least updated to the latest version of the no longer 
maintained Webkit1 implementation (1.8.3 -> 2.4.9)
2) that version is patched with every fix that other distributions have 
done, including [1]

I can do this, but at the expense of updating other packages in oe-core 
that need updating before we hit a stabilization milestone. Do you 
specifically know someone who needs such an extra-cushioned transition?

Alex

[1] https://bugzilla.redhat.com/show_bug.cgi?id=1182623

