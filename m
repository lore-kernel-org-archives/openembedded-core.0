Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steve@sakoman.com>) id 1RrufB-0001Si-Ot
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 18:05:05 +0100
Received: by bkaq10 with SMTP id q10so3496412bka.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 08:57:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.205.141.76 with SMTP id jd12mr9048729bkc.42.1327942632653;
	Mon, 30 Jan 2012 08:57:12 -0800 (PST)
Received: by 10.204.35.135 with HTTP; Mon, 30 Jan 2012 08:57:12 -0800 (PST)
X-Originating-IP: [74.41.60.154]
In-Reply-To: <4F26C678.2080305@linux.intel.com>
References: <1327936840-13937-1-git-send-email-steve@sakoman.com>
	<1327936840-13937-4-git-send-email-steve@sakoman.com>
	<4F26C678.2080305@linux.intel.com>
Date: Mon, 30 Jan 2012 08:57:12 -0800
Message-ID: <CAOSpxdZcJQcU5pWRY6yvaETKvOErM4DkQEfOMBEcQ_NvDCYBUA@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] gnupg: add recipe for 2.0.18
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
X-List-Received-Date: Mon, 30 Jan 2012 17:05:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2012 at 8:34 AM, Saul Wold <sgw@linux.intel.com> wrote:
> On 01/30/2012 07:20 AM, Steve Sakoman wrote:
>>
>> GnuPG 2.0 is the new modularized version of GnuPG supporting OpenPGP and
>> S/MIME
>>
>> Signed-off-by: Steve Sakoman<steve@sakoman.com>
>> ---
>> =A0meta/recipes-extended/gnupg/gnupg_2.0.18.bb | =A0 24
>> ++++++++++++++++++++++++
>> =A01 files changed, 24 insertions(+), 0 deletions(-)
>> =A0create mode 100644 meta/recipes-extended/gnupg/gnupg_2.0.18.bb
>>
>> diff --git a/meta/recipes-extended/gnupg/gnupg_2.0.18.bb
>> b/meta/recipes-extended/gnupg/gnupg_2.0.18.bb
>> new file mode 100644
>> index 0000000..c56f3d5
>> --- /dev/null
>> +++ b/meta/recipes-extended/gnupg/gnupg_2.0.18.bb
>> @@ -0,0 +1,24 @@
>> +DESCRIPTION =3D "gnupg - GNU privacy guard"
>> +LICENSE =3D "GPLv2+"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df27defe1e96c2e1ecd4e0c9be896=
7949"
>> +
>> +DEPENDS =3D "pth libassuan libksba zlib bzip2 readline"
>> +
>> +inherit autotools gettext
>> +
>> +SRC_URI =3D "ftp://ftp.gnupg.org/gcrypt/gnupg/gnupg-${PV}.tar.bz2"
>> +
>> +SRC_URI[md5sum] =3D "2f37e0722666a0fedbe4d9f9227ac4d7"
>> +SRC_URI[sha256sum] =3D
>> "48aedd762ca443fb952a9e859efe3c66706d7c2c9c77c32dbdbac4fe962dae5b"
>> +
>> +S =3D "${WORKDIR}/gnupg-${PV}"
>> +
>> +EXTRA_OECONF =3D "--disable-ldap \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 --with-zlib=3D${STAGING_LIBDIR}/.. \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 --with-bzip2=3D${STAGING_LIBDIR}/.. \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--with-readline=3D${STAGING_LIBDIR}/.. =
\
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "
>> +
>> +do_install_append() {
>> + =A0 =A0 =A0 ln -sf gpg2 ${D}${bindir}/gpg
>> +}
>
>
> This recipe along with libksba, would should live in recipes-support, as
> they "support" functionality provided elsewhere.

OK, will resubmit with that change.

Steve


