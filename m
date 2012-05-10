Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SSKXC-0001Hb-Qk
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 05:59:22 +0200
Received: by eekd49 with SMTP id d49so140226eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2012 20:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=ti5/0EQ0/HCFuwApNSW/1dkEq5nPs3qQebQTL9LR59I=;
	b=y9/tjKCpqh/QbG8UHA8jPHsoCP3KW5NIBXmJrlMG/Ubyyre7KnqvCJv53kS0IwR8Lr
	ojan1wLjwUlAlRkgHhxrW/iriJCwU3QNSmtkwowelgmX8OfX7Xa1gKz69eiKzJfowg62
	jvPn0K+eJWns8JkLRPA7F+oZ25sFXa0ec2YgRaZjB9wjxCkSRdPqMWY3vbWfEHrLfCTm
	yuqSORWiSKi9h5dz659OaR+eaCjDEsyJxHbiyBchcvU9BSsVtEfSskOlqGo67cIn/NXG
	t3Fa5uGbBoqsb1t+GzWZ3xxDQT8BlTBnFCXiFWv23qRcGkJklsAhnogCnilb5WvVfp+/
	U8+w==
Received: by 10.14.187.1 with SMTP id x1mr495002eem.101.1336621769193; Wed, 09
	May 2012 20:49:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Wed, 9 May 2012 20:48:59 -0700 (PDT)
In-Reply-To: <C6370765-E629-4AC5-8C19-76E9554EFCBA@dominion.thruhere.net>
References: <1336118046-20901-1-git-send-email-koen@dominion.thruhere.net>
	<1336295833.23777.60.camel@ted>
	<7CF44BA9-7303-42A9-90AD-B9FAE7ADE00B@dominion.thruhere.net>
	<1336383872.23777.69.camel@ted>
	<C6370765-E629-4AC5-8C19-76E9554EFCBA@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 May 2012 20:48:59 -0700
Message-ID: <CAMKF1sp4BFwod5xi=XEgRqrJ3dQVqQWhSG6kmw9iSVMe0bn5vw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: enable TI shared transport plugin when wifi or bluetooth are requested
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
X-List-Received-Date: Thu, 10 May 2012 03:59:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 7, 2012 at 3:02 AM, Koen Kooi <koen@dominion.thruhere.net> wrot=
e:
>
> Op 7 mei 2012, om 11:44 heeft Richard Purdie het volgende geschreven:
>
>> On Sun, 2012-05-06 at 14:32 +0200, Koen Kooi wrote:
>>> Op 6 mei 2012, om 11:17 heeft Richard Purdie het volgende geschreven:
>>>
>>>> On Fri, 2012-05-04 at 09:54 +0200, Koen Kooi wrote:
>>>>> This plugin manages the firmware loading for the TI wl12xx series of =
bluetooth/wifi/fm chips.
>>>>>
>>>>> The double --enable-tist when both bluetooth and wireless are enabled=
 is ugly, but harmless
>>>>>
>>>>> The background on the plugin: https://bugs.meego.com/show_bug.cgi?id=
=3D8418
>>>>>
>>>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>>>> ---
>>>>>
>>>>> If accepted into master I'd like to have this in the 'denzil' branch =
as well.
>>>>>
>>>>> meta/recipes-connectivity/connman/connman.inc =C2=A0 =C2=A0 | =C2=A0 =
=C2=A04 ++--
>>>>> meta/recipes-connectivity/connman/connman_0.79.bb | =C2=A0 =C2=A02 +-
>>>>> 2 files changed, 3 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/rec=
ipes-connectivity/connman/connman.inc
>>>>> index bfe6620..8b27cfb 100644
>>>>> --- a/meta/recipes-connectivity/connman/connman.inc
>>>>> +++ b/meta/recipes-connectivity/connman/connman.inc
>>>>> @@ -28,8 +28,8 @@ EXTRA_OECONF +=3D "\
>>>>> =C2=A0 =C2=A0--enable-threads \
>>>>> =C2=A0 =C2=A0--enable-loopback \
>>>>> =C2=A0 =C2=A0--enable-ethernet \
>>>>> - =C2=A0 =C2=A0${@base_contains('DISTRO_FEATURES', 'wifi','--enable-w=
ifi', '--disable-wifi', d)} \
>>>>> - =C2=A0 =C2=A0${@base_contains('DISTRO_FEATURES', 'bluetooth','--ena=
ble-bluetooth', '--disable-bluetooth', d)} \
>>>>> + =C2=A0 =C2=A0${@base_contains('DISTRO_FEATURES', 'wifi','--enable-w=
ifi --enable-tist', '--disable-wifi', d)} \
>>>>> + =C2=A0 =C2=A0${@base_contains('DISTRO_FEATURES', 'bluetooth','--ena=
ble-bluetooth --enable-tist', '--disable-bluetooth', d)} \
>>>>> =C2=A0 =C2=A0--enable-dnsproxy \
>>>>> =C2=A0 =C2=A0--enable-ofono \
>>>>> =C2=A0 =C2=A0--enable-tools \
>>>>> diff --git a/meta/recipes-connectivity/connman/connman_0.79.bb b/meta=
/recipes-connectivity/connman/connman_0.79.bb
>>>>> index 4c57dab..d7f22b9 100644
>>>>> --- a/meta/recipes-connectivity/connman/connman_0.79.bb
>>>>> +++ b/meta/recipes-connectivity/connman/connman_0.79.bb
>>>>> @@ -11,4 +11,4 @@ SRC_URI =C2=A0=3D "git://git.kernel.org/pub/scm/net=
work/connman/connman.git \
>>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://test-set-ipv6-method-=
api-fix.patch \
>>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://connman"
>>>>> S =3D "${WORKDIR}/git"
>>>>> -PR =3D "r3"
>>>>> +PR =3D "r4"
>>>>
>>>> This appears to have broken the build on qemuppc:
>>>>
>>>> http://autobuilder.yoctoproject.org:8010/builders/nightly-ppc/builds/3=
69/steps/shell_19/logs/stdio
>>>
>>> That is really weird, since that's defined in ioctl.h in asm-generic/
>>> by the kernel. Does qemuppc have some options for serial ports
>>> disabled in the kernel headers? Since the wl12xx is a regular wifi
>>> chip it should work on ppc, like it does on arm and x86.
>>
>> Its defined in ioctls.h which is a key difference.
>>
>> ioctls.h is a set of default ioctl options which most architectures use
>> but architectures have their own custom definitions. PowerPC is one such
>> architecture, using "t" instead of "T" for tty operations.
>>
>> It seems the powerpc version never needed a version2 so in theory
>>
>> #ifndef TCGETS2
>> #define TCGETS2 TCGETS
>> #define termios2 termios
>> #endif
>>
>> would work but google suggests some potential issues which I don't
>> really want to dig into/understand.

issues are only if someone throws new binaries on older
kernel. I don't think thats an issue for us. above
patch should be ok imo

>>
>> I'm tempted to disable this plugin on powerpc
>
> That's fine by me.
>
>> unless anyone wants to
>> step up with a patch? Using the libc API for this would probably be more
>> portable.
>
> I can look into that after the next angstrom point release, which is ~2 w=
eeks away.
>
> regards,
>
> koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


