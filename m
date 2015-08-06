Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id EE43A734DA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 14:30:59 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t76EUx0Z030731; Thu, 6 Aug 2015 09:30:59 -0500
Received: from [10.113.0.102] ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015080609305963-1032454 ;
	Thu, 6 Aug 2015 09:30:59 -0500 
Message-ID: <55C36FA2.40901@ni.com>
Date: Thu, 06 Aug 2015 17:30:58 +0300
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1438674108-24258-1-git-send-email-adrian.ratiu@ni.com>	<CADkTA4PEZCM151f7Z72jcr-4H3MQqusdPr9WkO-jwUxrufPsTw@mail.gmail.com>	<OF2F3F95BE.08ECF07F-ONC2257E98.002DF696-C2257E98.002F92BC@ni.com>	<CADkTA4POzofrpfDEp8_bRokSoPV+2pb_RimQ+PrrZ2guqfPGNw@mail.gmail.com>	<55C30B7F.2050909@ni.com>
	<CADkTA4Mp_vF2uUdCSJ0TDVYapL-DuaLzHCvKsy6bLnytwAM76w@mail.gmail.com>
In-Reply-To: <CADkTA4Mp_vF2uUdCSJ0TDVYapL-DuaLzHCvKsy6bLnytwAM76w@mail.gmail.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 08/06/2015 09:30:59 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 08/06/2015 09:30:59 AM,
	Serialize complete at 08/06/2015 09:30:59 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-08-06_08:, , signatures=0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-yocto: do_configme: Add $TOOLCHAIN_OPTIONS to CFLAGS
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
X-List-Received-Date: Thu, 06 Aug 2015 14:31:02 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=utf-8; format=flowed

On 06.08.2015 16:19, Bruce Ashfield wrote:
> On Thu, Aug 6, 2015 at 3:23 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
>> On 05.08.2015 16:50, Bruce Ashfield wrote:
>>>
>>> On Wed, Aug 5, 2015 at 4:39 AM, Adrian Ratiu <adrian.ratiu@ni.com> wrote:
>>>>
>>>> Bruce Ashfield <bruce.ashfield@gmail.com> wrote on 05.08.2015 05:17:14:
>>>>
>>>>> On Tue, Aug 4, 2015 at 4:41 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>>>>> wrote:
>>>>>>
>>>>>> The kernel configure step was broken by the sysroot poisoning in [1].
>>>>>
>>>>>
>>>>> Can you be more precise here ? Configuration certainly works for me ..
>>>>> and
>>>>> has been working since last October.
>>>>
>>>>
>>>> This works because it was fixed in linux-yocto.inc *after* the sysroot
>>>> poisoning.
>>>> I've mentioned this in the next line :) But this is not what this fix is
>>>> for,
>>>> this fix should have been done at the same time with adding
>>>> $TOOLCHAIN_OPTIONS
>>>> to $KERNEL_CC in linux-yocto.inc.
>>>>
>>>> This bug was missed because there is NO error reporting in
>>>> yocto-kernel-tools
>>>> merge_configs.sh and the build continues despite the error. I've sent a
>>>> patch to
>>>> fail loudly in case merge_configs.sh fails in yocto-kernel-tools. You
>>>> know
>>>> about
>>>> it because you responded to that mail :) These issues are related.
>>>
>>>
>>> right. And as you saw there .. I don't need that patch. So we might as
>>> well
>>> let this one sit as well.
>>
>>
>> It's great if these issues were already fixed somehow different than how I
>> proposed. Are those local changes pushed to a public branch yet? I would
>> really like to test the new code.
>
> The solution is similar in the end, I just came to adding extra error checking
> via a different route (missing .cfg fragments not being reported and stopping
> the build).
>
> They are unfortunately back on my development machine, and I'm on
> vacation at the moment. But I will be back near that equipment next
> week!

I still think that we are solving two different issues altogether with 
these patches, but I think it best we wait until you push your changes 
and after that (if need be) I will reapply my patches on top of your 
changes and resend (again, if need be).

Have a nice vacation!


