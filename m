Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8901A61A45
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 20:20:01 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 28 Jun 2013 13:21:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,961,1363158000"; d="scan'208";a="362223818"
Received: from unknown (HELO [10.255.13.119]) ([10.255.13.119])
	by fmsmga002.fm.intel.com with ESMTP; 28 Jun 2013 13:19:59 -0700
Message-ID: <51CDEFEF.2090801@linux.intel.com>
Date: Fri, 28 Jun 2013 13:19:59 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <1372447427-31750-1-git-send-email-sgw@linux.intel.com>
	<1372449088.28188.3.camel@pb-ThinkPad-R50e>
In-Reply-To: <1372449088.28188.3.camel@pb-ThinkPad-R50e>
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
X-List-Received-Date: Fri, 28 Jun 2013 20:20:02 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/28/2013 12:51 PM, Phil Blundell wrote:
> On Fri, 2013-06-28 at 12:23 -0700, Saul Wold wrote:
>> This will allow for SECURITY_CFLAGS and SECURITY_LDFLAGS to be
>> defined in the security_flags.inc and override the empty default.
>
> Why can't security_flags.inc just append to CFLAGS and LDFLAGS
> respectively, or some other set of variables that already exists?
>
So, if I remember correctly there was issues with this because there are 
a number of packages that have to modify specifically the security 
related flags (see the list in security_flags.inc), the ordering/timing 
of being able to due that correctly did not allow for setting it 
directly in CFLAGS or TARGET_CFLAGS.

> Creating new variables in bitbake.conf does have a cost in terms of
> parse time and memory footprint for every recipe.  If the variables are
> referenced in ${CFLAGS} etc then it also adds an extra substitution
> whenever CFLAGS is expanded.  The cost of those things isn't enormous,
> but it isn't zero either and adding them isn't something that we should
> do capriciously.
>
I understand, and RP and I talked about this, we needed a separate 
variable to ensure the correct substitution occurred for those that 
needed to disable or remove certain flags.

Sau!


> p.
>
>
>
>

