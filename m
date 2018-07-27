Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 154C378C97
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 03:30:49 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id r1-v6so2381768pgp.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 20:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=kp8OgpLYZQCy2TWGq5T2YpppKsf2GF+cUtotrHuOc0Q=;
	b=MCRYaBsDr1eWk3ypXERqusikvj4eg/NmLSxZFeuTRf7G5ZXdvPaqj9xcHLA1NVAM6h
	7ZJRhYlsvpW5FfLzmJYaI+v+hf/D0hvR2u1zgVehaihp5nupHECWghBtIRxTRj4EzklF
	WAogYGeEVd9F5m25VTOo1zLeUI6aC1fEnCIbbXaZmxJ7RxdQz6GWGqEQ9yrcoMjA4ztf
	7arAji37U+0mhmuVDmQr5O4N6ZFupcUzJ6J4N2fy1LRBWF85JEDMJGg3VIzzUOUfYXyb
	ptR6xGhJkWZ1YusvOZzYejVE9+sJBgW1ziso3POb6YEM5ePIpBOyVcWzCK9km1rbPXqN
	Ko0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:organization:message-id:date:user-agent:mime-version:in-reply-to;
	bh=kp8OgpLYZQCy2TWGq5T2YpppKsf2GF+cUtotrHuOc0Q=;
	b=maJmXm2XaEAJSlt4JU5Vpuyth9gYkRxeFVFGi2QgUtbdq46bUr7OTt6LLWq6MEMJKz
	8KIRAZaNucYrPJHnnOuFyXa3GyUg2HgXvxaEDalFFR7UqXClQvXuNueORNRwzdi6BbGp
	pogrd9OEjU0GMUz911YWUSQawRU3YwPZN0IeG7KoARAWdyh11A5R70smbUrT2V1gUt/R
	/Q+S2WPYANBS2LvSWrMbZP17iieB1oG0Wc42Yq5eewHlWwQSplv8Ghmu9xS3czio00yD
	VPASF1Oq7VUzOXIkgIrWfyrMt/llsGHirpsD9snI5ZaMiWDnVyjoBFnlnbslavkAvnM6
	ljaw==
X-Gm-Message-State: AOUpUlE9eakwSKPi1L57VuidJdDoTeYmVl9Il065dPPsrwahwIZ+p+NM
	ZO6IUUePrpiK4/lBxg9UrKBX0Z4Y
X-Google-Smtp-Source: AAOMgpcepu88q/dBZ4PUv2s6sDyvkiHB5a5ekpOvPNCpeaI9TnX3E9/KfB5pgnXYvUKZ65Uuu30Drg==
X-Received: by 2002:a62:3601:: with SMTP id d1-v6mr4807801pfa.41.1532662250677;
	Thu, 26 Jul 2018 20:30:50 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:fdce:954b:eac0:24ad])
	by smtp.gmail.com with ESMTPSA id
	s195-v6sm10168511pgs.76.2018.07.26.20.30.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Jul 2018 20:30:50 -0700 (PDT)
To: Robert Yang <liezhi.yang@windriver.com>,
	Lei Maohui <leimaohui@cn.fujitsu.com>,
	openembedded-core@lists.openembedded.org
References: <1529965666-49307-1-git-send-email-leimaohui@cn.fujitsu.com>
	<b86b2fc6-d464-7c79-1c87-ef5f9d8ffb74@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Organization: HIMVIS LLC
Message-ID: <e30c95ce-8e5e-1978-6bb4-7a4cbe78f1cd@gmail.com>
Date: Thu, 26 Jul 2018 20:30:43 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <b86b2fc6-d464-7c79-1c87-ef5f9d8ffb74@windriver.com>
Subject: Re: [PATCH v2] cross-canadian/libgcc: fix aarch64's multilib SDK
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
X-List-Received-Date: Fri, 27 Jul 2018 03:30:50 -0000
X-Groupsio-MsgNum: 113995
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="GoFfuikfnW0fLltSl5CNliPzb3Os8FKFj"

--GoFfuikfnW0fLltSl5CNliPzb3Os8FKFj
Content-Type: multipart/mixed; boundary="On7h5NcNFPcWTyuiiQsxCa00lwZjsmclS";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>,
 Lei Maohui <leimaohui@cn.fujitsu.com>,
 openembedded-core@lists.openembedded.org
Message-ID: <e30c95ce-8e5e-1978-6bb4-7a4cbe78f1cd@gmail.com>
Subject: Re: [OE-core] [PATCH v2] cross-canadian/libgcc: fix aarch64's
 multilib SDK
References: <1529965666-49307-1-git-send-email-leimaohui@cn.fujitsu.com>
 <b86b2fc6-d464-7c79-1c87-ef5f9d8ffb74@windriver.com>
In-Reply-To: <b86b2fc6-d464-7c79-1c87-ef5f9d8ffb74@windriver.com>

--On7h5NcNFPcWTyuiiQsxCa00lwZjsmclS
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 7/25/18 1:04 AM, Robert Yang wrote:
> Hi Maohui,
>=20
> Thanks for sending it, I do think that oe-core needs this patch.
>=20
> // Robert
>=20
> On 06/26/2018 06:27 AM, Lei Maohui wrote:
>> The arm toolchain has a "-gnueabi" suffix, but aarch64 doesn't,
>> this makes multilib sdk doesn't work, there will be error as following=
:
>>
>> .../usr/libexec/armeb-poky-linux-gux-linux-gnueabi/7.3.0/real-ld:
>> cannot find crtbeginS.o: No such file or directo
>> .../usr/libexec/armeb-poky-linux-gux-linux-gnueabi/7.3.0/real-ld:
>> cannot find -lgcc
>> .../usr/libexec/armeb-poky-linux-gux-linux-gnueabi/7.3.0/real-ld:
>> cannot find -lgcc
>> collect2: error: ld returned 1 exit status
>>

Please test this patch with musl target preferably arm/aarch64
and also ppc/glibc by generating SDKs

>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
>> ---
>> =C2=A0 meta/recipes-devtools/gcc/libgcc-common.inc | 23
>> +++++++++++++++++------
>> =C2=A0 1 file changed, 17 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc
>> b/meta/recipes-devtools/gcc/libgcc-common.inc
>> index 848a476..a49fc98 100644
>> --- a/meta/recipes-devtools/gcc/libgcc-common.inc
>> +++ b/meta/recipes-devtools/gcc/libgcc-common.inc
>> @@ -145,11 +145,22 @@ fakeroot python do_extra_symlinks() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if bb.data.inherits_class('nativesdk', =
d):
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 targetsys =3D d.getVar('BASETARGET_SYS')
>> +=C2=A0=C2=A0=C2=A0 base_targetsys =3D d.getVar('BASETARGET_SYS')
>> +=C2=A0=C2=A0=C2=A0 targetsys =3D d.getVar('TARGET_SYS')
>> +
>> +=C2=A0=C2=A0=C2=A0 if base_targetsys !=3D targetsys:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dest =3D d.getVar('D') + d=
=2EgetVar('libdir') + '/' + base_targetsys
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dest_list =3D [dest]
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # For multilib like aarch6=
4 + arm, need 2 symlinks:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # 1) BASETARGET_SYS as usu=
al
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # 2) BASETARGET_SYS + "-gn=
ueabi" for multilib
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libce =3D d.getVar('LIBCEX=
TENSION')
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 abie =3D d.getVar('ABIEXTE=
NSION')
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if abie and libce and targ=
etsys.endswith(libce + abie):
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de=
st_list.append(dest + libce + abie)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 src =3D targetsys
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for dir in dest_list:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 not os.path.lexists(dir) and
>> os.path.lexists(d.getVar('D', True) + d.getVar('libdir', True)):
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 os.symlink(src, dir)
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 if targetsys !=3D d.getVar('TARGET_SYS'):
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dest =3D d.getVar('D') + d=
=2EgetVar('libdir') + '/' + targetsys
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 src =3D d.getVar('TARGET_S=
YS')
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if not os.path.lexists(des=
t) and
>> os.path.lexists(d.getVar('D') + d.getVar('libdir')):
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 os=
=2Esymlink(src, dest)
>> =C2=A0 }
>>


--On7h5NcNFPcWTyuiiQsxCa00lwZjsmclS--

--GoFfuikfnW0fLltSl5CNliPzb3Os8FKFj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCW1qR4wAKCRC7BTNVkZ0z
FIepAKCA88XuSvEW+kCmz8RX5CRP8ocjVACfV3csGJJQMp5eGWoQaYlmLA7Ke/k=
=/EQe
-----END PGP SIGNATURE-----

--GoFfuikfnW0fLltSl5CNliPzb3Os8FKFj--
