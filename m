Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UKaA9-0005wI-Kw
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 21:08:06 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2QJp1Gc011902
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Mar 2013 12:51:01 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 26 Mar 2013 12:51:00 -0700
Message-ID: <5151FC22.2080002@windriver.com>
Date: Tue, 26 Mar 2013 15:50:58 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <cover.1364308617.git.bruce.ashfield@windriver.com>
	<cd19c63a4d2874eb48c9a96a69a38af730c00834.1364308617.git.bruce.ashfield@windriver.com>
	<5151C361.7020202@linux.intel.com> <5151C3A2.4070806@windriver.com>
	<5151C4BC.4050108@linux.intel.com>
In-Reply-To: <5151C4BC.4050108@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/7] linux-yocto/3.8: allow kernel feature _appends to be overriden
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
X-List-Received-Date: Tue, 26 Mar 2013 20:08:06 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-03-26 11:54 AM, Darren Hart wrote:
>
>
> On 03/26/2013 08:49 AM, Bruce Ashfield wrote:
>> On 13-03-26 11:48 AM, Darren Hart wrote:
>>> On 03/26/2013 07:46 AM, Bruce Ashfield wrote:
>>>> It was pointed out that the current way the KERNEL_FEATURES variable
>>>> is appended in the base linux-yocto recipe doesn't allow the appended
>>>> features to be prevented in a layer without using python code and
>>>> a recipe finalize hook.
>>>>
>>>> To allow easier overriding of 'extra' or 'optional' features that are
>>>> defined in the linux-yocto recipe, we create a KERNEL_EXTRA_FEATURES
>>>> variable. This variable can be set in a layer to define extra features
>>>> or cleared to prevent the recipe's extra features from being appended
>>>> to the core functionality.
>>>
>>> You know what I'm going to say right? Docume.... right, good.
>>>
>>> Bruce, are you keeping a list of things that have changed and need
>>> documentation in the kernel-dev manual? Could you share it?
>>
>> I do have a list, I'll put it in bugzilla.
>
> Thank you sir!

I'm overloading bug 3423 with the list of documentation updates that I'll
send out for 1.4 .. it has now been updated.

Cheers,

Bruce

>



