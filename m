Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QjOYK-0003XB-V2
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 06:38:33 +0200
Received: by pvf24 with SMTP id 24so4398737pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2011 21:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=dAXHpfyEQFsuHAWdhm9TzIEKoUt116WynSXOe3wdYNA=;
	b=IJnxt3p63DavEpedECGmYwBydfwShTyK28jutezZ9DiQjplmfml1a95kc1rsOeK0g0
	6pvjYxgAD75WYA0WbOQ/m2n6DDgrO30ptV+OfRQMmrvLATVBK6Csle1kau8mYOCr/okv
	LectWuceNuPMjy1J8Zi3MbTH7junyj0ptyOD8=
Received: by 10.68.33.200 with SMTP id t8mr9734454pbi.144.1311136448069; Tue,
	19 Jul 2011 21:34:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.62.36 with HTTP; Tue, 19 Jul 2011 21:33:38 -0700 (PDT)
In-Reply-To: <4E26253D.8040000@linux.intel.com>
References: <1dd2e2b995b65326b14426fe01116b99a920d779.1311034342.git.raj.khem@gmail.com>
	<d12eac7e3b3d9c368f99e4163fb297858e577d00.1311034342.git.raj.khem@gmail.com>
	<4E26253D.8040000@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Jul 2011 21:33:38 -0700
Message-ID: <CAMKF1spHX9gU5ftXFJKQBzsw7Z=JJeR-RD=zXOw1emvfaRDzCw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 14/16] clutter-box2d: Replace use of finite macro with C99 compliant isfinite()
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
X-List-Received-Date: Wed, 20 Jul 2011 04:38:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 19, 2011 at 5:45 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 07/18/2011 05:17 PM, Khem Raj wrote:
>>
>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> ---
>> =C2=A0.../clutter/clutter-box2d/isfinite.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 19
>> +++++++++++++++++++
>> =C2=A0meta/recipes-graphics/clutter/clutter-box2d_git.bb | =C2=A0 =C2=A0=
6 ++++--
>> =C2=A02 files changed, 23 insertions(+), 2 deletions(-)
>> =C2=A0create mode 100644
>> meta/recipes-graphics/clutter/clutter-box2d/isfinite.patch
>>
>> diff --git a/meta/recipes-graphics/clutter/clutter-box2d/isfinite.patch
>> b/meta/recipes-graphics/clutter/clutter-box2d/isfinite.patch
>> new file mode 100644
>> index 0000000..fd2bf74
>> --- /dev/null
>> +++ b/meta/recipes-graphics/clutter/clutter-box2d/isfinite.patch
>> @@ -0,0 +1,19 @@
>> +_finite is obsoleted and C99 has isfinite instead so we should use it
>> +
>> +Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> +
>> +Upstream-Status: Pending
>> +
>> +Index: clutter-box2d-0.10.0/box2d/Source/Common/b2Math.h
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- clutter-box2d-0.10.0.orig/box2d/Source/Common/b2Math.h =C2=A0 =C2=
=A0 2008-12-16
>> 06:42:10.000000000 -0800
>> ++++ clutter-box2d-0.10.0/box2d/Source/Common/b2Math.h =C2=A02011-07-17
>> 02:10:29.833825198 -0700
>> +@@ -60,7 +60,7 @@
>> + #ifdef _MSC_VER
>> + =C2=A0 =C2=A0 =C2=A0 return _finite(x) !=3D 0;
>> + #else
>> +- =C2=A0 =C2=A0 =C2=A0return finite(x) !=3D 0;
>> ++ =C2=A0 =C2=A0 =C2=A0return std::isfinite(x) !=3D 0;
>> + #endif
>> + }
>> +
>> diff --git a/meta/recipes-graphics/clutter/clutter-box2d_git.bb
>> b/meta/recipes-graphics/clutter/clutter-box2d_git.bb
>> index bfd46b2..06f5fa2 100644
>> --- a/meta/recipes-graphics/clutter/clutter-box2d_git.bb
>> +++ b/meta/recipes-graphics/clutter/clutter-box2d_git.bb
>> @@ -4,9 +4,11 @@ LIC_FILES_CHKSUM =3D
>> "file://box2d/License.txt;md5=3De5d39ad91f7dc4692dcdb1d85139ec6
>>
>> =C2=A0SRCREV =3D "4799ac10ae8cb7da936a2b999aba58fe62eb1ee3"
>> =C2=A0PV =3D "0.10.1+git${SRCPV}"
>> -PR =3D "r0"
>> +PR =3D "r1"
>>
>> -SRC_URI =3D "git://git.gnome.org/clutter-box2d.git"
>> +SRC_URI =3D "git://git.gnome.org/clutter-box2d.git \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://isfinite.patch \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
>>
>> =C2=A0S =3D "${WORKDIR}/git"
>>
>
> Khem,
>
> This patch seems to have patched clutter-box2d-1.6_0.10.0.bb also, with t=
he
> isfinite patch. =C2=A0This fails to apply. =C2=A0Was this intentional wer=
e you
> planning on updating the 1.6 version?

yes the patch should be applied to both recipes since x86 uses
clutter-box2d-1.6_0.10.0.bb
and arm uses the git version. It applied well for arm and x86 here.
Let me check once more

>
> Sau!
>


