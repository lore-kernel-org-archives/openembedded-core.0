Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1ShyLN-0000Uj-78
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 09:31:49 +0200
Received: by eaal1 with SMTP id l1so457926eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2012 00:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=Lpm4FDqMs+91LBacDDi8XjRWw2XVg8Cyeg9EZ1j6Hr0=;
	b=RF7C9hRJfNE0jCxSZmIVJ2C7wKU0Hy86S8DkNuAk8LirF0+5dpIGTnuqF9dT5NEKmm
	vKag9s056Ubeq+gZw6cMVHeZQXpTTne6uF81qj3Q27PROzZ8VaOEzP+RLGi3j16Sz0+9
	vc4r0X9XLbumJFvR5tJY5/GTWtBZKYyL2HEnzR0cMWHjNPGAqQf+MTnQByMt9iTHIXKK
	bnAO1EPbHG9o6adFODwEkpgMXYyCwE+R5elNhMIWFbFmcPxSLrkdenIJc474gPE7kkqT
	f4sJ8qNa52m4bW5YaumEDfSTqCYWJM/hahsK5C+ceT7dmpk/jAtGGiUVTuBaA/UKSSTb
	zzhA==
Received: by 10.14.37.132 with SMTP id y4mr189783eea.142.1340349662168; Fri,
	22 Jun 2012 00:21:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.219.71 with HTTP; Fri, 22 Jun 2012 00:20:31 -0700 (PDT)
In-Reply-To: <20120622063756.GK9352@jama.jama.net>
References: <cover.1340205163.git.raj.khem@gmail.com>
	<a1ca534609d8ae49a16b9d28cc9e92db0894c4e4.1340205163.git.raj.khem@gmail.com>
	<20120622063756.GK9352@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Jun 2012 00:20:31 -0700
Message-ID: <CAMKF1spK9RwuhfGoTSPCEGvnKRcYfYPHGo0EdktwXdthP6uncA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] gcc-4.7: Update to tip of gcc-4_7-branch since 4.7.1 has been out
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
X-List-Received-Date: Fri, 22 Jun 2012 07:31:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 21, 2012 at 11:37 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Wed, Jun 20, 2012 at 08:18:37AM -0700, Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0meta/recipes-devtools/gcc/gcc-4.7.inc | =C2=A0 12 ++++++------
>> =C2=A01 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtoo=
ls/gcc/gcc-4.7.inc
>> index 34a73b1..25a1088 100644
>> --- a/meta/recipes-devtools/gcc/gcc-4.7.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
>> @@ -3,12 +3,12 @@ require gcc-common.inc
>> =C2=A0PR =3D "r2"
>>
>> =C2=A0# Third digit in PV should be incremented after a minor release
>> -# happens from this branch on gcc e.g. currently its 4.7.0
>> -# when 4.7.1 is releases and we bump SRCREV beyond the release
>> -# on branch then PV should be incremented to 4.7.1+svnr${SRCPV}
>> +# happens from this branch on gcc e.g. currently its 4.7.1
>> +# when 4.7.2 is releases and we bump SRCREV beyond the release
>> +# on branch then PV should be incremented to 4.7.2+svnr${SRCPV}
>> =C2=A0# to reflect that change
>>
>> -PV =3D "4.7.0+svnr${SRCPV}"
>> +PV =3D "4.7.1+svnr${SRCPV}"
>>
>> =C2=A0# BINV should be incremented after updating to a revision
>> =C2=A0# after a minor gcc release (e.g. 4.7.1 or 4.7.2) has been made
>> @@ -16,9 +16,9 @@ PV =3D "4.7.0+svnr${SRCPV}"
>> =C2=A0# 4.7.1 then the value below will have 2 which will mean 4.7.2
>> =C2=A0# which will be next minor release and so on.
>>
>> -BINV =3D "4.7.1"
>> +BINV =3D "4.7.2"
>>
>> -SRCREV =3D "186651"
>> +SRCREV =3D "188658"
>> =C2=A0BRANCH =3D "gcc-4_7-branch"
>> =C2=A0FILESPATH =3D "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.7' ]=
, d)}"
>
> I'm not sure if this one is new, but libgcc now reports unpackaged
> file:
>
> NOTE: package libgcc-4.7.1+svnr188658-r2: task do_package: Started
> WARNING: For recipe libgcc, the following files/directories were
> installed but not shipped in any package:
> WARNING: =C2=A0 /usr/lib/arm-oe-linux-gnueabi/4.7.2/include
> WARNING: =C2=A0 /usr/lib/arm-oe-linux-gnueabi/4.7.2/include/unwind.h

can you see couple of things 1. if this file is being generated and
installed during libgcc build or if its coming from the bits that are
stashed away from gcc-cross build

this file should not be packaged with libgcc so right solution will be
to delete this file
>
> And the problem with (sometimes) missing or corrupt header file is still =
there:
> | /OE/shr-core/tmp-eglibc/work-shared/gcc-4.7.1+svnr188658-r2/gcc-4_7-bra=
nch/gcc/dwarf2out.c:8383:6: warning: format not a string literal and no for=
mat arguments [-Wformat-security]
> | gcc -c =C2=A0 -isystem/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr=
/include -O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE =C2=A0-W -Wall -Wwr=
ite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wmissing-=
format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno-overlen=
gth-strings -Wold-style-definition -Wc++-compat =C2=A0 -DHAVE_CONFIG_H -I. =
-I. -I/OE/shr-core/tmp-eglibc/work-shared/gcc-4.7.1+svnr188658-r2/gcc-4_7-b=
ranch/gcc -I/OE/shr-core/tmp-eglibc/work-shared/gcc-4.7.1+svnr188658-r2/gcc=
-4_7-branch/gcc/. -I/OE/shr-core/tmp-eglibc/work-shared/gcc-4.7.1+svnr18865=
8-r2/gcc-4_7-branch/gcc/../include -I/OE/shr-core/tmp-eglibc/work-shared/gc=
c-4.7.1+svnr188658-r2/gcc-4_7-branch/gcc/../libcpp/include =C2=A0-I/OE/shr-=
core/tmp-eglibc/work-shared/gcc-4.7.1+svnr188658-r2/gcc-4_7-branch/gcc/../l=
ibdecnumber -I/OE/shr-core/tmp-eglibc/work-shared/gcc-4.7.1+svnr188658-r2/g=
cc-4_7-branch/gcc/../libdecnumber/dpd -I../libdecnumber =C2=A0 =C2=A0/OE/sh=
r-core/tmp-eglibc/work-shared/gcc-4.7.1+svnr188658-r2/gcc-4_7-branch/gcc/em=
it-rtl.c -o emit-rtl.o
> | /OE/shr-core/tmp-eglibc/work-shared/gcc-4.7.1+svnr188658-r2/gcc-4_7-bra=
nch/gcc/emit-rtl.c:42:17: fatal error: rtl.h: No such file or directory
> | compilation terminated.
> Restarting build helps again..
>

this is intriguing we should look into it can you explain (once again
how can I reproduce it)

> Cheers,
>
> --
> Martin 'JaMa' Jansa =C2=A0 =C2=A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


