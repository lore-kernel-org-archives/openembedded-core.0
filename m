Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Sxi6j-0002MC-OE
	for openembedded-core@lists.openembedded.org;
	Sat, 04 Aug 2012 19:25:45 +0200
Received: by eaad12 with SMTP id d12so462055eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Aug 2012 10:14:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=0re8EcCl7u+xH1xmroKGanbr4cN1f7D4x0nYsHaXpiQ=;
	b=hXBtAfnhkeO7FGpLzaKg1ZgVjaOtydnWKHziLPF4IaiJ0MXBoVDVPMOXZ2oFf2J/d8
	Q3eHk/zItNO/oMT2Z4Yj16i84sqzBFKqSSRdtespE2injTQTRlAWPEsDobbH8WVjq9S7
	6fQ/NLDAppsP2yVWvOgCJffvIWgCK2MnbNWx/MTfC5FvVcadn6fm54mUMKMAne2avwbU
	FzF/uv3VL2o09t2+O29BFhxX+qJy579rsZ7sS0pYee85XkhopYtVSzQgIlnCYZhkkERm
	g5f4i4ASKcG6QWyt9Kn6ksN2ELT7N+uZlrXFZYS+UF71MzhEx30HZjq0JZhGZQA868cN
	ArJg==
Received: by 10.14.208.133 with SMTP id q5mr6699634eeo.9.1344100443507;
	Sat, 04 Aug 2012 10:14:03 -0700 (PDT)
Received: from ?IPv6:2001:610:612::2566:5e0b:9902:bbea?
	([2001:610:612:0:2566:5e0b:9902:bbea])
	by mx.google.com with ESMTPS id o47sm34159320eem.0.2012.08.04.10.14.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 04 Aug 2012 10:14:02 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <501D2B2B.6070806@intel.com>
Date: Sat, 4 Aug 2012 19:14:01 +0200
Message-Id: <3103BB42-D7DD-456B-8733-9A019CA66E99@dominion.thruhere.net>
References: <cover.1344022584.git.laurentiu.palcu@intel.com>
	<b41b2c46c9de5d3f63bfa146e23e8974a7a6cebf.1344022584.git.laurentiu.palcu@intel.com>
	<CALbNGRQjUxm0h2+YA=Tog2_JhWPKGJmdy9QyhOjSQWLRQ1eKOQ@mail.gmail.com>
	<501CD3EE.3080100@intel.com>
	<CALbNGRTJM5=Xt4NqoEuEQa2U-eMtmQzy42HmwRK0zvkq-zK-3Q@mail.gmail.com>
	<501D2B2B.6070806@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQk+XtmJXXafjJzh9D+N7NWojPFcQCYSNpwlfzxbrDO1lQDyXYD8wSOd2DnIDP0JZ+NiLCzA
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
X-List-Received-Date: Sat, 04 Aug 2012 17:25:45 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 4 aug. 2012, om 16:01 heeft Laurentiu Palcu =
<laurentiu.palcu@intel.com> het volgende geschreven:

>=20
>=20
> On 08/04/2012 12:29 PM, Andreas M=FCller wrote:
>> On Sat, Aug 4, 2012 at 9:49 AM, Laurentiu Palcu
>> <laurentiu.palcu@intel.com> wrote:
>>>=20
>>>=20
>>> On 08/04/2012 02:22 AM, Andreas M=FCller wrote:
>>>> On Fri, Aug 3, 2012 at 10:19 PM, Laurentiu Palcu
>>>> <laurentiu.palcu@intel.com> wrote:
>>>>> This will improve first boot time because building the icon cache =
is
>>>>> done on host, with more processing power than the target.
>>>>>=20
>>>>> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
>>>>> ---
>>>>> meta/classes/gtk-icon-cache.bbclass |   10 ++--------
>>>>> 1 file changed, 2 insertions(+), 8 deletions(-)
>>>>>=20
>>>>> diff --git a/meta/classes/gtk-icon-cache.bbclass =
b/meta/classes/gtk-icon-cache.bbclass
>>>>> index 01fb2f3..2d82c54 100644
>>>>> --- a/meta/classes/gtk-icon-cache.bbclass
>>>>> +++ b/meta/classes/gtk-icon-cache.bbclass
>>>>> @@ -1,18 +1,12 @@
>>>>> FILES_${PN} +=3D "${datadir}/icons/hicolor"
>>>>>=20
>>>>> -DEPENDS +=3D "${@['hicolor-icon-theme', '']['${BPN}' =3D=3D =
'hicolor-icon-theme']}"
>>>>> +DEPENDS +=3D "${@['hicolor-icon-theme', '']['${BPN}' =3D=3D =
'hicolor-icon-theme']} gtk+-native"
>>>>>=20
>>>>> -# This could run on the host as icon cache files are architecture =
independent,
>>>>> -# but there is no gtk-update-icon-cache built natively.
>>>>> gtk_icon_cache_postinst() {
>>>>> -if [ "x$D" !=3D "x" ]; then
>>>>> -        exit 1
>>>>> -fi
>>>>> -
>>>>> # Update the pixbuf loaders in case they haven't been registered =
yet
>>>>> GDK_PIXBUF_MODULEDIR=3D${libdir}/gdk-pixbuf-2.0/2.10.0/loaders =
gdk-pixbuf-query-loaders --update-cache
>>>>>=20
>>>>> -for icondir in /usr/share/icons/* ; do
>>>>> +for icondir in $D/usr/share/icons/* ; do
>>>>>     if [ -d $icondir ] ; then
>>>>>         gtk-update-icon-cache -fqt  $icondir
>>>>>     fi
>>>>> --
>>>>> 1.7.9.5
>>>>>=20
>>>> Long time ago there was a patch introducing gtk-icon-cache to be =
only
>>>> run once on the machine [1] and I am still using that. At that time =
I
>>>> was asked for a more generic approach. Now I ask:
>>>>=20
>>>> 1. Wouldn't it be better to have gtk-icon-cache run once even on =
host
>>> But this is what these patches do. Make gtk-update-icon-cache run on
>>> host, when the target rootfs is constructed, rather than running it =
on
>>> target, at first boot.
>> As far as I can see gtk-icon-cache is run for each package - how much
>> extra build time at do_rootfs is to expect?
> I didn't measure it. But I didn't notice do_roofts task taking a lot
> more than it took previously. However, host machines these days have
> lots of MHz under the hood, multiple cores and quite a lot of RAM,
> compared to target machines. So, I do believe that waiting for some
> extra tens of seconds at build time is a trade-off we can live with,
> compared to waiting entire minutes for the target's first boot.

it's about 90 minutes on first boot for beaglebone :)=


