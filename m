Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5A4056A687
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 17:57:22 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 12 Jun 2013 10:58:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,853,1363158000"; d="scan'208";a="352170153"
Received: from unknown (HELO [10.255.13.2]) ([10.255.13.2])
	by fmsmga002.fm.intel.com with ESMTP; 12 Jun 2013 10:57:23 -0700
Message-ID: <51B8B683.7020402@linux.intel.com>
Date: Wed, 12 Jun 2013 10:57:23 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Andy Voltz <andy.voltz@timesys.com>
References: <1371055081-15301-1-git-send-email-andy.voltz@timesys.com>
	<51B8A870.6040900@linux.intel.com>
	<20130612171354.GC12032@timesys.com>
In-Reply-To: <20130612171354.GC12032@timesys.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tune-cortexa*.inc: fix tunings for cortex a5, a7, a8, a9, a15 machines.
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
X-List-Received-Date: Wed, 12 Jun 2013 17:57:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/12/2013 10:13 AM, Andy Voltz wrote:
> Hi Saul,
>
> On Wed, Jun 12, 2013 at 12:57:20PM -0400, Saul Wold wrote:
>> On 06/12/2013 09:38 AM, Andy Voltz wrote:
>>> Using CORTEX_ID variable reference in the tuning overrides did not work.
>>> This reverts those changes, and adds a tuning file for the cortex-a5.
>>>
>>> Revert "tune-cortexa5.inc: Add tune file for cortex-a5"
>>> Revert "tune-cortexa.inc: create a common include for cortex-a armv7a tuning"
>>>
>> Andy, does this patch supersede your -mtune not -mcpu patch?  I seem to
>> have some trouble applying this patch.
>>
>
> Yes. Sorry I thought that patch was NACK/dead.
>
>> It might be best to provide a series that includes the reverts with
>> appropriate commit messages.
>>
>
> Sure, I can send as a series.
>

Don't worry about it, seems RP already merged it into master, I must 
have had too much junk in my Master_under_test branch and had not 
reverted the right stuff.

Sau!

> Regards
>

