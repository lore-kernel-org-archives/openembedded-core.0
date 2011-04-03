Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q6X2u-00016z-Jk
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Apr 2011 01:49:28 +0200
Received: by fxm19 with SMTP id 19so4143154fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Apr 2011 16:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=ehNirH73SQy6Gv/cO2+veMydtBT8y1Dnqckngb9sm+Q=;
	b=GbaQnWegsEF4VwcVeih45PzynFjD25dO2R46BTxB9I0q2ybt0AUbxSKf1tjNHirceg
	25dgfUjKIFWNlil7DOrj74iOOM10b9q7/dNaoGp+R39IT75UyTqLtbodnXqHIlD0OdCz
	WI6pXOb9kOAUwOZoMN6ZSfWEo7q56dppXr0I8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=oWngbhCAw3KnMlU4psC2OZIO6hajf5a+3SR1U7uNnpNtu6elFDXptb4sxvQJlSdyYL
	Swyk6aUxZRfhkOd/J7KVw+p/i7NpVD2iexv5OBFoFKrvVccm5hoUdAkZXkwM4GGrJkdq
	yaI0xZ3gdA6QdqyUE97graCMA9arCf+LGb7Hw=
Received: by 10.223.77.71 with SMTP id f7mr2087676fak.141.1301874443121; Sun,
	03 Apr 2011 16:47:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.23.136 with HTTP; Sun, 3 Apr 2011 16:46:53 -0700 (PDT)
In-Reply-To: <674f01045f776753ffafa72d9df37473cb50f397.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
	<674f01045f776753ffafa72d9df37473cb50f397.1301631488.git.raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 3 Apr 2011 16:46:53 -0700
Message-ID: <BANLkTikmRJnFCaTnxW-9CH+_0QFUGeYroQ@mail.gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 46/46] linux-tools.inc: Dummify do_compile_perf and do_install_perf for uclibc
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
X-List-Received-Date: Sun, 03 Apr 2011 23:49:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2011 at 9:30 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Perf wants elfutils and elfutils on uclibc does not work due to
> its usage of obstack_printf functionality missing from uclibc.
>

this patch does not work well yet but is independent of other patches
in series. This problem needs to be
sorted differently.

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0meta/recipes-kernel/linux/linux-tools.inc | =C2=A0 12 ++++++++----
> =C2=A01 files changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-tools.inc b/meta/recipes-ker=
nel/linux/linux-tools.inc
> index 2ac74a5..9ddebed 100644
> --- a/meta/recipes-kernel/linux/linux-tools.inc
> +++ b/meta/recipes-kernel/linux/linux-tools.inc
> @@ -1,6 +1,11 @@
> =C2=A0# included by kernel recipes if they want to build/provide
> =C2=A0# perf functionality from their tree.
> -
> +do_compile_perf_libc-uclibc () {
> + =C2=A0 =C2=A0 =C2=A0 :
> +}
> +do_install_perf_libc-uclibc () {
> + =C2=A0 =C2=A0 =C2=A0 :
> +}
> =C2=A0do_compile_perf() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake -C ${S}/tools/perf CC=3D"${CC}" LD=
=3D"${LD}" prefix=3D${prefix}
> =C2=A0}
> @@ -14,6 +19,5 @@ do_install_perf() {
> =C2=A0addtask compile_perf after do_compile before do_install
> =C2=A0addtask install_perf after do_install before do_package
>
> -do_compile_perf[depends] =3D =C2=A0"virtual/libc:do_populate_sysroot"
> -do_compile_perf[depends] =3D+ "elfutils:do_populate_sysroot"
> -RDEPENDS_perf +=3D "python perl elfutils"
> +DEPENDS_perf_libc-glibc +=3D "elfutils virtual/libc"
> +RDEPENDS_perf_libc-glibc +=3D "python perl elfutils"
> --
> 1.7.4.1
>
>


