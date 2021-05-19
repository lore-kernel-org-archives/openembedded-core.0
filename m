Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.12751.1621436573718627327
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 May 2021 08:02:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=t1i3GqtG;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id gb17so2411020ejc.8
        for <openembedded-core@lists.openembedded.org>; Wed, 19 May 2021 08:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=65Y+z+LVgZD+G2bCRUnfqj5LSMzgImoC4FUCj79NB8Q=;
        b=t1i3GqtGhT3oX2ZgoqFCaiyPPQeffHj69LQNjpx6/faS3ASmdwRriyIZSzFGrJrTnR
         27R/KyEYQTbqoOTLNDf/IOJ7oqXkNGMGKCNwqoguGIunFReOROeP39CVhW1jxjwvardY
         zi6mi9XX7ufbudL8p/fXUOhnuUGaO0XeFGiv18v3In/07ray5qsQNO8WHnesDla3OkgX
         SYiLjPSb8yvyYHBg/WEvPbN4EbP08FIKAYDBE3AGo00dEzO83Nrdtig1b/vvFkNgH762
         aJsH4xTnnO71wN7uXq4T8LpWS8oKr7OV+tdrclyCIpQZx86RwhjTkDS2SEY3789BvHgi
         cviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=65Y+z+LVgZD+G2bCRUnfqj5LSMzgImoC4FUCj79NB8Q=;
        b=oukS4hBQLKN7Rw0trtyNSBoEo97LSx6TSaewND4h7tBsrAJ5c4hKpTF8PlzTeDlsPq
         PZcjgzrZlMH7air5nZVFLTereKlqLlmTmYlSru5EAv+FR9EDtw+Vj6z7tx/oFIDRBoKf
         4qj1TJ8n9wPmsnUFGtw3rWZFCw4IG8nGtPGCSykNJrTJ+g6xN8/gSi/62YXB4vqye055
         ewlRSkqXKDSnbgN1IsL9h0i5co/tfd+A5+9y5Tgs3Vdl/MwlI3q/LtbCa0QTLGMTh7nK
         RPgRkHWabU83d6TDyDLATqg9qJ7z8wXwglDIyjEjdEJCNWOo7xWe6Lr0bZEiCEcvYeZP
         7ZTw==
X-Gm-Message-State: AOAM532Omfi6ttvNXdtECL2hjSLmay1syFydEO7BlyFxZ5HO5YrXk8Wq
	8IM73TwmzvXpMQslbi/uA5JJ22hK8jMdAYhyR0w=
X-Google-Smtp-Source: ABdhPJyLJWRDlpXkRPayqB1c8SAn1M9wQSH5nHrKINTkux8D2Z4zY/X0JXuF7I1K2J8JKlk4PFWLXkwTSmSz/pWg2h4=
X-Received: by 2002:a17:906:68c:: with SMTP id u12mr12941883ejb.470.1621436572029;
 Wed, 19 May 2021 08:02:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210519102302.2674317-1-Martin.Jansa@gmail.com> <AM9PR09MB4642AC4E6EAC764B936940BAA82B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: <AM9PR09MB4642AC4E6EAC764B936940BAA82B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 19 May 2021 17:02:40 +0200
Message-ID: <CA+chaQdBf=aJZddxAc43GBXNoRAYwWTzw3MtQSmKxK7=tsNnzQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sstatesig.py: make it fatal error when sstate manifest isn't found
To: Konrad Weihmann <kweihmann@outlook.com>, Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e6d9aa05c2b01e83"

--000000000000e6d9aa05c2b01e83
Content-Type: text/plain; charset="UTF-8"

On Wed, May 19, 2021 at 12:47 PM Konrad Weihmann <kweihmann@outlook.com>
wrote:

>
>
> On 19.05.21 12:23, Martin Jansa wrote:
> > * all known issues in this area were fixed, make it fatal that it
> >    cannot be overlooked if someone triggers this issue again
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >   meta/lib/oe/sstatesig.py | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> > index 6cd6e11acc..e86a09b332 100644
> > --- a/meta/lib/oe/sstatesig.py
> > +++ b/meta/lib/oe/sstatesig.py
> > @@ -453,7 +453,7 @@ def find_sstate_manifest(taskdata, taskdata2,
> taskname, d, multilibcache):
> >           manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-%s-%s.%s" %
> (pkgarch, taskdata, taskname))
> >           if os.path.exists(manifest):
> >               return manifest, d2
> > -    bb.error("Manifest %s not found in %s (variant '%s')?" % (manifest,
> d2.expand(" ".join(pkgarchs)), variant))
> > +    bb.fatal("Manifest %s not found in %s (variant '%s')?" % (manifest,
> d2.expand(" ".join(pkgarchs)), variant))
> >       return None, d2
>
> doesn't that make the return statement obsolete? also how can an error
> be overlooked? It does make the task triggering this issue fail, so how
> is a fatal better in this case (besides abnormally terminating the task)
>

bb.error doesn't make the task to fail, it only shows an error (which
results in non-zero exit code), but lets depending tasks to continue and
fail with other (often more misleading) errors, because their dependency is
really missing in RSS

without this patch:
ERROR: adwaita-icon-theme-3.34.3-r0 do_prepare_recipe_sysroot: Manifest
/OE/build/oe-core/tmp-glibc/sstate-control/manifest-x86_64_ubuntu-21.04-at-spi2-core-native.populate_sysroot
not found in x86_64 x86_64_ubuntu-21.04 (variant '')?
ERROR: adwaita-icon-theme-3.34.3-r0 do_prepare_recipe_sysroot: Manifest
/OE/build/oe-core/tmp-glibc/sstate-control/manifest-x86_64_ubuntu-21.04-at-spi2-core-native.populate_sysroot
not found in x86_64 x86_64_ubuntu-21.04 (variant '')?
ERROR: adwaita-icon-theme-3.34.3-r0 do_configure: Manifest
/OE/build/oe-core/tmp-glibc/sstate-control/manifest-x86_64_ubuntu-21.04-at-spi2-core-native.populate_sysroot
not found in x86_64 x86_64_ubuntu-21.04 (variant '')?
ERROR: adwaita-icon-theme-3.34.3-r0 do_install: Manifest
/OE/build/oe-core/tmp-glibc/sstate-control/manifest-x86_64_ubuntu-21.04-at-spi2-core-native.populate_sysroot
not found in x86_64 x86_64_ubuntu-21.04 (variant '')?
ERROR: adwaita-icon-theme-3.34.3-r0 do_package: Manifest
/OE/build/oe-core/tmp-glibc/sstate-control/manifest-x86_64_ubuntu-21.04-at-spi2-core-native.populate_sysroot
not found in x86_64 x86_64_ubuntu-21.04 (variant '')?
ERROR: adwaita-icon-theme-3.34.3-r0 do_package_write_ipk: Manifest
/OE/build/oe-core/tmp-glibc/sstate-control/manifest-x86_64_ubuntu-21.04-at-spi2-core-native.populate_sysroot
not found in x86_64 x86_64_ubuntu-21.04 (variant '')?
NOTE: Tasks Summary: Attempted 2819 tasks of which 2803 didn't need to be
rerun and all succeeded.
Summary: There were 6 ERROR messages shown, returning a non-zero exit code.

with this patch:
ERROR: adwaita-icon-theme-3.34.3-r0 do_prepare_recipe_sysroot: Manifest
/OE/build/oe-core/tmp-glibc/sstate-control/manifest-x86_64_ubuntu-21.04-at-spi2-core-native.populate_sysroot
not found in x86_64 x86_64_ubuntu-21.04 (variant '')?
ERROR: Logfile of failure stored in:
/OE/build/oe-core/tmp-glibc/work/all-oe-linux/adwaita-icon-theme/3.34.3-r0/temp/log.do_prepare_recipe_sysroot.1638704
ERROR: Task
(/OE/build/oe-core/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb:do_prepare_recipe_sysroot)
failed with exit code '1'
NOTE: Tasks Summary: Attempted 2805 tasks of which 2800 didn't need to be
rerun and 1 failed.
Summary: 1 task failed:

/OE/build/oe-core/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb:
do_prepare_recipe_sysroot
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

Without this fix:
https://git.openembedded.org/openembedded-core/commit/?id=63da9a4f889c5b0e41bc8ec08abe0acea1546479

I was seeing various native dependencies missing and as you can see in
the adwaita-icon-theme example, missing at-spi2-core-native isn't fatal for
the build, but were adwaita-icon-theme packages and sstate built correctly?
If you don't investigate all these ERROR messages and non-zero exit code
(e.g. just because you have thousands of builds per day populating the same
sstate mirror), you might miss some of these breakages. While using fatal
prevents adwaita-icon-theme to even start building and producing possibly
broken packages, images, sstate.

In some other cases e.g. qtwayland-native missing when building target
qtwayland you will get do_compile failure complaining that the the binary
from qtwayland-native is missing, but the root cause of this issue is
written many lines above do_compile log. You can see some other examples in
https://git.openembedded.org/openembedded-core-contrib/commit/?h=jansa/master&id=817f1c14cec4d66504a5028908a4ebac147f3b52
and before changing this from bb.warn to bb.error in previous patch most of
these issues were just "some random builddir breakage which was resolved by
doing clean build from sstate".

And this happens in multi-machine builds with dunfell/gatesgarth/hardknott
and only master is safe now. I plan to ask Steve to backport this and
related fixes to dunfell after a bit more time in master:
https://git.openembedded.org/openembedded-core/commit/?id=0eb95212a7e6b6bdc1243094072dea432cb48f0f
https://git.openembedded.org/openembedded-core/commit/?id=63da9a4f889c5b0e41bc8ec08abe0acea1546479
https://git.openembedded.org/openembedded-core/commit/?id=95607a26854d873399d2b9d7e5fcbffc0cbdba4c
and then this one.

Regards,

--000000000000e6d9aa05c2b01e83
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 19, 2021 at 12:47 PM Konr=
ad Weihmann &lt;<a href=3D"mailto:kweihmann@outlook.com">kweihmann@outlook.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><br>
<br>
On 19.05.21 12:23, Martin Jansa wrote:<br>
&gt; * all known issues in this area were fixed, make it fatal that it<br>
&gt;=C2=A0 =C2=A0 cannot be overlooked if someone triggers this issue again=
<br>
&gt; <br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/lib/oe/sstatesig.py | 2 +-<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py<br>
&gt; index 6cd6e11acc..e86a09b332 100644<br>
&gt; --- a/meta/lib/oe/sstatesig.py<br>
&gt; +++ b/meta/lib/oe/sstatesig.py<br>
&gt; @@ -453,7 +453,7 @@ def find_sstate_manifest(taskdata, taskdata2, task=
name, d, multilibcache):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0manifest =3D d2.expand(&quot;$=
{SSTATE_MANIFESTS}/manifest-%s-%s.%s&quot; % (pkgarch, taskdata, taskname))=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.exists(manifest):<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return manifest,=
 d2<br>
&gt; -=C2=A0 =C2=A0 bb.error(&quot;Manifest %s not found in %s (variant &#3=
9;%s&#39;)?&quot; % (manifest, d2.expand(&quot; &quot;.join(pkgarchs)), var=
iant))<br>
&gt; +=C2=A0 =C2=A0 bb.fatal(&quot;Manifest %s not found in %s (variant &#3=
9;%s&#39;)?&quot; % (manifest, d2.expand(&quot; &quot;.join(pkgarchs)), var=
iant))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return None, d2<br>
<br>
doesn&#39;t that make the return statement obsolete? also how can an error =
<br>
be overlooked? It does make the task triggering this issue fail, so how <br=
>
is a fatal better in this case (besides abnormally terminating the task)<br=
></blockquote><div><br></div><div>bb.error doesn&#39;t make the task to fai=
l, it only shows an error (which results in non-zero exit code), but lets d=
epending tasks to continue and fail with other (often more misleading) erro=
rs, because their dependency is really missing in RSS</div><div><br></div><=
div>without this patch:</div><div>ERROR: adwaita-icon-theme-3.34.3-r0 do_pr=
epare_recipe_sysroot: Manifest /OE/build/oe-core/tmp-glibc/sstate-control/m=
anifest-x86_64_ubuntu-21.04-at-spi2-core-native.populate_sysroot not found =
in x86_64 x86_64_ubuntu-21.04 (variant &#39;&#39;)?<br>ERROR: adwaita-icon-=
theme-3.34.3-r0 do_prepare_recipe_sysroot: Manifest /OE/build/oe-core/tmp-g=
libc/sstate-control/manifest-x86_64_ubuntu-21.04-at-spi2-core-native.popula=
te_sysroot not found in x86_64 x86_64_ubuntu-21.04 (variant &#39;&#39;)?<br=
>ERROR: adwaita-icon-theme-3.34.3-r0 do_configure: Manifest /OE/build/oe-co=
re/tmp-glibc/sstate-control/manifest-x86_64_ubuntu-21.04-at-spi2-core-nativ=
e.populate_sysroot not found in x86_64 x86_64_ubuntu-21.04 (variant &#39;&#=
39;)?<br>ERROR: adwaita-icon-theme-3.34.3-r0 do_install: Manifest /OE/build=
/oe-core/tmp-glibc/sstate-control/manifest-x86_64_ubuntu-21.04-at-spi2-core=
-native.populate_sysroot not found in x86_64 x86_64_ubuntu-21.04 (variant &=
#39;&#39;)?<br>ERROR: adwaita-icon-theme-3.34.3-r0 do_package: Manifest /OE=
/build/oe-core/tmp-glibc/sstate-control/manifest-x86_64_ubuntu-21.04-at-spi=
2-core-native.populate_sysroot not found in x86_64 x86_64_ubuntu-21.04 (var=
iant &#39;&#39;)?<br>ERROR: adwaita-icon-theme-3.34.3-r0 do_package_write_i=
pk: Manifest /OE/build/oe-core/tmp-glibc/sstate-control/manifest-x86_64_ubu=
ntu-21.04-at-spi2-core-native.populate_sysroot not found in x86_64 x86_64_u=
buntu-21.04 (variant &#39;&#39;)?<br>NOTE: Tasks Summary: Attempted 2819 ta=
sks of which 2803 didn&#39;t need to be rerun and all succeeded.<br></div><=
div>Summary: There were 6 ERROR messages shown, returning a non-zero exit c=
ode.<br></div><div><br></div><div>with this patch:</div><div>ERROR: adwaita=
-icon-theme-3.34.3-r0 do_prepare_recipe_sysroot: Manifest /OE/build/oe-core=
/tmp-glibc/sstate-control/manifest-x86_64_ubuntu-21.04-at-spi2-core-native.=
populate_sysroot not found in x86_64 x86_64_ubuntu-21.04 (variant &#39;&#39=
;)?</div>ERROR: Logfile of failure stored in: /OE/build/oe-core/tmp-glibc/w=
ork/all-oe-linux/adwaita-icon-theme/3.34.3-r0/temp/log.do_prepare_recipe_sy=
sroot.1638704<br>ERROR: Task (/OE/build/oe-core/openembedded-core/meta/reci=
pes-gnome/gnome/adwaita-icon-theme_3.34.3.bb:do_prepare_recipe_sysroot) fai=
led with exit code &#39;1&#39;</div><div class=3D"gmail_quote">NOTE: Tasks =
Summary: Attempted 2805 tasks of which 2800 didn&#39;t need to be rerun and=
 1 failed.<br></div><div class=3D"gmail_quote">Summary: 1 task failed:<br>=
=C2=A0 /OE/build/oe-core/openembedded-core/meta/recipes-gnome/gnome/adwaita=
-icon-theme_3.34.3.bb:do_prepare_recipe_sysroot<br>Summary: There was 1 ERR=
OR message shown, returning a non-zero exit code.<br></div><div class=3D"gm=
ail_quote"><br></div><div class=3D"gmail_quote">Without this fix:</div><div=
 class=3D"gmail_quote"><a href=3D"https://git.openembedded.org/openembedded=
-core/commit/?id=3D63da9a4f889c5b0e41bc8ec08abe0acea1546479">https://git.op=
enembedded.org/openembedded-core/commit/?id=3D63da9a4f889c5b0e41bc8ec08abe0=
acea1546479</a><br></div><div class=3D"gmail_quote"><br></div><div class=3D=
"gmail_quote">I was seeing various native dependencies missing and as you c=
an see in the=C2=A0adwaita-icon-theme example, missing=C2=A0at-spi2-core-na=
tive isn&#39;t fatal for the build, but were adwaita-icon-theme packages an=
d sstate built correctly? If you don&#39;t investigate all these ERROR mess=
ages and non-zero exit code (e.g. just because you have thousands of builds=
 per day populating the same sstate mirror), you might miss some of these b=
reakages. While using fatal prevents adwaita-icon-theme to even start build=
ing and producing possibly broken packages, images, sstate.</div><div class=
=3D"gmail_quote"><br></div><div class=3D"gmail_quote">In some other cases e=
.g. qtwayland-native missing when building target qtwayland you will get do=
_compile failure complaining that the the binary from qtwayland-native is m=
issing, but the root cause of this issue is written many lines above do_com=
pile log. You can see some other examples in=C2=A0<a href=3D"https://git.op=
enembedded.org/openembedded-core-contrib/commit/?h=3Djansa/master&amp;id=3D=
817f1c14cec4d66504a5028908a4ebac147f3b52">https://git.openembedded.org/open=
embedded-core-contrib/commit/?h=3Djansa/master&amp;id=3D817f1c14cec4d66504a=
5028908a4ebac147f3b52</a> and before changing this from bb.warn to bb.error=
 in previous patch most of these issues were just &quot;some random builddi=
r breakage which was resolved by doing clean build from sstate&quot;.</div>=
<div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">And this ha=
ppens in multi-machine builds with dunfell/gatesgarth/hardknott and only ma=
ster is safe now. I plan to ask Steve to backport this and related fixes to=
 dunfell after a bit more time in master:</div><div class=3D"gmail_quote"><=
a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=3D0eb95=
212a7e6b6bdc1243094072dea432cb48f0f">https://git.openembedded.org/openembed=
ded-core/commit/?id=3D0eb95212a7e6b6bdc1243094072dea432cb48f0f</a><br></div=
><div class=3D"gmail_quote"><a href=3D"https://git.openembedded.org/openemb=
edded-core/commit/?id=3D63da9a4f889c5b0e41bc8ec08abe0acea1546479">https://g=
it.openembedded.org/openembedded-core/commit/?id=3D63da9a4f889c5b0e41bc8ec0=
8abe0acea1546479</a><br></div><div class=3D"gmail_quote"><a href=3D"https:/=
/git.openembedded.org/openembedded-core/commit/?id=3D95607a26854d873399d2b9=
d7e5fcbffc0cbdba4c">https://git.openembedded.org/openembedded-core/commit/?=
id=3D95607a26854d873399d2b9d7e5fcbffc0cbdba4c</a><br></div><div class=3D"gm=
ail_quote">and then this one.</div><div class=3D"gmail_quote"><br></div><di=
v class=3D"gmail_quote">Regards,</div></div>

--000000000000e6d9aa05c2b01e83--
