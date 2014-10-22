Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 4210065CED
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 13:27:00 +0000 (UTC)
Received: (qmail 23698 invoked by uid 1003); 22 Oct 2014 13:27:00 -0000
Received: from unknown (HELO ?192.168.1.122?) (philip@opensdr.com@71.171.45.99)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	22 Oct 2014 13:26:59 -0000
Message-ID: <5447B09B.8030006@balister.org>
Date: Wed, 22 Oct 2014 09:26:51 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>, 
	Tom Zanussi <tom.zanussi@intel.com>
References: <54454A41.7090900@balister.org> <2808693.YK3zlpjAPq@comp-006-thk>
	<1413981637.8474.30.camel@empanada.home.network>
	<3835144.lX68KSfk9D@comp-006-thk>
In-Reply-To: <3835144.lX68KSfk9D@comp-006-thk>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: wic debug suggestions
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
X-List-Received-Date: Wed, 22 Oct 2014 13:27:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 10/22/2014 08:48 AM, Maciej Borzecki wrote:
> On Wednesday 22 of October 2014 07:40:37 Tom Zanussi wrote:
>> On Wed, 2014-10-22 at 09:03 +0200, Maciej Borzecki wrote:
>>> On Monday 20 of October 2014 13:45:37 Philip Balister wrote:
>>>> I'm trying to make an sd card using the sdimage-bootpart.wks file. I've
>>>> made an image and dd'ed it to a card. The card has a good vfat
>>>> partition, but the ext4 partition won't mount. Looks like bad
>>>> superblock. I can format the partition manually, so partitions seem OK
>>>> and card works.
>>>>
>>>> Does anyone have any suggestions for debugging this?
>>>
>>> In default wks, the vfat partition is /boot, ext4 is /. If I understood
>>> you
>>> correctly / fails to mount, is that right?
>>>
>>> I've rebuilt an image with poky rev
>>> 8ac8eca2e3bd8c78e2b31ea974930ed0243258a3. Loading via loopback and
>>> mounting partition 2 (/ in this case) works fine.
>>>
>>> Can you post the output this command?
>>>
>>>   wic create -D -e core-image-minimal sdimage-bootpart
>>
>> It seems the problem is in handling a large file system.  A new bug has
>> been opened for this:
>>
>> Bug 6863 - Wic fails to create a working image for a large file system
>>
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=6863
> Do you need help?

I'd be glad to try any suggestions.

Philip


> 
> 



