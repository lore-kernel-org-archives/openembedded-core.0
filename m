Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id CBB9B7E6C6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 22:52:00 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id k21so19176820edq.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 15:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zYIsHlKRYatsyg5Oq8yKeGAEcHepoCqFS7mq/P7yI6E=;
	b=lJfsO+QMksSzm8bzd1s0PU0vgqjaAAR92G5O6OhKd/GArDx8+7ekS7xuEV0oVhRDZ8
	Q1uRMywtj2WEk7SkfzcLFFXDe49WNLp0o2BSrVz++7PYMgUsOOFOeH84Ai5JHv1dcQit
	HDPPBzzMaI56Zpk5PsfPlE7Rdzg8ibkgOpOEcXuJiu+H0lz7rMZoq/c3prneo3kbXZHo
	oGLiS2OW2B66tyAZV6x7BXpnxqzTpdrlXUVWzmZcIM/LaBlCcBhz9zGRrXiB1TwqEglj
	D9hpkgxfxmxs0KJaH+mNstp97m6LfQzpQceUM1wMcFsImsPNW521wIClV08GUPC6l3M+
	LkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zYIsHlKRYatsyg5Oq8yKeGAEcHepoCqFS7mq/P7yI6E=;
	b=C1aiWJkiOtZWzrZl0R78XfPgsW0aPQHF4EaHD9AVdkupRz3DX7nOhsu/OoIU+noiQl
	yPYUIL8FGo44S4ZPJYbx+25+r162PRxClN2XztEK/HfPAg6q5G+QaNUQBaQ8japCE/SY
	bR6QW1Fo0/uJLfqeFD5wcQpDkhPEtTiDJg26/PgvLWiHjrqPeH04ffe0VLcK8R811EW6
	Kd5IkUndj6nbY1IcKImslkCHX8RzE/UkmJaRgKMUw0Dey1jLfHu+GRVBptzMS/HokuMT
	pKSSCPrksDCnjgKGS1VABOYObxoh293e2fNbctfAIOTizIj1McLkQsDwgf14J7gdsj2r
	TxuQ==
X-Gm-Message-State: APjAAAWTwyYF7XiNxX3bkXCnfuiSb5Jmn4FObexc5WDcPtbIq7u2Biyn
	Btw5/wC3ydHjnnAvH+jY2wSPjGuXUunvfSy/+Vk=
X-Google-Smtp-Source: APXvYqy/dORU+aBFPM3jkVA3Ayj8XsJOKcj18vwu7ghe3u8SYEv/DbmiBT29pSRK1NtFaHojFbw1USr7O/o4gjRg8lk=
X-Received: by 2002:a17:906:55d4:: with SMTP id
	z20mr59595392ejp.205.1560293521483; 
	Tue, 11 Jun 2019 15:52:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190527134419.14223-1-anuj.mittal@intel.com>
	<20190527134419.14223-2-anuj.mittal@intel.com>
In-Reply-To: <20190527134419.14223-2-anuj.mittal@intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 12 Jun 2019 00:51:52 +0200
Message-ID: <CA+chaQcsY9ywdEvoa5vYqy4pyGmehtzUgF3X97MHpFBKXWDfBw@mail.gmail.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] Revert "image_types: use pigz to create .gz files"
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
X-List-Received-Date: Tue, 11 Jun 2019 22:52:01 -0000
Content-Type: multipart/alternative; boundary="00000000000017eca3058b142564"

--00000000000017eca3058b142564
Content-Type: text/plain; charset="UTF-8"

This is just FYI:

This probably won't happen with most of OE use-cases, but even with pigz
being the drop in replacement, there are some differences, e.g. when I'm
using pigz-2.4 on my Gentoo host as gzip, xmltex-1.9.tar.gz fails to unpack
gzip: warning:
/tmp/tmpfs/portage/dev-tex/xmltex-1.9-r2/distdir/xmltex-1.9.tar.gz:
trailing junk was ignored
ERROR: dev-tex/xmltex-1.9-r2::gentoo failed (unpack phase):
   unpack: failure unpacking xmltex-1.9.tar.gz

yes xmltex-1.9.tar.gz has something strange in the archive and emerge
should ignore the error from gzip (gzip itself shows it only as a warning),
but it doesn't and it's a bit confusing to find out that gzip is actually
pigz for someone who didn't see this commit :).

On Mon, May 27, 2019 at 3:44 PM Anuj Mittal <anuj.mittal@intel.com> wrote:

> This reverts commit a559ffab30b7b45849ace023808c1fb20811d43d.
>
> This is not needed now that pigz has been marked as a drop-in
> replacement.
>
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  meta/classes/image_types.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/image_types.bbclass
> b/meta/classes/image_types.bbclass
> index 1c44ec4a80..fd98a7d1bd 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -284,7 +284,7 @@ COMPRESSIONTYPES ?= ""
>
>  CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip sum md5sum sha1sum
> sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vdi qcow2 base64
> ${COMPRESSIONTYPES}"
>  CONVERSION_CMD_lzma = "lzma -k -f -7
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> -CONVERSION_CMD_gz = "pigz -f -9 -n -c
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} >
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
> +CONVERSION_CMD_gz = "gzip -f -9 -n -c
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} >
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
>  CONVERSION_CMD_bz2 = "pbzip2 -f -k
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
>  CONVERSION_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_DEFAULTS}
> --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} >
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
>  CONVERSION_CMD_lz4 = "lz4 -9 -z -l
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000017eca3058b142564
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This is just FYI:</div><div><br></div><div>This proba=
bly won&#39;t happen with most of OE use-cases, but even with pigz being th=
e drop in replacement, there are some differences, e.g. when I&#39;m using =
pigz-2.4 on my Gentoo host as gzip, xmltex-1.9.tar.gz fails to unpack</div>=
gzip: warning: /tmp/tmpfs/portage/dev-tex/xmltex-1.9-r2/distdir/xmltex-1.9.=
tar.gz: trailing junk was ignored<br><div>ERROR: dev-tex/xmltex-1.9-r2::gen=
too failed (unpack phase):<br>=C2=A0 =C2=A0unpack: failure unpacking xmltex=
-1.9.tar.gz<br></div><div><br></div><div>yes xmltex-1.9.tar.gz has somethin=
g strange in the archive and emerge should ignore the error from gzip (gzip=
 itself shows it only as a warning), but it doesn&#39;t and it&#39;s a bit =
confusing to find out that gzip is actually pigz for someone who didn&#39;t=
 see this commit :).<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, May 27, 2019 at 3:44 PM Anuj Mittal &=
lt;<a href=3D"mailto:anuj.mittal@intel.com">anuj.mittal@intel.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This rever=
ts commit a559ffab30b7b45849ace023808c1fb20811d43d.<br>
<br>
This is not needed now that pigz has been marked as a drop-in<br>
replacement.<br>
<br>
Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com" tar=
get=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/image_types.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bb=
class<br>
index 1c44ec4a80..fd98a7d1bd 100644<br>
--- a/meta/classes/image_types.bbclass<br>
+++ b/meta/classes/image_types.bbclass<br>
@@ -284,7 +284,7 @@ COMPRESSIONTYPES ?=3D &quot;&quot;<br>
<br>
=C2=A0CONVERSIONTYPES =3D &quot;gz bz2 lzma xz lz4 lzo zip sum md5sum sha1s=
um sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vdi qcow2 base6=
4 ${COMPRESSIONTYPES}&quot;<br>
=C2=A0CONVERSION_CMD_lzma =3D &quot;lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME=
_SUFFIX}.${type}&quot;<br>
-CONVERSION_CMD_gz =3D &quot;pigz -f -9 -n -c ${IMAGE_NAME}${IMAGE_NAME_SUF=
FIX}.${type} &gt; ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz&quot;<br>
+CONVERSION_CMD_gz =3D &quot;gzip -f -9 -n -c ${IMAGE_NAME}${IMAGE_NAME_SUF=
FIX}.${type} &gt; ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz&quot;<br>
=C2=A0CONVERSION_CMD_bz2 =3D &quot;pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_S=
UFFIX}.${type}&quot;<br>
=C2=A0CONVERSION_CMD_xz =3D &quot;xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_=
DEFAULTS} --check=3D${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}=
.${type} &gt; ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz&quot;<br>
=C2=A0CONVERSION_CMD_lz4 =3D &quot;lz4 -9 -z -l ${IMAGE_NAME}${IMAGE_NAME_S=
UFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4&quot;<br>
-- <br>
2.20.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--00000000000017eca3058b142564--
