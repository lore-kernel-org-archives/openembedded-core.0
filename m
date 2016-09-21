Return-Path: <sujith.h@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 90A8F6069D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 05:12:25 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id 11so1216612qtc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 22:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=y+BW/SBBz1hsd5TpCUdts94B5EItFzCIVbxCllYE120=;
	b=kmccoF+Ueqq5f7aVfvBwgPV6wCxj6+QCoiq2JFwI1EYoQ++6W+pMDwyY/eLJlflWTN
	O8o+seLBqaIpNIEFgJM9Jbf5vGhXZZGtlngK7Km88PxW1MoylGNfIs7Dt48jOpK7X61W
	jy+iTIlUjcSGBQYP4c8h4BxbKxYD9RWR4vNGDJ4QJ1Z3XlB3G2HcBg+y2BFFj0IKyvQ4
	4mmrzcOz8NfHexjQOYf0t0Pp6xHi0ey28G9I57ST88DPCXAvRVHy7FE/V3PmCR19uVdx
	NRlF6kt6Wo7frmQRAcDwhwqd7zOLk+ouUe5AWx9ReCsygBsr1lOdREoaVxHmCwfK4cAB
	YboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=y+BW/SBBz1hsd5TpCUdts94B5EItFzCIVbxCllYE120=;
	b=MrtmK1YB82vb1rBpTorgdDPGkeepA6HqM3xFgwlN7GP0i2W1C1wev/fvz7uAVbFGcn
	+bXkekw4I7aZjkNXmHP03EzSI92Vw5CiRF4fUV8PrfyNIS+itXvFtPDwHQw1xQKysiXh
	+yVuZlPRngKn/RNvFvRxnwubu6NG8c9IECe7aJvFO1FJJWFHSxW/oB0cBNlv8RjoZitT
	MIsDPNNM188RELASWNP3IaAjh37s1TLrZR6X6tt80yY7vW7hh64kqS3kKjCsoe/cBYRs
	5YC8MlOK4Om/UhGH0WKm5L6W4eK4nGN9So+3eG40pIvaFCJ6ED6whgCFp3TxKfbmfbC6
	MZLQ==
X-Gm-Message-State: AE9vXwMKLPJ/xNuoApqW2cTbhsAu/Jkmiq1uu2ilXUqXxEEynpldu5uq/AMJdQDZV2/SlNZ0IqUGV56pfqZeRQ==
X-Received: by 10.200.54.249 with SMTP id b54mr41244794qtc.21.1474434746422;
	Tue, 20 Sep 2016 22:12:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.183.1 with HTTP; Tue, 20 Sep 2016 22:12:06 -0700 (PDT)
In-Reply-To: <CAJ86T=UY08eUCijiBDLCkcGkaZSXCYPRvwmoONHF73XCtGqhSg@mail.gmail.com>
References: <1473317486-13435-1-git-send-email-sujith.h@gmail.com>
	<CAJ86T=VS6k_GDbCNc_Wf-yNegfP0dUAocZQApi_e+nFSgerTmA@mail.gmail.com>
	<CADyYWLnP3=Lxw93hWV37o=pm0Ow+Ap5bS_8nB+ZYjtr7AX6dQw@mail.gmail.com>
	<CABcZAN=ca9cRakHcYvetaQwCKsuAmUX3Bmf--6OfT7AimJuHgw@mail.gmail.com>
	<CAJ86T=UY08eUCijiBDLCkcGkaZSXCYPRvwmoONHF73XCtGqhSg@mail.gmail.com>
From: sujith h <sujith.h@gmail.com>
Date: Wed, 21 Sep 2016 10:42:06 +0530
Message-ID: <CADyYWL=BMAZp2N==jbMCa+8KyQQ5fUeTSWnYCLz-B76TwFQrEg@mail.gmail.com>
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
X-List-Received-Date: Wed, 21 Sep 2016 05:12:27 -0000
Content-Type: multipart/alternative; boundary=001a113e14d44e3e2d053cfd972e

--001a113e14d44e3e2d053cfd972e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 21, 2016 at 3:22 AM, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Mon, Sep 19, 2016 at 11:00 AM, Christopher Larson
> <chris_larson@mentor.com> wrote:
> >
> > On Mon, Sep 19, 2016 at 4:10 AM, sujith h <sujith.h@gmail.com> wrote:
> >>
> >> On Thu, Sep 8, 2016 at 12:36 PM, Andre McCurdy <armccurdy@gmail.com>
> >> wrote:
> >>>
> >>> On Wed, Sep 7, 2016 at 11:51 PM, Sujith H <sujith.h@gmail.com> wrote:
> >>> > From: Christopher Larson <chris_larson@mentor.com>
> >>> >
> >>> > When built on an i686 host for qemux86-64 without the
> >>> > fix to obey LD and it fails:
> >>> >
> >>> > /scratch/dogwood/toolchains/x86_64/bin/i686-pc-linux-gnu-ld:
> >>> > Relocatable linking with relocations from format elf64-x86-64
> >>> >
> >>> > (/scratch/dogwood/perf-ld-test/build/tmp/work/qemux86_
> 64-mel-linux/perf/1.0-r9/perf-1.0/fs/fs.o)
> >>> > to format elf32-i386
> >>> > (/scratch/dogwood/perf-ld-test/build/tmp/work/qemux86_
> 64-mel-linux/perf/1.0-r9/perf-1.0/fs/libapi-in.o)
> >>> > is not supported
> >>> >
> >>> > This is because LD includes HOST_LD_ARCH, which contains TUNE_LDARG=
S,
> >>> > which is -m elf32_x86_64 for x86_64. Without that, direct use of ld
> >>> > will fail.
> >>> >
> >>> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> >>> > Signed-off-by: Sujith Haridasan <Sujith_Haridasan@mentor.com>
> >>> > ---
> >>> >  meta/recipes-kernel/perf/perf.bb | 9 +++++++++
> >>> >  1 file changed, 9 insertions(+)
> >>> >
> >>> > diff --git a/meta/recipes-kernel/perf/perf.bb
> >>> > b/meta/recipes-kernel/perf/perf.bb
> >>> > index 88e3a0a..85fe0ea 100644
> >>> > --- a/meta/recipes-kernel/perf/perf.bb
> >>> > +++ b/meta/recipes-kernel/perf/perf.bb
> >>> > @@ -79,6 +79,7 @@ EXTRA_OEMAKE =3D '\
> >>> >      ARCH=3D${ARCH} \
> >>> >      CC=3D"${CC}" \
> >>> >      AR=3D"${AR}" \
> >>> > +    LD=3D"${LD}" \
> >>> >      EXTRA_CFLAGS=3D"-ldw" \
> >>> >      perfexecdir=3D${libexecdir} \
> >>> >      NO_GTK2=3D1 ${TUI_DEFINES} NO_DWARF=3D1 ${LIBUNWIND_DEFINES} \
> >>> > @@ -98,6 +99,14 @@ EXTRA_OEMAKE +=3D "\
> >>> >      'infodir=3D${@os.path.relpath(infodir, prefix)}' \
> >>> >  "
> >>> >
> >>> > +do_configure_prepend () {
> >>> > +    for makefile in "${S}/tools/perf/Makefile.perf" \
> >>> > +                    "${S}/tools/lib/api/Makefile"; do
> >>> > +        if [ -e "$makefile" ]; then
> >>> > +            sed -i 's,LD =3D $(CROSS_COMPILE)ld,#LD,' "$makefile"
> >>> > +        fi
> >>> > +    done
> >>> > +}
> >>>
> >>> Isn't passing LD via the Make command line enough to over-ride these
> >>> definitions in the Makefiles?
> >>
> >> Unfortunately that didn't helped I believe. That's the reason, this
> patch
> >> was created.
> >
> > The patch mirrored the handling of CC/AR, which also used sed at the ti=
me
> > the append was created. If upstream removed the sed for those, then we
> can
> > remove it for LD as well, presumably. I=E2=80=99d recommend actually te=
sting
> that.
>
> Brief testing suggests that commenting out LD in
> ${S}/tools/lib/api/Makefile is still required.
>
> For clarity the new sed command should probably be added next to the
> existing ones for CC and AR though, rather than on its own in a new
> do_configure_prepend().
>
> There is no "LD =3D ..." line to comment out in
> ${S}/tools/perf/Makefile.perf.
>

I will update the patch  as per the suggestion.

>
> > --
> > Christopher Larson
> > kergoth at gmail dot com
> > Founder - BitBake, OpenEmbedded, OpenZaurus
> > Maintainer - Tslib
> > Senior Software Engineer, Mentor Graphics
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

--001a113e14d44e3e2d053cfd972e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Sep 21, 2016 at 3:22 AM, Andre McCurdy <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZ=
b"><div class=3D"h5">On Mon, Sep 19, 2016 at 11:00 AM, Christopher Larson<b=
r>
&lt;<a href=3D"mailto:chris_larson@mentor.com">chris_larson@mentor.com</a>&=
gt; wrote:<br>
&gt;<br>
&gt; On Mon, Sep 19, 2016 at 4:10 AM, sujith h &lt;<a href=3D"mailto:sujith=
.h@gmail.com">sujith.h@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Thu, Sep 8, 2016 at 12:36 PM, Andre McCurdy &lt;<a href=3D"mail=
to:armccurdy@gmail.com">armccurdy@gmail.com</a>&gt;<br>
&gt;&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Wed, Sep 7, 2016 at 11:51 PM, Sujith H &lt;<a href=3D"mailt=
o:sujith.h@gmail.com">sujith.h@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt; &gt; From: Christopher Larson &lt;<a href=3D"mailto:chris_lars=
on@mentor.com">chris_larson@mentor.com</a>&gt;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; When built on an i686 host for qemux86-64 without the<br>
&gt;&gt;&gt; &gt; fix to obey LD and it fails:<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; /scratch/dogwood/toolchains/<wbr>x86_64/bin/i686-pc-linux=
-gnu-<wbr>ld:<br>
&gt;&gt;&gt; &gt; Relocatable linking with relocations from format elf64-x8=
6-64<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; (/scratch/dogwood/perf-ld-<wbr>test/build/tmp/work/qemux8=
6_<wbr>64-mel-linux/perf/1.0-r9/perf-<wbr>1.0/fs/fs.o)<br>
&gt;&gt;&gt; &gt; to format elf32-i386<br>
&gt;&gt;&gt; &gt; (/scratch/dogwood/perf-ld-<wbr>test/build/tmp/work/qemux8=
6_<wbr>64-mel-linux/perf/1.0-r9/perf-<wbr>1.0/fs/libapi-in.o)<br>
&gt;&gt;&gt; &gt; is not supported<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; This is because LD includes HOST_LD_ARCH, which contains =
TUNE_LDARGS,<br>
&gt;&gt;&gt; &gt; which is -m elf32_x86_64 for x86_64. Without that, direct=
 use of ld<br>
&gt;&gt;&gt; &gt; will fail.<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:c=
hris_larson@mentor.com">chris_larson@mentor.com</a>&gt;<br>
&gt;&gt;&gt; &gt; Signed-off-by: Sujith Haridasan &lt;<a href=3D"mailto:Suj=
ith_Haridasan@mentor.com">Sujith_Haridasan@mentor.com</a>&gt;<br>
&gt;&gt;&gt; &gt; ---<br>
&gt;&gt;&gt; &gt;=C2=A0 meta/recipes-kernel/perf/<a href=3D"http://perf.bb"=
 rel=3D"noreferrer" target=3D"_blank">perf.<wbr>bb</a> | 9 +++++++++<br>
&gt;&gt;&gt; &gt;=C2=A0 1 file changed, 9 insertions(+)<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; diff --git a/meta/recipes-kernel/perf/<a href=3D"http://p=
erf.bb" rel=3D"noreferrer" target=3D"_blank">per<wbr>f.bb</a><br>
&gt;&gt;&gt; &gt; b/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=
=3D"noreferrer" target=3D"_blank">per<wbr>f.bb</a><br>
&gt;&gt;&gt; &gt; index 88e3a0a..85fe0ea 100644<br>
&gt;&gt;&gt; &gt; --- a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb"=
 rel=3D"noreferrer" target=3D"_blank">per<wbr>f.bb</a><br>
&gt;&gt;&gt; &gt; +++ b/meta/recipes-kernel/perf/<a href=3D"http://perf.bb"=
 rel=3D"noreferrer" target=3D"_blank">per<wbr>f.bb</a><br>
&gt;&gt;&gt; &gt; @@ -79,6 +79,7 @@ EXTRA_OEMAKE =3D &#39;\<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 ARCH=3D${ARCH} \<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 CC=3D&quot;${CC}&quot; \<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 AR=3D&quot;${AR}&quot; \<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 LD=3D&quot;${LD}&quot; \<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 EXTRA_CFLAGS=3D&quot;-ldw&quot; \<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 perfexecdir=3D${libexecdir} \<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 NO_GTK2=3D1 ${TUI_DEFINES} NO_DWARF=
=3D1 ${LIBUNWIND_DEFINES} \<br>
&gt;&gt;&gt; &gt; @@ -98,6 +99,14 @@ EXTRA_OEMAKE +=3D &quot;\<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &#39;infodir=3D${@os.path.relpath(<wb=
r>infodir, prefix)}&#39; \<br>
&gt;&gt;&gt; &gt;=C2=A0 &quot;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; +do_configure_prepend () {<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 for makefile in &quot;${S}/tools/perf/Make=
file.<wbr>perf&quot; \<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;${S}/tools/lib/api/Makefile&quot;; do<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -e &quot;$makefile&quot=
; ]; then<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &#39;s,=
LD =3D $(CROSS_COMPILE)ld,#LD,&#39; &quot;$makefile&quot;<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 done<br>
&gt;&gt;&gt; &gt; +}<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Isn&#39;t passing LD via the Make command line enough to over-=
ride these<br>
&gt;&gt;&gt; definitions in the Makefiles?<br>
&gt;&gt;<br>
&gt;&gt; Unfortunately that didn&#39;t helped I believe. That&#39;s the rea=
son, this patch<br>
&gt;&gt; was created.<br>
&gt;<br>
&gt; The patch mirrored the handling of CC/AR, which also used sed at the t=
ime<br>
&gt; the append was created. If upstream removed the sed for those, then we=
 can<br>
&gt; remove it for LD as well, presumably. I=E2=80=99d recommend actually t=
esting that.<br>
<br>
</div></div>Brief testing suggests that commenting out LD in<br>
${S}/tools/lib/api/Makefile is still required.<br>
<br>
For clarity the new sed command should probably be added next to the<br>
existing ones for CC and AR though, rather than on its own in a new<br>
do_configure_prepend().<br>
<br>
There is no &quot;LD =3D ...&quot; line to comment out in ${S}/tools/perf/M=
akefile.perf.<br></blockquote><div><br></div><div>I will update the patch=
=C2=A0 as per the suggestion. <br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; --<br>
&gt; Christopher Larson<br>
&gt; kergoth at gmail dot com<br>
&gt; Founder - BitBake, OpenEmbedded, OpenZaurus<br>
&gt; Maintainer - Tslib<br>
&gt; Senior Software Engineer, Mentor Graphics<br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><d=
iv><div dir=3D"ltr"><div>=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=
=B5=8D =E0=B4=B9=E0=B4=B0=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=
=B5=8D<br>Bangalore<br>&lt;Project&gt;Contributor to KDE project<br></div><=
div>&lt;Project&gt;Contributor to Yocto project<br></div><div><a href=3D"ht=
tp://fci.wikia.com/wiki/Anti-DRM-Campaign" target=3D"_blank">http://fci.wik=
ia.com/wiki/Anti-DRM-Campaign</a><br>&lt;Blog&gt; <a href=3D"http://sujithh=
.info" target=3D"_blank">http://sujithh.info</a><br></div><div>C-x C-c<br><=
/div></div></div></div></div>
</div></div>

--001a113e14d44e3e2d053cfd972e--
