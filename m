Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rzynh-0004rz-Oj
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 00:07:13 +0100
Received: by lahc1 with SMTP id c1so8400492lah.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2012 14:58:54 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.112.8.129 as permitted sender) client-ip=10.112.8.129; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.112.8.129 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.112.8.129])
	by 10.112.8.129 with SMTP id r1mr10311511lba.38.1329865134359 (num_hops
	= 1); Tue, 21 Feb 2012 14:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=xgJWrVt1t2pVfU1uBNCidz8jBAsu3pmDJqNus0cqEHc=;
	b=n5/7JljIk+82BHHPhlhxat2kbL09FFMTIZQs7HxuPYQgPTIttiaeCqZ9lGvcVBI4Bo
	yZeXrmX3W8t+OVb6ie/gJvPc+OOItXnjCJ70Dgiek3uoX4OJm0BNhoErLUO2kELVEkft
	zUWuQqqd75fb/mvA5EA2SeRjv3NMgVOn1YRbU=
Received: by 10.112.8.129 with SMTP id r1mr8661100lba.38.1329865134303; Tue,
	21 Feb 2012 14:58:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.27.109 with HTTP; Tue, 21 Feb 2012 14:58:24 -0800 (PST)
In-Reply-To: <1329861178.20261.62.camel@ted>
References: <1329851229-31625-1-git-send-email-steve@sakoman.com>
	<1329861178.20261.62.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Feb 2012 14:58:24 -0800
Message-ID: <CAMKF1srgDCoszNsYc30zwR_kgQOV8F2k3i5dQHGyzvJoW3ar4w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Steve Sakoman <steve@sakoman.com>
Subject: Re: [PATCH] libxml2: add missing dependency on binutils
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
X-List-Received-Date: Tue, 21 Feb 2012 23:07:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2012 at 1:52 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2012-02-21 at 11:07 -0800, Steve Sakoman wrote:
>> Otherwise build fails with following error:
>>
>> | In file included from libxml.h:36:0,
>> | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from xml=
memory.c:8:
>> | ./include/libxml/xmlversion.h:396:22: fatal error: ansidecl.h: No such=
 file or directory
>>
>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>> ---
>> =C2=A0meta/recipes-core/libxml/libxml2.inc | =C2=A0 =C2=A02 +-
>> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/li=
bxml/libxml2.inc
>> index 0979acd..6230f60 100644
>> --- a/meta/recipes-core/libxml/libxml2.inc
>> +++ b/meta/recipes-core/libxml/libxml2.inc
>> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://Copyright;md5=3Dbb90c4892=
6316d9af6e2d70ca7013ade \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0file://trio.c;beginline=3D5;endline=3D14;md5=3D6c025753c86d958722ec76=
e94cae932e"
>>
>> =C2=A0DEPENDS_virtclass-native =3D "python-native"
>> -DEPENDS =3D+ "zlib"
>> +DEPENDS =3D+ "zlib binutils"
>>
>> =C2=A0SRC_URI =3D "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://libxml-64bit.patch"
>
> This sounds very wrong. It would have implications for libxml2-native
> I'd imagine. What is it doing that needs binutils?

configure detects the header and then uses it. So as long as you provide
binutils or not provide consistently it will build in a consistent way
whats happening here probably is that its configured with binutils-dev
being staged but is building without then being in staging.


>
> Its going to add considerable time to the build too.
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


