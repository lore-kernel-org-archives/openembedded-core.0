Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RkgGx-0006oD-BL
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 19:18:14 +0100
Received: by lami14 with SMTP id i14so2050420lam.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 10:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=0KPnJG+QQYDioILAcS7G2rtt/9pViwkWwwJIp1mTtgU=;
	b=SvWOB0dB+7KxRyqPNTBJZek9ka1FeTbeKmXJamc/oZW3NXIHYGutQ7/T2GvKqeTcau
	bOD9YOWo0KiThpIHEfmrZteY6ADPJUZ3u5riWV0FWxbq0j4HlQqo7KxQCkHW1XXivLEF
	Fp5F9HC5jWx2cUxMD8n7wjC5YqcjEOLK3JfIo=
Received: by 10.112.87.226 with SMTP id bb2mr4676505lbb.67.1326219042392; Tue,
	10 Jan 2012 10:10:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.115.1 with HTTP; Tue, 10 Jan 2012 10:10:11 -0800 (PST)
In-Reply-To: <1326218304.23315.8.camel@ted>
References: <cover.1326174744.git.sgw@linux.intel.com>
	<b93626c9cd63c844f1836dc7baed7254dc171e74.1326174744.git.sgw@linux.intel.com>
	<1326193275.12160.65.camel@phil-desktop> <1326218304.23315.8.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Jan 2012 10:10:11 -0800
Message-ID: <CAMKF1spRCUxVs+Tt=M2otMp9oBcX63zhv9Y=AyFDF8b9wT4ttA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 14/22] default-distrovars: Define DISTRO_FEATURES_LIBC for uclibc
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
X-List-Received-Date: Tue, 10 Jan 2012 18:18:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 10, 2012 at 9:58 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2012-01-10 at 11:01 +0000, Phil Blundell wrote:
>> On Mon, 2012-01-09 at 21:54 -0800, Saul Wold wrote:
>> > diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/co=
nf/distro/include/default-distrovars.inc
>> > index e1594f3..0b515e5 100644
>> > --- a/meta/conf/distro/include/default-distrovars.inc
>> > +++ b/meta/conf/distro/include/default-distrovars.inc
>> > @@ -10,6 +10,8 @@ LIMIT_BUILT_LOCALES ?=3D "POSIX en_US en_GB"
>> > =C2=A0ENABLE_BINARY_LOCALE_GENERATION ?=3D "1"
>> > =C2=A0LOCALE_UTF8_ONLY ?=3D "0"
>> >
>> > +DISTRO_FEATURES_LIBC_libc-uclibc ?=3D "ipv4 ipv6 largefile libc-posix=
-clang-wchar"
>> > +
>> > =C2=A0DISTRO_FEATURES_LIBC ?=3D "ipv4 ipv6 libc-backtrace libc-big-mac=
ros libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt \
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libc-crypt-ufc libc=
-db-aliases libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse \
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libc-getlogin libc-=
idn libc-inet-anl libc-libm libc-libm-big libc-locales libc-locale-code \
>>
>> This looks like a bad idea to me. =C2=A0I think that override will cause
>> potentially surprising behaviour for folks who are trying to set
>> DISTRO_FEATURES_LIBC by hand. =C2=A0And, as far as I can tell, this patc=
h
>> won't make any functional difference since uclibc will just ignore the
>> features it doesn't understand.
>
> Agreed. If this really is an issue we could do something like:
>
> DEFAULTLIBFEATURES =3D "xxx"
> DEFAULTLIBFEATURES_libc-uclibc =3D "yyy"
> DISTRO_FEATURES_LIBC ?=3D "${DEFAULTLIBCFEATURES}"

I think its ok to drop it since OE-core is reference set of features and
let users redefine them if need be.

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


