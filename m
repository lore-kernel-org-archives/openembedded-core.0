Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QqbMx-0004SO-TT
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 03:44:36 +0200
Received: by pzk2 with SMTP id 2so4417425pzk.34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2011 18:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=F/IQRnO65oy9Fqek1pJjr2/SGRv5i1T4xb5pj9EeksY=;
	b=qQHb40gNhS7yT09h0RNpHhhojRT9vVU/l2IwKjVnSqPa98B9IyEInY18o8FyPQ2IZu
	VlKCh26iKGuWu6UGtBV86VrChgixhkqpkRIfN3TXRSbr/8Kjn7VGiWIaLlN8vqqk5N5+
	8Eup1SdojHZ2/E8WYoMK3lj+yDoNufcBpKpw8=
Received: by 10.142.213.9 with SMTP id l9mr42003wfg.233.1312854006175; Mon, 08
	Aug 2011 18:40:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.46.137 with HTTP; Mon, 8 Aug 2011 18:39:36 -0700 (PDT)
In-Reply-To: <840A81C1B782724A8EB52725BD519EFF1832C5@MBX20.4emm.local>
References: <840A81C1B782724A8EB52725BD519EFF1832C5@MBX20.4emm.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Aug 2011 18:39:36 -0700
Message-ID: <CAMKF1spMJyBDYowk-Bb9szzAM2RuxoRm=GLnURz_qfryePccmw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: gcc version mismatch in sdk generation
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
X-List-Received-Date: Tue, 09 Aug 2011 01:44:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 8, 2011 at 6:33 PM, James Limbouris
<james@digitalmatter.com.au> wrote:
> On Tue Aug 9 01:25:55 CEST 2011, Richard Purdie wrote:
>>On Mon, 2011-08-08 at 05:02 +0000, James Limbouris wrote:
>>> Hi,
>>>
>>> In oe-core, with Angstrom 2010.x, generating an sdk with:
>>>
>>> bitbake meta-toolchain-qte
>>>
>>> is giving me a toolchain with gcc-4.6.1 binaries in the i686 sysroot, b=
ut
>>> gcc-4.5.4 runtime libraries in the arm (target) sysroot. The sdk can't
>>> link until a symlink is installed to trick it into using the 4.5.4 libr=
aries.
>>>
>>> I've checked the preferred versions, but they seem to be set consistent=
ly
>>> in the disto's conf file, at least as far as I can see.
>>>
>>> 'bitbake -s | grep gcc' gives:
>>> gcc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :4.5-r39.1+svnr=
176640
>>> gcc-cross =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :4.5-r39.2+svnr176640
>>> gcc-cross-canadian-arm =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0:4.5-r39.0+svnr176640
>>> gcc-cross-initial =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 :4.5-r39.0+svnr176640
>>> gcc-cross-intermediate =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0:4.5-r39.0+svnr176640
>>> gcc-crosssdk =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:4.5-r39.0+svnr176640
>>> gcc-crosssdk-initial =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0:4.5-r39.0+svnr176640
>>> gcc-crosssdk-intermediate =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 :4.5-r39.0+svnr176640
>>> gcc-runtime =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :4.5-r39.1+svnr176640
>>> gcc-runtime-nativesdk =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0:4.6.1+svnr175454-r5 =C2=A0 =C2=A0 :4.5-r39.1+svnr17664=
0
>>> gccmakedep =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 1:1.0.2-r3
>>> libgcc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:4.5-r39.1+svnr17664=
0
>>> libgcc-nativesdk =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :4.6.1+svnr175454-r3 =C2=A0 =C2=A0 :4.5-r39=
.1+svnr176640
>>
>> The nativesdk and crosssdk versions need to match at the very least.
>>
>> Cheers,
>>
>> Richard
>
> Yes - that's what is so confusing. They seem to match in the Angstrom con=
f:


what does SDKGCCVERSION contain ?

>
> #Everybody else can just use this:
> ANGSTROM_GCC_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ?=3D "4.5"
>
> ANGSTROM_BINUTILS_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0?=3D "2.20.1"
>
> PREFERRED_VERSION_binutils =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ?=3D "${ANGSTROM_BINUTILS_VERSION}"
> PREFERRED_VERSION_binutils-cross =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ?=3D "${ANGSTROM_BINUTILS_VERSION}"
> PREFERRED_VERSION_binutils-crosssdk =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0?=3D "${ANGSTROM_BINUTILS_VERSION}"
> PREFERRED_VERSION_binutils-cross-canadian =C2=A0 =C2=A0 =C2=A0 =C2=A0?=3D=
 "${ANGSTROM_BINUTILS_VERSION}"
>
> PREFERRED_VERSION_gcc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0?=3D "${ANGSTROM_GCC_VERSIO=
N}"
> PREFERRED_VERSION_gcc-cross =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0?=3D "${ANGSTROM_GCC_VERSION}"
> PREFERRED_VERSION_gcc-cross-initial =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0?=3D "${ANGSTROM_GCC_VERSION}"
> PREFERRED_VERSION_gcc-cross-intermediate =C2=A0 =C2=A0 =C2=A0 =C2=A0 ?=3D=
 "${ANGSTROM_GCC_VERSION}"
> PREFERRED_VERSION_gcc-cross-canadian =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ?=3D "${ANGSTROM_GCC_VERSION}"
> PREFERRED_VERSION_gcc-crosssdk =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ?=3D "${ANGSTROM_GCC_VERSION}"
> PREFERRED_VERSION_gcc-crosssdk-initial =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ?=3D "${ANGSTROM_GCC_VERSION}"
> PREFERRED_VERSION_gcc-crosssdk-intermediate =C2=A0 =C2=A0 =C2=A0?=3D "${A=
NGSTROM_GCC_VERSION}"
> PREFERRED_VERSION_gcc-runtime =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0?=3D "${ANGSTROM_GCC_VERSION}"
> PREFERRED_VERSION_gcc-runtime-nativesdk =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0?=3D "${ANGSTROM_GCC_VERSION}"
> PREFERRED_VERSION_libgcc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ?=3D "${ANGSTROM_GCC_VERSION}"
> PREFERRED_VERSION_libgcc-nativesdk =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ?=3D "${ANGSTROM_GCC_VERSION}"
>
> Regards
> James Limbouris
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


