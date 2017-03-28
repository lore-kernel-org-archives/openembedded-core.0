Return-Path: <kergoth@gmail.com>
Received: from mail-ot0-f179.google.com (mail-ot0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8171477AF0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 20:12:20 +0000 (UTC)
Received: by mail-ot0-f179.google.com with SMTP id t8so55347507otf.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 13:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Tb2saieXxMvvUFXWKO7BVsj3CzT2dO3XHhH1IVOrfYY=;
	b=d/MDpkxq1cRU1fPjjfvJ6158ossc9vdTR3jr9yjy0YdZxIT1YymanGt+rQLfERRD9H
	aYFgtOFkYaY7DS+GWbrtF1yjroA+Uj7Jdd6BQQYs4Cmrogk+hpEqF+Z+jbiSeLx2PTek
	T+NAdJ5ypKHzIbvAnyW0Y0IBKr7QiDp+Iwkl4ekdlpUWEzfoJHOL4tNpSbVfPRUbo+Ol
	iBF3itRMQltbOcbOGpkUJQJMclUjmavpgG1bfZZHVWRb+Hb/jauqs1IGHlGJmSa9RShj
	CdrY6t/hfDGKnblzI2B/qDvsVRVeeCeoJA9F1bZiWx6hgbXQSeRIhdAmjy8+75SB0ByP
	GtxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Tb2saieXxMvvUFXWKO7BVsj3CzT2dO3XHhH1IVOrfYY=;
	b=U7rk5Om6zlRk/Q1RJNcteJgQSSMguvYYk8lNHFlKHm2L92Txi8HY1w+BjK+UXN4nGV
	qsZy2ObBzCf2NB9aJUpsKW44E1GcU4d2mBnOrUyscVaXpsVFWPxldtuUjYXddQdN6Ion
	06nUe8RPn3FTKDsZSDIekO7rMmdXw1+ykuV7iIYZzpl1PN2792r7drbk+kjoRkDei3Eu
	RlnRAL9UU9yAPik67WkCh4kQUKXt/oM0FyDUURpQ4iwsPG3ZIVEu8rTKpJdq6diLBv0u
	kCk5zJp1euXoySB/WRVmBaH1mgV5zlV7bNbFMrBkgSFApbGnB1/P7lkW+3vCLgpe1mwK
	Sk1A==
X-Gm-Message-State: AFeK/H0pkjsLN4l0tEd6ThamXW8B1w2rKH1r3Bq955x+mZU1dtrgshHfILAbbeentMoyi/LL3Kiw+xN0mrro0g==
X-Received: by 10.157.58.68 with SMTP id j62mr15463886otc.145.1490731942249;
	Tue, 28 Mar 2017 13:12:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.32.161 with HTTP; Tue, 28 Mar 2017 13:12:01 -0700 (PDT)
In-Reply-To: <e1eee1aa56e1dc59a55a9cac25a00a1ea2f9375e.1490727568.git.spopovyc@cisco.com>
References: <e1eee1aa56e1dc59a55a9cac25a00a1ea2f9375e.1490727568.git.spopovyc@cisco.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Tue, 28 Mar 2017 13:12:01 -0700
Message-ID: <CABcZAN=pYQH82T4Gxi9VneWQtRQYZyeu+Wrr+4V7iWeXW+_RvA@mail.gmail.com>
To: Serhii Popovych <spopovyc@cisco.com>
Cc: XE-Linux <xe-linux-external@cisco.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ca-certificates: Fix symlinks to the certificates in nativesdk
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
X-List-Received-Date: Tue, 28 Mar 2017 20:12:23 -0000
Content-Type: multipart/alternative; boundary=001a114929e6df89b9054bd01364

--001a114929e6df89b9054bd01364
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 28, 2017 at 12:00 PM, Serhii Popovych <spopovyc@cisco.com>
wrote:

> Symlinks to certificates in buildtools-tarball at /etc/ssl/certs
> installed with absolute pathes making these sumlinks pointing
> outside of toolchain to the host system locations.
>
> These locations may not contain some certificates (thus link to
> the certificate in toolchain is broken) or host system
> certificate may be revoked by CRL or outdated.
>
> Since this change seems non intrusive for target package apply
> patch for all builds.
>
> Cc: XE-Linux <xe-linux-external@cisco.com>
> Signed-off-by: Serhii Popovych <spopovyc@cisco.com>
>

We actually run a script against the entire sdk sysroot to convert all
absolute links to relative (see `POPULATE_SDK_POST_TARGET_COMMAND +=3D
=E2=80=9Crootfs_sysroot_relativelinks;` in image.bbclass and
rootfs_sysroot_relativelinks in rootfs-postcommands.bbclass), but this
script had a bug. I recently sent a patch (this morning) to it to fix this
exact issue. Of course, it wouldn=E2=80=99t hurt to also change the behavio=
r in the
recipe, but it=E2=80=99s not necessary with the script fixed.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a114929e6df89b9054bd01364
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Mar 28, 2017 at 12:00 PM, Serhii Popovych <span dir=3D"ltr">&lt;<a =
href=3D"mailto:spopovyc@cisco.com" target=3D"_blank">spopovyc@cisco.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bor=
der-left-style:solid;padding-left:1ex"><div id=3D"gmail-:3o6" class=3D"gmai=
l-a3s gmail-aXjCH gmail-m15b164aedd3825ff">Symlinks to certificates in buil=
dtools-tarball at /etc/ssl/certs<br>
installed with absolute pathes making these sumlinks pointing<br>
outside of toolchain to the host system locations.<br>
<br>
These locations may not contain some certificates (thus link to<br>
the certificate in toolchain is broken) or host system<br>
certificate may be revoked by CRL or outdated.<br>
<br>
Since this change seems non intrusive for target package apply<br>
patch for all builds.<br>
<br>
Cc: XE-Linux &lt;<a href=3D"mailto:xe-linux-external@cisco.com">xe-linux-ex=
ternal@cisco.com</a>&gt;<br>
Signed-off-by: Serhii Popovych &lt;<a href=3D"mailto:spopovyc@cisco.com">sp=
opovyc@cisco.com</a>&gt;</div></blockquote></div><br>We actually run a scri=
pt against the entire sdk sysroot to convert all absolute links to relative=
 (see `POPULATE_SDK_POST_TARGET_COMMAND +=3D =E2=80=9Crootfs_sysroot_relati=
velinks;` in image.bbclass and rootfs_sysroot_relativelinks in rootfs-postc=
ommands.bbclass), but this script had a bug. I recently sent a patch (this =
morning) to it to fix this exact issue. Of course, it wouldn=E2=80=99t hurt=
 to also change the behavior in the recipe, but it=E2=80=99s not necessary =
with the script fixed.<br>-- <br><div class=3D"gmail_signature"><div dir=3D=
"ltr"><div><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<=
br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Senior Software Engineer,=
 Mentor Graphics</div></div></div></div>
</div></div>

--001a114929e6df89b9054bd01364--
