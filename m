Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TrGxZ-00088H-Uh
	for openembedded-core@lists.openembedded.org;
	Sat, 05 Jan 2013 00:46:01 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 04 Jan 2013 15:30:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,412,1355126400"; d="scan'208";a="187856185"
Received: from unknown (HELO [10.255.14.122]) ([10.255.14.122])
	by AZSMGA002.ch.intel.com with ESMTP; 04 Jan 2013 15:30:32 -0800
Message-ID: <50E76618.40400@linux.intel.com>
Date: Fri, 04 Jan 2013 15:30:32 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Marko Lindqvist <cazfi74@gmail.com>
References: <1357245391-11055-1-git-send-email-cazfi74@gmail.com>
	<50E755FE.90604@linux.intel.com>
	<CAF6bG8cgn7h2DKehjVEU5HmNurCqNC2VFMCAVBOjZbbW=h4VdA@mail.gmail.com>
	<CAF6bG8c=knEQNzYrzU7YUCvQn3fgF083eJLG_bj2nUki1w50nw@mail.gmail.com>
In-Reply-To: <CAF6bG8c=knEQNzYrzU7YUCvQn3fgF083eJLG_bj2nUki1w50nw@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Prepare recipes for automake-1.13 (batch 1)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Jan 2013 23:46:04 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/04/2013 03:11 PM, Marko Lindqvist wrote:
> On 5 January 2013 00:42, Marko Lindqvist <cazfi74@gmail.com> wrote:
>> On 5 January 2013 00:21, Saul Wold <sgw@linux.intel.com> wrote:
>>> On 01/03/2013 12:36 PM, Marko Lindqvist wrote:
>>>>
>>>> In practice there is three categories of changes in automake-1.13
>>>> that cause packages to break. From that follows that virtually all
>>>> problems fall to three categories, and all packages suffering from
>>>> problem of the same category get virtually identical fix.
>>>>
>>> So these need the automake-1.13 update first?  I have the 1.12 version but
>>> have not seen the 1.13 version yet.
>>>
>>> Just want to confirm that.
>>
>>   No, the other way around. These are needed in place before we can
>> even consider automake-1.13. They are compatible with several versions
>> back.
>
>   I've of course tested them with both automake-1.13 openembedded
> (patch for this update not submitted. If someone else needs it, I can
> of course send it) and against current master automake 1.12.
>
>
Ok got it, and ack on the Git repo for now email patches are fine, I 
need to sort out the current batch (which pre-dates these) and then I 
can concentrate on the next set.

Sau!

>   - ML
>
>


