Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steve@sakoman.com>) id 1RrvlF-00048w-VT
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 19:15:26 +0100
Received: by bkaq10 with SMTP id q10so3575705bka.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 10:07:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.204.146.14 with SMTP id f14mr146551bkv.132.1327946471481; Mon,
	30 Jan 2012 10:01:11 -0800 (PST)
Received: by 10.204.35.135 with HTTP; Mon, 30 Jan 2012 10:01:11 -0800 (PST)
X-Originating-IP: [74.41.60.154]
In-Reply-To: <CAMKF1spTSFxJzq17PHMwg=ps3G8zvnXpfQjvYeK-krN1NEgYRA@mail.gmail.com>
References: <1327936840-13937-1-git-send-email-steve@sakoman.com>
	<1327936840-13937-3-git-send-email-steve@sakoman.com>
	<CAMKF1spTSFxJzq17PHMwg=ps3G8zvnXpfQjvYeK-krN1NEgYRA@mail.gmail.com>
Date: Mon, 30 Jan 2012 10:01:11 -0800
Message-ID: <CAOSpxdYOPepi=nzNyo6BGpSOFx0r97LvhUP8MM+UcLZqf41h=w@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
To: Khem Raj <raj.khem@gmail.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] libksba: add recipe for 1.2.0
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
X-List-Received-Date: Mon, 30 Jan 2012 18:15:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2012 at 9:45 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Hi Steve
>
> On Mon, Jan 30, 2012 at 7:20 AM, Steve Sakoman <steve@sakoman.com> wrote:
>> Libksba provides an easy API to create and parse X.509 and CMS related o=
bjects
>> and is required for gnupg
>>
>
> Doesn't it need libgpg-error ?
> http://www.gnupg.org/related_software/libgpg-error

From that page it would appear so.  I'll do a v4 and add it.

Steve

>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>> ---
>> =A0meta/recipes-extended/gnupg/libksba_1.2.0.bb | =A0 10 ++++++++++
>> =A01 files changed, 10 insertions(+), 0 deletions(-)
>> =A0create mode 100644 meta/recipes-extended/gnupg/libksba_1.2.0.bb
>>
>> diff --git a/meta/recipes-extended/gnupg/libksba_1.2.0.bb b/meta/recipes=
-extended/gnupg/libksba_1.2.0.bb
>> new file mode 100644
>> index 0000000..876eedc
>> --- /dev/null
>> +++ b/meta/recipes-extended/gnupg/libksba_1.2.0.bb
>> @@ -0,0 +1,10 @@
>> +DESCRIPTION =3D " Libksba provides an easy API to create and parse X.50=
9 and CMS related objects"
>> +LICENSE =3D "GPLv3+"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df27defe1e96c2e1ecd4e0c9be896=
7949"
>> +
>> +inherit autotools binconfig
>> +
>> +SRC_URI =3D "ftp://ftp.gnupg.org/gcrypt/${PN}/${PN}-${PV}.tar.bz2"
>> +
>> +SRC_URI[md5sum] =3D "e797f370b69b4dc776499d6a071ae137"
>> +SRC_URI[sha256sum] =3D "09afce65b03d027cbec10d21464f4f651cdfd269e38b404=
f83e48d3e2a3c934b"
>> --
>> 1.7.1
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


