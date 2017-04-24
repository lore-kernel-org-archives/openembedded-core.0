Return-Path: <andrej.valek@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 3923571DDE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 06:41:41 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v3O6fbFd031235
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Mon, 24 Apr 2017 08:41:37 +0200
Received: from ATVIES991UGMSX.ww300.siemens.net
	(atvies991ugmsx.ww300.siemens.net [158.226.163.37])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTPS id v3O6fX9A008190
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 24 Apr 2017 08:41:37 +0200
Received: from ATNETS9912WMSX.ww300.siemens.net ([169.254.10.23]) by
	ATVIES991UGMSX.ww300.siemens.net ([158.226.163.37]) with mapi id
	14.03.0339.000; Mon, 24 Apr 2017 08:41:36 +0200
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: akuster808 <akuster808@gmail.com>
Thread-Topic: [OE-core] [PATCH][morty] glibc: Security fix CVE-2016-6323
Thread-Index: AQHSuuO9ZilRPfUAIEOE7aNxIRYE2KHUEu6Q
Date: Mon, 24 Apr 2017 06:41:36 +0000
Message-ID: <D55698ECEC159B488D62A508E18D7FEC0147B8D2@ATNETS9912WMSX.ww300.siemens.net>
References: <1492771066-9051-1-git-send-email-andrej.valek@siemens.com>
	<1e25144c-3a2b-a0de-1c28-7a1cd2597bed@gmail.com>
In-Reply-To: <1e25144c-3a2b-a0de-1c28-7a1cd2597bed@gmail.com>
Accept-Language: en-US, de-AT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.226.163.18]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][morty] glibc: Security fix CVE-2016-6323
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
X-List-Received-Date: Mon, 24 Apr 2017 06:41:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Armin,

Patches http://lists.openembedded.org/pipermail/openembedded-core/2017-Apri=
l/135828.html and http://lists.openembedded.org/pipermail/openembedded-core=
/2017-April/135829.html are the same.=20
I have resubmitted them, because "[PATCH]" was missing message header. I do=
n't know, if the word is required... (Patchwork didn't show them).

Andrej

> On 4/21/17 09:10 PM, akuster808 wrote:=20
> what is different about this one and the one sent on the 19th?

> -armin

>On 4/21/17 3:37 AM, Andrej Valek wrote:
> arm: mark __startcontext as .cantunwind, GNU
>
> CVE: CVE-2016-6323
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>

> ---
>  meta/recipes-core/glibc/glibc/CVE-2016-6323.patch | 39 +++++++++++++++++=
++++++
>  meta/recipes-core/glibc/glibc_2.24.bb             |  1 +
>  2 files changed, 40 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2016-6323.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/CVE-2016-6323.patch=20
> b/meta/recipes-core/glibc/glibc/CVE-2016-6323.patch
> new file mode 100644
> index 0000000..f9b9fa5
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/CVE-2016-6323.patch
> @@ -0,0 +1,39 @@
> +glibc-2.24: Fix CVE-2016-6323
> +
> +[No upstream tracking] --=20
> +https://sourceware.org/bugzilla/show_bug.cgi?id=3D20435
> +
> +arm: mark __startcontext as .cantunwind, GNU
> +
> +Glibc bug where the makecontext function would create an execution=20
> +context which is incompatible with the unwinder, causing it to hang=20
> +when the generation of a backtrace is attempted.
> +
> +Upstream-Status: Backport=20
> +[https://sourceware.org/git/gitweb.cgi?p=3Dglibc.git;h=3D9e2ff6c9cc54c0b=
4
> +402b8d49e4abe7000fde7617]
> +CVE: CVE-2016-6323
> +Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> +Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> +
> +diff --git a/sysdeps/unix/sysv/linux/arm/setcontext.S=20
> +b/sysdeps/unix/sysv/linux/arm/setcontext.S
> +index 603e508..d1f168f 100644
> +--- a/sysdeps/unix/sysv/linux/arm/setcontext.S
> ++++ b/sysdeps/unix/sysv/linux/arm/setcontext.S
> +@@ -86,12 +86,19 @@ weak_alias(__setcontext, setcontext)
> +=20
> + 	/* Called when a makecontext() context returns.  Start the
> + 	   context in R4 or fall through to exit().  */
> ++	/* Unwind descriptors are looked up based on PC - 2, so we have to
> ++	   make sure to mark the instruction preceding the __startcontext
> ++	   label as .cantunwind.  */
> ++	.fnstart
> ++	.cantunwind
> ++	nop
> + ENTRY(__startcontext)
> + 	movs    r0, r4
> + 	bne     PLTJMP(__setcontext)
> +=20
> + 	@ New context was 0 - exit
> + 	b       PLTJMP(HIDDEN_JUMPTARGET(exit))
> ++	.fnend
> + END(__startcontext)
> +=20
> + #ifdef PIC
> diff --git a/meta/recipes-core/glibc/glibc_2.24.bb=20
> b/meta/recipes-core/glibc/glibc_2.24.bb
> index f5a21b2..bce06c7 100644
> --- a/meta/recipes-core/glibc/glibc_2.24.bb
> +++ b/meta/recipes-core/glibc/glibc_2.24.bb
> @@ -37,6 +37,7 @@ SRC_URI =3D "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};nam=
e=3Dglibc \
>             file://0024-eglibc-Forward-port-cross-locale-generation-suppo=
rt.patch \
>             file://0025-Define-DUMMY_LOCALE_T-if-not-defined.patch \
>             file://0026-build_local_scope.patch \
> +           file://CVE-2016-6323.patch \
>  "
> =20
>  SRC_URI +=3D "\


--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

