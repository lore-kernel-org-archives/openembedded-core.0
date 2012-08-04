Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SxkLA-0005WU-Mr
	for openembedded-core@lists.openembedded.org;
	Sat, 04 Aug 2012 21:48:48 +0200
Received: by yhjj56 with SMTP id j56so1566120yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Aug 2012 12:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=Ti8ck00DEmwZY9aM6y5ayuOtdSd0ce0cRd2P9QKjq08=;
	b=lvEdcJ9hpYb8mZzg/p8HwVo/jNd3sZOXf23By44mlFM0UZt1vSU/K2GP9VodigosBn
	rTyAUk1osv6oAFlQTWn6zIA0GuFChD1Ra0lXn0kEFgnp69FjB2jGT//rCcLHw/k5IOoB
	lQjRQHhspEndAEArThc7odqJ6nuAyWyI4klnOdYkEf7uOv1pNPpnp5zcFKmB8xiMyLhr
	uQOP+FsFHISqNzBw9cH/brB0vWFWUnAlHG7eD5YP/RWc/HS8HOg3qJx8/Fjkxr6vXC2S
	7KlsPwmdWaF+MYPij9MbUQT6CpmnTEB20gC1H0lNHavVWBd7fo0hygcf5mq0T0MlyoLo
	q7FA==
MIME-Version: 1.0
Received: by 10.42.53.208 with SMTP id o16mr622100icg.6.1344109025567; Sat, 04
	Aug 2012 12:37:05 -0700 (PDT)
Received: by 10.64.142.201 with HTTP; Sat, 4 Aug 2012 12:37:05 -0700 (PDT)
In-Reply-To: <3103BB42-D7DD-456B-8733-9A019CA66E99@dominion.thruhere.net>
References: <cover.1344022584.git.laurentiu.palcu@intel.com>
	<b41b2c46c9de5d3f63bfa146e23e8974a7a6cebf.1344022584.git.laurentiu.palcu@intel.com>
	<CALbNGRQjUxm0h2+YA=Tog2_JhWPKGJmdy9QyhOjSQWLRQ1eKOQ@mail.gmail.com>
	<501CD3EE.3080100@intel.com>
	<CALbNGRTJM5=Xt4NqoEuEQa2U-eMtmQzy42HmwRK0zvkq-zK-3Q@mail.gmail.com>
	<501D2B2B.6070806@intel.com>
	<3103BB42-D7DD-456B-8733-9A019CA66E99@dominion.thruhere.net>
Date: Sat, 4 Aug 2012 21:37:05 +0200
Message-ID: <CALbNGRRLGToMpW2tCzdtEcpZmAmgK3d2VKF0SVi-hgBanFOexQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] gtk-icon-cache: call postinst scriplet at do_rootfs time
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
X-List-Received-Date: Sat, 04 Aug 2012 19:48:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 4, 2012 at 7:14 PM, Koen Kooi <koen@dominion.thruhere.net> wrot=
e:
>
> Op 4 aug. 2012, om 16:01 heeft Laurentiu Palcu <laurentiu.palcu@intel.com=
> het volgende geschreven:
>
>>
>>
>> On 08/04/2012 12:29 PM, Andreas M=FCller wrote:
>>> On Sat, Aug 4, 2012 at 9:49 AM, Laurentiu Palcu
>>> <laurentiu.palcu@intel.com> wrote:
>>>>
>>>>
>>>> On 08/04/2012 02:22 AM, Andreas M=FCller wrote:
>>>>> On Fri, Aug 3, 2012 at 10:19 PM, Laurentiu Palcu
>>>>> <laurentiu.palcu@intel.com> wrote:
>>>>>> This will improve first boot time because building the icon cache is
>>>>>> done on host, with more processing power than the target.
>>>>>>
>>>>>> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
>>>>>> ---
>>>>>> meta/classes/gtk-icon-cache.bbclass |   10 ++--------
>>>>>> 1 file changed, 2 insertions(+), 8 deletions(-)
>>>>>>
>>>>>> diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-=
icon-cache.bbclass
>>>>>> index 01fb2f3..2d82c54 100644
>>>>>> --- a/meta/classes/gtk-icon-cache.bbclass
>>>>>> +++ b/meta/classes/gtk-icon-cache.bbclass
>>>>>> @@ -1,18 +1,12 @@
>>>>>> FILES_${PN} +=3D "${datadir}/icons/hicolor"
>>>>>>
>>>>>> -DEPENDS +=3D "${@['hicolor-icon-theme', '']['${BPN}' =3D=3D 'hicolo=
r-icon-theme']}"
>>>>>> +DEPENDS +=3D "${@['hicolor-icon-theme', '']['${BPN}' =3D=3D 'hicolo=
r-icon-theme']} gtk+-native"
>>>>>>
>>>>>> -# This could run on the host as icon cache files are architecture i=
ndependent,
>>>>>> -# but there is no gtk-update-icon-cache built natively.
>>>>>> gtk_icon_cache_postinst() {
>>>>>> -if [ "x$D" !=3D "x" ]; then
>>>>>> -        exit 1
>>>>>> -fi
>>>>>> -
>>>>>> # Update the pixbuf loaders in case they haven't been registered yet
>>>>>> GDK_PIXBUF_MODULEDIR=3D${libdir}/gdk-pixbuf-2.0/2.10.0/loaders gdk-p=
ixbuf-query-loaders --update-cache
>>>>>>
>>>>>> -for icondir in /usr/share/icons/* ; do
>>>>>> +for icondir in $D/usr/share/icons/* ; do
>>>>>>     if [ -d $icondir ] ; then
>>>>>>         gtk-update-icon-cache -fqt  $icondir
>>>>>>     fi
>>>>>> --
>>>>>> 1.7.9.5
>>>>>>
>>>>> Long time ago there was a patch introducing gtk-icon-cache to be only
>>>>> run once on the machine [1] and I am still using that. At that time I
>>>>> was asked for a more generic approach. Now I ask:
>>>>>
>>>>> 1. Wouldn't it be better to have gtk-icon-cache run once even on host
>>>> But this is what these patches do. Make gtk-update-icon-cache run on
>>>> host, when the target rootfs is constructed, rather than running it on
>>>> target, at first boot.
>>> As far as I can see gtk-icon-cache is run for each package - how much
>>> extra build time at do_rootfs is to expect?
>> I didn't measure it. But I didn't notice do_roofts task taking a lot
>> more than it took previously. However, host machines these days have
>> lots of MHz under the hood, multiple cores and quite a lot of RAM,
>> compared to target machines. So, I do believe that waiting for some
>> extra tens of seconds at build time is a trade-off we can live with,
>> compared to waiting entire minutes for the target's first boot.
>
> it's about 90 minutes on first boot for beaglebone :)

And less than 3min on overo with the patches we sent (and my xfce
image is full of gtk-icon-update). Don't misunderstand me: I agree on
doing things like this on host if possible. But for me the main time
waiting on a new image is do_rootfs and I just suggest to think about
having these tasks run only once - but we can do this later or never.
A bit off topic: As far as I can remember there were times when it was
a no-go having gtk-native in oe-core. I hope they are over...

Andreas


