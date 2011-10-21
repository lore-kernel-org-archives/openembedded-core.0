Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RHHHY-0007jD-Ay
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 17:45:16 +0200
Received: by ywf9 with SMTP id 9so1486993ywf.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 08:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=3K7z800N9D3Q0Qog9dzFOl7Zzt7MiqsMvzGbnJQmQkE=;
	b=KuXFMSsVjeHFZwIXKDmqm+1iGQ4BAoIS91wZkzoMKdDU+t9lLr0m5NOeV4vkbQvbhk
	N+N7ovee15v96goPtZmhr9NLHY9RDbYtF1Sdck0vPK865RVdVrb13lboMY3FTHJWDzRT
	Lz0S4VlyZNyJqdmw32QMk8c3rYN5AxUk13358=
Received: by 10.68.23.6 with SMTP id i6mr28676691pbf.13.1319211558810; Fri, 21
	Oct 2011 08:39:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Fri, 21 Oct 2011 08:38:45 -0700 (PDT)
In-Reply-To: <9136b0cb351d0b7fee119739e669130906c1747a.1319184832.git.Martin.Jansa@gmail.com>
References: <cover.1319184832.git.Martin.Jansa@gmail.com>
	<bfd27053f71157d3f3d3c0bf523015347714d3f8.1319184832.git.Martin.Jansa@gmail.com>
	<9136b0cb351d0b7fee119739e669130906c1747a.1319184832.git.Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Oct 2011 08:38:45 -0700
Message-ID: <CAMKF1spT-0QOKRUr2hTv3-B7tsJkzADRUUUkcJL89hkKHfj7=A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] webkit-gtk: force arm mode to work around binutils segfault
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
X-List-Received-Date: Fri, 21 Oct 2011 15:45:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 21, 2011 at 1:17 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> =C2=A0meta/recipes-sato/webkit/webkit-gtk_svn.bb | =C2=A0 17 ++++++++++++=
+++++
> =C2=A01 files changed, 17 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-sato/webkit/webkit-gtk_svn.bb b/meta/recipes-sa=
to/webkit/webkit-gtk_svn.bb
> index 2862ad4..0a1f8b6 100644
> --- a/meta/recipes-sato/webkit/webkit-gtk_svn.bb
> +++ b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
> @@ -45,6 +45,23 @@ EXTRA_OECONF =3D "\
>
> =C2=A0EXTRA_AUTORECONF =3D " -I Source/autotools "
>
> +
> +#| ./Source/JavaScriptCore/heap/HandleTypes.h: In static member function=
 'static T* JSC::HandleTypes<T>::getFromSlot(JSC::HandleSlot) [with T =3D J=
SC::Structure, JSC::HandleTypes<T>::ExternalType =3D JSC::Structure*, JSC::=
HandleSlot =3D JSC::JSValue*]':
> +#| ./Source/JavaScriptCore/heap/Handle.h:141:79: =C2=A0 instantiated fro=
m 'JSC::Handle<T>::ExternalType JSC::Handle<T>::get() const [with T =3D JSC=
::Structure, JSC::Handle<T>::ExternalType =3D JSC::Structure*]'
> +#| ./Source/JavaScriptCore/runtime/ScopeChain.h:39:75: =C2=A0 instantiat=
ed from here
> +#| ./Source/JavaScriptCore/heap/HandleTypes.h:38:130: warning: cast from=
 'JSC::JSCell*' to 'JSC::HandleTypes<JSC::Structure>::ExternalType {aka JSC=
::Structure*}' increases required alignment of target type [-Wcast-align]
> +#| {standard input}: Assembler messages:
> +#| {standard input}:28873: Error: invalid immediate: 983040 is out of ra=
nge
> +#| {standard input}:28873: Error: value of 983040 too large for field of=
 2 bytes at 15110
> +#| /OE/shr-core/tmp/sysroots/x86_64-linux/usr/libexec/armv4t-oe-linux-gn=
ueabi/gcc/arm-oe-linux-gnueabi/4.6.2/as: BFD (GNU Binutils) 2.21.1 assertio=
n fail /OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/binutils-cross-2.21.1a=
-r0/binutils-2.21.1/bfd/elf.c:2819
> +#| arm-oe-linux-gnueabi-g++: internal compiler error: Segmentation fault=
 (program as)

What it seems is that tables are growing pretty large for thumb to
handle. Did you try to use -O1 or -Os with thumb mode ?

> +#| Please submit a full bug report,
> +#| with preprocessed source if appropriate.
> +#| See <http://gcc.gnu.org/bugs.html> for instructions.
> +#| make[1]: *** [Source/JavaScriptCore/jit/libjavascriptcoregtk_1_0_la-J=
IT.lo] Error 1
> +#| make[1]: Leaving directory `/OE/shr-core/tmp/work/armv4t-oe-linux-gnu=
eabi/webkit-gtk-1.5.1+svnr90727-r0'
> +ARM_INSTRUCTION_SET =3D "arm"
> +
> =C2=A0CONFIGUREOPT_DEPTRACK =3D ""
>
> =C2=A0do_configure_append() {
> --
> 1.7.7
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


