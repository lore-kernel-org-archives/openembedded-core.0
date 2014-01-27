Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 807D66E719
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 21:37:42 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 27 Jan 2014 13:37:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,731,1384329600"; d="scan'208";a="473364506"
Received: from unknown (HELO [10.255.13.56]) ([10.255.13.56])
	by orsmga002.jf.intel.com with ESMTP; 27 Jan 2014 13:37:26 -0800
Message-ID: <52E6D195.8030809@linux.intel.com>
Date: Mon, 27 Jan 2014 13:37:25 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Fathi Boudra <fathi.boudra@linaro.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1390218017-10423-1-git-send-email-fathi.boudra@linaro.org>	<1390218017-10423-2-git-send-email-fathi.boudra@linaro.org>	<1390300893.874.79.camel@ted>
	<CAGNsrLBebkDZcLk91x1XPAGW2XzK0opYgRJ7u8s4+Du32t_R9A@mail.gmail.com>
In-Reply-To: <CAGNsrLBebkDZcLk91x1XPAGW2XzK0opYgRJ7u8s4+Du32t_R9A@mail.gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 1/7] ltp: rename recipe to ltp_20140115.bb
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
X-List-Received-Date: Mon, 27 Jan 2014 21:37:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/21/2014 04:17 AM, Fathi Boudra wrote:
> On 21 January 2014 12:41, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Mon, 2014-01-20 at 13:40 +0200, Fathi Boudra wrote:
>>> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
>>> ---
>>>   meta/recipes-extended/ltp/ltp_20130904.bb | 78 -------------------------------
>>>   meta/recipes-extended/ltp/ltp_20140115.bb | 78 +++++++++++++++++++++++++++++++
>>>   2 files changed, 78 insertions(+), 78 deletions(-)
>>>   delete mode 100644 meta/recipes-extended/ltp/ltp_20130904.bb
>>>   create mode 100644 meta/recipes-extended/ltp/ltp_20140115.bb
>>
>> So we rename the recipe but don't actually change the SRCREV to the new
>> version (since you do that in 3/7)?
>>
>> This seems a little confusing?
>
> could be :) I sent the patchset as-is. I can squash the 2 patches if you prefer.
>

Yes, please can you please send a v3 patch set, also might be nice to 
have the clean-ups first and then the changes that are new after the update.

Make sense?

Thanks
	Sau!

>> Cheers,
>>
>> Richard
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

