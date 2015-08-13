Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id D3B3173D64
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 08:43:00 +0000 (UTC)
Received: (qmail 5621 invoked by uid 1003); 13 Aug 2015 08:42:59 -0000
Received: from unknown (HELO ?10.56.233.24?) (philip@opensdr.com@88.128.80.115)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	13 Aug 2015 08:42:59 -0000
To: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	"Burton, Ross" <ross.burton@intel.com>
References: <1436426071-3790-1-git-send-email-leimaohui@cn.fujitsu.com>
	<56502.10.252.20.69.1436441609.squirrel@linux.intel.com>
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
From: Philip Balister <philip@balister.org>
Message-ID: <55CC588E.6030200@balister.org>
Date: Thu, 13 Aug 2015 10:42:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpXke_FaA_bSUtPSjqMKWtUsyU44qsm73KfZNrajfZrnQ@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 13 Aug 2015 08:43:01 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 08/11/2015 10:46 PM, Otavio Salvador wrote:
> On Tue, Aug 11, 2015 at 5:36 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> On 11 August 2015 at 16:46, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> can we freeze this thread please.
>>
>>
>> Or more usefully, reboot it.  Philip, you're turning into Koen!  Alex, if
>> someone on this list asks what Poky is, 99% of the time they're trolling.
>> :)
>>
>> The original and unanswered question was "should oe-core continue to
>> maintain GPLv2 recipes where upstream has moved to GPLv3 or should those
>> recipes move to a standalone layer" with various implied questions:
>>
>> - If the v2 recipes move to a separate layer, who own/maintains/tests it?
>> - Should there be v2 recipes for every recipe that has moved to v3, or only
>> (as is now) the "more-core" recipes (currently YP tests that core-image-base
>> builds without GPLv3, nothing else more complicated)
>> - Should meta-gplv2 only contain recipes from oe-core, or all layers?  If
>> other layers decide to hold both v3 and v2 recipes (not that I'm aware any
>> have), what makes oe-core special?
>>
>> I'm torn, Richard is torn.  Neither of those are useful to forming a
>> decision.  Does anyone else have any *useful* feedback?
> 
> I think it is a matter of resource usage.
> 
> Up to now, the GPLv2 maintenance has not been so hard and thus I would
> say for us to stay as is for now. We should revisit this for every
> release and review if it is time for split it or not.
> 

This would be a good time to remind us who the audience is for the gplv2
recipes so we understand the amount of manpower behind their maintenance.

My concern keeping then in core is that the commnunity who uses them
will reduce over time and they will bitrot. If that happens, we should
create a layer for them and remove them from core.

Philip

