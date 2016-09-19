Return-Path: <sujith.h@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id B1A9860557
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 11:11:06 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id n66so9603982qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 04:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=osA5hDoWas2TqZ2wb3Du8xVnysuHBQgMvBTnuFNb81k=;
	b=SD2x5dXC4PIOol2h/4S1AplG2ECVD9kDAhYwBoUBbq+ilidkvQ+TNwivap0EGV0qwO
	ItxXhqRAIHQr6KCb2RSUv6ceHDGJkDbwXrkFL8Tnv7wNo/7OjadWdU7m0AiPAKKCMjIi
	EyAeaQvjpenfWOUmct448KONcIU7rIwhK5824MUl/PYbQHvSayB9b1W0ALAHaQXsa1bt
	e0zYHCVPjyN9PpxsfuTaE6ZH97BZAFs2Mbpj9Ai+wFxshBW3U1xwnMVCgbrUbEqA60Vi
	KXJGpR9Cf0HdS9VOnBSq6vnw2nX8+w5o6ZQOI6zAfswt9YMOu2HbiWcy+wyI1riehWdB
	brgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=osA5hDoWas2TqZ2wb3Du8xVnysuHBQgMvBTnuFNb81k=;
	b=HIZTNbet6RIs14LtBxLg2v52wf47JS6wGD5zlyYgNY/mBYYp1sKFuPsOfsMxoMYgh7
	DzT/0PquZyb3k5Zas0DlYrHSKt/7XyAMS9FTcrS3AD7H+wCyqcIDIH+kEdUmzHIr/ZnM
	+WVVSEeB92z5Eo0m4pyzzMTV4jF8C85Gdt+0yrQx+oWm9ZTtsn78x0JAM12v35m5TlyR
	uyvt16mVLRMrPRJ3cDk3p+J3vXjKZ4TOpFDcsGpFRqgGc8+Gk++wiYQ870zo8s5z6Grg
	C+jglTTOBHeRNRO+opicOBuXCs0Rm473vNlQqAXYJ+br0I6MH1/lXuIvhwrEiqFm25W1
	GUiQ==
X-Gm-Message-State: AE9vXwPiltUZsOsxyW5wuw/yhuZsvZtsNV4X82saclkmIJ2MEogV/FAPEqyLn2xisMt2rA6Ra3+Vj5OHGw2WxQ==
X-Received: by 10.55.91.196 with SMTP id p187mr27042363qkb.263.1474283467391; 
	Mon, 19 Sep 2016 04:11:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.183.1 with HTTP; Mon, 19 Sep 2016 04:10:47 -0700 (PDT)
In-Reply-To: <CAJ86T=VS6k_GDbCNc_Wf-yNegfP0dUAocZQApi_e+nFSgerTmA@mail.gmail.com>
References: <1473317486-13435-1-git-send-email-sujith.h@gmail.com>
	<CAJ86T=VS6k_GDbCNc_Wf-yNegfP0dUAocZQApi_e+nFSgerTmA@mail.gmail.com>
From: sujith h <sujith.h@gmail.com>
Date: Mon, 19 Sep 2016 16:40:47 +0530
Message-ID: <CADyYWLnP3=Lxw93hWV37o=pm0Ow+Ap5bS_8nB+ZYjtr7AX6dQw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Sujith Haridasan <Sujith_Haridasan@mentor.com>,
	Christopher Larson <chris_larson@mentor.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: Fix to obey LD failure on host i686
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
X-List-Received-Date: Mon, 19 Sep 2016 11:11:08 -0000
Content-Type: multipart/alternative; boundary=001a114e7b505f7581053cda5e1f

--001a114e7b505f7581053cda5e1f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 8, 2016 at 12:36 PM, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Wed, Sep 7, 2016 at 11:51 PM, Sujith H <sujith.h@gmail.com> wrote:
> > From: Christopher Larson <chris_larson@mentor.com>
> >
> > When built on an i686 host for qemux86-64 without the
> > fix to obey LD and it fails:
> >
> > /scratch/dogwood/toolchains/x86_64/bin/i686-pc-linux-gnu-ld:
> > Relocatable linking with relocations from format elf64-x86-64
> > (/scratch/dogwood/perf-ld-test/build/tmp/work/qemux86_
> 64-mel-linux/perf/1.0-r9/perf-1.0/fs/fs.o)
> > to format elf32-i386 (/scratch/dogwood/perf-ld-
> test/build/tmp/work/qemux86_64-mel-linux/perf/1.0-r9/perf-
> 1.0/fs/libapi-in.o)
> > is not supported
> >
> > This is because LD includes HOST_LD_ARCH, which contains TUNE_LDARGS,
> > which is -m elf32_x86_64 for x86_64. Without that, direct use of ld wil=
l
> fail.
> >
> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > Signed-off-by: Sujith Haridasan <Sujith_Haridasan@mentor.com>
> > ---
> >  meta/recipes-kernel/perf/perf.bb | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/meta/recipes-kernel/perf/perf.bb
> b/meta/recipes-kernel/perf/perf.bb
> > index 88e3a0a..85fe0ea 100644
> > --- a/meta/recipes-kernel/perf/perf.bb
> > +++ b/meta/recipes-kernel/perf/perf.bb
> > @@ -79,6 +79,7 @@ EXTRA_OEMAKE =3D '\
> >      ARCH=3D${ARCH} \
> >      CC=3D"${CC}" \
> >      AR=3D"${AR}" \
> > +    LD=3D"${LD}" \
> >      EXTRA_CFLAGS=3D"-ldw" \
> >      perfexecdir=3D${libexecdir} \
> >      NO_GTK2=3D1 ${TUI_DEFINES} NO_DWARF=3D1 ${LIBUNWIND_DEFINES} \
> > @@ -98,6 +99,14 @@ EXTRA_OEMAKE +=3D "\
> >      'infodir=3D${@os.path.relpath(infodir, prefix)}' \
> >  "
> >
> > +do_configure_prepend () {
> > +    for makefile in "${S}/tools/perf/Makefile.perf" \
> > +                    "${S}/tools/lib/api/Makefile"; do
> > +        if [ -e "$makefile" ]; then
> > +            sed -i 's,LD =3D $(CROSS_COMPILE)ld,#LD,' "$makefile"
> > +        fi
> > +    done
> > +}
>
> Isn't passing LD via the Make command line enough to over-ride these
> definitions in the Makefiles?
>

Unfortunately that didn't helped I believe. That's the reason, this patch
was created.


>
> >  do_compile() {
> >         # Linux kernel build system is expected to do the right thing
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
<Project>Contributor to Yocto project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info
C-x C-c

--001a114e7b505f7581053cda5e1f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Sep 8, 2016 at 12:36 PM, Andre McCurdy <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZ=
b"><div class=3D"h5">On Wed, Sep 7, 2016 at 11:51 PM, Sujith H &lt;<a href=
=3D"mailto:sujith.h@gmail.com">sujith.h@gmail.com</a>&gt; wrote:<br>
&gt; From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.com=
">chris_larson@mentor.com</a>&gt;<br>
&gt;<br>
&gt; When built on an i686 host for qemux86-64 without the<br>
&gt; fix to obey LD and it fails:<br>
&gt;<br>
&gt; /scratch/dogwood/toolchains/<wbr>x86_64/bin/i686-pc-linux-gnu-<wbr>ld:=
<br>
&gt; Relocatable linking with relocations from format elf64-x86-64<br>
&gt; (/scratch/dogwood/perf-ld-<wbr>test/build/tmp/work/qemux86_<wbr>64-mel=
-linux/perf/1.0-r9/perf-<wbr>1.0/fs/fs.o)<br>
&gt; to format elf32-i386 (/scratch/dogwood/perf-ld-<wbr>test/build/tmp/wor=
k/qemux86_<wbr>64-mel-linux/perf/1.0-r9/perf-<wbr>1.0/fs/libapi-in.o)<br>
&gt; is not supported<br>
&gt;<br>
&gt; This is because LD includes HOST_LD_ARCH, which contains TUNE_LDARGS,<=
br>
&gt; which is -m elf32_x86_64 for x86_64. Without that, direct use of ld wi=
ll fail.<br>
&gt;<br>
&gt; Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@m=
entor.com">chris_larson@mentor.com</a>&gt;<br>
&gt; Signed-off-by: Sujith Haridasan &lt;<a href=3D"mailto:Sujith_Haridasan=
@mentor.com">Sujith_Haridasan@mentor.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noref=
errer" target=3D"_blank">perf.<wbr>bb</a> | 9 +++++++++<br>
&gt;=C2=A0 1 file changed, 9 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=
=3D"noreferrer" target=3D"_blank">per<wbr>f.bb</a> b/meta/recipes-kernel/pe=
rf/<a href=3D"http://perf.bb" rel=3D"noreferrer" target=3D"_blank">per<wbr>=
f.bb</a><br>
&gt; index 88e3a0a..85fe0ea 100644<br>
&gt; --- a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noref=
errer" target=3D"_blank">per<wbr>f.bb</a><br>
&gt; +++ b/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noref=
errer" target=3D"_blank">per<wbr>f.bb</a><br>
&gt; @@ -79,6 +79,7 @@ EXTRA_OEMAKE =3D &#39;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ARCH=3D${ARCH} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 CC=3D&quot;${CC}&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 AR=3D&quot;${AR}&quot; \<br>
&gt; +=C2=A0 =C2=A0 LD=3D&quot;${LD}&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 EXTRA_CFLAGS=3D&quot;-ldw&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 perfexecdir=3D${libexecdir} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 NO_GTK2=3D1 ${TUI_DEFINES} NO_DWARF=3D1 ${LIBUNWIN=
D_DEFINES} \<br>
&gt; @@ -98,6 +99,14 @@ EXTRA_OEMAKE +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;infodir=3D${@os.path.relpath(<wbr>infodir, pr=
efix)}&#39; \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt; +do_configure_prepend () {<br>
&gt; +=C2=A0 =C2=A0 for makefile in &quot;${S}/tools/perf/Makefile.<wbr>per=
f&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &quot;${S}/tools/lib/api/Makefile&quot;; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -e &quot;$makefile&quot; ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &#39;s,LD =3D $(CROS=
S_COMPILE)ld,#LD,&#39; &quot;$makefile&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 done<br>
&gt; +}<br>
<br>
</div></div>Isn&#39;t passing LD via the Make command line enough to over-r=
ide these<br>
definitions in the Makefiles?<br></blockquote><div><br></div><div>Unfortuna=
tely that didn&#39;t helped I believe. That&#39;s the reason, this patch wa=
s created.<br>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;=C2=A0 do_compile() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Linux kernel build system is expect=
ed to do the right thing<br>
&gt; --<br>
&gt; 1.9.1<br>
&gt;<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<=
wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><=
div><div dir=3D"ltr"><div>=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=
=B5=8D =E0=B4=B9=E0=B4=B0=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=
=B5=8D<br>Bangalore<br>&lt;Project&gt;Contributor to KDE project<br></div><=
div>&lt;Project&gt;Contributor to Yocto project<br></div><div><a href=3D"ht=
tp://fci.wikia.com/wiki/Anti-DRM-Campaign" target=3D"_blank">http://fci.wik=
ia.com/wiki/Anti-DRM-Campaign</a><br>&lt;Blog&gt; <a href=3D"http://sujithh=
.info" target=3D"_blank">http://sujithh.info</a><br></div><div>C-x C-c<br><=
/div></div></div></div></div>
</div></div>

--001a114e7b505f7581053cda5e1f--
