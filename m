Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QlMeE-00044d-N0
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 17:00:46 +0200
Received: by yib18 with SMTP id 18so2285575yib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2011 07:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=na0o7aMZ82UOUBKZl5oaoE3m6PFaPFLib9o8Y5T5ZgY=;
	b=X00tCdbOUSiK6dvRst/JsyZF3yNZt0QLEm9Y+4k67e/tygoBSWI0MRoP25vnDungRP
	0Dk0Eba9P649vr77xWpjgLS2pRO9Zw6SA1ctduGCJ6fNl3x7TlxooeqKOT/NbNjvMfRA
	+QZ3I07/Ca0GtE7cquJca8k1Bo3OS2UD8bGQ8=
MIME-Version: 1.0
Received: by 10.91.17.22 with SMTP id u22mr4610414agi.133.1311605793570; Mon,
	25 Jul 2011 07:56:33 -0700 (PDT)
Received: by 10.91.12.2 with HTTP; Mon, 25 Jul 2011 07:56:33 -0700 (PDT)
In-Reply-To: <35b13046d50006f3eec3f0cbfd37c8463c1fb485.1311605321.git.bruce.ashfield@windriver.com>
References: <cover.1311605321.git.bruce.ashfield@windriver.com>
	<35b13046d50006f3eec3f0cbfd37c8463c1fb485.1311605321.git.bruce.ashfield@windriver.com>
Date: Mon, 25 Jul 2011 10:56:33 -0400
Message-ID: <CADkTA4O9CVTN+ZDFDtajPM2=E-EdYPCvagphm9iGToC1vvRoCA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] machine/qemu: set preferred linux-yocto kernel version
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
X-List-Received-Date: Mon, 25 Jul 2011 15:00:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 25, 2011 at 10:51 AM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> The introduction of the linux-yocto-3.0 kernel is taking
> precedence over the known working 2.6.37 version. Forcing
> 2.6.37 until 3.0 is validated on the qemu machines.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
> =A0meta/conf/machine/include/qemu.inc | =A0 =A01 +
> =A01 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/inclu=
de/qemu.inc
> index 9ef242f..c2d116f 100644
> --- a/meta/conf/machine/include/qemu.inc
> +++ b/meta/conf/machine/include/qemu.inc
> @@ -12,6 +12,7 @@ RDEPENDS_kernel-base =3D ""
>
> =A0# Use a common kernel recipe for all QEMU machines
> =A0PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
> +PREFERRED_VERSION_linux-yocto =3D "2.6.37+git%"

gak. This should be ?=3D, I'll update the patch and re-push.

Bruce

> =A0#PREFERRED_PROVIDER_linux-libc-headers ?=3D "linux-libc-headers-yocto"
>
> =A0EXTRA_IMAGEDEPENDS +=3D "qemu-native qemu-helper-native"
> --
> 1.7.4.1
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


