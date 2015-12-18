Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5B7936067D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 04:31:06 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id p187so48394566wmp.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 20:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=d2YXYE6ZZUBA5bKdrW6CmLF7DhOi6bs16iwC9qeBSd8=;
	b=o+/cvdFoFhUH1vCUkOWReoOj6CofR6+lZ9Tgbw6IvB7mKCO1LNO1zM5V1TLn4j722F
	gErAT6i7+6Ft3rLiv6GYsl1hlze5LvPBk5umH6MK1KFNOjrrODUNzHJlU9gYKaAG0lxx
	k5aQ0Yz3gHZKjXfM2nppsnktImFnflaPI7ODsYmeX4kQKN2ZdCauNt4LjjXVfdIpvdq9
	YmG3/pbiYS8xw0Yz083n04Yz4Be6fuGafjcqBBUjLuuC57o40jLkEhV1VvYRSOmKYYNH
	H8JTQMyqJV9hJccGdVX1PdVtRXMWpF1uGXk0q3DUpn/Bgp9/8KURMWZziV4I8Ur/wtsy
	9gOw==
MIME-Version: 1.0
X-Received: by 10.194.203.99 with SMTP id kp3mr1444393wjc.3.1450413066412;
	Thu, 17 Dec 2015 20:31:06 -0800 (PST)
Received: by 10.194.117.68 with HTTP; Thu, 17 Dec 2015 20:31:06 -0800 (PST)
In-Reply-To: <685B7CE0-BE34-4C9F-8A8C-841E3D5A488B@gmail.com>
References: <1450402525-11430-1-git-send-email-armccurdy@gmail.com>
	<1450402525-11430-4-git-send-email-armccurdy@gmail.com>
	<685B7CE0-BE34-4C9F-8A8C-841E3D5A488B@gmail.com>
Date: Thu, 17 Dec 2015 20:31:06 -0800
Message-ID: <CAJ86T=VFLOwED-RTw_CN6id=HATHk5+3hwUpEVN5_BxNc2=V_g@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4 v2] valgrind: make it explicit that valgrind supports armv7a and above
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
X-List-Received-Date: Fri, 18 Dec 2015 04:31:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2015 at 8:14 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Dec 17, 2015, at 5:35 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> Update comments etc and remove usage of the _armv7a over-ride.
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>> meta/recipes-devtools/valgrind/valgrind_3.11.0.bb | 13 ++++++++++---
>> 1 file changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb b/meta/re=
cipes-devtools/valgrind/valgrind_3.11.0.bb
>> index 3dc3cc1..0481c63 100644
>> --- a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
>> +++ b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
>> @@ -26,14 +26,21 @@ SRC_URI =3D "http://www.valgrind.org/downloads/valgr=
ind-${PV}.tar.bz2 \
>> SRC_URI[md5sum] =3D "4ea62074da73ae82e0162d6550d3f129"
>> SRC_URI[sha256sum] =3D "6c396271a8c1ddd5a6fb9abe714ea1e8a86fce85b30ab26b=
4266aeb4c2413b42"
>>
>> -COMPATIBLE_HOST =3D '(i.86|x86_64|mips|powerpc|powerpc64).*-linux'
>> -COMPATIBLE_HOST_armv7a =3D 'arm.*-linux'
>> +COMPATIBLE_HOST =3D '(i.86|x86_64|arm|mips|powerpc|powerpc64).*-linux'
>> +
>> +# valgrind supports armv7 and above
>> +COMPATIBLE_HOST_armv4 =3D 'null'
>> +COMPATIBLE_HOST_armv5 =3D 'null'
>> +COMPATIBLE_HOST_armv6 =3D =E2=80=98null'
>
> I just used it last week with armv5te/qemuarm

Oh, that's good to know. If it works for armv5 then we should probably
just make it available for all arm builds. I'll send a new patch.

>>
>> inherit autotools ptest
>>
>> EXTRA_OECONF =3D "--enable-tls --without-mpicc"
>> -EXTRA_OECONF_armv7a =3D "--enable-tls -host=3Darmv7-none-linux-gnueabi =
--without-mpicc"
>> EXTRA_OECONF +=3D "${@['--enable-only32bit','--enable-only64bit'][d.getV=
ar('SITEINFO_BITS', True) !=3D '32']}"
>> +
>> +# valgrind checks host_cpu "armv7*)", so we need to over-ride the autot=
ools.bbclass default --host option
>> +EXTRA_OECONF_append_arm =3D " --host=3Darmv7${HOST_VENDOR}-${HOST_OS}"
>> +
>> EXTRA_OEMAKE =3D "-w"
>>
>> do_install_append () {
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

