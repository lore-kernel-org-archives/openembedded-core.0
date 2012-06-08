Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1Scxbo-0008I7-Ai
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 13:44:04 +0200
Received: from mail-vc0-f180.google.com ([209.85.220.180])
	by mga11.intel.com with ESMTP/TLS/RC4-MD5; 08 Jun 2012 04:32:28 -0700
Received: by vcbfk26 with SMTP id fk26so791573vcb.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jun 2012 04:32:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=XYtHmP0sa3mf6PgAjeWRcTnsMmESj3qwohAMR0KRDCs=;
	b=PDN7nnWfFfCB9XDNN1ajG9XGR4nQ1+chr3teA53t3smdij8HrQznkVw1ph7Or+dOt1
	EWYt9SGiXVEWprTNcAtSUahaF4yw4SZrMTr7ax2B418wwq/hxPWIZKq02kRsiWGQHWzx
	KMWPlZNQesVXfCXpjSwfro2jbBE8aq7KFHn26NUoYshZp71pWOWDkSZPUFp6HhK5CdTS
	59LsLJ4CuVzdtLdSZyQGk1nc6ZV6q3UfeLkwDSEoy/M43fT5pz+/0eARJpHHRLYBIsQL
	eHJnqNCv/x8K7DNMcAhHhXk9uQpljSYOHf1ccyE+DxE4MD2h4yVLprBR6I3luVn5dwjn
	9SVQ==
Received: by 10.220.240.7 with SMTP id ky7mr5724535vcb.46.1339155147423; Fri,
	08 Jun 2012 04:32:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.52.169.200 with HTTP; Fri, 8 Jun 2012 04:32:07 -0700 (PDT)
In-Reply-To: <20120608112246.GI3140@jama.jama.net>
References: <1339153524-20746-1-git-send-email-bogdan.a.marinescu@intel.com>
	<20120608112246.GI3140@jama.jama.net>
From: "Marinescu, Bogdan A" <bogdan.a.marinescu@intel.com>
Date: Fri, 8 Jun 2012 14:32:07 +0300
Message-ID: <CAMZjud0TFhLgd2H+fEifCgMC26mqPb0+ab=1OZzFE6=MRvRMFg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmOZfXoLiSW+xa8tRHTbYhgOWUh7f1YP/6Nu9bCY0AJhr9KG1xz8i4tmgcR9ZcSuqxjjm7m
Subject: Re: [PATCH] libpcre: updated to version 8.30
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
X-List-Received-Date: Fri, 08 Jun 2012 11:44:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 8, 2012 at 2:22 PM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> On Fri, Jun 08, 2012 at 02:05:24PM +0300, Bogdan Marinescu wrote:
>> Tested by compiling lighttpd
>>
>> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
>> ---
>> =A0.../libpcre/{libpcre_8.21.bb =3D> libpcre_8.30.bb} =A0 | =A0 10 +++++=
-----
>> =A01 file changed, 5 insertions(+), 5 deletions(-)
>> =A0rename meta/recipes-support/libpcre/{libpcre_8.21.bb =3D> libpcre_8.3=
0.bb} (86%)
>>
>> diff --git a/meta/recipes-support/libpcre/libpcre_8.21.bb b/meta/recipes=
-support/libpcre/libpcre_8.30.bb
>> similarity index 86%
>> rename from meta/recipes-support/libpcre/libpcre_8.21.bb
>> rename to meta/recipes-support/libpcre/libpcre_8.30.bb
>> index f5fa4ef..83831e7 100644
>> --- a/meta/recipes-support/libpcre/libpcre_8.21.bb
>> +++ b/meta/recipes-support/libpcre/libpcre_8.30.bb
>> @@ -5,15 +5,15 @@ provides a POSIX calling interface to PCRE; the regula=
r expressions \
>> =A0themselves still follow Perl syntax and semantics. The header file fo=
r \
>> =A0the POSIX-style functions is called pcreposix.h."
>> =A0SECTION =3D "devel"
>> -PR =3D "r1"
>> +PR =3D "r0"
>> =A0LICENSE =3D "BSD"
>> -LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D2f00d186a775c8002422a5315079=
d96b"
>> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/pcre/pcre-${PV}.tar.bz2 \
>> +LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D115e2bee152e2e23e838a2913609=
4877"
>
> What's changed in LICENCE? And add it to commit message in v2.

The copyright was extended to 2012. Do I need to resubmit the patch
with this information?

Thanks,
Bogdan

>
> Cheers,
>
>> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/pcre/pcre/${PV}/pcre-${PV}.t=
ar.bz2 \
>> =A0 =A0 =A0 =A0 =A0 =A0 file://pcre-cross.patch \
>> =A0 =A0 =A0 =A0 =A0 =A0 file://fix-pcre-name-collision.patch"
>>
>> -SRC_URI[md5sum] =3D "0a7b592bea64b7aa7f4011fc7171a730"
>> -SRC_URI[sha256sum] =3D "a4b8509d11fc2764fb4e1415b764ad2c214459edc011ce4=
8aeeb6bbe1ac599e3"
>> +SRC_URI[md5sum] =3D "98e8928cccc945d04279581e778fbdff"
>> +SRC_URI[sha256sum] =3D "c1113fd7db934e97ad8b3917d432e5b642e9eb9afd127eb=
797804937c965f4ac"
>>
>> =A0S =3D "${WORKDIR}/pcre-${PV}"
>>
>> --
>> 1.7.9.5
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


