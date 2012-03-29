Received: from mail-qa0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SDKOK-0006Vc-HL
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 20:48:12 +0200
Received: by qao25 with SMTP id 25so330846qao.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 11:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=8N+rUXt5A4ymBUO/6/21sW5BrRC8+OjqsQowqu3toHI=;
	b=DCckxXYAjoaU67es4u631DZJlJuQd3TFQi9EUbu1ANqAi4X+Z0KFYEKYyXjj2cePXi
	1O+vD960y0B8MwpxFot1Qu5CEiuQuPOz/X18kXxofmVp+UUQ4qVfwCzJCh8RQj2A8pAo
	ZgxChb/j27m6HT/eBfxIN86beaSJWXCZ7Zm86BHyUmctb+Hbb4LjDK7jLOhc03ZbgKMx
	KwKlb9Vv1RS06WlMGisJVbXVgfuQtInFDNQEpn6q6jxEEYxxr71pDjYsUzpurzpztDDV
	v800GkLioO9MqYtKztIDiTr6IiW5PhyEDckax0TicklFy/ypWASOTEohbxrUtsHGm1Dm
	zPxA==
Received: by 10.224.203.10 with SMTP id fg10mr1613119qab.66.1333046348599;
	Thu, 29 Mar 2012 11:39:08 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.158.11 with HTTP; Thu, 29 Mar 2012 11:38:47 -0700 (PDT)
In-Reply-To: <4F749060.8020101@windriver.com>
References: <1332877869-12195-1-git-send-email-kergoth@gmail.com>
	<1332877869-12195-3-git-send-email-kergoth@gmail.com>
	<4F72219A.2020301@windriver.com>
	<CABcZANmm5BNHdMtSJJ_P6WNpkgrQ+1vhbHgDg1-9Dc_FXWbhgQ@mail.gmail.com>
	<4F723618.6060104@windriver.com>
	<F4FE715B8B374104BDAF129362EBDD00@gmail.com>
	<4F723B78.2060308@windriver.com>
	<CABcZAN=-uE0_UkROO_abncN3m17Qxy=_kqo-Qg=L_pLNKJ99Hg@mail.gmail.com>
	<CAEsOVNc9s=t77p4iN5DU6FP5=NVe4Lr+ZV=SG2BrZZ6-AtcKng@mail.gmail.com>
	<CABcZANnyVxQsJ6ntV=DTeOtPb3R=d8=JSbny8+iOAT8XV99+UQ@mail.gmail.com>
	<4F7481FE.3020505@windriver.com>
	<CAEsOVNcbLXA-16E+sFhTExa0oZ62bGEXeNmzzjBOvmLaUPAoYg@mail.gmail.com>
	<4F749060.8020101@windriver.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 29 Mar 2012 11:38:47 -0700
X-Google-Sender-Auth: SNsWuKYEFFc0u1ke9eZ63SEYr40
Message-ID: <CABcZANktSbmBpDPvRoiT_44xY0Pn7pKvo_qhF87hF9oSJNungw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] powerpc: define TUNE_PKGARCH for powerpc/powerpc-nf
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
X-List-Received-Date: Thu, 29 Mar 2012 18:48:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 29, 2012 at 9:40 AM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> (This is going to be a bit rambling I'm afraid.. I'm working my way throu=
gh
> investigation and a possible solution.. =C2=A0so be sure to look all the =
way to
> the end..)
>
>
> On 3/29/12 10:58 AM, McClintock Matthew-B29882 wrote:
>>
>> On Thu, Mar 29, 2012 at 10:38 AM, Mark Hatle<mark.hatle@windriver.com>
>> =C2=A0wrote:
>>>
>>> On 3/28/12 11:54 PM, Chris Larson wrote:
>>>>
>>>>
>>>> On Wed, Mar 28, 2012 at 9:47 PM, McClintock Matthew-B29882
>>>> <B29882@freescale.com> =C2=A0 =C2=A0wrote:
>>>>>
>>>>>
>>>>> On Tue, Mar 27, 2012 at 5:16 PM, Chris Larson<clarson@kergoth.com>
>>>>> =C2=A0wrote:
>>>>>>>
>>>>>>>
>>>>>>> If you can explain why the override isn't overriding the default
>>>>>>> TUNE_PKGARCH (and it's intentional and not a bug), and we can
>>>>>>> consistently
>>>>>>> modify all of the elements... I'm happy to accept the changes to al=
l
>>>>>>> of
>>>>>>> the
>>>>>>> tunings.
>>>>>>
>>>>>>
>>>>>>
>>>>>> See above. It's not an override. And plenty of files already specify
>>>>>> TUNE_PKGARCH_tune-<tune>, so I don't see how it'd be inconsistent to
>>>>>> do so for the defaults, personally.
>>>>>
>>>>>
>>>>>
>>>>> If no one else has complained so far it makes me believe they are not
>>>>> missing any TUNE_PKGARCH_tune-<tune> =C2=A0 =C2=A0then.
>>>>
>>>>
>>>>
>>>> I don't understand the point you're attempting to make here.
>>>
>>>
>>>
>>> Just an FYI -- I've not forgotten about this.. I'm going to look into
>>> what
>>> is currently implemented and figure out how to get it to be consistent.=
.
>>> things have definitely changed since the initial implementation, and
>>> things
>>> are no longer consistent.
>>>
>>> Hopefully I'll have an update later today.
>>
>>
>> Just for some background:
>>
>> I added the TUNEPKG_ARCH =3D TUNE_PKGARCH_tune-$DEFAULTTUNE bit because
>> it seemed to make sense and it was missing from this list:
>>
>> meta/conf/bitbake.conf:TUNE_FEATURES ??=3D
>> "${TUNE_FEATURES_tune-${DEFAULTTUNE}}"
>> meta/conf/bitbake.conf:PACKAGE_EXTRA_ARCHS ??=3D
>> "${PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE}}"
>>
>> Also it seemed silly (at the time admittedly) to set TUNE_PKGARCH
>> based off a value in TUNE_FEATURES and using bb functions to do this
>> when the way I went with was simply setting a value. I did miss that
>> the default case no longer works properly unless you have a
>> TUNE_PKGARCH_tune-{powerpc,powerpc-nf,powerpc64} =3D
>> {powerpc,powerpc-nf,powerpc64} set in the default arch files.
>>
>> Anyways, I'm not stuck on one particular method at the time I was
>> trying to get ppce5500 multilib working properly.
>
>
> Ok, that makes a bit more sense.. What I see right now is:
>
> TUNE_PKGARCH ??=3D "${TUNE_PKGARCH_tune-${DEFAULTTUNE}}"
>
> (This was originally designed that TUNE_PKGARCH was defined based on the
> overrides... note, not only has the above affected that, but it's not
> consistent in the other architectures either.. so it was wrong, and is st=
ill
> likely wrong...)
>
> Arm defines it as:
>
> TUNE_PKGARCH =3D "${@d.getVar('ARMPKGARCH',
> True)}${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}${ARMPKGSFX_EABI}${ARMPKGSFX_ENDI=
AN}${ARMPKGSFX_FPU}"
>
> That way the ARMPKGARCH is the base of the configuration, while the DSP,
> ABI, Endian and FPU are added dynamically based on the feature flags (and
> associated settings)..
>
> IA defines is as:
> TUNE_PKGARCH ?=3D "${@bb.utils.contains("TUNE_FEATURES", "m32", "x86",
> "x86_64", d)}"
> TUNE_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "mx32", "_x32", =
"",
> d)}"
>
> And then some (c3, core2, i586) override that, but not all of them.. agai=
n
> this is likely wrong as well..
>
> MIPS defines it as:
>
> TUNE_PKGARCH ?=3D "${TUNE_ARCH}${MIPSPKGSFX_FPU}${MIPSPKGSFX_ABI}"
>
> TUNE_ARCH as:
> TUNE_ARCH =3D "mips${MIPSPKGSFX_BYTE}${MIPSPKGSFX_ENDIAN}
>
> and finally powerpc:
>
> There is NO TUNE_PKGARCH defined.. but there is an append:
>
> TUNE_PKGARCH_append =3D "${PPCPKGSFX_FPU}"
>
> And each of the tunings:
>
> tune-ppc603e.inc:TUNE_PKGARCH_tune-ppc603e =3D "ppc603e"
> tune-ppce300c2.inc:TUNE_PKGARCH_tune-ppce300c2 =3D "ppce300c2"
> tune-ppce500.inc:TUNE_PKGARCH_tune-ppce500 =3D "ppce500"
> tune-ppce500mc.inc:TUNE_PKGARCH_tune-ppce500mc =3D "ppce500mc"
> tune-ppce500v2.inc:TUNE_PKGARCH_tune-ppce500v2 =3D "ppce500v2"
> tune-ppce5500.inc:TUNE_PKGARCH_tune-ppce5500 =3D "ppce5500"
> tune-ppce5500.inc:TUNE_PKGARCH_tune-ppc64e5500 =3D "ppc64e5500"
>
>
> .... =C2=A0so somehow we need to figure out a more consistent approach.
> =C2=A0Personally I prefer the ARM/MIPS style approach. =C2=A0Build up the=
 format using
> a consistent set of features/arguments.

That seems reasonable to me. I personally don't care much about which
approach is used as long as we're consistent about it :)

> The one thing I'm still struggling with though is what is the final purpo=
se
> of these variables. =C2=A0I may be able to make a better determination as=
 to the
> right values if I truly understood the difference. =C2=A0Below is my atte=
mpt at
> understanding this... (let me know if this is correct or if you have
> corrections)
>
> DEFAULTTUNE - The default tuning for a given machine or build
> [multilib build uses overrides to change the DEFAULTTUNE setting], tune
> values are defined by the conf/machine/include/* items
>
> TUNE_FEATURES_tune-<tune> - Should not be manually modified (i.e. not in
> local.conf, only specified by a tune file), but inherited via the
> DEFAULTTUNE value -- this defines the set of tuning variables that a give=
n
> tuning uses to setup cflags, pkgarch, abi, etc..
>
> TUNE_CCARGS - Setup the cflags based on the TUNE_FEATURES settings. =C2=
=A0These
> should be additive when defined using "+=3D". =C2=A0All items in this lis=
t should
> be dynamic! i.e. ${@bb.utils.contains("TUNE_FEATURES", "feature", "cflag"=
,
> "!cflag", d)}
>
> AVAILTUNES - This is a list of all available tunes within the machine
> configuration. =C2=A0This does not mean that all available tunes are comp=
atible
> with that machine configuration, or with each other. =C2=A0The DEFAULTTUN=
E must
> be in this list. =C2=A0Each tuning file can add to this list using "+=3D"=
.
>
> PACKAGE_EXTRA_ARCHS_tune-<tune> - List of all compatible package arches t=
o a
> given tune.
>
> TUNE_ARCH - GNU canonical arch for the architecture. =C2=A0I.e. arm, arme=
b, mips,
> mips64, etc.
>
> TUNE_PKGARCH - The package architecture listed for the purpose of package
> feeds. =C2=A0These are the names used by the PACKAGE_EXTRA_ARCHS for
> compatibility reasons.
>
> TARGET_FPU - The FPU setting for a given architecture, hard (generate
> floating point instructions), soft (generate internal gcc calls), "other"
> architecture specific floating point. =C2=A0This is synchronized with the
> compiler and other toolchain items. =C2=A0This should be dynamically conf=
igured
> in the same way the TUNE_CCARGS is.
>
> BASE_LIB_tune-<tune> - The "/lib" location for a specific ABI.

That's my understanding of those as well, if someone disagrees, it'd
be very interesting to know that. Further, it'd be nice to document
these somewhere.. either documentation.conf, though they're intended
for the bsp maintainers not the average user, or somewhere else
appropriate.

> So how about this for a possible solution:
>
> bitbake.conf:
> Keep - TUNE_FEATURES ??=3D "${TUNE_FEATURES_tune-${DEFAULTTUNE}}"
>
> Remove - TUNE_PKGARCH
>
> In the tuning files, specifically the architectural tuning files:
>
> Require a default setting of TUNE_PKGARCH. =C2=A0The default setting MIGH=
T be
> specific to an arch (as in the ARM case above), or could be
> TUNE_PKGARCH =3D ${TUNE_PKGARCH_tune-${DEFAULTTUNE}} for something like
> PowerPC where it may be easier to specific the exact package arch.
>
> Each architecture file needs a small README to indicate how someone is to
> add a new tuning to that architecture.
>
> ----
>
> Does the above seem reasonable? =C2=A0If so I'll try to get started on th=
at...

That seems reasonable to me, for what that's worth. I could see
simplifying the way the powerpc stuff works in the future, but at
least we'd have something functional for now as well. It keeps primary
responsibility for TUNE_PKGARCH in arch-powerpc*.inc, which is as it
should be -- the arch knows best how to manage it. I'm curious to hear
Matthew's perspective on this.
--=20
Christopher Larson


