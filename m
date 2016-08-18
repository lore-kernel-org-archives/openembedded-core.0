Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id F24A076E4A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 16:43:00 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y134so16967pfg.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 09:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=iNJsGLOsaQjgQGhDgSHs4VxO1eDPvQZtFOtrPYHHaQ4=;
	b=pt1Ogm1sTEWqpebAX+24hRVB8wUOYLMjS0qtjpikcY2KdDLsipW4KtQeDJ2eYXIn5K
	a8UglqoJ5naJqDVETeQjItIkYK5J7aP5q/cdCsD/EoyJ9T3Bhn6vE+M7frNTDApzafQM
	TwePXwAu3M1OEWON99PQaWnaOSRYUW9xk2PwJEbsSrdije3I8adxVZAxiRK4PGjF/hY7
	Th/NJXAlZSoFoKhRc12UmK6g0hzMcnX9cbZCn76TSSfo6Xfo9zMnO792g4fO2GyMzPFR
	crxPtOmysAO5cPGaszkpFlZmrKq0ZHmDPmU53IeZVTNtFPXzzztuvpW/DPockZSA/gdH
	BKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=iNJsGLOsaQjgQGhDgSHs4VxO1eDPvQZtFOtrPYHHaQ4=;
	b=m4Zk9F6Z5gjhpJCTUmoAHN9pWyGbB4r0UAT7KZVSqNHcr+u9xml0DWqtwuXwcd2Oem
	9nUwkPfzuH1PCbiBBq6bOTP/QzA0ndjRTvl8QFyrNb2AUiRcuxP8oZfRBD0M9an06tet
	3FqnVPG2vzJBNC2gQdii2hRyVw/KWONXJqY8EGbsZ4/5el9/ZlumJHdY8d0wsW4W8kUv
	d65Gda5ravZPcZO2Fn8Kr+qP+2Z/ZGsdZkRdzanR2GOMWNmztqEvPx+Lo4bgVm1ea8Sv
	ZaY6kiLNcTA1eBQioW+HThr9FWiwvgi2dUZlR5TgxsjRlM6DQ7Yh9NLkpb9eOjvskm1p
	+l5Q==
X-Gm-Message-State: AEkoouta94JHPqFChso3BFkO7DD9dah3c7UUL+VAy1i0oiYJ82Nk/c2E4K0UWh3MxinrfQ==
X-Received: by 10.98.222.70 with SMTP id h67mr5709085pfg.128.1471538581512;
	Thu, 18 Aug 2016 09:43:01 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:3edf:e111:2047:280c:be38?
	([2601:647:4c00:3edf:e111:2047:280c:be38])
	by smtp.gmail.com with ESMTPSA id
	sy7sm4993575pac.42.2016.08.18.09.43.00
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 18 Aug 2016 09:43:00 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1471527992.16712.6.camel@linuxfoundation.org>
Date: Thu, 18 Aug 2016 09:43:00 -0700
Message-Id: <547D2FE2-0FAA-42C8-A9D3-BF0E2FCD1C6B@gmail.com>
References: <1471527992.16712.6.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libunwind: Fix build race conflict with gcc and musl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Aug 2016 16:43:01 -0000
X-Groupsio-MsgNum: 85903
Content-Type: multipart/signed;
	boundary="Apple-Mail=_8AB13650-7BBE-40EC-99FD-8B719E5570A9";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_8AB13650-7BBE-40EC-99FD-8B719E5570A9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 18, 2016, at 6:46 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> Building libunwind, then gcc-runtime causes build failures. This is =
hard
> to fix since gcc-runtime wants the internal gcc unwind.h header but =
libunwind
> wants to provide this. There are differences in include behaviour =
between gcc
> and glibc which are by design.

based upon C library being musl or glibc

>=20
> This patch hacks around the issue by looking for a define used during =
gcc-runtime's
> build and skipping to the internal header in that case. The patch is =
only enabled
> on musl and is the best workaround I could come up with to unblock =
failing builds
> on our auto builder.

I also saw gcc build failures not only gcc-runtime. I am not able to =
find the logs
once I have a reproducer, I will check if it was in libstdc++ as well or =
elsewhere
nevertheless this is ok to go in.

>=20
> [YOCTO #10129]
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> diff --git =
a/meta/recipes-support/libunwind/libunwind/musl-header-conflict.patch =
b/meta/recipes-support/libunwind/libunwind/musl-header-conflict.patch
> new file mode 100644
> index 0000000..79f63fd
> --- /dev/null
> +++ =
b/meta/recipes-support/libunwind/libunwind/musl-header-conflict.patch
> @@ -0,0 +1,37 @@
> +If you:
> +
> +TCLIBC=3Dmusl bitbake unwind
> +TCLIBC=3Dmusl bitbake gcc-runtime -c cleansstate
> +TCLIBC=3Dmusl bitbake gcc-runtime
> +
> +you will see libstdc++ fail to build due to finding libunwind's =
header file.
> +
> +Khem: "When we build any of gcc components they expect to use =
internal version
> +and that works with glibc based gcc since the search headers first =
look into gcc
> +headers, however with musl the gcc headers are searched after the =
standard
> +headers ( which is by design the right thing )."
> +
> +This patch hacks around the issue by looking for a define used during =
gcc-runtime's
> +build and skipping to the internal header in that case.
> +
> +[YOCTO #10129]
> +
> +RP 2016/8/18
> +
> +Upstream-Status: Inappropriate [really need to fix gcc]
> +
> +Index: git/include/unwind.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/include/unwind.h
> ++++ git/include/unwind.h
> +@@ -23,6 +23,10 @@ LIABLE FOR ANY CLAIM, DAMAGES OR OTHER L
> + OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN =
CONNECTION
> + WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
> +
> ++#ifdef _GLIBCXX_SHARED
> ++#include_next <unwind.h>
> ++#endif

This is a solution we can live with since _GLIBCXX_SHARED is gcc =
internal define, it wont
be visible to other packages.

> ++
> + #ifndef _UNWIND_H
> + #define _UNWIND_H
> +
> diff --git a/meta/recipes-support/libunwind/libunwind_git.bb =
b/meta/recipes-support/libunwind/libunwind_git.bb
> index 6d1d9fb..cd4cb89 100644
> --- a/meta/recipes-support/libunwind/libunwind_git.bb
> +++ b/meta/recipes-support/libunwind/libunwind_git.bb
> @@ -13,6 +13,7 @@ SRC_URI =3D "git://git.sv.gnu.org/libunwind.git \
>            =
file://0001-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch \
>            "
>=20
> +SRC_URI_append_libc-musl =3D " file://musl-header-conflict.patch=E2=80=9D=


It should be fine to use it in general too.

> EXTRA_OECONF_append_libc-musl =3D " --disable-documentation =
--disable-tests "
>=20
> # http://errors.yoctoproject.org/Errors/Details/20487/
>=20
>=20


--Apple-Mail=_8AB13650-7BBE-40EC-99FD-8B719E5570A9
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAle15ZgACgkQuwUzVZGdMxQzWQCdFI38rqzjDFYHhKt/YZdjLmiK
8oQAoJFuhyWh73ckzd2WUy3xnx2msgFc
=1FRf
-----END PGP SIGNATURE-----

--Apple-Mail=_8AB13650-7BBE-40EC-99FD-8B719E5570A9--
