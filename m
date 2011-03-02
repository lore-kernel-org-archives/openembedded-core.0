Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PugpO-00074i-ON
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 08:50:34 +0100
Received: by fxm8 with SMTP id 8so5459569fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Mar 2011 23:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=BANxVkX9J7WyX7xy9R73CkOA+6z5TjU7SmZw60k3VdA=;
	b=AcoPmLUon3klk9Yz92SeeAlGvC0HXOC6WoGIsn7kFeWsAeKTdnDmEVTxG3ir7zdL+N
	cWZ8JGqbSu0vvYe3kBQSbGoBagbx0N+zQi3nPcK4sWJ3JnWh4zsD4veLhkjOnC6xGCvL
	XxD3s8UEuGYVoXkZTECt5wAw/tTS8xzyJbD4M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=gSqSsMeixqU4i5Isq+DmhjYiK12g/GI+NQzavQ3s+Y8OK9+sG93vgLZepio8pnTN4F
	X2wcKizPxiun88G7kTBpFFmD0AI011Fm9r0n0g3zYXOc2ZGDKth57JVyPch0PW3s+iza
	PCVxTduNRCPsGNKeF2fhDPpN6Pb1krsnzNVGs=
Received: by 10.223.52.90 with SMTP id h26mr5540590fag.58.1299052145085; Tue,
	01 Mar 2011 23:49:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Tue, 1 Mar 2011 23:48:45 -0800 (PST)
In-Reply-To: <4D6DA1E6.9050004@windriver.com>
References: <1299029911-3973-1-git-send-email-raj.khem@gmail.com>
	<1299029911-3973-2-git-send-email-raj.khem@gmail.com>
	<4D6DA1E6.9050004@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Mar 2011 23:48:45 -0800
Message-ID: <AANLkTinX4VjtU-yo5soykMBXm+NnjcPQbh6r5_c3zMyM@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/6] sqlite3: Update version 3.7.3 -> 3.7.5
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
X-List-Received-Date: Wed, 02 Mar 2011 07:50:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 1, 2011 at 5:48 PM, Mark Hatle <mark.hatle@windriver.com> wrote=
:
> On 3/1/11 7:38 PM, Khem Raj wrote:
>> * Imported from OE commit a2c3af2d608b1b713018d688b00e03873a538993
>> * native version of 3.7.3 does not build
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0meta/recipes-support/sqlite/sqlite3.inc =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 =C2=A07 ++++++-
>> =C2=A0meta/recipes-support/sqlite/sqlite3_3.7.3.bb | =C2=A0 =C2=A08 ----=
----
>> =C2=A0meta/recipes-support/sqlite/sqlite3_3.7.5.bb | =C2=A0 10 +++++++++=
+
>> =C2=A03 files changed, 16 insertions(+), 9 deletions(-)
>> =C2=A0delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.3.bb
>> =C2=A0create mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.5.bb
>>
>> diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-supp=
ort/sqlite/sqlite3.inc
>> index 92c4930..30808a4 100644
>> --- a/meta/recipes-support/sqlite/sqlite3.inc
>> +++ b/meta/recipes-support/sqlite/sqlite3.inc
>> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://www.sqlite.org"
>> =C2=A0SECTION =3D "libs"
>> =C2=A0PRIORITY =3D "optional"
>> =C2=A0DEPENDS =3D "readline ncurses tcl-native"
>> -DEPENDS_virtclass-native =3D "tcl-native"
>> +DEPENDS_virtclass-native =3D "tcl-native ncurses-native"
>> =C2=A0LICENSE =3D "PD"
>>
>> =C2=A0SRC_URI =3D "http://www.sqlite.org/sqlite-${PV}.tar.gz \
>> @@ -32,3 +32,8 @@ FILES_lib${PN}-doc =3D "${docdir} ${mandir} ${infodir}=
"
>> =C2=A0AUTO_LIBNAME_PKGS =3D "lib${PN}"
>>
>> =C2=A0BBCLASSEXTEND =3D "native nativesdk"
>> +
>> +do_compile_prepend() {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake sqlite3.h
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 sqlite3.h ${STAGING_INCDIR}
>> +}
>
> Why is the above chunk needed? =C2=A0This looks like an error to me if sq=
lite doesn't
> use it's own sqlite3.h from the build directory vs the INCDIR.
>
> (or should this actually be do_install_prepend as well?)

Nice you pointed it out. This do_compile_prepend is not required
infact. I will remove this hunk

>
> --Mark
>
>> diff --git a/meta/recipes-support/sqlite/sqlite3_3.7.3.bb b/meta/recipes=
-support/sqlite/sqlite3_3.7.3.bb
>> deleted file mode 100644
>> index 7296aba..0000000
>> --- a/meta/recipes-support/sqlite/sqlite3_3.7.3.bb
>> +++ /dev/null
>> @@ -1,8 +0,0 @@
>> -require sqlite3.inc
>> -
>> -LIC_FILES_CHKSUM =3D "file://src/main.c;endline=3D16;md5=3D86c9b824e9d6=
8f8a26343a4b57f6d85a"
>> -
>> -PR =3D "r1"
>> -
>> -SRC_URI[md5sum] =3D "5437978aae90350cf984993091e0d695"
>> -SRC_URI[sha256sum] =3D "dbf352e8fbb74829f5e7a88f9f6ceeb80a709537f668c36=
e4b6cdfb271309ef6"
>> diff --git a/meta/recipes-support/sqlite/sqlite3_3.7.5.bb b/meta/recipes=
-support/sqlite/sqlite3_3.7.5.bb
>> new file mode 100644
>> index 0000000..212d9e2
>> --- /dev/null
>> +++ b/meta/recipes-support/sqlite/sqlite3_3.7.5.bb
>> @@ -0,0 +1,10 @@
>> +require sqlite3.inc
>> +
>> +LIC_FILES_CHKSUM =3D "file://sqlite3.c;endline=3D19;md5=3Dc1b8048b78396=
1c3ba387c43fd955dc6"
>> +
>> +SRC_URI =3D "http://www.sqlite.org/sqlite-autoconf-3070500.tar.gz"
>> +S =3D "${WORKDIR}/sqlite-autoconf-3070500"
>> +PR =3D "r0"
>> +
>> +SRC_URI[md5sum] =3D "a9604a82613ade2e7f4c303f233e477f"
>> +SRC_URI[sha256sum] =3D "cb5b86926ec9f65882b2dddd244f2d620337d911ec73411=
863f77e48cf6a2f94"
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


