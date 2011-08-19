Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <aalonso00@gmail.com>) id 1QuQX4-0005TO-Tz
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Aug 2011 16:58:51 +0200
Received: by vwe42 with SMTP id 42so2608408vwe.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 07:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=1OF0uYjRSZqoJRpV4iVbCMUoA3k/J08J5MJZ4AqJBnY=;
	b=AbWA8RTXoSgPpSduat1Rk64Ar9QuZ0Jhs0xV5x3e0KWd9SRDADUI/M35XArKEAhgub
	MTiv4Kick2vopvga6Ppyf6Z8RkUIn5dBfWP58pLCIsS9zVtUhrSBHTdkc0FAsOYAEHiV
	kLW8zsW/6F+GbMn5DRr5sspX/naDs4YQAKm+8=
MIME-Version: 1.0
Received: by 10.52.186.130 with SMTP id fk2mr377371vdc.343.1313765649909; Fri,
	19 Aug 2011 07:54:09 -0700 (PDT)
Received: by 10.220.210.79 with HTTP; Fri, 19 Aug 2011 07:54:09 -0700 (PDT)
In-Reply-To: <1313763310.13995.95.camel@rex>
References: <1313636261-5074-1-git-send-email-aalonso00@gmail.com>
	<1313763310.13995.95.camel@rex>
Date: Fri, 19 Aug 2011 09:54:09 -0500
Message-ID: <CAAB-1yyWWMTtkqmn2rUTz2RN=SYfoGOPgK=AJL0J7c5--tsS6g@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][v2] file: new file version 5.07
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
X-List-Received-Date: Fri, 19 Aug 2011 14:58:51 -0000
Content-Type: multipart/alternative; boundary=bcaec5486264e1872304aadce690

--bcaec5486264e1872304aadce690
Content-Type: text/plain; charset=ISO-8859-1

The patches fail to apply so i drop them, I didn't check if the patches
where merged into
upstream :(

On Fri, Aug 19, 2011 at 9:15 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2011-08-17 at 21:57 -0500, Adrian Alonso wrote:
> > * file version 5.07 also prevents magic file mistmatch
> >   in Fedora 15
> > * related to bug 1358.
> >   http://bugzilla.pokylinux.org/show_bug.cgi?id=1358
> > * v2 remove previous file version 5.04
> >   remove unused patchs
>
> When you say these are unused patches, were the fixes merged into
> upstream or did these patches simply fail to apply so you dropped them?
>
> Cheers,
>
> Richard
>
> >
> > Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
> > ---
> >  meta/recipes-devtools/file/file/ge-le.patch        |   72
> --------------------
> >  .../file/file/stringb-compat.patch                 |   31 ---------
> >  meta/recipes-devtools/file/file_5.04.bb            |   39 -----------
> >  meta/recipes-devtools/file/file_5.07.bb            |   36 ++++++++++
> >  4 files changed, 36 insertions(+), 142 deletions(-)
> >  delete mode 100644 meta/recipes-devtools/file/file/ge-le.patch
> >  delete mode 100644 meta/recipes-devtools/file/file/stringb-compat.patch
> >  delete mode 100644 meta/recipes-devtools/file/file_5.04.bb
> >  create mode 100644 meta/recipes-devtools/file/file_5.07.bb
> >
> > diff --git a/meta/recipes-devtools/file/file/ge-le.patch
> b/meta/recipes-devtools/file/file/ge-le.patch
> > deleted file mode 100644
> > index fb7d671..0000000
> > --- a/meta/recipes-devtools/file/file/ge-le.patch
> > +++ /dev/null
> > @@ -1,72 +0,0 @@
> > -Upstream-Status: Pending
> > -
> > -`>=' and `<=' was silently ignored in previous version,
> > -but causes an warning in file 5.04. Add support for these
> > -two operators as a feature extension, however, users should
> > -not rely on them.
> > -
> > -8/17/2010 - created by Qing He <qing.he@intel.com>
> > -
> > -diff --git a/src/apprentice.c b/src/apprentice.c
> > -index 3d4c3cf..a2b86ed 100644
> > ---- a/src/apprentice.c
> > -+++ b/src/apprentice.c
> > -@@ -1396,11 +1396,10 @@ parse(struct magic_set *ms, struct magic_entry
> **mentryp, uint32_t *nmentryp,
> > -             m->reln = *l;
> > -             ++l;
> > -             if (*l == '=') {
> > --                    if (ms->flags & MAGIC_CHECK) {
> > --                            file_magwarn(ms, "%c= not supported",
> > --                                m->reln);
> > --                            return -1;
> > --                    }
> > -+                if (m->reln == '>')
> > -+                    m->reln = 'g';
> > -+                else if (m->reln == '<')
> > -+                    m->reln = 'l';
> > -                ++l;
> > -             }
> > -             break;
> > -diff --git a/src/softmagic.c b/src/softmagic.c
> > -index d8a5675..1648e43 100644
> > ---- a/src/softmagic.c
> > -+++ b/src/softmagic.c
> > -@@ -1955,6 +1955,38 @@ magiccheck(struct magic_set *ms, struct magic *m)
> > -             }
> > -             break;
> > -
> > -+    case 'g':
> > -+            if (m->flag & UNSIGNED) {
> > -+                    matched = v >= l;
> > -+                    if ((ms->flags & MAGIC_DEBUG) != 0)
> > -+                            (void) fprintf(stderr, "%llu >= %llu =
> %d\n",
> > -+                                (unsigned long long)v,
> > -+                                (unsigned long long)l, matched);
> > -+            }
> > -+            else {
> > -+                    matched = (int64_t) v >= (int64_t) l;
> > -+                    if ((ms->flags & MAGIC_DEBUG) != 0)
> > -+                            (void) fprintf(stderr, "%lld >= %lld =
> %d\n",
> > -+                                (long long)v, (long long)l, matched);
> > -+            }
> > -+            break;
> > -+
> > -+    case 'l':
> > -+            if (m->flag & UNSIGNED) {
> > -+                    matched = v <= l;
> > -+                    if ((ms->flags & MAGIC_DEBUG) != 0)
> > -+                            (void) fprintf(stderr, "%llu <= %llu =
> %d\n",
> > -+                                (unsigned long long)v,
> > -+                                (unsigned long long)l, matched);
> > -+            }
> > -+            else {
> > -+                    matched = (int64_t) v <= (int64_t) l;
> > -+                    if ((ms->flags & MAGIC_DEBUG) != 0)
> > -+                            (void) fprintf(stderr, "%lld <= %lld =
> %d\n",
> > -+                                   (long long)v, (long long)l,
> matched);
> > -+            }
> > -+            break;
> > -+
> > -     case '&':
> > -             matched = (v & l) == l;
> > -             if ((ms->flags & MAGIC_DEBUG) != 0)
> > diff --git a/meta/recipes-devtools/file/file/stringb-compat.patch
> b/meta/recipes-devtools/file/file/stringb-compat.patch
> > deleted file mode 100644
> > index 8aba31e..0000000
> > --- a/meta/recipes-devtools/file/file/stringb-compat.patch
> > +++ /dev/null
> > @@ -1,31 +0,0 @@
> > -Upstream-Status: Pending
> > -
> > -`B' in file 4.x has the same meaning with `W' in file 5,
> > -let `B' be an alias of `W'.
> > -
> > -8/17/2010 - created by Qing He <qing.he@intel.com>
> > -
> > -diff --git a/src/apprentice.c b/src/apprentice.c
> > -index 58826c3..3d4c3cf 100644
> > ---- a/src/apprentice.c
> > -+++ b/src/apprentice.c
> > -@@ -1340,6 +1340,7 @@ parse(struct magic_set *ms, struct magic_entry
> **mentryp, uint32_t *nmentryp,
> > -                                                 "zero range");
> > -                                     l = t - 1;
> > -                                     break;
> > -+                            case CHAR_COMPACT_BLANK:
> > -                             case CHAR_COMPACT_WHITESPACE:
> > -                                     m->str_flags |=
> STRING_COMPACT_WHITESPACE;
> > -                                     break;
> > -diff --git a/src/file.h b/src/file.h
> > -index c07f2d4..42cf416 100644
> > ---- a/src/file.h
> > -+++ b/src/file.h
> > -@@ -282,6 +282,7 @@ struct magic {
> > - #define STRING_TEXTTEST                             BIT(5)
> > - #define STRING_BINTEST                              BIT(6)
> > - #define CHAR_COMPACT_WHITESPACE                     'W'
> > -+#define CHAR_COMPACT_BLANK                  'B'
> > - #define CHAR_COMPACT_OPTIONAL_WHITESPACE    'w'
> > - #define CHAR_IGNORE_LOWERCASE                       'c'
> > - #define CHAR_IGNORE_UPPERCASE                       'C'
> > diff --git a/meta/recipes-devtools/file/file_5.04.bbb/meta/recipes-devtools/file/
> file_5.04.bb
> > deleted file mode 100644
> > index 1f9c78e..0000000
> > --- a/meta/recipes-devtools/file/file_5.04.bb
> > +++ /dev/null
> > @@ -1,39 +0,0 @@
> > -SUMMARY = "File classification tool"
> > -DESCRIPTION = "File attempts to classify files depending \
> > -on their contents and prints a description if a match is found."
> > -HOMEPAGE = "http://www.darwinsys.com/file/"
> > -SECTION = "console/utils"
> > -
> > -# two clause BSD
> > -LICENSE = "BSD"
> > -LIC_FILES_CHKSUM =
> "file://COPYING;beginline=2;md5=6a7382872edb68d33e1a9398b6e03188"
> > -
> > -DEPENDS = "zlib file-native"
> > -DEPENDS_virtclass-native = "zlib-native"
> > -PR = "r2"
> > -
> > -SRC_URI = "ftp://ftp.astron.com/pub/file/file-${PV}.tar.gz \
> > -           file://stringb-compat.patch \
> > -           file://ge-le.patch \
> > -           file://dump \
> > -           file://filesystems"
> > -
> > -SRC_URI[md5sum] = "accade81ff1cc774904b47c72c8aeea0"
> > -SRC_URI[sha256sum] =
> "4c9e6e7994e74cb3386374ae91b055d26ac96b9d3e82fd157ae2d62e87a4260c"
> > -
> > -inherit autotools
> > -
> > -do_configure_prepend() {
> > -     cp ${WORKDIR}/dump ${S}/magic/Magdir/
> > -     cp ${WORKDIR}/filesystems ${S}/magic/Magdir/
> > -}
> > -
> > -FILES_${PN} += "${datadir}/misc/*.mgc"
> > -
> > -do_install_append_virtclass-native() {
> > -     create_cmdline_wrapper ${D}/${bindir}/file \
> > -             --magic-file ${datadir}/misc/magic.mgc
> > -}
> > -
> > -
> > -BBCLASSEXTEND = "native"
> > diff --git a/meta/recipes-devtools/file/file_5.07.bbb/meta/recipes-devtools/file/
> file_5.07.bb
> > new file mode 100644
> > index 0000000..9b5b51f
> > --- /dev/null
> > +++ b/meta/recipes-devtools/file/file_5.07.bb
> > @@ -0,0 +1,36 @@
> > +SUMMARY = "File classification tool"
> > +DESCRIPTION = "File attempts to classify files depending \
> > +on their contents and prints a description if a match is found."
> > +HOMEPAGE = "http://www.darwinsys.com/file/"
> > +SECTION = "console/utils"
> > +
> > +# two clause BSD
> > +LICENSE = "BSD"
> > +LIC_FILES_CHKSUM =
> "file://COPYING;beginline=2;md5=6a7382872edb68d33e1a9398b6e03188"
> > +
> > +DEPENDS = "zlib file-native"
> > +DEPENDS_virtclass-native = "zlib-native"
> > +PR = "r0"
> > +
> > +SRC_URI = "ftp://ftp.astron.com/pub/file/file-${PV}.tar.gz \
> > +           file://dump \
> > +           file://filesystems"
> > +
> > +SRC_URI[md5sum] = "b8d1f9a8a644067bd0a703cebf3f4858"
> > +SRC_URI[sha256sum] =
> "c968bfe97d87f9f564728a894d57be2c6bba9a2006763fffff85c5f72a9a3c2f"
> > +
> > +inherit autotools
> > +
> > +do_configure_prepend() {
> > +     cp ${WORKDIR}/dump ${S}/magic/Magdir/
> > +     cp ${WORKDIR}/filesystems ${S}/magic/Magdir/
> > +}
> > +
> > +FILES_${PN} += "${datadir}/misc/*.mgc"
> > +
> > +do_install_append_virtclass-native() {
> > +     create_cmdline_wrapper ${D}/${bindir}/file \
> > +             --magic-file ${datadir}/misc/magic.mgc
> > +}
> > +
> > +BBCLASSEXTEND = "native"
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



-- 
Saludos
Adrian Alonso
http://aalonso.wordpress.com

--bcaec5486264e1872304aadce690
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

The patches fail to apply so i drop them, I didn&#39;t check if the patches=
 where merged into<br>upstream :(<br><br><div class=3D"gmail_quote">On Fri,=
 Aug 19, 2011 at 9:15 AM, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.or=
g</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex;"><div class=3D"im">On Wed, 2011-08-17 at 21:=
57 -0500, Adrian Alonso wrote:<br>
&gt; * file version 5.07 also prevents magic file mistmatch<br>
&gt; =A0 in Fedora 15<br>
&gt; * related to bug 1358.<br>
&gt; =A0 <a href=3D"http://bugzilla.pokylinux.org/show_bug.cgi?id=3D1358" t=
arget=3D"_blank">http://bugzilla.pokylinux.org/show_bug.cgi?id=3D1358</a><b=
r>
&gt; * v2 remove previous file version 5.04<br>
&gt; =A0 remove unused patchs<br>
<br>
</div>When you say these are unused patches, were the fixes merged into<br>
upstream or did these patches simply fail to apply so you dropped them?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<div><div></div><div class=3D"h5"><br>
&gt;<br>
&gt; Signed-off-by: Adrian Alonso &lt;<a href=3D"mailto:aalonso00@gmail.com=
">aalonso00@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =A0meta/recipes-devtools/file/file/ge-le.patch =A0 =A0 =A0 =A0| =A0 72=
 --------------------<br>
&gt; =A0.../file/file/stringb-compat.patch =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
| =A0 31 ---------<br>
&gt; =A0meta/recipes-devtools/file/<a href=3D"http://file_5.04.bb" target=
=3D"_blank">file_5.04.bb</a> =A0 =A0 =A0 =A0 =A0 =A0| =A0 39 -----------<br=
>
&gt; =A0meta/recipes-devtools/file/<a href=3D"http://file_5.07.bb" target=
=3D"_blank">file_5.07.bb</a> =A0 =A0 =A0 =A0 =A0 =A0| =A0 36 ++++++++++<br>
&gt; =A04 files changed, 36 insertions(+), 142 deletions(-)<br>
&gt; =A0delete mode 100644 meta/recipes-devtools/file/file/ge-le.patch<br>
&gt; =A0delete mode 100644 meta/recipes-devtools/file/file/stringb-compat.p=
atch<br>
&gt; =A0delete mode 100644 meta/recipes-devtools/file/<a href=3D"http://fil=
e_5.04.bb" target=3D"_blank">file_5.04.bb</a><br>
&gt; =A0create mode 100644 meta/recipes-devtools/file/<a href=3D"http://fil=
e_5.07.bb" target=3D"_blank">file_5.07.bb</a><br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/file/file/ge-le.patch b/meta/recipe=
s-devtools/file/file/ge-le.patch<br>
&gt; deleted file mode 100644<br>
&gt; index fb7d671..0000000<br>
&gt; --- a/meta/recipes-devtools/file/file/ge-le.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,72 +0,0 @@<br>
&gt; -Upstream-Status: Pending<br>
&gt; -<br>
&gt; -`&gt;=3D&#39; and `&lt;=3D&#39; was silently ignored in previous vers=
ion,<br>
&gt; -but causes an warning in file 5.04. Add support for these<br>
&gt; -two operators as a feature extension, however, users should<br>
&gt; -not rely on them.<br>
&gt; -<br>
&gt; -8/17/2010 - created by Qing He &lt;<a href=3D"mailto:qing.he@intel.co=
m">qing.he@intel.com</a>&gt;<br>
&gt; -<br>
&gt; -diff --git a/src/apprentice.c b/src/apprentice.c<br>
&gt; -index 3d4c3cf..a2b86ed 100644<br>
&gt; ---- a/src/apprentice.c<br>
&gt; -+++ b/src/apprentice.c<br>
&gt; -@@ -1396,11 +1396,10 @@ parse(struct magic_set *ms, struct magic_entr=
y **mentryp, uint32_t *nmentryp,<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 m-&gt;reln =3D *l;<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 ++l;<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 if (*l =3D=3D &#39;=3D&#39;) {<br>
&gt; -- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ms-&gt;flags &amp; MAGIC=
_CHECK) {<br>
&gt; -- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file_magwarn=
(ms, &quot;%c=3D not supported&quot;,<br>
&gt; -- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0m-&g=
t;reln);<br>
&gt; -- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -1;<b=
r>
&gt; -- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}<br>
&gt; -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (m-&gt;reln =3D=3D &#39;&gt;&#39;=
)<br>
&gt; -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0m-&gt;reln =3D &#39;g&#39;;<=
br>
&gt; -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else if (m-&gt;reln =3D=3D &#39;&lt;=
&#39;)<br>
&gt; -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0m-&gt;reln =3D &#39;l&#39;;<=
br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0++l;<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 }<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 break;<br>
&gt; -diff --git a/src/softmagic.c b/src/softmagic.c<br>
&gt; -index d8a5675..1648e43 100644<br>
&gt; ---- a/src/softmagic.c<br>
&gt; -+++ b/src/softmagic.c<br>
&gt; -@@ -1955,6 +1955,38 @@ magiccheck(struct magic_set *ms, struct magic =
*m)<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 }<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 break;<br>
&gt; -<br>
&gt; -+ =A0 =A0case &#39;g&#39;:<br>
&gt; -+ =A0 =A0 =A0 =A0 =A0 =A0if (m-&gt;flag &amp; UNSIGNED) {<br>
&gt; -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0matched =3D v &gt;=3D l;<br>
&gt; -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if ((ms-&gt;flags &amp; MAGI=
C_DEBUG) !=3D 0)<br>
&gt; -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(void) fprin=
tf(stderr, &quot;%llu &gt;=3D %llu =3D %d\n&quot;,<br>
&gt; -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(uns=
igned long long)v,<br>
&gt; -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(uns=
igned long long)l, matched);<br>
&gt; -+ =A0 =A0 =A0 =A0 =A0 =A0}<br>
&gt; -+ =A0 =A0 =A0 =A0 =A0 =A0else {<br>
&gt; -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0matched =3D (int64_t) v &gt;=
=3D (int64_t) l;<br>
&gt; -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if ((ms-&gt;flags &amp; MAGI=
C_DEBUG) !=3D 0)<br>
&gt; -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(void) fprin=
tf(stderr, &quot;%lld &gt;=3D %lld =3D %d\n&quot;,<br>
&gt; -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(lon=
g long)v, (long long)l, matched);<br>
&gt; -+ =A0 =A0 =A0 =A0 =A0 =A0}<br>
&gt; -+ =A0 =A0 =A0 =A0 =A0 =A0break;<br>
&gt; -+<br>
&gt; -+ =A0 =A0case &#39;l&#39;:<br>
&gt; -+ =A0 =A0 =A0 =A0 =A0 =A0if (m-&gt;flag &amp; UNSIGNED) {<br>
&gt; -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0matched =3D v &lt;=3D l;<br>
&gt; -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if ((ms-&gt;flags &amp; MAGI=
C_DEBUG) !=3D 0)<br>
&gt; -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(void) fprin=
tf(stderr, &quot;%llu &lt;=3D %llu =3D %d\n&quot;,<br>
&gt; -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(uns=
igned long long)v,<br>
&gt; -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(uns=
igned long long)l, matched);<br>
&gt; -+ =A0 =A0 =A0 =A0 =A0 =A0}<br>
&gt; -+ =A0 =A0 =A0 =A0 =A0 =A0else {<br>
&gt; -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0matched =3D (int64_t) v &lt;=
=3D (int64_t) l;<br>
&gt; -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if ((ms-&gt;flags &amp; MAGI=
C_DEBUG) !=3D 0)<br>
&gt; -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(void) fprin=
tf(stderr, &quot;%lld &lt;=3D %lld =3D %d\n&quot;,<br>
&gt; -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 (long long)v, (long long)l, matched);<br>
&gt; -+ =A0 =A0 =A0 =A0 =A0 =A0}<br>
&gt; -+ =A0 =A0 =A0 =A0 =A0 =A0break;<br>
&gt; -+<br>
&gt; - =A0 =A0 case &#39;&amp;&#39;:<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 matched =3D (v &amp; l) =3D=3D l;<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 if ((ms-&gt;flags &amp; MAGIC_DEBUG) !=3D 0)=
<br>
&gt; diff --git a/meta/recipes-devtools/file/file/stringb-compat.patch b/me=
ta/recipes-devtools/file/file/stringb-compat.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 8aba31e..0000000<br>
&gt; --- a/meta/recipes-devtools/file/file/stringb-compat.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,31 +0,0 @@<br>
&gt; -Upstream-Status: Pending<br>
&gt; -<br>
&gt; -`B&#39; in file 4.x has the same meaning with `W&#39; in file 5,<br>
&gt; -let `B&#39; be an alias of `W&#39;.<br>
&gt; -<br>
&gt; -8/17/2010 - created by Qing He &lt;<a href=3D"mailto:qing.he@intel.co=
m">qing.he@intel.com</a>&gt;<br>
&gt; -<br>
&gt; -diff --git a/src/apprentice.c b/src/apprentice.c<br>
&gt; -index 58826c3..3d4c3cf 100644<br>
&gt; ---- a/src/apprentice.c<br>
&gt; -+++ b/src/apprentice.c<br>
&gt; -@@ -1340,6 +1340,7 @@ parse(struct magic_set *ms, struct magic_entry =
**mentryp, uint32_t *nmentryp,<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 &quot;zero range&quot;);<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 l =3D t - 1;<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 break;<br>
&gt; -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case CHAR_CO=
MPACT_BLANK:<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 case CHAR_CO=
MPACT_WHITESPACE:<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 m-&gt;str_flags |=3D STRING_COMPACT_WHITESPACE;<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 break;<br>
&gt; -diff --git a/src/file.h b/src/file.h<br>
&gt; -index c07f2d4..42cf416 100644<br>
&gt; ---- a/src/file.h<br>
&gt; -+++ b/src/file.h<br>
&gt; -@@ -282,6 +282,7 @@ struct magic {<br>
&gt; - #define STRING_TEXTTEST =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 BIT(5)<br>
&gt; - #define STRING_BINTEST =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0BIT(6)<br>
&gt; - #define CHAR_COMPACT_WHITESPACE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 &#39;W&#39;<br>
&gt; -+#define CHAR_COMPACT_BLANK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&#39;B=
&#39;<br>
&gt; - #define CHAR_COMPACT_OPTIONAL_WHITESPACE =A0 =A0&#39;w&#39;<br>
&gt; - #define CHAR_IGNORE_LOWERCASE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 &#39;c&#39;<br>
&gt; - #define CHAR_IGNORE_UPPERCASE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 &#39;C&#39;<br>
&gt; diff --git a/meta/recipes-devtools/file/<a href=3D"http://file_5.04.bb=
" target=3D"_blank">file_5.04.bb</a> b/meta/recipes-devtools/file/<a href=
=3D"http://file_5.04.bb" target=3D"_blank">file_5.04.bb</a><br>
&gt; deleted file mode 100644<br>
&gt; index 1f9c78e..0000000<br>
&gt; --- a/meta/recipes-devtools/file/<a href=3D"http://file_5.04.bb" targe=
t=3D"_blank">file_5.04.bb</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,39 +0,0 @@<br>
&gt; -SUMMARY =3D &quot;File classification tool&quot;<br>
&gt; -DESCRIPTION =3D &quot;File attempts to classify files depending \<br>
&gt; -on their contents and prints a description if a match is found.&quot;=
<br>
&gt; -HOMEPAGE =3D &quot;<a href=3D"http://www.darwinsys.com/file/" target=
=3D"_blank">http://www.darwinsys.com/file/</a>&quot;<br>
&gt; -SECTION =3D &quot;console/utils&quot;<br>
&gt; -<br>
&gt; -# two clause BSD<br>
&gt; -LICENSE =3D &quot;BSD&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://COPYING;beginline=3D2;md5=3D6a73828=
72edb68d33e1a9398b6e03188&quot;<br>
&gt; -<br>
&gt; -DEPENDS =3D &quot;zlib file-native&quot;<br>
&gt; -DEPENDS_virtclass-native =3D &quot;zlib-native&quot;<br>
&gt; -PR =3D &quot;r2&quot;<br>
&gt; -<br>
&gt; -SRC_URI =3D &quot;<a href=3D"ftp://ftp.astron.com/pub/file/file-$%7BP=
V%7D.tar.gz" target=3D"_blank">ftp://ftp.astron.com/pub/file/file-${PV}.tar=
.gz</a> \<br>
&gt; - =A0 =A0 =A0 =A0 =A0 file://stringb-compat.patch \<br>
&gt; - =A0 =A0 =A0 =A0 =A0 file://ge-le.patch \<br>
&gt; - =A0 =A0 =A0 =A0 =A0 file://dump \<br>
&gt; - =A0 =A0 =A0 =A0 =A0 file://filesystems&quot;<br>
&gt; -<br>
&gt; -SRC_URI[md5sum] =3D &quot;accade81ff1cc774904b47c72c8aeea0&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;4c9e6e7994e74cb3386374ae91b055d26ac96b9d=
3e82fd157ae2d62e87a4260c&quot;<br>
&gt; -<br>
&gt; -inherit autotools<br>
&gt; -<br>
&gt; -do_configure_prepend() {<br>
&gt; - =A0 =A0 cp ${WORKDIR}/dump ${S}/magic/Magdir/<br>
&gt; - =A0 =A0 cp ${WORKDIR}/filesystems ${S}/magic/Magdir/<br>
&gt; -}<br>
&gt; -<br>
&gt; -FILES_${PN} +=3D &quot;${datadir}/misc/*.mgc&quot;<br>
&gt; -<br>
&gt; -do_install_append_virtclass-native() {<br>
&gt; - =A0 =A0 create_cmdline_wrapper ${D}/${bindir}/file \<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 --magic-file ${datadir}/misc/magic.mgc<br>
&gt; -}<br>
&gt; -<br>
&gt; -<br>
&gt; -BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt; diff --git a/meta/recipes-devtools/file/<a href=3D"http://file_5.07.bb=
" target=3D"_blank">file_5.07.bb</a> b/meta/recipes-devtools/file/<a href=
=3D"http://file_5.07.bb" target=3D"_blank">file_5.07.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000..9b5b51f<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/file/<a href=3D"http://file_5.07.bb" targe=
t=3D"_blank">file_5.07.bb</a><br>
&gt; @@ -0,0 +1,36 @@<br>
&gt; +SUMMARY =3D &quot;File classification tool&quot;<br>
&gt; +DESCRIPTION =3D &quot;File attempts to classify files depending \<br>
&gt; +on their contents and prints a description if a match is found.&quot;=
<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"http://www.darwinsys.com/file/" target=
=3D"_blank">http://www.darwinsys.com/file/</a>&quot;<br>
&gt; +SECTION =3D &quot;console/utils&quot;<br>
&gt; +<br>
&gt; +# two clause BSD<br>
&gt; +LICENSE =3D &quot;BSD&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;beginline=3D2;md5=3D6a73828=
72edb68d33e1a9398b6e03188&quot;<br>
&gt; +<br>
&gt; +DEPENDS =3D &quot;zlib file-native&quot;<br>
&gt; +DEPENDS_virtclass-native =3D &quot;zlib-native&quot;<br>
&gt; +PR =3D &quot;r0&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;<a href=3D"ftp://ftp.astron.com/pub/file/file-$%7BP=
V%7D.tar.gz" target=3D"_blank">ftp://ftp.astron.com/pub/file/file-${PV}.tar=
.gz</a> \<br>
&gt; + =A0 =A0 =A0 =A0 =A0 file://dump \<br>
&gt; + =A0 =A0 =A0 =A0 =A0 file://filesystems&quot;<br>
&gt; +<br>
&gt; +SRC_URI[md5sum] =3D &quot;b8d1f9a8a644067bd0a703cebf3f4858&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;c968bfe97d87f9f564728a894d57be2c6bba9a20=
06763fffff85c5f72a9a3c2f&quot;<br>
&gt; +<br>
&gt; +inherit autotools<br>
&gt; +<br>
&gt; +do_configure_prepend() {<br>
&gt; + =A0 =A0 cp ${WORKDIR}/dump ${S}/magic/Magdir/<br>
&gt; + =A0 =A0 cp ${WORKDIR}/filesystems ${S}/magic/Magdir/<br>
&gt; +}<br>
&gt; +<br>
&gt; +FILES_${PN} +=3D &quot;${datadir}/misc/*.mgc&quot;<br>
&gt; +<br>
&gt; +do_install_append_virtclass-native() {<br>
&gt; + =A0 =A0 create_cmdline_wrapper ${D}/${bindir}/file \<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 --magic-file ${datadir}/misc/magic.mgc<br>
&gt; +}<br>
&gt; +<br>
&gt; +BBCLASSEXTEND =3D &quot;native&quot;<br>
<br>
<br>
<br>
</div></div>_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</blockquote></div><br><br clear=3D"all"><br>-- <br>Saludos<br>Adrian Alons=
o<br><a href=3D"http://aalonso.wordpress.com">http://aalonso.wordpress.com<=
/a><br><br>

--bcaec5486264e1872304aadce690--
