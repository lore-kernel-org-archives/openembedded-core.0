Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2265A73BBA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 11:03:29 +0000 (UTC)
Received: by widdi4 with SMTP id di4so94430526wid.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 04:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=ei987s7HjzBRtiK6kWWNRTb1a3pnEhD3qUMR25/LnmM=;
	b=DlHZzwb7GqNwmIkTsbve8k1pbBCNga8A8GG1WqOXsymp7cyuQVgkVvgWNVk29JHZi2
	o+mvey2QI1hOgNIQMGF4ryMbUCmvDRdHoynUIczLXFmrlTwWIGhbJ/WHrTiOcOJLuYrR
	jfbanb0Ki6Z2LuKqASn/sb3mkxIfiV2MvUh5QC8i0sV+AxBRjBWktstWzjeEHVSx0nKs
	AgGJjHB32ns0qaoomjoqJ8BQYmGdjIfYSjG+7SPI5GqSu8yKQGvzTDF+feLJ4IkylUg5
	IpjuTAmg4iiuAFC2uhX69PHvlMKO/NtfA1H++Vq5LylN9vD784VWSPwYmR+leI95+/HD
	lGcg==
X-Received: by 10.194.90.172 with SMTP id bx12mr21003298wjb.93.1430132610627; 
	Mon, 27 Apr 2015 04:03:30 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id ex2sm1400083wjd.28.2015.04.27.04.03.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Apr 2015 04:03:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 27 Apr 2015 13:04:26 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20150427110426.GE2379@jama>
References: <1429613620-2989-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1429613620-2989-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [fido][PATCH 1/4] elfutils: fix build with -Os
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
X-List-Received-Date: Mon, 27 Apr 2015 11:03:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2015 at 12:53:37PM +0200, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

ping for all 4 changes

> ---
>  ...m-Silence-Werror-maybe-uninitialized-fals.patch | 35 ++++++++++++++++=
++++++
>  meta/recipes-devtools/elfutils/elfutils_0.161.bb   |  1 +
>  2 files changed, 36 insertions(+)
>  create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.161/0001-el=
f_getarsym-Silence-Werror-maybe-uninitialized-fals.patch
>=20
> diff --git a/meta/recipes-devtools/elfutils/elfutils-0.161/0001-elf_getar=
sym-Silence-Werror-maybe-uninitialized-fals.patch b/meta/recipes-devtools/e=
lfutils/elfutils-0.161/0001-elf_getarsym-Silence-Werror-maybe-uninitialized=
-fals.patch
> new file mode 100644
> index 0000000..3754c1c
> --- /dev/null
> +++ b/meta/recipes-devtools/elfutils/elfutils-0.161/0001-elf_getarsym-Sil=
ence-Werror-maybe-uninitialized-fals.patch
> @@ -0,0 +1,35 @@
> +From 668accf322fd7185e273bfd50b84320e71d9de5a Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <Martin.Jansa@gmail.com>
> +Date: Fri, 10 Apr 2015 00:29:18 +0200
> +Subject: [PATCH] elf_getarsym: Silence -Werror=3Dmaybe-uninitialized fal=
se
> + positive
> +
> +Upstream-Status: Pending
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +---
> + libelf/elf_getarsym.c | 9 +++++++--
> + 1 file changed, 7 insertions(+), 2 deletions(-)
> +
> +diff --git a/libelf/elf_getarsym.c b/libelf/elf_getarsym.c
> +index d0bb28a..08954d2 100644
> +--- a/libelf/elf_getarsym.c
> ++++ b/libelf/elf_getarsym.c
> +@@ -165,8 +165,13 @@ elf_getarsym (elf, ptr)
> +       int w =3D index64_p ? 8 : 4;
> +=20
> +       /* We have an archive.  The first word in there is the number of
> +-	 entries in the table.  */
> +-      uint64_t n;
> ++	 entries in the table.
> ++	 Set to SIZE_MAX just to silence -Werror=3Dmaybe-uninitialized
> ++	 elf_getarsym.c:290:9: error: 'n' may be used uninitialized in this fu=
nction
> ++	 The read_number_entries function doesn't initialize n only when retur=
ning
> ++	 -1 which in turn ensures to jump over usage of this uninitialized var=
iable.
> ++	 */
> ++      uint64_t n =3D SIZE_MAX;
> +       size_t off =3D elf->start_offset + SARMAG + sizeof (struct ar_hdr=
);
> +       if (read_number_entries (&n, elf, &off, index64_p) < 0)
> + 	{
> +--=20
> +2.3.5
> +
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.161.bb b/meta/reci=
pes-devtools/elfutils/elfutils_0.161.bb
> index a3c1f36..d8c27f5 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.161.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.161.bb
> @@ -15,6 +15,7 @@ SRC_URI +=3D "\
>          file://dso-link-change.patch \
>          file://Fix_elf_cvt_gunhash.patch \
>          file://fixheadercheck.patch \
> +        file://0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals=
=2Epatch \
>  "
> =20
>  # pick the patch from debian
> --=20
> 2.3.5
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

