Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7BD4A602D9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 18:00:29 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id a62so1837983oib.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 11:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=z6UzvUywmr9OxaEAWIZyFdKRXOQ4WYDtlgAAZq4sqqE=;
	b=yofK7SWlDdDnRANNoCpzC3eBNbNLCWMX38VTT9V5yBm5kDhthd7DAwyjFw95Wa2jHa
	a1pnW4BPFerbXiTzljVAlRHBggkNGOjdJS7ZmMgumfBITCbLQQ2EjLEJYnDGGbFO8fLa
	UCY9utguifRcbTXiQIERTrLe/6IPUrFhXy2ntPrh0iQAqy4FYC4MNYyuzr5wn2yeoFRJ
	FSFdG5l2F+rBLLSD6gteiY0jKd1PvyDzqLtdqKcwhzQd3DhSoBQ4hoOPcEIfk4a8BJRo
	/QSkmPpVpgZX8cIffL1p0W7eLO9IAPJBQ/wmmHx59nMJP8SvK+9/4SuJfDvPgTKapdFg
	z6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=z6UzvUywmr9OxaEAWIZyFdKRXOQ4WYDtlgAAZq4sqqE=;
	b=lVbXEhQsq9BQKSWj0ZY/L2j3cjAXs+M/cbnAXEXFSRWMierhaXaLjaYwf4vpvCYBv4
	u1fkJFkJ71sLWQj/xGFlW/VOCur0lvxDewv61jBUTWlE5RNT2wUZAiBRVLEdFQRmWjME
	ppt84/vJhc97GSWZINugRgxYs79MULHagKGg7+15/SlY95T2tFobYqkFtn0x9bLpQMfd
	tjH8WHe3xwohv2lxmHVmp4L8WmRdCy9M1dHd4IdOOV614+YNMcpVL60R+c7sOnBhpA1s
	3Jtc4puFBzI8JauF6RAs81jBCOl0RsmStjn2QeivXHNA2Pb3NGc7OO3V8cb2db0CF2nI
	zDzQ==
X-Gm-Message-State: AE9vXwOzHhU/Qqx6x6sEO1EiFLHVKIshYvRaM+lPg3BV1WQ5AelPrD968UwaihnQto2E16iHCaUX4b2fZq5ayw==
X-Received: by 10.202.206.73 with SMTP id e70mr30811909oig.183.1474308030700; 
	Mon, 19 Sep 2016 11:00:30 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.13.194 with HTTP; Mon, 19 Sep 2016 11:00:10 -0700 (PDT)
In-Reply-To: <CADyYWLnP3=Lxw93hWV37o=pm0Ow+Ap5bS_8nB+ZYjtr7AX6dQw@mail.gmail.com>
References: <1473317486-13435-1-git-send-email-sujith.h@gmail.com>
	<CAJ86T=VS6k_GDbCNc_Wf-yNegfP0dUAocZQApi_e+nFSgerTmA@mail.gmail.com>
	<CADyYWLnP3=Lxw93hWV37o=pm0Ow+Ap5bS_8nB+ZYjtr7AX6dQw@mail.gmail.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Mon, 19 Sep 2016 11:00:10 -0700
X-Google-Sender-Auth: N-Mmj3C3kXux6jH2QnpNr2AEWZw
Message-ID: <CABcZAN=ca9cRakHcYvetaQwCKsuAmUX3Bmf--6OfT7AimJuHgw@mail.gmail.com>
To: sujith h <sujith.h@gmail.com>
Cc: Sujith Haridasan <Sujith_Haridasan@mentor.com>,
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
X-List-Received-Date: Mon, 19 Sep 2016 18:00:32 -0000
Content-Type: multipart/alternative; boundary=001a113d292075cb76053ce0163e

--001a113d292075cb76053ce0163e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 19, 2016 at 4:10 AM, sujith h <sujith.h@gmail.com> wrote:

>
>
> On Thu, Sep 8, 2016 at 12:36 PM, Andre McCurdy <armccurdy@gmail.com>
> wrote:
>
>> On Wed, Sep 7, 2016 at 11:51 PM, Sujith H <sujith.h@gmail.com> wrote:
>> > From: Christopher Larson <chris_larson@mentor.com>
>> >
>> > When built on an i686 host for qemux86-64 without the
>> > fix to obey LD and it fails:
>> >
>> > /scratch/dogwood/toolchains/x86_64/bin/i686-pc-linux-gnu-ld:
>> > Relocatable linking with relocations from format elf64-x86-64
>> > (/scratch/dogwood/perf-ld-test/build/tmp/work/qemux86_64-mel-linux/per=
f
>> /1.0-r9/perf-1.0/fs/fs.o)
>> > to format elf32-i386 (/scratch/dogwood/perf-ld-test
>> /build/tmp/work/qemux86_64-mel-linux/perf/1.0-r9/perf-1.0/fs/libapi-in.o=
)
>> > is not supported
>> >
>> > This is because LD includes HOST_LD_ARCH, which contains TUNE_LDARGS,
>> > which is -m elf32_x86_64 for x86_64. Without that, direct use of ld
>> will fail.
>> >
>> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>> > Signed-off-by: Sujith Haridasan <Sujith_Haridasan@mentor.com>
>> > ---
>> >  meta/recipes-kernel/perf/perf.bb | 9 +++++++++
>> >  1 file changed, 9 insertions(+)
>> >
>> > diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/
>> perf/perf.bb
>> > index 88e3a0a..85fe0ea 100644
>> > --- a/meta/recipes-kernel/perf/perf.bb
>> > +++ b/meta/recipes-kernel/perf/perf.bb
>> > @@ -79,6 +79,7 @@ EXTRA_OEMAKE =3D '\
>> >      ARCH=3D${ARCH} \
>> >      CC=3D"${CC}" \
>> >      AR=3D"${AR}" \
>> > +    LD=3D"${LD}" \
>> >      EXTRA_CFLAGS=3D"-ldw" \
>> >      perfexecdir=3D${libexecdir} \
>> >      NO_GTK2=3D1 ${TUI_DEFINES} NO_DWARF=3D1 ${LIBUNWIND_DEFINES} \
>> > @@ -98,6 +99,14 @@ EXTRA_OEMAKE +=3D "\
>> >      'infodir=3D${@os.path.relpath(infodir, prefix)}' \
>> >  "
>> >
>> > +do_configure_prepend () {
>> > +    for makefile in "${S}/tools/perf/Makefile.perf" \
>> > +                    "${S}/tools/lib/api/Makefile"; do
>> > +        if [ -e "$makefile" ]; then
>> > +            sed -i 's,LD =3D $(CROSS_COMPILE)ld,#LD,' "$makefile"
>> > +        fi
>> > +    done
>> > +}
>>
>> Isn't passing LD via the Make command line enough to over-ride these
>> definitions in the Makefiles?
>>
>
> Unfortunately that didn't helped I believe. That's the reason, this patch
> was created.
>

The patch mirrored the handling of CC/AR, which also used sed at the time
the append was created. If upstream removed the sed for those, then we can
remove it for LD as well, presumably. I=E2=80=99d recommend actually testin=
g that.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113d292075cb76053ce0163e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Sep 19, 2016 at 4:10 AM, sujith h <span dir=3D"ltr">&lt;<a href=3D"=
mailto:sujith.h@gmail.com" target=3D"_blank">sujith.h@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div class=3D"adM"><br></div><=
div class=3D"gmail_extra"><div class=3D"adM"><br></div><div class=3D"gmail_=
quote"><div class=3D"adM"><div class=3D"h5">On Thu, Sep 8, 2016 at 12:36 PM=
, Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D"mailto:armccurdy@gmail.com=
" target=3D"_blank">armccurdy@gmail.com</a>&gt;</span> wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"><div><div>On Wed, Sep 7, 2016 at 11:51 PM, Sujith H &l=
t;<a href=3D"mailto:sujith.h@gmail.com" target=3D"_blank">sujith.h@gmail.co=
m</a>&gt; wrote:<br>
&gt; From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.com=
" target=3D"_blank">chris_larson@mentor.com</a>&gt;<br>
&gt;<br>
&gt; When built on an i686 host for qemux86-64 without the<br>
&gt; fix to obey LD and it fails:<br>
&gt;<br>
&gt; /scratch/dogwood/toolchains/x8<wbr>6_64/bin/i686-pc-linux-gnu-ld:<br>
&gt; Relocatable linking with relocations from format elf64-x86-64<br>
&gt; (/scratch/dogwood/<span class=3D"il">perf</span>-ld-test<wbr>/build/tm=
p/work/qemux86_64-<wbr>mel-linux/<span class=3D"il">perf</span>/1.0-r9/<spa=
n class=3D"il">perf</span>-1.<wbr>0/fs/fs.o)<br>
&gt; to format elf32-i386 (/scratch/dogwood/<span class=3D"il">perf</span>-=
ld-test<wbr>/build/tmp/work/qemux86_64-<wbr>mel-linux/<span class=3D"il">pe=
rf</span>/1.0-r9/<span class=3D"il">perf</span>-1.<wbr>0/fs/libapi-in.o)<br=
>
&gt; is not supported<br>
&gt;<br>
&gt; This is because LD includes HOST_LD_ARCH, which contains TUNE_LDARGS,<=
br>
&gt; which is -m elf32_x86_64 for x86_64. Without that, direct use of ld wi=
ll fail.<br>
&gt;<br>
&gt; Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@m=
entor.com" target=3D"_blank">chris_larson@mentor.com</a>&gt;<br>
&gt; Signed-off-by: Sujith Haridasan &lt;<a href=3D"mailto:Sujith_Haridasan=
@mentor.com" target=3D"_blank">Sujith_Haridasan@mentor.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-kernel/<span class=3D"il">perf</span>/<a href=3D"ht=
tp://perf.bb" rel=3D"noreferrer" target=3D"_blank"><span class=3D"il">perf<=
/span>.<wbr>bb</a> | 9 +++++++++<br>
&gt;=C2=A0 1 file changed, 9 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-kernel/<span class=3D"il">perf</span>/<a hre=
f=3D"http://perf.bb" rel=3D"noreferrer" target=3D"_blank">per<wbr>f.bb</a> =
b/meta/recipes-kernel/<span class=3D"il">perf</span>/<a href=3D"http://perf=
.bb" rel=3D"noreferrer" target=3D"_blank">per<wbr>f.bb</a><br>
&gt; index 88e3a0a..85fe0ea 100644<br>
&gt; --- a/meta/recipes-kernel/<span class=3D"il">perf</span>/<a href=3D"ht=
tp://perf.bb" rel=3D"noreferrer" target=3D"_blank">per<wbr>f.bb</a><br>
&gt; +++ b/meta/recipes-kernel/<span class=3D"il">perf</span>/<a href=3D"ht=
tp://perf.bb" rel=3D"noreferrer" target=3D"_blank">per<wbr>f.bb</a><br>
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
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;infodir=3D${@os.path.relpath(in<wbr>fodir, pr=
efix)}&#39; \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt; +do_configure_prepend () {<br>
&gt; +=C2=A0 =C2=A0 for makefile in &quot;${S}/tools/<span class=3D"il">per=
f</span>/Makefile.<span class=3D"il">perf</span><wbr>&quot; \<br>
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
definitions in the Makefiles?<br></blockquote><div><br></div></div></div><d=
iv>Unfortunately that didn&#39;t helped I believe. That&#39;s the reason, t=
his patch was created.</div></div></div></blockquote></div><br>The patch mi=
rrored the handling of CC/AR, which also used sed at the time the append wa=
s created. If upstream removed the sed for those, then we can remove it for=
 LD as well, presumably. I=E2=80=99d recommend actually testing that.<br>--=
 <br><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div=
 dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br>Founder - Bi=
tBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software En=
gineer, Mentor Graphics</div></div>
</div></div>

--001a113d292075cb76053ce0163e--
