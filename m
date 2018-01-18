Return-Path: <sstncr@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7754471DDD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 16:41:09 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id f4so10826335qtj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 08:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Fa2GB5bK4kiszJ1SyRMx2Z59vGVjJNuY+gHh/A3LAVM=;
	b=BbU+3uqLtVeWlV1HM0hAWSKzymjtsuJPu5jI9yR4eydiGdJUamTOtPyJ/w/4sRUPbo
	g7slgyfHFFKHieNQS17bkc7ehzvKYHx7ZEuGYPSkqD7P0NIYiBnOF2vnSHz2s1xC61AH
	pgSV8ZcKqVRs6UC+8+/PEtPIyRf1mtv5SgF9sfVnTRBMvqA3Wr8hgzWneBljuLahPgfV
	QtiPaQAu6ijvGF5PEov5ulsuTkHjP7/G0LMrahZBOBLlgPrwfE0cOgSGRj2pER0aDctZ
	U/0fx5H8PlOwDRKScwIfQyGgU7AMZcHLR7kuhKwx1fsJ1ba0Ed4r9A/8LwCzCZkH7+sf
	HQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Fa2GB5bK4kiszJ1SyRMx2Z59vGVjJNuY+gHh/A3LAVM=;
	b=LqnKCM2lMG/skB9XfmjgxV3anNcCGapRFW8o887VhzJrAlvGLyWqNV6fJVXyiTmE+R
	devw1zrQtWtUfUuiMXHLA/upVEdS41sB3dR9rd+CbcFjoJhXErgCwe0ba7/P6nIzKaKY
	pSn2a4Uh5xdLOEHGexWm1PCCAjGH0wkO04izLIg+kpcPXLiy0kFQwftOZHLKaYw7g3jD
	VoSKm+mf9t5/QrZFDis8svNPfwj0b2FSaR3aA4TqD9zv7vcF6T9ANBMfwYf6CwhUHjmx
	CwMeRa2cLYvwwDR9TO/efrGDJ475FKxwquWGWODwy9NU5acvQW5TTTMz9t87K4Y13pFW
	U14Q==
X-Gm-Message-State: AKwxyte/dJ023V7kFK+0zwmIeqaUGRpafStTqAaiFdAns1HQXXjta/A7
	rIQn0jogfw68W0d7Pa3hP5dCSJTuK7z1uFwtq3E=
X-Google-Smtp-Source: ACJfBotarnDsI57I/C0oNYGt0rH1t8W0nBPaETatZNOqAj8RKwZwDn99Cq+agftUoKB5tsdKodhRX9CO8ixGcx0Qg10=
X-Received: by 10.55.24.16 with SMTP id j16mr64670366qkh.298.1516293670321;
	Thu, 18 Jan 2018 08:41:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.200.1.6 with HTTP; Thu, 18 Jan 2018 08:41:09 -0800 (PST)
In-Reply-To: <8270727b-0177-4b21-7235-6febe3bec51b@gmail.com>
References: <1515686841-28097-1-git-send-email-sstncr@gmail.com>
	<1515686841-28097-2-git-send-email-sstncr@gmail.com>
	<8270727b-0177-4b21-7235-6febe3bec51b@gmail.com>
From: Stefan Stanacar <sstncr@gmail.com>
Date: Thu, 18 Jan 2018 18:41:09 +0200
Message-ID: <CANr+NRtRWCoNHDsrGL8+WSvF=tvfCMUjvmvwm2CnphUE1hfPpA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [morty][PATCH] kernel.bbclass: Fix symlink creation when using externalsrc
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
X-List-Received-Date: Thu, 18 Jan 2018 16:41:09 -0000
Content-Type: multipart/alternative; boundary="001a114415e6984ac405630fa182"

--001a114415e6984ac405630fa182
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 17, 2018 at 9:04 PM, akuster808 <akuster808@gmail.com> wrote:

>
>
> On 01/11/2018 08:07 AM, Stefan Stanacar wrote:
> > do_unpack is by default in SRCTREECOVEREDTASKS so this append can't run,
> since
> > this tasks gets removed by externalsrc when it's enabled.
> >
> > However this was hidden because externalsrc does run do_fetch and
> do_unpack if
> > there are type=kmeta or file:// entries in the SRC_URI value of the
> kernel recipe.
> > (e.g linux-yocto).
> >
> > Make this a separate task so that it actually gets run for kernel
> recipes with
> > no file:// or type=kmeta in SRC_URI.
>
> Is this fixed in Master?
>
>
Nope, I've sent a patch for master as well:
http://lists.openembedded.org/pipermail/openembedded-core/2018-January/146355.html
but it wasn't merged (yet?)

Cheers,
Stefan


> - armin
> > Signed-off-by: Stefan Stanacar <sstncr@gmail.com>
> > ---
> >  meta/classes/kernel.bbclass | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > index f8318b8..3eaae03 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -102,7 +102,7 @@ inherit ${KERNEL_CLASSES}
> >  # the symlink.
> >  do_unpack[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B}
> ${STAGING_KERNEL_BUILDDIR}"
> >  do_clean[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B}
> ${STAGING_KERNEL_BUILDDIR}"
> > -base_do_unpack_append () {
> > +python do_symlink_staging_dir () {
> >      s = d.getVar("S", True)
> >      if s[-1] == '/':
> >          # drop trailing slash, so that os.symlink(kernsrc, s) doesn't
> use s as directory name and fail
> > @@ -119,6 +119,8 @@ base_do_unpack_append () {
> >              shutil.move(s, kernsrc)
> >              os.symlink(kernsrc, s)
> >  }
> > +addtask do_symlink_staging_dir after do_unpack before do_patch
> do_configure
> > +
> >
> >  inherit kernel-arch deploy
> >
>
>

--001a114415e6984ac405630fa182
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Jan 17, 2018 at 9:04 PM, akuster808 <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
br>
<br>
On 01/11/2018 08:07 AM, Stefan Stanacar wrote:<br>
&gt; do_unpack is by default in SRCTREECOVEREDTASKS so this append can&#39;=
t run, since<br>
&gt; this tasks gets removed by externalsrc when it&#39;s enabled.<br>
&gt;<br>
&gt; However this was hidden because externalsrc does run do_fetch and do_u=
npack if<br>
&gt; there are type=3Dkmeta or file:// entries in the SRC_URI value of the =
kernel recipe.<br>
&gt; (e.g linux-yocto).<br>
&gt;<br>
&gt; Make this a separate task so that it actually gets run for kernel reci=
pes with<br>
&gt; no file:// or type=3Dkmeta in SRC_URI.<br>
<br>
Is this fixed in Master?<br>
<br></blockquote><div><br></div><div>Nope, I&#39;ve sent a patch for master=
 as well: <a href=3D"http://lists.openembedded.org/pipermail/openembedded-c=
ore/2018-January/146355.html">http://lists.openembedded.org/pipermail/opene=
mbedded-core/2018-January/146355.html</a> but it wasn&#39;t merged (yet?)</=
div><div><br></div><div>Cheers,</div><div>Stefan<br></div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
- armin<br>
&gt; Signed-off-by: Stefan Stanacar &lt;<a href=3D"mailto:sstncr@gmail.com"=
>sstncr@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/kernel.bbclass | 4 +++-<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass=
<br>
&gt; index f8318b8..3eaae03 100644<br>
&gt; --- a/meta/classes/kernel.bbclass<br>
&gt; +++ b/meta/classes/kernel.bbclass<br>
&gt; @@ -102,7 +102,7 @@ inherit ${KERNEL_CLASSES}<br>
&gt;=C2=A0 # the symlink.<br>
&gt;=C2=A0 do_unpack[cleandirs] +=3D &quot; ${S} ${STAGING_KERNEL_DIR} ${B}=
 ${STAGING_KERNEL_BUILDDIR}&quot;<br>
&gt;=C2=A0 do_clean[cleandirs] +=3D &quot; ${S} ${STAGING_KERNEL_DIR} ${B} =
${STAGING_KERNEL_BUILDDIR}&quot;<br>
&gt; -base_do_unpack_append () {<br>
&gt; +python do_symlink_staging_dir () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 s =3D d.getVar(&quot;S&quot;, True)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if s[-1] =3D=3D &#39;/&#39;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # drop trailing slash, so that os.sy=
mlink(kernsrc, s) doesn&#39;t use s as directory name and fail<br>
&gt; @@ -119,6 +119,8 @@ base_do_unpack_append () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.move(s, kernsrc=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.symlink(kernsrc, s)=
<br>
&gt;=C2=A0 }<br>
&gt; +addtask do_symlink_staging_dir after do_unpack before do_patch do_con=
figure<br>
&gt; +<br>
&gt;<br>
&gt;=C2=A0 inherit kernel-arch deploy<br>
&gt;<br>
<br>
</blockquote></div><br></div></div>

--001a114415e6984ac405630fa182--
