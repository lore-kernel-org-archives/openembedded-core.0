Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9E8F17318D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 16:49:06 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id vy10so2118479pac.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 09:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=p9imNkeaIZ3mOCAcMZvXfOGtyheUffJjxsKmBekjmJY=;
	b=Qll0kYKsoGv4WpgTRFNKM5Lclfzif9kE34prR5Jgn2NCwvFGwcx3BUD43W8Ih/vJcG
	p2HqpXEP3fKSWOaygI7HzDBGNJ9/j1APVY9ewSGEqNfBrKO9W1+P07Sz0iMfLr0oOy7Q
	kJLXBbVhrWU3AOU/Sq2PtB219dflb2qtTwTlJ96pXghLMymHZ4h81R67YiTYVcQEeJZI
	WCx0RlT5QGcQW5chDJTQmmDY7o7VWFjep0w5UPL61Chl4I3A7qxQBE6yja6UfPu/GHg3
	T8am5qnCbQ5PflwuYA/uAW3KlGW1Vz3BRRWvRbQ1bRrRHcbHpiIWz/0LDDcfuBHNzJ/M
	6uHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=p9imNkeaIZ3mOCAcMZvXfOGtyheUffJjxsKmBekjmJY=;
	b=Ok10cYTbCGsvTAkY0w9t+4MYSaMipQzZnMJDtp6IoSdMWK4H8VQfF3dbaCy1d3yGfa
	dFXCiTpAgcC6tYqm/eiRBFYzXhBeM/EaIJNJmhzvDa/l1sFqTWKykYmt2rRf29rRPbYv
	3MAMpMaKLWVdartx2/vLujdqFRvdRu0Ruj4Ytxs95i+pvi0+ta9SyPOVdvsaFIoElWzY
	/ZxUnAOKRcI0tIx0Z3R8fs2rhxEwTbZcwLu9o6ktGeeV5nK40IHH+Xaqed6vaIK9QVLP
	aCjPgNXq+eakn8IbwWTfh0r4gxSVYz74If1cP66mpN8zrzQJ2/WBYbt7eo2sXhByLtbG
	I1uQ==
X-Gm-Message-State: AEkoousYhcCGSf8vmqPjbkDNY7yLBOL4g3CXuKH1y0GdjodBhjvXbn465A29mCfnIiXzRQ==
X-Received: by 10.66.86.170 with SMTP id q10mr5629991paz.105.1471538946937;
	Thu, 18 Aug 2016 09:49:06 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:3edf:e111:2047:280c:be38?
	([2601:647:4c00:3edf:e111:2047:280c:be38])
	by smtp.gmail.com with ESMTPSA id h1sm5006390pay.48.2016.08.18.09.49.05
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 18 Aug 2016 09:49:05 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <547D2FE2-0FAA-42C8-A9D3-BF0E2FCD1C6B@gmail.com>
Date: Thu, 18 Aug 2016 09:49:05 -0700
Message-Id: <89A43EA1-0412-422D-8CCA-0E571C6DB710@gmail.com>
References: <1471527992.16712.6.camel@linuxfoundation.org>
	<547D2FE2-0FAA-42C8-A9D3-BF0E2FCD1C6B@gmail.com>
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
X-List-Received-Date: Thu, 18 Aug 2016 16:49:07 -0000
X-Groupsio-MsgNum: 85905
Content-Type: multipart/signed;
	boundary="Apple-Mail=_3EBF98E7-4B45-45D9-9758-C8BCA31811BD";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_3EBF98E7-4B45-45D9-9758-C8BCA31811BD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 18, 2016, at 9:43 AM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
>=20
>> On Aug 18, 2016, at 6:46 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>>=20
>> Building libunwind, then gcc-runtime causes build failures. This is =
hard
>> to fix since gcc-runtime wants the internal gcc unwind.h header but =
libunwind
>> wants to provide this. There are differences in include behaviour =
between gcc
>> and glibc which are by design.
>=20
> based upon C library being musl or glibc
>=20
>>=20
>> This patch hacks around the issue by looking for a define used during =
gcc-runtime's
>> build and skipping to the internal header in that case. The patch is =
only enabled
>> on musl and is the best workaround I could come up with to unblock =
failing builds
>> on our auto builder.
>=20
> I also saw gcc build failures not only gcc-runtime. I am not able to =
find the logs
> once I have a reproducer, I will check if it was in libstdc++ as well =
or elsewhere
> nevertheless this is ok to go in.

It was compiling gcc itself for arm/musl target see

http://errors.yoctoproject.org/Errors/Details/73163/

thats why I disabled it on world builds on arm. Real fix would be
for gcc to get its act together.

>=20
>>=20
>> [YOCTO #10129]
>>=20
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>=20
>> diff --git =
a/meta/recipes-support/libunwind/libunwind/musl-header-conflict.patch =
b/meta/recipes-support/libunwind/libunwind/musl-header-conflict.patch
>> new file mode 100644
>> index 0000000..79f63fd
>> --- /dev/null
>> +++ =
b/meta/recipes-support/libunwind/libunwind/musl-header-conflict.patch
>> @@ -0,0 +1,37 @@
>> +If you:
>> +
>> +TCLIBC=3Dmusl bitbake unwind
>> +TCLIBC=3Dmusl bitbake gcc-runtime -c cleansstate
>> +TCLIBC=3Dmusl bitbake gcc-runtime
>> +
>> +you will see libstdc++ fail to build due to finding libunwind's =
header file.
>> +
>> +Khem: "When we build any of gcc components they expect to use =
internal version
>> +and that works with glibc based gcc since the search headers first =
look into gcc
>> +headers, however with musl the gcc headers are searched after the =
standard
>> +headers ( which is by design the right thing )."
>> +
>> +This patch hacks around the issue by looking for a define used =
during gcc-runtime's
>> +build and skipping to the internal header in that case.
>> +
>> +[YOCTO #10129]
>> +
>> +RP 2016/8/18
>> +
>> +Upstream-Status: Inappropriate [really need to fix gcc]
>> +
>> +Index: git/include/unwind.h
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- git.orig/include/unwind.h
>> ++++ git/include/unwind.h
>> +@@ -23,6 +23,10 @@ LIABLE FOR ANY CLAIM, DAMAGES OR OTHER L
>> + OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN =
CONNECTION
>> + WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
>> +
>> ++#ifdef _GLIBCXX_SHARED
>> ++#include_next <unwind.h>
>> ++#endif
>=20
> This is a solution we can live with since _GLIBCXX_SHARED is gcc =
internal define, it wont
> be visible to other packages.
>=20
>> ++
>> + #ifndef _UNWIND_H
>> + #define _UNWIND_H
>> +
>> diff --git a/meta/recipes-support/libunwind/libunwind_git.bb =
b/meta/recipes-support/libunwind/libunwind_git.bb
>> index 6d1d9fb..cd4cb89 100644
>> --- a/meta/recipes-support/libunwind/libunwind_git.bb
>> +++ b/meta/recipes-support/libunwind/libunwind_git.bb
>> @@ -13,6 +13,7 @@ SRC_URI =3D "git://git.sv.gnu.org/libunwind.git \
>>           =
file://0001-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch \
>>           "
>>=20
>> +SRC_URI_append_libc-musl =3D " file://musl-header-conflict.patch=E2=80=
=9D
>=20
> It should be fine to use it in general too.
>=20
>> EXTRA_OECONF_append_libc-musl =3D " --disable-documentation =
--disable-tests "
>>=20
>> # http://errors.yoctoproject.org/Errors/Details/20487/
>>=20
>>=20
>=20


--Apple-Mail=_3EBF98E7-4B45-45D9-9758-C8BCA31811BD
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAle15wUACgkQuwUzVZGdMxT/kQCfbdeDJNKSiX8XJKLKIGO3eeiV
fXkAn3qViBFREgmob5UKxkPoVps3kG5C
=GTVI
-----END PGP SIGNATURE-----

--Apple-Mail=_3EBF98E7-4B45-45D9-9758-C8BCA31811BD--
