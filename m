Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PvFdu-00010r-DG
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 22:01:02 +0100
Received: by fxm8 with SMTP id 8so1544033fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2011 12:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=AzfXtI5piDW/mepjv6VUzZg2haxlGajAQVzob293sps=;
	b=voPYe534cJy6ryzaDXNWaFscCnbVMJABoqbeY3ylIXVN7bnSYMzU/LcczCjGtPpzYQ
	cEtJWJx3jPniOCdiORpCYG15esgGwZHoTLaaKkUKJy1qehExvTJAxCLYsOqP0utV24Pw
	R8XLJ6lXTdjN7X/XTsvrQbwc92AFV4qxVDZr4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=YB4kaZ39U2xKRnsFIx/TiK+r8lbZyZPB6t3ZfpI7qLHuTKOpZSXGI7hzOSkK55IuQN
	DWdvWsQ6iwU69RP+5tC16Tl01jWWfE0TGgpGglIqS1op5f5noY/vxB8xHFUvAdvvrdkr
	ohW0SrtvQ70jPi1gGZlib2HD7RmV/YChpaOhI=
Received: by 10.223.100.8 with SMTP id w8mr2079105fan.55.1299185970066; Thu,
	03 Mar 2011 12:59:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Thu, 3 Mar 2011 12:59:10 -0800 (PST)
In-Reply-To: <10e14f3105719259ad119b37ff1b49d1bc78a4ce.1299182375.git.sgw@linux.intel.com>
References: <cover.1299182375.git.sgw@linux.intel.com>
	<10e14f3105719259ad119b37ff1b49d1bc78a4ce.1299182375.git.sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Mar 2011 12:59:10 -0800
Message-ID: <AANLkTi=-bWXFhaionzUfRvZJx1ajX9hPqBQAW1FY1kB8@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: poky@yoctoproject.org
Subject: Re: [PATCH 09/10] recipe: add slang from OE
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
X-List-Received-Date: Thu, 03 Mar 2011 21:01:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 3, 2011 at 12:02 PM, Saul Wold <sgw@linux.intel.com> wrote:
> From: Kang Kai <kai.kang@windriver.com>
>
> slang is the shared library for the S-Lang extension language,
> and required by newt because of LSB command check
>
> Signed-off-by: Kang Kai <kai.kang@windriver.com>

same thing for recipes imported from OE make note of last commit on the rec=
ipe
that it came from. Probably adding patch header to patches would be
nice to have as well.

> ---
> =C2=A0meta/recipes-extended/slang/slang/fix-uclibc.patch | =C2=A0 11 ++++=
++++
> =C2=A0meta/recipes-extended/slang/slang_2.2.2.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 25 ++++++++++++++++++++
> =C2=A02 files changed, 36 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 meta/recipes-extended/slang/slang/fix-uclibc.pat=
ch
> =C2=A0create mode 100644 meta/recipes-extended/slang/slang_2.2.2.bb
>
> diff --git a/meta/recipes-extended/slang/slang/fix-uclibc.patch b/meta/re=
cipes-extended/slang/slang/fix-uclibc.patch
> new file mode 100644
> index 0000000..c2b8225
> --- /dev/null
> +++ b/meta/recipes-extended/slang/slang/fix-uclibc.patch
> @@ -0,0 +1,11 @@
> +--- slang-2.1.3.orig/src/slcommon.c =C2=A0 =C2=A02007-01-10 18:09:07.000=
000000 +0200
> ++++ slang-2.1.3.orig/src/slcommon.c =C2=A0 =C2=A02008-03-19 16:09:09.000=
000000 +0200
> +@@ -191,7 +191,7 @@
> + =C2=A0 =C2=A0return p;
> + }
> +
> +-#if !defined(HAVE_ISSETUGID) && defined(__GLIBC__) && (__GLIBC__ >=3D 2=
)
> ++#if !defined(HAVE_ISSETUGID) && defined(__GLIBC__) && (__GLIBC__ >=3D 2=
) && !defined(__UCLIBC__)
> + extern int __libc_enable_secure;
> + # define HAVE___LIBC_ENABLE_SECURE 1
> + #endif
> diff --git a/meta/recipes-extended/slang/slang_2.2.2.bb b/meta/recipes-ex=
tended/slang/slang_2.2.2.bb
> new file mode 100644
> index 0000000..7fe76af
> --- /dev/null
> +++ b/meta/recipes-extended/slang/slang_2.2.2.bb
> @@ -0,0 +1,25 @@
> +SUMMARY =3D "The shared library for the S-Lang extension language"
> +
> +DESCRIPTION =3D "S-Lang is an interpreted language and a programming lib=
rary. =C2=A0The \
> +S-Lang language was designed so that it can be easily embedded into \
> +a program to provide the program with a powerful extension language. \
> +The S-Lang library, provided in this package, provides the S-Lang \
> +extension language. =C2=A0S-Lang's syntax resembles C, which makes it ea=
sy \
> +to recode S-Lang procedures in C if you need to."
> +
> +SECTION =3D "libs"
> +PRIORITY =3D "optional"
> +DEPENDS =3D "pcre"
> +PR =3D "r0"
> +
> +LICENSE =3D "GPL Artistic"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317=
bb3"
> +
> +
> +SRC_URI =3D "ftp://space.mit.edu/pub/davis/slang/v2.2/OLD/slang-${PV}.ta=
r.bz2 \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix-uclibc.patch"
> +
> +inherit autotools
> +
> +SRC_URI[md5sum] =3D "974437602a781cfe92ab61433dd16d03"
> +SRC_URI[sha256sum] =3D "cfaf8551fa3855f9b0043309bb553ef6d457f931b404df5a=
6ba6a5a69371fc42"
> --
> 1.7.1.1
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


