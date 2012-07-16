Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SqnsA-0000e4-P8
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 18:10:10 +0200
Received: by qabg1 with SMTP id g1so1737342qab.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 08:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=GKLlaOuy3fukdQf7j9YCvUleqoB/kw3dC0cEZW3hs+0=;
	b=okHtz21Ldb0BWDP2/WXqzoqeCuEgVuTGOWiU8QFK7h1NaPoubIYdZhyH3QpqY6aDMs
	MGzPXl7jKSY/dioGmHEm7hdd8795AcAu+koJqqh0fZeWIB4p6hAzys6mGx6H5oHStI4/
	AYBf8R8i/FszyktbFPOwD/G8ftsCU7bUKXojvgwY3//Fb9GRdY6VH/0nv8ZXJK//1Ph7
	DLx8DDgyFHsSjj2B5YL7TLSQRQFBqSva4G6N1wpf9/F4upgnEvA4tfHaGyuZGHcsFLnP
	yy0VsLECBsQBe830WtURIJptGzq9OCeVf7EYzyr5Uv6jTXIXyR4lG6LEWqMINBFNwrEK
	G87A==
MIME-Version: 1.0
Received: by 10.229.106.225 with SMTP id y33mr6349009qco.76.1342454332080;
	Mon, 16 Jul 2012 08:58:52 -0700 (PDT)
Received: by 10.229.8.78 with HTTP; Mon, 16 Jul 2012 08:58:52 -0700 (PDT)
In-Reply-To: <d67e47bd457de90b19428245644dc64ecf4ba11a.1342453118.git.sgw@linux.intel.com>
References: <cover.1342453118.git.sgw@linux.intel.com>
	<d67e47bd457de90b19428245644dc64ecf4ba11a.1342453118.git.sgw@linux.intel.com>
Date: Mon, 16 Jul 2012 11:58:52 -0400
Message-ID: <CADkTA4PU2FTrOkiKFL=+imfddD+Do-kpD0K9a+BuNyG041LgnA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 09/30] linux-libc-headers: updated to 3.4.3
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
X-List-Received-Date: Mon, 16 Jul 2012 16:10:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jul 16, 2012 at 11:47 AM, Saul Wold <sgw@linux.intel.com> wrote:
> From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
>
> Tested by building core-image-sato-sdk.

We've never gone to this level of granularity in the past, since
-stable updates to
the kernel are not going to change something in the libc-headers exports.

As far as I'm concerned, bumping this for each stable release is too much churn.

Sorry I missed this during the original review/posting.

Cheers,

Bruce

>
> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc        |    2 +-
>  .../linux-libc-headers/linux-libc-headers_3.4.3.bb |    6 ++++++
>  .../linux-libc-headers/linux-libc-headers_3.4.bb   |    6 ------
>  3 files changed, 7 insertions(+), 7 deletions(-)
>  create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.3.bb
>  delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.bb
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> index f11e687..0a068be 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -22,7 +22,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
>  BINUVERSION ?= "2.22"
>  EGLIBCVERSION ?= "2.15"
>  UCLIBCVERSION ?= "0.9.33"
> -LINUXLIBCVERSION ?= "3.4"
> +LINUXLIBCVERSION ?= "3.4.3"
>
>  PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
>  PREFERRED_VERSION_gcc-cross ?= "${GCCVERSION}"
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.3.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.3.bb
> new file mode 100644
> index 0000000..6f8d9e8
> --- /dev/null
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.3.bb
> @@ -0,0 +1,6 @@
> +require linux-libc-headers.inc
> +
> +PR = "r0"
> +
> +SRC_URI[md5sum] = "3aefa02db55715d627ed23a01667057d"
> +SRC_URI[sha256sum] = "17f1256daa289dde1a0a587c9753556d37a52770f7c4efcf2666fd4796a6eacc"
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.bb
> deleted file mode 100644
> index 9e8c88f..0000000
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require linux-libc-headers.inc
> -
> -PR = "r0"
> -
> -SRC_URI[md5sum] = "146af0160fc7a60cf9acf44aec13482b"
> -SRC_URI[sha256sum] = "a797a15d0b6228381507c14ecf4eec4a6cc5c77cfd521ba3b3e1325e85b5b16d"
> --
> 1.7.7.6
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


