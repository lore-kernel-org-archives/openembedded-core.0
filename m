Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QFB5Z-0007iy-Dv
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 22:11:58 +0200
Received: by ewy5 with SMTP id 5so647789ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2011 13:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=WV3Ez3hgirdPJ1DUW9KYrqDDHZSTXtgLz+ALzCpyuis=;
	b=rcEC8zztIjkelJA6aN+BJ8YlMmLyTr8WzAasO8MjgDqIQCY6IHKGtAh381yWE+f+T7
	s2yRol02X51ACird/sfReM2htg6dPEseDFXIaNSTmJ9x1iWHquEapT94c9AJPD9yYNdF
	yXGBukr62n7moJzKXuAcbvCtrwewjFS5XQlU0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Xfj6Q3K2j9+HwiKmgtUW3GF6d+pEThRThiHVDueX7nlOUlWX6YMwd+gS1bapz5WF5+
	G9xWBWgWspdqu5C4qGqK0Uu+vLiJTaSjI3pywsM81zQCxAcHSawfbDyYayIP+u7swHmo
	mIW+7IYP6VEKQ8vCHJbDw7GBba2M5rHiQ1lxI=
Received: by 10.14.34.88 with SMTP id r64mr1197449eea.77.1303934965607; Wed,
	27 Apr 2011 13:09:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.47.139 with HTTP; Wed, 27 Apr 2011 13:08:53 -0700 (PDT)
In-Reply-To: <20110418084520.GB24192@jama.jama.net>
References: <cover.1303113405.git.Martin.Jansa@gmail.com>
	<f78273c64ab21b1a0691585a2140d5fdf24f3f3a.1303113405.git.Martin.Jansa@gmail.com>
	<1303115695.5518.70.camel@rex> <20110418084520.GB24192@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Apr 2011 13:08:53 -0700
Message-ID: <BANLkTimB1pq=f=62d=RC6MjOtqbzrS7OUg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] task-base: allow distribution to define apm provider
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
X-List-Received-Date: Wed, 27 Apr 2011 20:11:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 18, 2011 at 1:45 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Mon, Apr 18, 2011 at 09:34:55AM +0100, Richard Purdie wrote:
>> On Mon, 2011-04-18 at 10:00 +0200, Martin Jansa wrote:
>> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> > ---
>> > =C2=A0meta/recipes-core/tasks/task-base.bb | =C2=A0 =C2=A05 ++++-
>> > =C2=A01 files changed, 4 insertions(+), 1 deletions(-)
>> >
>> > diff --git a/meta/recipes-core/tasks/task-base.bb b/meta/recipes-core/=
tasks/task-base.bb
>> > index 138e617..10f3af4 100644
>> > --- a/meta/recipes-core/tasks/task-base.bb
>> > +++ b/meta/recipes-core/tasks/task-base.bb
>> > @@ -179,8 +179,11 @@ RDEPENDS_task-base-acpi =3D "\
>> > =C2=A0 =C2=A0 =C2=A0acpid \
>> > =C2=A0 =C2=A0 =C2=A0libacpi "
>> >
>> > +# Distro can override apm provider
>> > +DISTRO_APM ?=3D "apm"
>> > +
>> > =C2=A0RDEPENDS_task-base-apm =3D "\
>> > - =C2=A0 =C2=A0apm \
>> > + =C2=A0 =C2=A0${DISTRO_APM} \
>> > =C2=A0 =C2=A0 =C2=A0apmd"
>>
>> Can you explain a little more about why a distro would do this please?
>> I'm a little worried this whole file could become a set of DISTRO_*
>> variables :/.
>>

may be define virtual/apm package and use that in RDEPENDS

>> Cheers,
>>
>> Richard
>
> For example in SHR we're using FSO which provides apm replacement called =
fso-apm which
> conflicts with standard apm.
>
> We can rename it to VIRTUAL-RUNTIME_apm (like
> VIRTUAL-RUNTIME_update-alternatives) if you prefer such namespace.
>
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


