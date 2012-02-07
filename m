Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Runy6-0000ie-QS
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 17:32:35 +0100
Received: by daln34 with SMTP id n34so2936573dal.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2012 08:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=308/O5fmUultiy+waq9WSGLcKVXmB9YEkeI3DvSHr5k=;
	b=N1IxV4tP1VE8euDuDOM4rWc1ANQNAAc/7ei1DfZ5dds5+WASdW24xRMfgadle/qXab
	aIXdadgMhWPYkrK60jX18uZ295WPMpPdiCcRNwfiqcXDz1D3Sbu38XwYDE9I+buYS5bZ
	PNU2HiGOJnlqMipMgn6yAKz+hxEPdtPuBJVPs=
MIME-Version: 1.0
Received: by 10.68.116.234 with SMTP id jz10mr58733252pbb.84.1328631871399;
	Tue, 07 Feb 2012 08:24:31 -0800 (PST)
Received: by 10.142.139.16 with HTTP; Tue, 7 Feb 2012 08:24:31 -0800 (PST)
In-Reply-To: <b77a4edb8a1782a2d04eda1b751d36b608a5f455.1328423023.git.bruce.ashfield@windriver.com>
References: <cover.1328423023.git.bruce.ashfield@windriver.com>
	<b77a4edb8a1782a2d04eda1b751d36b608a5f455.1328423023.git.bruce.ashfield@windriver.com>
Date: Tue, 7 Feb 2012 11:24:31 -0500
Message-ID: <CADkTA4PM=kKSdwri1xSJFFTUPo-6K6s316QPOQwxk2F0QY7k_w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: dvhart@linux.intel.com, saul.wold@intel.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/5] linux-yocto: fri2: use emgd-1.10
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
X-List-Received-Date: Tue, 07 Feb 2012 16:32:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 5, 2012 at 1:31 AM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> Updating meta for the following change:
>
> =A0 =A0fri2: use emgd-1.10
>
> =A0 =A0Use the yocto/emgd-1.10 branch in place of yocto/emgd.
>
> Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
> =A0meta/recipes-kernel/linux/linux-yocto_3.2.bb | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bb b/meta/recipes-=
kernel/linux/linux-yocto_3.2.bb
> index a80924d..c13fb37 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.2.bb

An update on this change:

I touched the wrong file for this update, the emgd changes are for the 3.0
kernel, not 3.2 (they will eventually be there as well, just not now).
I've fixed
this and re-pushed the top commit to my contrib branch.

The new diffstat is this:

  meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    2 +-
  meta/recipes-kernel/linux/linux-yocto_3.0.bb    |    2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)

I'm off to check my builders to see why this chugged along in my local
testing.

Cheers,

Bruce


> @@ -23,7 +23,7 @@ SRCREV_machine_qemuppc ?=3D "b8228f337002ad88f1e152d0c0=
c46c6035cd0428"
> =A0SRCREV_machine_qemux86 ?=3D "417fc778a86e81303bab5883b919ee422ec51c04"
> =A0SRCREV_machine_qemux86-64 ?=3D "417fc778a86e81303bab5883b919ee422ec51c=
04"
> =A0SRCREV_machine ?=3D "417fc778a86e81303bab5883b919ee422ec51c04"
> -SRCREV_meta ?=3D "138bf5b502607fe40315c0d76822318d77d97e01"
> +SRCREV_meta ?=3D "b78a519841bd8b477cad599af8d38df6760445c1"
>
> =A0PR =3D "r0"
> =A0PV =3D "${LINUX_VERSION}+git${SRCPV}"
> --
> 1.7.4.1
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


