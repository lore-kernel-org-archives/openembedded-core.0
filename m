Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3F2E265EE7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Apr 2014 08:59:43 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id p61so6204354wes.25
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Apr 2014 01:59:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=CIpEwahm11QqfJRfz6R1drxTqaTH+tqa3rgoaFwGQ9g=;
	b=TyUjV6mJw7mrqowT7lpAS/qhIoK2OT09u9U7ltu+hXMXMp747A0hjajxZngnP0pVZd
	hsvOzNr2KaPWw5Y1OjwMgC5kRt0vF4hvZ7xNCZ3lv/440Bu1PWbGm1wobLIGeuxhu+aG
	olglXFbejlUu1m9zt91DJbKV1AFDHMp9NsatU0GdAF1mVafqkNjrDYro16436Hy/jLKs
	NI/lUUOJalQTqQ7L2MKnw1SgOe7/ObLJZdWFMCpSXPGDEqbXWy20fO+5CoFKvgSmnfc+
	UPsoR2SBletlvheKxm4VeicLecZOPbhiI485qrBS/nQuqODiha83tCNCG1mAFLcsbFsa
	8DTQ==
X-Gm-Message-State: ALoCoQkIAqiT2fgQh8qrXHBuiNulA9ucn/ga7G+FebLHTKEDdWwA4J6zV2PMughHW/xOyVFJl6lU
X-Received: by 10.180.188.130 with SMTP id ga2mr1821185wic.18.1397293183275;
	Sat, 12 Apr 2014 01:59:43 -0700 (PDT)
Received: from ?IPv6:2001:610:612::a577:209d:8f4f:fd8d?
	([2001:610:612:0:a577:209d:8f4f:fd8d])
	by mx.google.com with ESMTPSA id h10sm9472649wix.2.2014.04.12.01.59.41
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 12 Apr 2014 01:59:42 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <70B26E21-6281-44C1-9126-13DDA4E4495C@dominion.thruhere.net>
Date: Sat, 12 Apr 2014 10:59:38 +0200
Message-Id: <A42FC8E8-E142-4AFE-AD89-1530587D99CC@dominion.thruhere.net>
References: <1389780926-20901-1-git-send-email-koen.kooi@linaro.org>
	<52FB2ADF.70209@linaro.org> <1392193887.7120.191.camel@ted>
	<8F835027-D28B-42A9-B8A7-49E85688B376@dominion.thruhere.net>
	<BA1EAF4A-F798-48CC-A7D1-6E582BB8A001@dominion.thruhere.net>
	<70B26E21-6281-44C1-9126-13DDA4E4495C@dominion.thruhere.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1874)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] grub git: workaround debugedit problems for 64 bit targets
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
X-List-Received-Date: Sat, 12 Apr 2014 08:59:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 8 apr. 2014, om 14:46 heeft Koen Kooi <koen@dominion.thruhere.net> =
het volgende geschreven:

>=20
> Op 13 mrt. 2014, om 10:08 heeft Koen Kooi <koen@dominion.thruhere.net> =
het volgende geschreven:
>=20
>>=20
>> Op 15 feb. 2014, om 11:27 heeft Koen Kooi =
<koen@dominion.thruhere.net> het volgende geschreven:
>>=20
>>>=20
>>> Op 12 feb. 2014, om 09:31 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:
>>>=20
>>>> On Wed, 2014-02-12 at 09:03 +0100, Koen Kooi wrote:
>>>>> On 01/15/2014 11:15 AM, Koen Kooi wrote:
>>>>>> I've limited it to 64bit targets, but to be honest debug =
splitting doesn't make sense for grub since it won't run in your rootfs =
and attaching gdb is pretty much impossible.
>>>>>>=20
>>>>>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>>>>>> ---
>>>>>> meta/recipes-bsp/grub/grub_git.bb | 5 +++++
>>>>>> 1 file changed, 5 insertions(+)
>>>>>>=20
>>>>>> diff --git a/meta/recipes-bsp/grub/grub_git.bb =
b/meta/recipes-bsp/grub/grub_git.bb
>>>>>> index 1796e7f..bc79cfa 100644
>>>>>> --- a/meta/recipes-bsp/grub/grub_git.bb
>>>>>> +++ b/meta/recipes-bsp/grub/grub_git.bb
>>>>>> @@ -51,8 +51,13 @@ do_configure_prepend() {
>>>>>> do_install_append () {
>>>>>>   install -d ${D}${sysconfdir}/grub.d
>>>>>>   install -m 0755 ${WORKDIR}/40_custom =
${D}${sysconfdir}/grub.d/40_custom
>>>>>> +
>>>>>> }
>>>>>>=20
>>>>>> +# debugedit chokes on 64 bit platforms
>>>>>> +INHIBIT_PACKAGE_DEBUG_SPLIT_aarch64 =3D "1"
>>>>>> +INHIBIT_PACKAGE_DEBUG_SPLIT_x86-64 =3D "1"
>>>>>> +
>>>>>> RDEPENDS_${PN} =3D "diffutils freetype"
>>>>>> FILES_${PN}-dbg +=3D "${libdir}/${BPN}/*/.debug"
>>>>>>=20
>>>>>>=20
>>>>>=20
>>>>> Since the package.bbclass change went in yesterday: ping
>>>>=20
>>>> Should we just do this for 64 bit targets or should we be doing it
>>>> unconventionally?
>>>=20
>>> It is needed for every 'bare metal' binary we run through debugedit. =
But for some reason debugedit doesn't choke on 32bit binaries. I'm not =
sure what the right answer is here, I only fixed it for the archs I ran =
into problems myself.=20
>>>=20
>>> I'd be happy to respin this patch if you let me know what the =
preferred solution is.
>>=20
>> Ping
>=20
> Ping again

With my non-work hat on: I can't build grub for 64-bit non-efi targets =
(e.g. my core2quad machine at home) due to this, it would be nice to get =
this into the 'daisy'  branch to fix those buildfailures.

regards,

Koen=

