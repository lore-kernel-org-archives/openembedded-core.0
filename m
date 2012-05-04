Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SQN5g-0005CI-G6
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 20:18:52 +0200
Received: by lbol5 with SMTP id l5so2087563lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2012 11:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=bvM6jSiqd4RIHRzxXbRZcERw/mIxvvQHbdoPEIiGOZQ=;
	b=bq4s3juRGnIy8KiHwL/TMc2KeCD57vGdG/+9hk2aXuY80TkZJbUUV8mfLIxtmf3sKt
	JGNLuj9kGJXRNjnus2mYus22Zf3dZVmhd+Xm6S3BgfjzuL7TGu8QNHhnyaV8p90HjeyT
	XJhwTlSsKag9FOnA01GxW6mYw8dkgea54HDt1CdgYv2Psn3io5y0uvIWKgfG+CtdH8Xr
	Cb2KFnG5lv7M1doZ2O5aFAY43bCdKtSvn5NpTAm9S+92VbFQqyKOkqmZJ9f1pMNMs7yX
	q2b3BkVvyLpMii+m4jJypWJj99xftKMD5UY3NFqbG+tlf8AYEIoqicsIdBKpIy5b+gHw
	lTrA==
Received: by 10.112.86.101 with SMTP id o5mr3390773lbz.1.1336154945503; Fri,
	04 May 2012 11:09:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Fri, 4 May 2012 11:08:35 -0700 (PDT)
In-Reply-To: <1336136984-11129-1-git-send-email-obi@opendreambox.org>
References: <1336136984-11129-1-git-send-email-obi@opendreambox.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 May 2012 11:08:35 -0700
Message-ID: <CAMKF1squHkCYjzuZWxUqsEmbGbgUKbnP2EHbtdF=G-8h4bVjYA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-4.6: explicitly disable ppl
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
X-List-Received-Date: Fri, 04 May 2012 18:18:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 4, 2012 at 6:09 AM, Andreas Oberritter <obi@opendreambox.org> w=
rote:
> * Fixes the following error after a system library upgrade
> | .../mipsel-oe-linux/4.6.4/cc1: error while loading shared libraries: li=
bppl.so.10: cannot open shared object file: No such file or directory
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
> * This patch is based on the denzil branch.
>
> =C2=A0meta/recipes-devtools/gcc/gcc-4.6.inc | =C2=A0 =C2=A03 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtool=
s/gcc/gcc-4.6.inc
> index 020e21b..74843ae 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.6.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
> @@ -1,6 +1,6 @@
> =C2=A0require gcc-common.inc
>
> -PR =3D "r25"
> +PR =3D "r26"
>
> =C2=A0# Third digit in PV should be incremented after a minor release
> =C2=A0# happens from this branch on gcc e.g. currently its 4.6.0
> @@ -93,6 +93,7 @@ EXTRA_OECONF_BASE =3D " --enable-lto \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0--disable-libmudflap \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0--with-system-zlib \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0--with-linker-hash-style=3D${LINKER_HASH_STYLE} \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --without-ppl \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0--enable-cheaders=3Dc_global "
>
> =C2=A0EXTRA_OECONF_INITIAL =3D "--disable-libmudflap \
> --
> 1.7.9.5
>
>

You will also need to disable cloog
infact you should backport

commit 523df15bcc21e1749771cca757613f3520243b8e
Author: Khem Raj <raj.khem@gmail.com>
Date:   Thu Mar 22 16:08:03 2012 -0700

    gcc-4.7: Disable cloog and ppl

    If build system has those libraries installed
    gcc configure will pick them up. We want
    consistent builds so we disable them since we
    do not (yet) support them

    Signed-off-by: Khem Raj <raj.khem@gmail.com>



> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


