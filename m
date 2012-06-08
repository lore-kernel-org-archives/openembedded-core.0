Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Sd1Oc-0001ML-8e
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 17:46:42 +0200
Received: by dalh21 with SMTP id h21so2365339dal.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jun 2012 08:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=AteJN/fNRdwvVqj9aeItFNaXsr1ckd1gwpmD74qxWDk=;
	b=jkozSNnUXoqF65YoHwiiVYWtkn9eID7hYIF9vqXscvjSpyJZpExmaZ86vap5jaADHQ
	l1rcPmx1+/U9y+U7CfopsK5lO0Uv3IPZSeKghTB4yEmdqIWTlDDuTGW3OpiwXY5uGOD3
	k3QwYhRfIswwzOxTSme7Us6jINkWP5yWvQV/u3fzl8zalABwqI0CgLSlL/094hFBrSC9
	7Ldsgd2Q0TwOUgTDajVpFZc2mPj5iWgacGVyPiYubKl7zka6xLp94rKDVJc0TT5vWPxn
	CUowwYil74/5RBcBFuFxURvXT/pFlfhYJ18HSYwlUbkTCIerzyjJjv8/t/Yukh6F8IML
	Z8IQ==
MIME-Version: 1.0
Received: by 10.68.132.166 with SMTP id ov6mr21870642pbb.24.1339169770754;
	Fri, 08 Jun 2012 08:36:10 -0700 (PDT)
Received: by 10.68.197.4 with HTTP; Fri, 8 Jun 2012 08:36:10 -0700 (PDT)
In-Reply-To: <c909caf522c3e75922f02d55d9a412984f37b2a0.1339169972.git.bruce.ashfield@windriver.com>
References: <cover.1339169970.git.bruce.ashfield@windriver.com>
	<c909caf522c3e75922f02d55d9a412984f37b2a0.1339169972.git.bruce.ashfield@windriver.com>
Date: Fri, 8 Jun 2012 11:36:10 -0400
Message-ID: <CADkTA4PhMcBYz4wPuNuqXaHAi6Oi7wOJeKwrhtRYzUJRg5Mt8A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] linux-libc-headers: set default LINUXLIBCVERSION to 3.4
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
X-List-Received-Date: Fri, 08 Jun 2012 15:46:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 8, 2012 at 11:42 AM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> The 3.4 kernel is released, and is the default for qemu* builds, so
> we can safely update the default libc-headers version to 3.4.
>
> Built and booted for qemu*
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
> =A0meta/conf/distro/include/tcmode-default.inc =A0 =A0 =A0 =A0| =A0 =A02 =
+-
> =A0.../linux-libc-headers/linux-libc-headers_3.4.bb =A0 | =A0 =A06 ++++++
> =A02 files changed, 7 insertions(+), 1 deletions(-)
> =A0create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-h=
eaders_3.4.bb
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/dist=
ro/include/tcmode-default.inc
> index 469233d..89c72c5 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -22,7 +22,7 @@ SDKGCCVERSION ?=3D "${GCCVERSION}"
> =A0BINUVERSION ?=3D "2.22"
> =A0EGLIBCVERSION ?=3D "2.15"
> =A0UCLIBCVERSION ?=3D "0.9.33"
> -LINUXLIBCVERSION ?=3D "3.2"
> +LINUXLIBCVERSION ?=3D "3.4"
>
> =A0PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
> =A0PREFERRED_VERSION_gcc-cross ?=3D "${GCCVERSION}"
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.=
4.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.bb
> new file mode 100644
> index 0000000..9cedd52
> --- /dev/null
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.bb
> @@ -0,0 +1,6 @@
> +require linux-libc-headers.inc
> +
> +PR =3D "r1"

FYI: this r1 came from the reference libc-headers that I used .. but
now that I think
about it, it should be r0.

I can make that change on my topic branch.

Cheers,

Bruce

> +
> +SRC_URI[md5sum] =3D "146af0160fc7a60cf9acf44aec13482b"
> +SRC_URI[sha256sum] =3D "a797a15d0b6228381507c14ecf4eec4a6cc5c77cfd521ba3=
b3e1325e85b5b16d"
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


