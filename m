Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SxzX2-0003fE-2r
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 14:02:04 +0200
Received: by eekb57 with SMTP id b57so587130eek.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 04:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=+VONRRXMT2tt780Npusvm8Ad5uuhgj9WNWvep/RJv80=;
	b=mPWb9PWBMG2R9RdUY7LUn5v59W/+rG7rsHLQDg/vR5/PmsJVA3lZ0k+ZGYrRD+YMY6
	VglJk4AaKiL5iDix1JubtDmGF1hVHW7S+20Chb0WRJaedtvzCiOsJ3qv+W1WqGpfuGvs
	x2ccpJyyqAeiKRhUZTody5LC/joRmEeMUyas0YU9HzHbeCgI7oKnZ6qM61P8w+r9ejpX
	MAECCYLlLoziZODTPD9WkV0q4ksxCMdNZv8Pa98SzfeR+N5W1j5mH4YCMG9Dh3u9ysk7
	unMhMntWps4gvDds0GQuPWo3n+MznAFnEDBiW1Xl85F4OOKwGo0HCq/eazkrgceEiCXG
	p1jg==
Received: by 10.14.0.198 with SMTP id 46mr3000265eeb.30.1344167420845;
	Sun, 05 Aug 2012 04:50:20 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id 9sm39346274eei.12.2012.08.05.04.50.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 04:50:19 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CALbNGRRLGToMpW2tCzdtEcpZmAmgK3d2VKF0SVi-hgBanFOexQ@mail.gmail.com>
Date: Sun, 5 Aug 2012 13:50:24 +0200
Message-Id: <F3831105-91D9-4F46-8DC3-48E491FC6532@dominion.thruhere.net>
References: <cover.1344022584.git.laurentiu.palcu@intel.com>
	<b41b2c46c9de5d3f63bfa146e23e8974a7a6cebf.1344022584.git.laurentiu.palcu@intel.com>
	<CALbNGRQjUxm0h2+YA=Tog2_JhWPKGJmdy9QyhOjSQWLRQ1eKOQ@mail.gmail.com>
	<501CD3EE.3080100@intel.com>
	<CALbNGRTJM5=Xt4NqoEuEQa2U-eMtmQzy42HmwRK0zvkq-zK-3Q@mail.gmail.com>
	<501D2B2B.6070806@intel.com>
	<3103BB42-D7DD-456B-8733-9A019CA66E99@dominion.thruhere.net>
	<CALbNGRRLGToMpW2tCzdtEcpZmAmgK3d2VKF0SVi-hgBanFOexQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQm1QIZP8nrctEOUUFC0xezG6HnB8A59lhTnqOuhmlWshqN5FID3OWKlBgGN8cvcAtvBfDlL
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
X-List-Received-Date: Sun, 05 Aug 2012 12:02:04 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 4 aug. 2012, om 21:37 heeft Andreas M=FCller =
<schnitzeltony@googlemail.com> het volgende geschreven:

> On Sat, Aug 4, 2012 at 7:14 PM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>>=20
>> Op 4 aug. 2012, om 16:01 heeft Laurentiu Palcu =
<laurentiu.palcu@intel.com> het volgende geschreven:
>>=20
>>>=20
>>>=20
>>> On 08/04/2012 12:29 PM, Andreas M=FCller wrote:
>>>> On Sat, Aug 4, 2012 at 9:49 AM, Laurentiu Palcu
>>>> <laurentiu.palcu@intel.com> wrote:
>>>>>=20
>>>>>=20
>>>>> On 08/04/2012 02:22 AM, Andreas M=FCller wrote:
>>>>>> On Fri, Aug 3, 2012 at 10:19 PM, Laurentiu Palcu
>>>>>> <laurentiu.palcu@intel.com> wrote:
>>>>>>> This will improve first boot time because building the icon =
cache is
>>>>>>> done on host, with more processing power than the target.
>>>>>>>=20
>>>>>>> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
>>>>>>> ---
>>>>>>> meta/classes/gtk-icon-cache.bbclass |   10 ++--------
>>>>>>> 1 file changed, 2 insertions(+), 8 deletions(-)
>>>>>>>=20
>>>>>>> diff --git a/meta/classes/gtk-icon-cache.bbclass =
b/meta/classes/gtk-icon-cache.bbclass
>>>>>>> index 01fb2f3..2d82c54 100644
>>>>>>> --- a/meta/classes/gtk-icon-cache.bbclass
>>>>>>> +++ b/meta/classes/gtk-icon-cache.bbclass
>>>>>>> @@ -1,18 +1,12 @@
>>>>>>> FILES_${PN} +=3D "${datadir}/icons/hicolor"
>>>>>>>=20
>>>>>>> -DEPENDS +=3D "${@['hicolor-icon-theme', '']['${BPN}' =3D=3D =
'hicolor-icon-theme']}"
>>>>>>> +DEPENDS +=3D "${@['hicolor-icon-theme', '']['${BPN}' =3D=3D =
'hicolor-icon-theme']} gtk+-native"
>>>>>>>=20
>>>>>>> -# This could run on the host as icon cache files are =
architecture independent,
>>>>>>> -# but there is no gtk-update-icon-cache built natively.
>>>>>>> gtk_icon_cache_postinst() {
>>>>>>> -if [ "x$D" !=3D "x" ]; then
>>>>>>> -        exit 1
>>>>>>> -fi
>>>>>>> -
>>>>>>> # Update the pixbuf loaders in case they haven't been registered =
yet
>>>>>>> GDK_PIXBUF_MODULEDIR=3D${libdir}/gdk-pixbuf-2.0/2.10.0/loaders =
gdk-pixbuf-query-loaders --update-cache
>>>>>>>=20
>>>>>>> -for icondir in /usr/share/icons/* ; do
>>>>>>> +for icondir in $D/usr/share/icons/* ; do
>>>>>>>    if [ -d $icondir ] ; then
>>>>>>>        gtk-update-icon-cache -fqt  $icondir
>>>>>>>    fi
>>>>>>> --
>>>>>>> 1.7.9.5
>>>>>>>=20
>>>>>> Long time ago there was a patch introducing gtk-icon-cache to be =
only
>>>>>> run once on the machine [1] and I am still using that. At that =
time I
>>>>>> was asked for a more generic approach. Now I ask:
>>>>>>=20
>>>>>> 1. Wouldn't it be better to have gtk-icon-cache run once even on =
host
>>>>> But this is what these patches do. Make gtk-update-icon-cache run =
on
>>>>> host, when the target rootfs is constructed, rather than running =
it on
>>>>> target, at first boot.
>>>> As far as I can see gtk-icon-cache is run for each package - how =
much
>>>> extra build time at do_rootfs is to expect?
>>> I didn't measure it. But I didn't notice do_roofts task taking a lot
>>> more than it took previously. However, host machines these days have
>>> lots of MHz under the hood, multiple cores and quite a lot of RAM,
>>> compared to target machines. So, I do believe that waiting for some
>>> extra tens of seconds at build time is a trade-off we can live with,
>>> compared to waiting entire minutes for the target's first boot.
>>=20
>> it's about 90 minutes on first boot for beaglebone :)
>=20
> And less than 3min on overo with the patches we sent (and my xfce
> image is full of gtk-icon-update). Don't misunderstand me: I agree on
> doing things like this on host if possible. But for me the main time
> waiting on a new image is do_rootfs and I just suggest to think about
> having these tasks run only once - but we can do this later or never.
> A bit off topic: As far as I can remember there were times when it was
> a no-go having gtk-native in oe-core. I hope they are over...

I never bought the arguments against gtk-native, so I hope common sense =
prevails and we can do the icon-cache stuff on the host.=20=


