Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RYL1E-0003q8-Ho
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 18:10:56 +0100
Received: by lahd3 with SMTP id d3so308645lah.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Dec 2011 09:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=WM/QBWQnHBO3Wt7MMCCgZieUDAV7M350DJP7dFYlC9U=;
	b=TgnzPiIGBuQA5yhqmfr4dagk1u5nX7uEXdvVA5+CRADFzPnGM5oZztMRGVPlLeRHAI
	Wd5KW+lBryeUjQjMyiPXuu98Aw3iK3S40jZMVVskxoPBg76/f/ACNUuqoo3ro1065DKL
	BcMhXBDsOuwZ1bYjxgPj6z5x5zQi7puNnidYw=
Received: by 10.152.105.67 with SMTP id gk3mr12303536lab.48.1323277447732;
	Wed, 07 Dec 2011 09:04:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Wed, 7 Dec 2011 09:03:34 -0800 (PST)
In-Reply-To: <CA+chaQfBfNs57Be9N-T1QzfZ=aXzDMN7QjKeKV8ZGnULORZjng@mail.gmail.com>
References: <cover.1323148566.git.raj.khem@gmail.com>
	<2f734b193f63f8fe0625c758bc5c696bf93166ac.1323148566.git.raj.khem@gmail.com>
	<09058d57658d20d3f71f149a879563393f6fb313.1323148566.git.raj.khem@gmail.com>
	<CA+chaQfBfNs57Be9N-T1QzfZ=aXzDMN7QjKeKV8ZGnULORZjng@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 7 Dec 2011 09:03:34 -0800
Message-ID: <CAMKF1sqY=MqqYReQwXiDh5OGSTvRR07H05xiM-duevSU7bfPrw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] cloog-ppl,ppl: Add new recipes
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
X-List-Received-Date: Wed, 07 Dec 2011 17:10:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 6, 2011 at 3:41 AM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> On Tue, Dec 6, 2011 at 6:21 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> These are supporting libraries needed if we want
>> to build gcc with graphite support which does better
>> job on loop optimizarions.
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0meta/recipes-support/cloog-ppl/cloog-ppl.inc =C2=A0 =C2=A0 =C2=A0 =
| =C2=A0 =C2=A06 +
>> =C2=A0.../recipes-support/cloog-ppl/cloog-ppl_0.15.11.bb | =C2=A0 13 +
>> =C2=A0.../ppl/ppl-0.11.2/ppl_autoreconf.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|17034 ++++++++++++++++++++
>> =C2=A0meta/recipes-support/ppl/ppl.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A06 +
>> =C2=A0meta/recipes-support/ppl/ppl_0.11.2.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | =C2=A0 16 +
>> =C2=A0meta/recipes-support/ppl/ppl_git.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 17 +
>> =C2=A06 files changed, 17092 insertions(+), 0 deletions(-)
>> =C2=A0create mode 100644 meta/recipes-support/cloog-ppl/cloog-ppl.inc
>> =C2=A0create mode 100644 meta/recipes-support/cloog-ppl/cloog-ppl_0.15.1=
1.bb
>> =C2=A0create mode 100644 meta/recipes-support/ppl/ppl-0.11.2/ppl_autorec=
onf.patch
>> =C2=A0create mode 100644 meta/recipes-support/ppl/ppl.inc
>> =C2=A0create mode 100644 meta/recipes-support/ppl/ppl_0.11.2.bb
>> =C2=A0create mode 100644 meta/recipes-support/ppl/ppl_git.bb
>
> While testing this changes I got this from ppl build
> configure:10654: checking how to link with libgmpxx
> configure:11127: result: /usr/lib/libgmpxx.so /usr/lib/libgmp.so
> configure:11173: checking for the GMP library version 4.1.3 or above
> ...
> ac_cv_libgmp_cppflags=3D
> ac_cv_libgmp_libs=3D/usr/lib/libgmp.so
> ac_cv_libgmp_ltlibs=3D'-L/usr/lib -lgmp'
> ac_cv_libgmp_prefix=3D/usr
> ac_cv_libgmpxx_cppflags=3D
> ac_cv_libgmpxx_libs=3D'/usr/lib/libgmpxx.so /usr/lib/libgmp.so'
> ac_cv_libgmpxx_ltlibs=3D'-L/usr/lib -lgmpxx -L/usr/lib -lgmp'
> ac_cv_libgmpxx_prefix=3D/usr
>
> OE @ ~/shr-core/tmp-eglibc $ find sysroots/nokia900/usr/lib/ -name libgmp=
\*
> sysroots/nokia900/usr/lib/libgmp.so.10.0.2
> sysroots/nokia900/usr/lib/libgmp.la
> sysroots/nokia900/usr/lib/libgmpxx.a
> sysroots/nokia900/usr/lib/libgmpxx.so.4
> sysroots/nokia900/usr/lib/libgmp.so.10
> sysroots/nokia900/usr/lib/libgmpxx.la
> sysroots/nokia900/usr/lib/ssl/engines/libgmp.so
> sysroots/nokia900/usr/lib/libgmp.so
> sysroots/nokia900/usr/lib/libgmpxx.so.4.2.2
> sysroots/nokia900/usr/lib/libgmp.a
> sysroots/nokia900/usr/lib/libgmpxx.so
>

is this when you build gcc for target ?

> Maybe we should pass --with-gmp-build or improve m4/ac_check_gmp.m4 to
> detect gmp in sysroot?

Thanks for trying it out.

Yes I should. I had it for a while but then I removed it for experimenting
if it will find libs in sysroot and it did and since then I removed it but =
I
forgot that I do not have gmp libs installed locally on build system.

I will fix it here and push a new patch to same branch


