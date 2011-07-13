Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1QgnkE-0001KV-Tm
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 02:56:07 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id DA05E1660342; Tue, 12 Jul 2011 18:52:10 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 4049116602B9;
	Tue, 12 Jul 2011 18:52:10 -0600 (MDT)
Message-ID: <4E1CEC39.1030202@mlbassoc.com>
Date: Tue, 12 Jul 2011 18:52:09 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc15 Thunderbird/3.1.10
MIME-Version: 1.0
To: Tom Rini <tom_rini@mentor.com>
References: <cover.1310511423.git.josh@linux.intel.com>	<1314a49d823f6e174ca09773cde0fee7ed0e1306.1310511423.git.josh@linux.intel.com>
	<4E1CDAE7.3040501@mentor.com> <4E1CE8D6.80605@mlbassoc.com>
	<4E1CEA80.70806@mentor.com>
In-Reply-To: <4E1CEA80.70806@mentor.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 13 Jul 2011 00:56:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/12/2011 06:44 PM, Tom Rini wrote:
> On 07/12/2011 05:37 PM, Gary Thomas wrote:
>> On 07/12/2011 05:38 PM, Tom Rini wrote:
>>> On 07/12/2011 04:24 PM, Joshua Lock wrote:
>>>> This is for use in the Hob GUI to enable the user to change the type
>>>> of the
>>>> generated image.
>>>>
>>>> Signed-off-by: Joshua Lock<josh@linux.intel.com>
>>>> ---
>>>>    meta/classes/image_types.bbclass |    2 ++
>>>>    1 files changed, 2 insertions(+), 0 deletions(-)
>>>>
>>>> diff --git a/meta/classes/image_types.bbclass
>>>> b/meta/classes/image_types.bbclass
>>>> index 89a745c..29d7a57 100644
>>>> --- a/meta/classes/image_types.bbclass
>>>> +++ b/meta/classes/image_types.bbclass
>>>> @@ -102,3 +102,5 @@ IMAGE_DEPENDS_cpio.xz = "xz-native"
>>>>    IMAGE_DEPENDS_ubi = "mtd-utils-native"
>>>>    IMAGE_DEPENDS_ubifs = "mtd-utils-native"
>>>>
>>>> +# This variable is available to request which values are suitable
>>>> for IMAGE_FSTYPES
>>>> +IMAGE_TYPES = "jffs2 cramfs ext2 ext2.gz ext3 ext3.gz squashfs
>>>> squashfs-lzma ubi ubifs"
>>>
>>> Concept is fine, but please don't list ubi and ubifs just list ubi.
>>
>> Perhaps the [brokwn] rule to explicitly build ubifs should also be purged?
>
> Nope, that's how the ubi is created.  Essentially at the time anyhow, OE
> didn't make it too easy to add in an image that needs to be in a
> container to be used.  So we have the ubifs rule (yes, that needs a
> cherry-pick from oe.dev) for 'advanced' users and the ubi rule to create
> a simple ubi image.

I might be missing something, but I don't see why this rule is necessary
in image_types.bbclass:
   IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img ${MKUBIFS_ARGS}"

Having it there leads to the confusion (I was) that ubifs was useful.

At least for me, I can build ubi images with that rule removed.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


