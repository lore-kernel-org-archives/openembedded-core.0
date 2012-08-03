Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SxRmW-0004oU-Qr
	for openembedded-core@lists.openembedded.org;
	Sat, 04 Aug 2012 01:59:49 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Aug 2012 16:48:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="202100125"
Received: from unknown (HELO envy.home) ([10.255.12.180])
	by fmsmga002.fm.intel.com with ESMTP; 03 Aug 2012 16:48:06 -0700
Message-ID: <501C62C9.9090707@linux.intel.com>
Date: Fri, 03 Aug 2012 16:46:17 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1343199345.git.Xin.Ouyang@windriver.com>
	<969F26A8BAB325438E7EB80D3C3134FB16174E03@IRSMSX102.ger.corp.intel.com>
	<1343331612.7600.19.camel@ted>
	<1343335483.4888.3.camel@joshua-dell-xps.jf.intel.com>
	<7A8E501D-1792-4693-8EF4-C51E08B850FC@chargestorm.se>
In-Reply-To: <7A8E501D-1792-4693-8EF4-C51E08B850FC@chargestorm.se>
X-Enigmail-Version: 1.4.3
Subject: Re: Package recipes change proposal (system-wide) -	name wise
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Aug 2012 23:59:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 07/28/2012 02:22 AM, Anders Darander wrote:
> 
> On 26 jul 2012, at 22:43, "Joshua Lock" <josh@linux.intel.com>
> wrote:
>> On Thu, 2012-07-26 at 20:40 +0100, Richard Purdie wrote:
>>> 
>>> Also, as others have mentioned, git can detect move operations if
>>> you tell it to.
>> 
>> FYI the create-pull-request script passes -M40 to git
>> format-patch, which tells git to:
>> 
>> "should consider a delete/add pair to be a rename if more than 40%
>> of the file hasn’t changed."
>> 
>> Though with the size of some recipes perhaps the -M value should
>> be increased, or not passed at all?
> 
> No, the -M option shouldn't be removed. Why would you like to
> increase the percentage needed to handle a delete/add pair as a
> rename? Rather, it could very well be lowered even more, though the
> current 40% might be a good compromise.
> 
> Detecting a delete/add pair as a rename operation with some further
> modifications of the recipe does make reviewing the upgrade patches a
> lot easier...

Right, Anders submitted the -M40 change deliberately:

This was introduced as:

commit c8294d1e6da20f82d444a9d866bf5444a002dc5c
Author: Anders Darander <anders@chargestorm.se>
Date:   Tue Aug 16 15:41:34 2011 +0200

    create-pull-request: increase likelihood of detecting a rename

    Decrease the similarity percentage needed to recognize a
delete/add-pair follow
    as a rename.
    This make reviewing patches easier.

    (From OE-Core rev: 3944f5e02d22b70b3bcd733a80f005dbd8e248a2)

    Signed-off-by: Anders Darander <anders@chargestorm.se>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

This hasn't been an issue for me, but I could see that with some of the
minimal recipes that this could trigger some false renames. Still, I
don't see it as a problem.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


