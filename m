Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RHHJ0-0007lP-Bl
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 17:46:46 +0200
Received: by yxj20 with SMTP id 20so1632311yxj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 08:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=NFlL3C36nBLwVYMb9Jv7gRm3XGl4g1RzDUED9YvyLo4=;
	b=pim4Ex/gX0Dnz0ATDYHZJq3t+rfMsN5DdOuDHi30y5tw6TePZYtrOPc1eLRjkbQ1Jt
	fsB7vZ8C5PUDJfSsbaVqfhHwNthFUg9VNruqgoxgWUfh0yc63TMbJf4DGzlWNO/qot2S
	xvFVFXe52vZCI2yDlHPwBYXAgymww0imYuuBc=
Received: by 10.68.17.225 with SMTP id r1mr29022963pbd.64.1319211650928; Fri,
	21 Oct 2011 08:40:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Fri, 21 Oct 2011 08:40:20 -0700 (PDT)
In-Reply-To: <9e9f9e73e7bfa4a5184196b874cfb1dfe179be24.1319184832.git.Martin.Jansa@gmail.com>
References: <cover.1319184832.git.Martin.Jansa@gmail.com>
	<bfd27053f71157d3f3d3c0bf523015347714d3f8.1319184832.git.Martin.Jansa@gmail.com>
	<9e9f9e73e7bfa4a5184196b874cfb1dfe179be24.1319184832.git.Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Oct 2011 08:40:20 -0700
Message-ID: <CAMKF1soRAhf065VCJqZsQMUct1a0Ob5S2rJzN9QpE0A0R0SZ6g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/8] pulseaudio-0.9.23: force ARM mode
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
X-List-Received-Date: Fri, 21 Oct 2011 15:46:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 21, 2011 at 1:17 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> =C2=A0.../pulseaudio/pulseaudio_0.9.23.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A01 +
> =C2=A01 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb b/me=
ta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
> index 4ac2418..2f872b8 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
> @@ -23,3 +23,4 @@ do_compile_prepend() {
> =C2=A0 =C2=A0 cp ${STAGING_LIBDIR}/libltdl* ${S}/libltdl
> =C2=A0}
>
> +ARM_INSTRUCTION_SET =3D "arm"

not averse to patch but it would be nice to know what fails in thumb mode.

> --
> 1.7.7
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


