Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QKiqD-0004cZ-Fg
	for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 05:15:01 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 May 2011 20:12:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,362,1301900400"; 
   d="scan'208";a="1107209"
Received: from unknown (HELO [10.255.12.78]) ([10.255.12.78])
	by fmsmga002.fm.intel.com with ESMTP; 12 May 2011 20:12:11 -0700
Message-ID: <4DCCA18B.4040505@linux.intel.com>
Date: Thu, 12 May 2011 20:12:11 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: William Mills <wmills@ti.com>
References: <4DCC3BA6.3010406@windriver.com> <4DCC4A51.9010309@linux.intel.com>
	<4DCC4D17.7000600@linux.intel.com> <4DCC59B7.1070309@ti.com>
	<4DCC721D.8000705@linux.intel.com> <4DCC9168.1090100@ti.com>
In-Reply-To: <4DCC9168.1090100@ti.com>
Cc: poky <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] Commit and Patch message guidelines - fifth draft
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
X-List-Received-Date: Fri, 13 May 2011 03:15:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 05/12/2011 07:03 PM, William Mills wrote:
> 
> On 05/12/2011 07:49 PM, Darren Hart wrote:
>> There is: http://www.yoctoproject.org/community/mailing-lists
>>
>> Which needs to be updated to better reflect the oe-core aspect I think.
> 
> This might be at least one source of the cross posting as people are not 
> sure poky vs oe-core.
> 
>>> It seems to me there is a whole bunch of discussion happening on the
>>> poky list about making changes that that would effect everyone using
>>> openembedded-core.  Do we have two lists for discussion of stuff that
>>> effect the oe-core?
>>
>> No. As I understand it, things that go into poky.git/meta and things
>> that go into oe-core should be sent to the openembedded-core list. Patch
>> series for poky.git should be isolated in such a way so that they do not
>> include changes to meta (oe-core) and other areas at the same time.
>  >
>  > Does anyone have a different view?
>  >
> 
> This seems logical to me. Thanks.  I also think discussion of a 
> potential patch should be done on the list that the patch would go to yes?
> 
> Maybe we could drive that definition to ground and get the mailing list 
> page updated.
> 
> ---
> 
> So above, perhaps my "whole bunch" was overstated.  Let me retract that 
> and say at least some.
> 
> I don't mean to pick on you Darren; 

Oh, I think I asked for this one :-)

> I really am just trying to 
> understand and an example is often helpful.  Earlier you and Richard 
> were discussing directdisc images [1] with a suggestion that it might be 
> ripe for removal.  Should that have been on oe-core?
> 

You are correct. I should have sent that to oe-core as the
implementation in question is in poky.git/meta (ie oe-core). Clearly,
this is easy to miss and will take some time for us to get there.

Thanks for pointing that out!

> [1] https://lists.yoctoproject.org/pipermail/poky/2011-May/006106.htm
> 
> Thanks,
> Bill

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


