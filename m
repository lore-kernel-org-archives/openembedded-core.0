Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SDA1n-0001mG-Am
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 09:44:15 +0200
Received: by vbbfr13 with SMTP id fr13so1446821vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 00:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Ujbw1tNkpeaa1a24SpyKiJyDgzMHjRAiUv4oCDpb6JQ=;
	b=tlE4PjhM68xqwU3712c1OkxICsLgVZEmefAm/9HdZ2weSsMxbCCd4D0p/00od0mR3E
	smkRoMOkXL3mMBf/Jxj10iEu8Ee30Rnrwzo63FZvMixKpzy0yl6NUJbtR8E8fQtj0qFw
	ArOSv52v40RvJRJYf24GYmtjVzeP0fg1Rz669hNitJ+2am378Gw2FcchcHctYodIxgmR
	au1Jdd7OM/Fp9NccOGI2ebp+7oW1CUUv1KmkiFcmYpfTht1/lG7D2iBprryaAKMy50iE
	q07mqk5cMEkSDoXzaMKQ7lKzqFDDZwvBBAxTJ8Qt37pA4EsGj960vYg0wuOgC1NkAnwM
	s3sA==
MIME-Version: 1.0
Received: by 10.52.72.130 with SMTP id d2mr12872872vdv.80.1333006511806; Thu,
	29 Mar 2012 00:35:11 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Thu, 29 Mar 2012 00:35:11 -0700 (PDT)
In-Reply-To: <1333003715-3872-1-git-send-email-noor_ahsan@mentor.com>
References: <1333003715-3872-1-git-send-email-noor_ahsan@mentor.com>
Date: Thu, 29 Mar 2012 04:35:11 -0300
X-Google-Sender-Auth: j9a35TmzFMNA98bTFQnx19J3SOI
Message-ID: <CAP9ODKpv8XrdPkHD3DiUT3fT5P4i-t1Fi9BoK4frV48QXkhMuQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libc-packgae.bbclass: Add i686 support in locale_arch_options
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
X-List-Received-Date: Thu, 29 Mar 2012 07:44:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Typo in commit log; please fix it and resend.

On Thu, Mar 29, 2012 at 03:48, Noor, Ahsan <noor_ahsan@mentor.com> wrote:
> From: Noor Ahsan <noor_ahsan@mentor.com>
>
> * While building for i686 architectre an error was coming that
> locale_arch_options does not have support for i686. Add missing support.
> * Verified on intel architecture.
>
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> ---
> =A0meta/classes/libc-package.bbclass | =A0 =A01 +
> =A01 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-packag=
e.bbclass
> index 4acf91a..957243d 100644
> --- a/meta/classes/libc-package.bbclass
> +++ b/meta/classes/libc-package.bbclass
> @@ -271,6 +271,7 @@ python package_do_split_gconvs () {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"mips": =
=A0 =A0" --uint32-align=3D4 --big-endian ", =A0 =A0\
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"mipsel": =
=A0" --uint32-align=3D4 --little-endian ", \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"i586": =
=A0 =A0" --uint32-align=3D4 --little-endian ", \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "i686": =A0=
 =A0" --uint32-align=3D4 --little-endian ", \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"x86_64": =
=A0" --uint32-align=3D4 --little-endian " =A0}
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if target_arch in locale_a=
rch_options:
> --
> 1.7.9
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


