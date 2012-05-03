Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SPozc-0006ei-Ey
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 07:54:20 +0200
Received: by laai10 with SMTP id i10so295230laa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2012 22:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=JmwT1iKCkhWJY7a7QIYU7h9lekibETkyNgRsVrRccHc=;
	b=xfi9qW7I/PsNlXayzKCAGeuXlAFDcSjhsiCm3vLh/O4v21oE2oZ0WcjZZEMmoiA6n0
	p++5WgxFIPp2Njx4o9VKDMcX2T8BC2Kz8p9IiqQS7j1WebqVrL2VyJx4hvzzCNSoE0cs
	JRjM2HzfdS0VpA3mru1d35vDI2gLPQSHQaeUm6Pvhr2FkvHtlFzb+5SLIlaJxVXOGTFe
	B2g0H5fvfwcmW8uhky10rF5t39JihMLMLRsfTNEhmrn0IXYhkoBbp8zjJkl0kiWo4rQ3
	psCJ+gCHE0rv/roNnqgHTFDPLQ73zYYEIEdiLbTa73MSVDLZTJlgWOK3cs08gpfxqp6r
	HAuw==
Received: by 10.112.86.101 with SMTP id o5mr406780lbz.1.1336023875230; Wed, 02
	May 2012 22:44:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Wed, 2 May 2012 22:44:05 -0700 (PDT)
In-Reply-To: <20120503053806.GC4658@jama.jama.net>
References: <cover.1335967122.git.Martin.Jansa@gmail.com>
	<eec6dc7f29ff7e5297e2827196cc81ffd9a76831.1335967122.git.Martin.Jansa@gmail.com>
	<20120502140940.GB3682@jama.jama.net> <4FA1A25F.9030502@gmail.com>
	<20120503053806.GC4658@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 May 2012 22:44:05 -0700
Message-ID: <CAMKF1so4ut2C8xKXqSV9KXG1pYN9bqqbDCXFYiyR0L+x_rHJbg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] site/arm-common: alignment values for guin32, guin64 and unsigned long
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
X-List-Received-Date: Thu, 03 May 2012 05:54:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 2, 2012 at 10:38 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Wed, May 02, 2012 at 02:08:47PM -0700, Khem Raj wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 05/02/2012 07:09 AM, Martin Jansa wrote:
>> > On Wed, May 02, 2012 at 03:59:45PM +0200, Martin Jansa wrote:
>> >> From: Tomas Frydrych <tomas@sleepfive.com>
>> >>
>> >> These are required to build recent versions of glib-2.0
>> >
>> > similar patch is needed also for other site files, just noticed it
>> > while building for qemux86-64
>>
>> would you also include rest of architectures too please ?
>
> I did for x86 and x86-64, for the rest I don't know the right values or
> care enough to find them somewhere.

will this upgrade break glib for architectures that have wrong values
for these vars ?
if answer is yes then I think we should do that before applying this
upgrade otherwise
it will be a regression

>
> Cheers,
>
>>
>> >
>> >>
>> >> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com> ---
>> >> meta/site/arm-common | =C2=A0 =C2=A03 +++ 1 files changed, 3 insertio=
ns(+),
>> >> 0 deletions(-)
>> >>
>> >> diff --git a/meta/site/arm-common b/meta/site/arm-common index
>> >> c3ffe08..cad8027 100644 --- a/meta/site/arm-common +++
>> >> b/meta/site/arm-common @@ -76,6 +76,9 @@
>> >> glib_cv_sizeof_ptrdiff_t=3D${glib_cv_sizeof_ptrdiff_t=3D4}
>> >> glib_cv_sizeof_size_t=3D${glib_cv_sizeof_size_t=3D4}
>> >> glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
>> >> glib_cv_sys_use_pid_niceness_surrogate=3D${glib_cv_sys_use_pid_nicene=
ss_surrogate=3Dyes}
>> >>
>> >>
>> +ac_cv_alignof_guint32=3D4
>> >> +ac_cv_alignof_guint64=3D8 +ac_cv_alignof_unsigned_long=3D4
>> >>
>> >> #gstreamer as_cv_unaligned_access=3D${as_cv_unaligned_access=3Dno} --
>> >> =C2=A01.7.8.6
>> >>
>> >
>> >
>> >
>> > _______________________________________________ Openembedded-core
>> > mailing list Openembedded-core@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>> -----BEGIN PGP SIGNATURE-----
>> Version: GnuPG v1.4.11 (GNU/Linux)
>> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/
>>
>> iEYEARECAAYFAk+hol8ACgkQuwUzVZGdMxQEkgCfZY5mVAR5RxST2olpH41m6V+d
>> iQwAnRBaSrzbM/RGWmb8cZJjXwMAg6KJ
>> =3DtUvc
>> -----END PGP SIGNATURE-----
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa =C2=A0 =C2=A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


