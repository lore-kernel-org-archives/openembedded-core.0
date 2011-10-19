Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RGfjc-0003op-Ro
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 01:39:45 +0200
Received: from mail-bw0-f52.google.com ([209.85.214.52])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 19 Oct 2011 16:33:52 -0700
Received: by bkbzs2 with SMTP id zs2so2692914bkb.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2011 16:33:50 -0700 (PDT)
Received: by 10.223.63.206 with SMTP id c14mr14187124fai.7.1319067230186;
	Wed, 19 Oct 2011 16:33:50 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id l11sm12182845faj.19.2011.10.19.16.33.47
	(version=SSLv3 cipher=OTHER); Wed, 19 Oct 2011 16:33:49 -0700 (PDT)
Message-ID: <4E9F5E5A.6040002@intel.com>
Date: Wed, 19 Oct 2011 16:33:46 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1319012721.git.sgw@linux.intel.com>
	<436a9b443962036ff35a5ffd86d80ad44350d5f2.1319012721.git.sgw@linux.intel.com>
	<758B37BA-B417-4B39-BF1C-0CEC613F067D@dominion.thruhere.net>
	<9DA5872FEF993D41B7173F58FCF6BE94E2F42EE2@orsmsx504.amr.corp.intel.com>
	<E8FAD09F-4767-4ACB-9588-EFC57570F176@dominion.thruhere.net>
	<9DA5872FEF993D41B7173F58FCF6BE94E2F42F6A@orsmsx504.amr.corp.intel.com>
	<158EAB1C-0C40-4C5B-B47A-A4B8C90A2055@dominion.thruhere.net>
	<1319042998.22985.257.camel@phil-desktop>
	<4E9F018D.7030703@intel.com>
	<CAMKF1srj1OrgnSwihsVGDCVasAc6zTHRJkfAkjFOpM80mUFM9A@mail.gmail.com>
	<4E9F0CCF.3070404@intel.com>
	<CAMKF1sqffiB0WMnhv3wVNseaMcL8TjXUePYXhvdUcwwk4roPag@mail.gmail.com>
	<CAP9ODKoFRiVnimZ3MDvK9S2v8JLykpR2-pWmmwz_2ua0pr-HfA@mail.gmail.com>
In-Reply-To: <CAP9ODKoFRiVnimZ3MDvK9S2v8JLykpR2-pWmmwz_2ua0pr-HfA@mail.gmail.com>
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: [CONSOLIDATED PULL 14/16] distro-tracking: update data for some toolchain recipes
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
X-List-Received-Date: Wed, 19 Oct 2011 23:39:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/19/2011 12:00 PM, Otavio Salvador wrote:
> On Wed, Oct 19, 2011 at 16:30, Khem Raj<raj.khem@gmail.com>  wrote:
> ...
>>>>> Many upstreams we can't track if updates are required automagically, so
>>>>> we
>>>>> need a place to record when the last manual check was, also possible
>>>>> reasons
>>>>> why we should not update to newer versions, ...
>>
>> hmm manual check means it has to be done manually is there any thing
>> that needs it ?
>>
>> I think unless they are distro specific which seems not since they are
>> in oe-core
>> they could exist in recipes  thats my opinion.
>
> I agree that this should be put into the recipes. Besides this allows
> for checking if it was updated when the version has been updated.
>
> If done right, when updating the version this data will be updated
> together. I see no change in the amount of changes.
>
> A plus of this choice is it will be more difficult to forget to update
> that info. This happened in last qt update for an example.
>

This may need to be something that the TSC brings up, possibly we can 
talk about it in Prague next week.

Sau!


