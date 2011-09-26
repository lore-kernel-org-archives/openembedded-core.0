Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1R7z3a-00062j-LX
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Sep 2011 02:28:26 +0200
Received: by yia27 with SMTP id 27so4980762yia.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2011 17:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=XGgn73RViwPsWSJESe/pX9Ml9lSgZbOpuXHGfKrv1CU=;
	b=FGCRPkFHvx/4NuRrN0iMhXD86AV0fZpK9OEiOXz5sQArVXLH9l6qAV6Qhv6BUbRY+l
	VdmTjtossBO/4ytDmS96/NfeHLRUqQKxYBsaARGekXdm1GG6m4TlmG0GYcr2q8Z99KXd
	H96+iij/CWYG8uXx/i4C++8+2VzeXhxl6XefY=
Received: by 10.68.7.202 with SMTP id l10mr26247769pba.22.1316996582034; Sun,
	25 Sep 2011 17:23:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.42.98 with HTTP; Sun, 25 Sep 2011 17:22:32 -0700 (PDT)
In-Reply-To: <1316971012.8185.30.camel@ted>
References: <1316909477-31924-1-git-send-email-raj.khem@gmail.com>
	<1316971012.8185.30.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 25 Sep 2011 17:22:32 -0700
Message-ID: <CAMKF1sphSpMstEoqqQmhF9NeHnAuJBvc3F5vcewB3ALwSA7o2w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] intltool: inherit gettext to add missing dependency on gettext
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
X-List-Received-Date: Mon, 26 Sep 2011 00:28:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 25, 2011 at 10:16 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sat, 2011-09-24 at 17:11 -0700, Khem Raj wrote:
>> Fixes the error like below
>>
>> | configure: error: GNU gettext tools not found; required for intltool
>> | + bbfatal 'oe_runconf failed'
>> | + echo 'ERROR: oe_runconf failed'
>> | ERROR: oe_runconf failed
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0meta/recipes-devtools/intltool/intltool.inc =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 =C2=A02 +-
>> =C2=A0meta/recipes-devtools/intltool/intltool_0.40.6.bb | =C2=A0 =C2=A02=
 +-
>> =C2=A02 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/intltool/intltool.inc b/meta/recipes-=
devtools/intltool/intltool.inc
>> index 23a1ee9..1e54feb 100644
>> --- a/meta/recipes-devtools/intltool/intltool.inc
>> +++ b/meta/recipes-devtools/intltool/intltool.inc
>> @@ -12,7 +12,7 @@ DEPENDS_virtclass-native =3D "libxml-parser-perl-nativ=
e"
>> =C2=A0RRECOMMENDS_${PN} =3D "perl-modules"
>> =C2=A0RRECOMMENDS_${PN}_virtclass-native =3D ""
>>
>> -inherit autotools pkgconfig perlnative
>> +inherit autotools pkgconfig perlnative gettext
>>
>> =C2=A0export PERL =3D "${bindir}/env perl"
>> =C2=A0PERL_virtclass-native =3D "/usr/bin/env nativeperl"
>> diff --git a/meta/recipes-devtools/intltool/intltool_0.40.6.bb b/meta/re=
cipes-devtools/intltool/intltool_0.40.6.bb
>> index e9871fc..eae2b85 100644
>> --- a/meta/recipes-devtools/intltool/intltool_0.40.6.bb
>> +++ b/meta/recipes-devtools/intltool/intltool_0.40.6.bb
>> @@ -1,7 +1,7 @@
>> =C2=A0require intltool.inc
>> =C2=A0LICENSE=3D"GPLv2"
>> =C2=A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df=
079bae19f"
>> -PR =3D "r5"
>> +PR =3D "r6"
>>
>> =C2=A0SRC_URI_append =3D " file://intltool-nowarn-0.40.0.patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${=
NATIVEPATCHES} \
>
> I investigated this one and intltool requires gettext at runtime, not
> build time. Which package did you see the above error from as I suspect
> it wasn't intltool itself but something using it?

It was intltool itself. The situation happens during rebuild when
intltool and gettext-native both are to be rebuilt
and other deps are already there. it doesnt usually happen since we
build gettext-native pretty early.
>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


