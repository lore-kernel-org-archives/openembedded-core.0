Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pusw8-0007JR-Cv
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 21:46:20 +0100
Received: by fxm8 with SMTP id 8so427228fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Mar 2011 12:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=7XDOtuOfjCyTHQ2otOrfh+B/n3eoFo7g4t/vY36rDuQ=;
	b=uYp6G/UXjkBSiKduEqnAodScVV1YXJHiAIpIoRFN4Ul1O7mpb0rOe6sFPNcqxwytmw
	HZxPpBkOqDakXaJFBA8svzGKK+QkHKvfiuGcwS1xVQMgIWihJSlZ3CFbya3HBtRiu+Pl
	TR1FW9TMA+z4ie2ngWh0mL9zwFt4WldAYYWmI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=gkWDWQGbvjqRR/0jpmmmJHnh4QmIrbgagSdVQJFN5cF/sU2ttueEc0R1iiXyjMX/QU
	F3x2TV6cme+NNrql5YzohXPFVER87cz3AvVjE/1wkHuJj2mF4vg0PpRyx5Z492o+N/Sg
	LwwJuPYITcLee94mvnFnoZB7rEBFwKj5ngFMk=
Received: by 10.223.52.90 with SMTP id h26mr426417fag.58.1299098691465; Wed,
	02 Mar 2011 12:44:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Wed, 2 Mar 2011 12:41:50 -0800 (PST)
In-Reply-To: <4D6E5425.5080107@windriver.com>
References: <1299055045-8096-1-git-send-email-raj.khem@gmail.com>
	<1299055045-8096-2-git-send-email-raj.khem@gmail.com>
	<4D6E5425.5080107@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 Mar 2011 12:41:50 -0800
Message-ID: <AANLkTik0wC3z9xbnnxQHvwXh=JwovA9j8-eR4WBg-+zz@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/7] sqlite3: Update version 3.7.3 -> 3.7.5
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
X-List-Received-Date: Wed, 02 Mar 2011 20:46:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 2, 2011 at 6:28 AM, Mark Hatle <mark.hatle@windriver.com> wrote=
:
> On 3/2/11 2:37 AM, Khem Raj wrote:
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
>> index 92c4930..a5e6782 100644
>> --- a/meta/recipes-support/sqlite/sqlite3.inc
>> +++ b/meta/recipes-support/sqlite/sqlite3.inc
>> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://www.sqlite.org"
>> =C2=A0SECTION =3D "libs"
>> =C2=A0PRIORITY =3D "optional"
>> =C2=A0DEPENDS =3D "readline ncurses tcl-native"
>> -DEPENDS_virtclass-native =3D "tcl-native"
>> +DEPENDS_virtclass-native =3D "tcl-native ncurses-native"
>> =C2=A0LICENSE =3D "PD"
>
> Sorry, I didn't notice this before either. =C2=A0Is ncurses-native and tc=
l-native
> actually needed here?
>
> From what I understand of sqlite, the ncurses is only used when readline =
is
> used. =C2=A0Readline during a virtclass-native build is disabled in the s=
qlite3.inc
> file. =C2=A0(Similarly tcl is also disabled in the sqlite3.inc file.)

I think its probably not needed. In my first build it could not find
ncurses shared library
to link in.  Now why it was looking for despite what you say I dont
know but I dont have
ncurses installed on host and I use no ASSUME_PROVIDED so whatever it needs=
 has
to come from either native sysroot or from build host

my fallout were also related to having a trailing '/' in TMPDIR

TMPDIR =3D /scratch/oe and
TMPDIR =3D /scratch/oe/

are VERY different if I have the latter nothing works ORIGIN gets
wrong relative paths
and no binary from buildhost works this is also seen before

http://www.mail-archive.com/angstrom-distro-devel@linuxtogo.org/msg02922.ht=
ml

but it may not be related to this thread but is something to solve
habing a trailing / should be a no op
>
>
>> =C2=A0SRC_URI =3D "http://www.sqlite.org/sqlite-${PV}.tar.gz \
>> @@ -32,3 +32,8 @@ FILES_lib${PN}-doc =3D "${docdir} ${mandir} ${infodir}=
"
>> =C2=A0AUTO_LIBNAME_PKGS =3D "lib${PN}"
>>
>> =C2=A0BBCLASSEXTEND =3D "native nativesdk"
>> +
>> +#do_compile_prepend() {
>> +# =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake sqlite3.h
>> +# =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 sqlite3.h ${STAGING_INCDIR=
}
>> +#}
>
> Any reason to keep this, or can we just remove the code?
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


