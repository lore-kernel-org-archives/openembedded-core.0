Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EB5B773905
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 14:29:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7DETffV023608
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 07:29:41 -0700 (PDT)
Received: from Marks-MacBook-Pro-2.local (172.25.36.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.235.1; Thu, 13 Aug 2015 07:29:40 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1436426071-3790-1-git-send-email-leimaohui@cn.fujitsu.com>
	<CAP9ODKqHNtENns2SOk-C9S2hh1weyf15=n1V8Rxgs+Rh5rMJGw@mail.gmail.com>
	<CAJTo0Layj-AXfYMmvqjZ-ASSDx_PptbysS7tUiGDLAyPjLGN5A@mail.gmail.com>
	<CAJ86T=WJiNC5fJj+Vgj=4T-dS+E9_CvTw79nFLVuFETxrp1qdw@mail.gmail.com>
	<1436601450.3310.27.camel@linuxfoundation.org>
	<55BA134F.9010908@linux.intel.com>
	<CAJ86T=UHTjTA7S_4EV66VEUoaRhYmaYveVcfxbqzVJsxZ4s6dg@mail.gmail.com>
	<55BB5F06.4010901@linux.intel.com>
	<CAMKF1srWcMoRui4kqRY5vCdLd-SPQ+EMihTci=NUghHsnGiBqQ@mail.gmail.com>
	<55C477AE.8030308@balister.org> <55C4A405.6050209@linux.intel.com>
	<55C637DB.9010106@balister.org> <55C8956D.9080508@linux.intel.com>
	<55C8F83F.4010003@balister.org> <55C9F7F2.2060502@linux.intel.com>
	<CAMKF1soCEwGMkVfHsMzp3Wt49LKQusLC8jTrYygCSsBgjHZQQw@mail.gmail.com>
	<CAJTo0LYXHLBF52jmfLF4azE-BSKj2F=9-G=8MXcFo36FgE6+0A@mail.gmail.com>
	<CAP9ODKpXke_FaA_bSUtPSjqMKWtUsyU44qsm73KfZNrajfZrnQ@mail.gmail.com>
	<55CC588E.6030200@balister.org>
From: Mark Hatle <mark.hatle@windriver.com>
X-Enigmail-Draft-Status: N1110
Organization: Wind River Systems
Message-ID: <55CCA9D4.4000902@windriver.com>
Date: Thu, 13 Aug 2015 09:29:40 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:38.0)
	Gecko/20100101 Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <55CC588E.6030200@balister.org>
Subject: Re: meta-gplv2? [Was Re: parted_1.8.6.bb: add parted that not GPLv3]
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
X-List-Received-Date: Thu, 13 Aug 2015 14:29:42 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 8/13/15 3:42 AM, Philip Balister wrote:
> On 08/11/2015 10:46 PM, Otavio Salvador wrote:
>> On Tue, Aug 11, 2015 at 5:36 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>>
>>> On 11 August 2015 at 16:46, Khem Raj <raj.khem@gmail.com> wrote:
>>>>
>>>> can we freeze this thread please.
>>>
>>>
>>> Or more usefully, reboot it.  Philip, you're turning into Koen!  Alex, if
>>> someone on this list asks what Poky is, 99% of the time they're trolling.
>>> :)
>>>
>>> The original and unanswered question was "should oe-core continue to
>>> maintain GPLv2 recipes where upstream has moved to GPLv3 or should those
>>> recipes move to a standalone layer" with various implied questions:
>>>
>>> - If the v2 recipes move to a separate layer, who own/maintains/tests it?
>>> - Should there be v2 recipes for every recipe that has moved to v3, or only
>>> (as is now) the "more-core" recipes (currently YP tests that core-image-base
>>> builds without GPLv3, nothing else more complicated)
>>> - Should meta-gplv2 only contain recipes from oe-core, or all layers?  If
>>> other layers decide to hold both v3 and v2 recipes (not that I'm aware any
>>> have), what makes oe-core special?
>>>
>>> I'm torn, Richard is torn.  Neither of those are useful to forming a
>>> decision.  Does anyone else have any *useful* feedback?
>>
>> I think it is a matter of resource usage.
>>
>> Up to now, the GPLv2 maintenance has not been so hard and thus I would
>> say for us to stay as is for now. We should revisit this for every
>> release and review if it is time for split it or not.
>>
> 
> This would be a good time to remind us who the audience is for the gplv2
> recipes so we understand the amount of manpower behind their maintenance.

I can only speak for the customers I know of directly.  They are:

* People whose lawyers tell them they can't use GPLv3, for no other reason that
FUD.  (This is diminishing.)

The follow are all around the 'TiVo-ization clause' concerns...

* People in the medical space
  - Some devices if modified have serious safety concerns.  So they want to be
able to lock down the device and must due so to get things like FDA certification.

* People in the automotive space (IVI, etc)
  - In some countries if a user modifies the device, due to the automaker
permitting modifications, the automake suddenly becomes liable for the users
changes.  This is a pretty nasty catch in their laws.  So the automakes want the
ability again to lock down the device to prevent liability issues, as well as
for potential safety concerns.

* Aeronautics
  - I've only talked to a few people on this, so I don't know if it is accurate
or not.. but again the issue is for FAA certification and similar they can't
permit changes to various flight systems.  If they permit a user to modify the
device it may fail FAA certification.

* Consumer Electronics
  - Some devices may be built in such a way that the designer does not want to
permit the user from modifying the device.  This is generally around things like
DRM, or devices that have physical components (like tape control) that can be
damaged due to improper control.

  - DRM if implemented in software can be a concern simply due to contractural
issues..

  - Physical device issues are all about warranty concerns.  (Personally I think
it's a red herring, but I've heard the concern on a number of devices from a few
large manufacturers.)

> My concern keeping then in core is that the commnunity who uses them
> will reduce over time and they will bitrot. If that happens, we should
> create a layer for them and remove them from core.

I think GPLv2 is a limited set of the community, but I also think that it's an
important set.  It removes some of the traditional embedded Linux concerns from
various markets.  As for bitrot, for the existing components, I don't see this
as a concern for the next few years at least.  There is still a health
(commercial) community using these components regularly, and worst case fixes
are being developed and sent back to the community via OSVs and integrators.

--Mark

> Philip
> 


