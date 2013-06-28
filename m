Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2DD05608BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 21:52:46 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 28 Jun 2013 14:54:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,961,1363158000"; d="scan'208";a="362260591"
Received: from unknown (HELO [10.255.13.119]) ([10.255.13.119])
	by fmsmga002.fm.intel.com with ESMTP; 28 Jun 2013 14:52:46 -0700
Message-ID: <51CE05AE.4050908@linux.intel.com>
Date: Fri, 28 Jun 2013 14:52:46 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <1372447427-31750-1-git-send-email-sgw@linux.intel.com>
	<1372449088.28188.3.camel@pb-ThinkPad-R50e>
	<51CDEFEF.2090801@linux.intel.com>
	<1372453659.28188.22.camel@pb-ThinkPad-R50e>
In-Reply-To: <1372453659.28188.22.camel@pb-ThinkPad-R50e>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2 v2] bitbake.conf: Add SECURITY_*FLAGS overridable definition
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
X-List-Received-Date: Fri, 28 Jun 2013 21:52:46 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/28/2013 02:07 PM, Phil Blundell wrote:
> On Fri, 2013-06-28 at 13:19 -0700, Saul Wold wrote:
>> So, if I remember correctly there was issues with this because there are
>> a number of packages that have to modify specifically the security
>> related flags (see the list in security_flags.inc), the ordering/timing
>> of being able to due that correctly did not allow for setting it
>> directly in CFLAGS or TARGET_CFLAGS.
>
> What exactly were the issues?  I can't think of any obvious reason why
> it wouldn't work for security.inc to do:
>
> SECURITY_CFLAGS = "-fstack-protector-all -pie -fpie -D_FORTIFY_SOURCE=2"
> SECURITY_CFLAGS_pn-curl = "-fstack-protector-all -pie -fpie"
> CFLAGS += "${SECURITY_CFLAGS}"
>
Seems either will work, this or TARGET_CFLAGS_append, I guess the 
problem I had in the past was trying to do it in the recipe or some 
other ordering problem.  I think part of it is that these are special 
since they use "export"

So now the question is which place them TARGET_*FLAGS or *FLAGS??

TARGET_* makes it clear we are modifying those flags.


Sau!
> p.
>
>
>
>

