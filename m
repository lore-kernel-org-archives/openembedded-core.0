Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qh5bC-0003UW-Bv
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 21:59:59 +0200
Received: by wyg30 with SMTP id 30so437349wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2011 12:55:59 -0700 (PDT)
Received: by 10.216.235.83 with SMTP id t61mr1245818weq.112.1310586959274;
	Wed, 13 Jul 2011 12:55:59 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	k43sm4437217wed.33.2011.07.13.12.55.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Jul 2011 12:55:58 -0700 (PDT)
Message-Id: <FB2AD5DE-3222-4E0C-B3E8-609658B82DF1@dominion.thruhere.net>
From: Koen Kooi <koen@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E1DA75A.2060201@mentor.com>
Mime-Version: 1.0 (Apple Message framework v936)
Date: Wed, 13 Jul 2011 21:55:46 +0200
References: <cover.1310511423.git.josh@linux.intel.com>	<1314a49d823f6e174ca09773cde0fee7ed0e1306.1310511423.git.josh@linux.intel.com>	<4E1CDAE7.3040501@mentor.com>
	<4E1CE8D6.80605@mlbassoc.com>	<4E1CEA80.70806@mentor.com>
	<4E1CEC39.1030202@mlbassoc.com>	<4E1CF0B1.6060400@mentor.com>
	<1310556245.20015.1106.camel@rex> <4E1DA75A.2060201@mentor.com>
X-Mailer: Apple Mail (2.936)
Subject: Re: [PATCH 1/2] classes/image_types: add a variable to list	available IMAGE_FSTYPE's
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
X-List-Received-Date: Wed, 13 Jul 2011 19:59:59 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit


Op 13 jul 2011, om 16:10 heeft Tom Rini het volgende geschreven:

> On 07/13/2011 04:24 AM, Richard Purdie wrote:
>> On Tue, 2011-07-12 at 18:11 -0700, Tom Rini wrote:
>>> On 07/12/2011 05:52 PM, Gary Thomas wrote:
>>>> On 07/12/2011 06:44 PM, Tom Rini wrote:
>>>>> On 07/12/2011 05:37 PM, Gary Thomas wrote:
>>>>>> On 07/12/2011 05:38 PM, Tom Rini wrote:
>>>>>>> On 07/12/2011 04:24 PM, Joshua Lock wrote:
>>>>>>>> This is for use in the Hob GUI to enable the user to change  
>>>>>>>> the type
>>>>>>>> of the
>>>>>>>> generated image.
>>>>>>>>
>>>>>>>> Signed-off-by: Joshua Lock<josh@linux.intel.com>
>>>>>>>> ---
>>>>>>>>   meta/classes/image_types.bbclass |    2 ++
>>>>>>>>   1 files changed, 2 insertions(+), 0 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/meta/classes/image_types.bbclass
>>>>>>>> b/meta/classes/image_types.bbclass
>>>>>>>> index 89a745c..29d7a57 100644
>>>>>>>> --- a/meta/classes/image_types.bbclass
>>>>>>>> +++ b/meta/classes/image_types.bbclass
>>>>>>>> @@ -102,3 +102,5 @@ IMAGE_DEPENDS_cpio.xz = "xz-native"
>>>>>>>>   IMAGE_DEPENDS_ubi = "mtd-utils-native"
>>>>>>>>   IMAGE_DEPENDS_ubifs = "mtd-utils-native"
>>>>>>>>
>>>>>>>> +# This variable is available to request which values are  
>>>>>>>> suitable
>>>>>>>> for IMAGE_FSTYPES
>>>>>>>> +IMAGE_TYPES = "jffs2 cramfs ext2 ext2.gz ext3 ext3.gz squashfs
>>>>>>>> squashfs-lzma ubi ubifs"
>>>>>>>
>>>>>>> Concept is fine, but please don't list ubi and ubifs just list  
>>>>>>> ubi.
>>>>>>
>>>>>> Perhaps the [brokwn] rule to explicitly build ubifs should also  
>>>>>> be
>>>>>> purged?
>>>>>
>>>>> Nope, that's how the ubi is created.  Essentially at the time  
>>>>> anyhow, OE
>>>>> didn't make it too easy to add in an image that needs to be in a
>>>>> container to be used.  So we have the ubifs rule (yes, that  
>>>>> needs a
>>>>> cherry-pick from oe.dev) for 'advanced' users and the ubi rule  
>>>>> to create
>>>>> a simple ubi image.
>>>>
>>>> I might be missing something, but I don't see why this rule is  
>>>> necessary
>>>> in image_types.bbclass:
>>>>  IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o
>>>> ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img ${MKUBIFS_ARGS}"
>>>>
>>>> Having it there leads to the confusion (I was) that ubifs was  
>>>> useful.
>>>>
>>>> At least for me, I can build ubi images with that rule removed.
>>>
>>> OK, refreshed my memory again.  We have ubifs (and it might indeed  
>>> need
>>> some quick kicking/fixing) target (a) since that's what was there to
>>> start with, but not quite enough (b) for advanced users.  There is a
>>> point to making a ubifs image which is when you're making a  
>>> complex ubi
>>> volume (either outside of OE or in your collection/layer that  
>>> provides a
>>> more complex ubinize conf).
>>>
>>> The problem in oe-core today is that we were using non-standard
>>> extensions on the ubifs part to try and distinguish between usable
>>> standalone files (ubi) and parts (ubifs).
>>
>> Surely if you're doing this extra processing, you could just define  
>> the
>> IMAGE_CMD_ubifs variable too?
>>
>> I'm a little worried about having something there that is effectively
>> unusable on its own...
>
> Well, ubifs is unusable without being in a ubi contanier.   But a ubi
> container can have anything in it, we just make a simple container to
> give people a starting point.

Being able to generate a eaw ubifs is usefull when you already have  
the container and only want to reflash, but don't want to trash the  
ubi erase cycle count.


