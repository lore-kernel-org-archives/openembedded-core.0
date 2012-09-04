Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1T8wBR-0005eW-DY
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 18:41:01 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q84GScgN017813
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Sep 2012 09:28:38 -0700 (PDT)
Received: from msp-dhcp18.wrs.com (172.25.34.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Tue, 4 Sep 2012 09:28:37 -0700
Message-ID: <50462C35.6000400@windriver.com>
Date: Tue, 4 Sep 2012 11:28:37 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <d45bc352092507d11c740fb85c37d1102fa7203d.1346250187.git.ross.burton@intel.com>
	<FF931F2C-6ABE-4F72-8FEE-90CFCE69121C@dominion.thruhere.net>
	<CAJTo0LZa4odP83UOT=1U+nan-wcOEKuRMXW3iHRv9wzD8pspDA@mail.gmail.com>
	<4976204.OdG2Ohk3KU@helios>
	<CAJTo0LbGH3HV1yQOMyoYDVR_z=34qy3riZnASGYdFtkK_XkOmw@mail.gmail.com>
	<1346267538.4396.38.camel@x121e.pbcl.net>
	<CAJTo0La-tMW+LVLqRGBTSE36x0BYXBJkiwh2B5_8_-SjaAzR5Q@mail.gmail.com>
	<CAMKF1srQO53m2zv91LLs8WFjEt=UKNA=w4OqxdVfJpyWPHG8jg@mail.gmail.com>
	<CAJTo0LZGcZHwM5cZgjFrQ9tuhw6RLN_g732wBitVgHKo8UigNQ@mail.gmail.com>
	<1346278937.4396.57.camel@x121e.pbcl.net>
	<1346423384.2673.102.camel@phil-desktop>
	<1346428885.16485.29.camel@ted>
	<CAMKF1soyonS_-QFV3XKaz1=i_Krguy4i2Nnt1Ep8O9mkTR-3Jg@mail.gmail.com>
	<CAMKF1sqqWJEwsvng_BHbqACJWhUBDRfW4Nixd2t2O1eADmCE5w@mail.gmail.com>
	<43FF08E0-8A1F-4B64-9552-D5C68A207D0C@gmail.com>
In-Reply-To: <43FF08E0-8A1F-4B64-9552-D5C68A207D0C@gmail.com>
Subject: Re: [PATCH 2/2] tzdata: install /etc/localtime alongside /etc/timezone
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
X-List-Received-Date: Tue, 04 Sep 2012 16:41:01 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/1/12 12:30 PM, Andrea Adami wrote:
>
>> On Fri, Aug 31, 2012 at 9:45 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Fri, Aug 31, 2012 at 9:01 AM, Richard Purdie
>>> <richard.purdie@linuxfoundation.org> wrote:
>>>>
>>>> I don't think dropping support for / and ${prefix} makes sense as long
>>>> as it doesn't excessively hurt us
>>>
>>> we already have, done special things to support it look how many
>>> libraries appear in /lib now a days despite their original build
>>> system wanting it in /usr and I still get atleast 50 warnings on it
>>> wanting more in /lib and I am sure someone will send patches
>>> for it because they hate the warning and then we will have this
>>> growing pile of patches
>>> to maintain. So IMO it has already started to hurt us.
>>
>> just to quantify it. I have 11 warnings reported about it.
>>
>> WARNING: QA Issue: .... installed in the base_prefix, requires a
>> shared library under exec_prefix (/usr)
>>
>> this is very custom image but very much similar to core-image-minimal
>> now if I fix this 11 warnings. For the sake of it I fixed these 11 warnings
>> by hacking patches for packages or recipes to move these files into
>> base_prefix and it now gives me 16 more warnings about same but
>> different files it wants to bring along into base_prefix
>>
>> its quite slimy :/
>
> As Khem says, leading distros are even going one step further:
>
> http:\\fedoraproject.org/wiki/Features/UsrMove
>
> Seems it's time to consider alternative rootfs layouts, like this F17 unified filesystem.

I really dislike their snarky FAQ..

I'm sorry, not all devices being generated have initramfs configuration (nor do 
people want that behavior.)   Also we've shown you can build a system w/ a split 
filesystem and it works properly.  The systemd/udev developers seem 'lazy' to 
me... they were unwilling to work through early and late boot so they just gave up.

The comments in the FAQ about /etc and /var being local to a given machine, 
while /usr being shareable is a reasonable set.  This is the situations where 
I've seen this used the most especially in blade systems w/ a local rootfs on 
each, with a shared /usr among them all.

I agree it can make some update processes more difficult, but the reality is 
there are already mechanisms in place -- for many products -- that address this.

Perhaps one way around the whole argument is simply to redefine the problem. 
(As Fedora and others seem to have done.)  Work on an OE solution to construct a 
minimal boot/configuration system that can load the appropriate (combined) /usr 
partition, and then pivot-root, or similar and re-exec init to switch to that 
configuration?  This is similar in concept to the initramfs, but is not tied to 
a specific technique or technology.

This would still allow for the quick boot configuration (RO mount even), udev 
setup, module loading and such -- and the larger /usr partition and upgrade path.

This is not something we have in OE today, and would certainly require some 
custom work.....

--Mark

> Andrea
>
>> __________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



