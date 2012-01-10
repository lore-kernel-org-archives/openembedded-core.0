Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RkgKB-0006xM-Cp
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 19:21:31 +0100
Received: by lami14 with SMTP id i14so2052151lam.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 10:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=KZ1TcLPSrcrXUjvUkuW5kor+eKhlwa4Z711UYZrbPZI=;
	b=GW0pn4abZmDYjR5ak+O1HghZuS5CX29UdvTKyQF1LWl3VjPDsdwb7j6T9AStBpKvC1
	/ftr17sFiUYsUEsWzLI1rleC3bxwKiD6hcopQ7vqXNiZqMvi3EfXuxzSdyVIGm0TmLg2
	cvdirSHpG73dTejp77vsJLpilJgQB4IBAv5bg=
Received: by 10.152.132.133 with SMTP id ou5mr9232491lab.46.1326219242373;
	Tue, 10 Jan 2012 10:14:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.115.1 with HTTP; Tue, 10 Jan 2012 10:13:31 -0800 (PST)
In-Reply-To: <a471d342424502de48f28c4f8297d490f2cd1443.1326174744.git.sgw@linux.intel.com>
References: <cover.1326174744.git.sgw@linux.intel.com>
	<a471d342424502de48f28c4f8297d490f2cd1443.1326174744.git.sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Jan 2012 10:13:31 -0800
Message-ID: <CAMKF1sqa4Z3QTSoUG2g_SGHE164WiWchTZghrW-yM2Btgnst5A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 03/22] site/common-uclibc: Cache gl_cv_func_wcwidth_works
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
X-List-Received-Date: Tue, 10 Jan 2012 18:21:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

please drop this patch. Its superseded by my pull request.

On Mon, Jan 9, 2012 at 9:53 PM, Saul Wold <sgw@linux.intel.com> wrote:
> From: Khem Raj <raj.khem@gmail.com>
>
> Its not computed properly during configure and
> we configure uclibc with widechar support anyway
> so its fine to cache it. It fixes the errors like
>
> | In file included from ./stdio.h:31:0,
> | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from fpur=
ge.h:20,
> | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from fpur=
ge.c:20:
> | /home/kraj/work/angstrom/sources/openembedded-core/build/tmp-uclibc/sys=
roots/qemux86/usr/include/stdio.h:662:40: error: expected declaration speci=
fiers or '...' before '(' token
> | make[4]: *** [fpurge.o] Error 1
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0meta/site/common-uclibc | =C2=A0 =C2=A01 +
> =C2=A01 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/meta/site/common-uclibc b/meta/site/common-uclibc
> index 331c2a2..c2ad42d 100644
> --- a/meta/site/common-uclibc
> +++ b/meta/site/common-uclibc
> @@ -21,6 +21,7 @@ ac_cv_func_vsnprintf_c99=3D${ac_cv_func_vsnprintf_c99=
=3Dyes}
> =C2=A0glib_cv_compliant_posix_memalign=3D${glib_cv_compliant_posix_memali=
gn=3D1}
> =C2=A0glib_cv_long_long_format=3D${glib_cv_long_long_format=3Dll}
> =C2=A0glib_cv_have_qsort_r=3D${glib_cv_have_qsort_r=3Dno}
> +gl_cv_func_wcwidth_works=3D${gl_cv_func_wcwidth_works=3Dyes}
>
> =C2=A0#dbus-glib
> =C2=A0ac_cv_have_abstract_sockets=3D${ac_cv_have_abstract_sockets=3Dyes}
> --
> 1.7.6.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


