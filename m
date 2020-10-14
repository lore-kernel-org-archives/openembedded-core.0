Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web10.308.1602715640469752002
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2020 15:47:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jaJlhdus;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id b69so879322qkg.8
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2020 15:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nuMD4YjZea63BzMozIGe4O7dAP0k+IE75QPJj2fdP7w=;
        b=jaJlhduswlmcGvIIGqdO2y1jeWx+cb17gQu5VVKLS2Ru0mE6hS0m/OWKBzfxJ6o4AG
         tL4bKsk9QOah1vnzek434ahW48Il7yu7P3JyAUfLMDmi/KavEd8TEU+i8ybK0tZ5zU7v
         ZFyUZVDY3WKWbMafHYNQr/ZBe6oF9wQ4d0QgeMpu+O8Q37TqDEwPB+98NXu02FQvaNnC
         4fz9QLQoJYe3VbhE/uJEe8pHMPSnCZzOW35KjVzqaytMMqCBEpvIpbJrBTf5CFT7ZvmO
         S7M/c3t30MIhUw+09EEBVlgmK+yUY4RqETJab1fJCrE7S51EUo3wV3WSSCZDvarxEqEZ
         M1bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nuMD4YjZea63BzMozIGe4O7dAP0k+IE75QPJj2fdP7w=;
        b=hCk24fQFUtx068mdIjW7wOrrLu1nLf9MSWIYs8X4t15oT4jIm3ByyO3Ph9Dy0J+7NE
         XCxp+Fvawz2/kyDchkgcwk3q6tfQUX+3HRAaaVxNwvbN7Ukewi40m42UTg7dxfQBz/G/
         4gHYF1fOSUGzaNdNh15QWcYoWCE2WkhdbPCeXYT9QgWfYhNBhqlWqQ3MVY1r9ws++GcX
         Cj2xgQdcty3epazxKpXCmjyud9O253XVDzoiQpLLo1KYWUWmS5qRn9QC/fVdr+cty5tN
         LizfdsbRIuz5W9/xJGZK7yrzyJ7UBvCVASZJVgT1aNTj1G5cKg/ADyS/TCxzz/X8VfL7
         bPMQ==
X-Gm-Message-State: AOAM530vrVoKpIGcVg/KNxJLbKmnnrpaiozz4xvz/57r9uiY7BGmXKaq
	cJ4LL83pq/uEhDowy74L/XGkKQsE5wy3Ce6vCrk=
X-Google-Smtp-Source: ABdhPJxTvF2REaBy0IvtaLhAd9q36uqrpfKXGDdsOnZYPIg6oTyLFNyd64NI21TQyUTYZGRgf+c04b+JoPDj2j1Em+g=
X-Received: by 2002:a37:a751:: with SMTP id q78mr1292063qke.337.1602715639457;
 Wed, 14 Oct 2020 15:47:19 -0700 (PDT)
MIME-Version: 1.0
References: <20201014112620.2244199-1-ross.burton@arm.com> <CAJdd5GY4QD03+UWP_y-ALi4vE54cf8-DTAYxMNOGrG1BZ-cHUw@mail.gmail.com>
 <CAMKF1soMBC6dk0DvaG=HjUD+Y0h4uh5LMkiNOJptxRibt_e=jQ@mail.gmail.com> <02ab658d-eef9-de6c-b826-a2a2a77c8b2d@gmail.com>
In-Reply-To: <02ab658d-eef9-de6c-b826-a2a2a77c8b2d@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 14 Oct 2020 15:47:08 -0700
Message-ID: <CAMKF1sp4E9H1Qq=QkyE1WhyLMihGHwVXWELo4++=X5LB4Zq4oQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] waf: explicitly run waf under Python 3
To: Joshua Watt <jpewhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Ross Burton <ross@burtonini.com>
Content-Type: multipart/alternative; boundary="0000000000005dae4205b1a95014"

--0000000000005dae4205b1a95014
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 14, 2020 at 2:23 PM Joshua Watt <jpewhacker@gmail.com> wrote:

>
> On 10/14/20 4:01 PM, Khem Raj wrote:
> > On Wed, Oct 14, 2020 at 5:41 AM Joshua Watt <JPEWhacker@gmail.com>
> wrote:
> >>
> >>
> >> On Wed, Oct 14, 2020, 6:26 AM Ross Burton <ross@burtonini.com> wrote:
> >>> We don't assume Python 2 is on the host and don't expose an unversioned
> >>> python in HOSTTOOLS, but waf uses the unversion python binary.
> >>>
> >>> Typically this is solved by patching waf (see the glmark2 recipe) but
> >>> this can be solved centrally by invoking python3 directly.  All
> wscripts
> >>> that needed Python 2 would have been fixed by now.
> >>>
> >>> Signed-off-by: Ross Burton <ross.burton@arm.com>
> >>> ---
> >>>   meta/classes/waf.bbclass | 8 ++++----
> >>>   1 file changed, 4 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
> >>> index 309f625a40..df6d4d53e8 100644
> >>> --- a/meta/classes/waf.bbclass
> >>> +++ b/meta/classes/waf.bbclass
> >>> @@ -42,7 +42,7 @@ python waf_preconfigure() {
> >>>       subsrcdir = d.getVar('S')
> >>>       wafbin = os.path.join(subsrcdir, 'waf')
> >>>       try:
> >>> -        result = subprocess.check_output([wafbin, '--version'],
> cwd=subsrcdir, stderr=subprocess.STDOUT)
> >>> +        result = subprocess.check_output(['python3', wafbin,
> '--version'], cwd=subsrcdir, stderr=subprocess.STDOUT)
> >>
> >> This will break our internal usage... We still use waf 1 which runs
> under python 2 only :(, although we are working on transitioning
> > this is for master and we have already said goodbye to python2 in
> > oe-core. perhaps reverse patching waf in your app might be an option ?
>
> a.k.a. upgrading to waf 2 :)
>
> Can we deal with it by importing either `pythonnative` or
> `python3native` in the recipes along with waf.bbclass, e.g.
>
>      inherit waf pythonnative # waf 1
>
> or
>
>      inherit waf python3native # waf 2
>
> Then you get the interpreter than matches the waf in your repo.



This is going to be a large set of recipes I would imagine and perhaps not
worth it for supporting old version of waf which is not used in any
packages on open layers it will aggravate serialization of waf recipes due
to python native dependency on the other hand there are recipes in meta-Oe
which need this change where patches are pending



>
> I do appreciate that oe-core has dumped python 2 support (and we should
> have *ages* ago also)... but I also don't really want a fire drill when
> most of our applications no longer build on 3.2, especially we can just
> inherit python3native as shown.
>
> >
> >>>           version = result.decode('utf-8').split()[1]
> >>>           if StrictVersion(version) >= StrictVersion("1.8.7"):
> >>>               d.setVar("WAF_EXTRA_CONF", "--bindir=${bindir}
> --libdir=${libdir}")
> >>> @@ -55,16 +55,16 @@ python waf_preconfigure() {
> >>>   do_configure[prefuncs] += "waf_preconfigure"
> >>>
> >>>   waf_do_configure() {
> >>> -       (cd ${S} && ./waf configure -o ${B} --prefix=${prefix}
> ${WAF_EXTRA_CONF} ${EXTRA_OECONF})
> >>> +       (cd ${S} && python3 ./waf configure -o ${B} --prefix=${prefix}
> ${WAF_EXTRA_CONF} ${EXTRA_OECONF})
> >>>   }
> >>>
> >>>   do_compile[progress] = "outof:^\[\s*(\d+)/\s*(\d+)\]\s+"
> >>>   waf_do_compile()  {
> >>> -       (cd ${S} && ./waf build ${@oe.utils.parallel_make_argument(d,
> '-j%d', limit=64)} ${EXTRA_OEWAF_BUILD})
> >>> +       (cd ${S} && python3 ./waf build
> ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)}
> ${EXTRA_OEWAF_BUILD})
> >>>   }
> >>>
> >>>   waf_do_install() {
> >>> -       (cd ${S} && ./waf install --destdir=${D}
> ${EXTRA_OEWAF_INSTALL})
> >>> +       (cd ${S} && python3 ./waf install --destdir=${D}
> ${EXTRA_OEWAF_INSTALL})
> >>>   }
> >>>
> >>>   EXPORT_FUNCTIONS do_configure do_compile do_install
> >>> --
> >>> 2.25.1
> >>>
> >>>
> >>>
> >>>
> >> 
> >>
>

--0000000000005dae4205b1a95014
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Oct 14, 2020 at 2:23 PM Joshua Watt &lt;<a href=3D=
"mailto:jpewhacker@gmail.com">jpewhacker@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><br>
On 10/14/20 4:01 PM, Khem Raj wrote:<br>
&gt; On Wed, Oct 14, 2020 at 5:41 AM Joshua Watt &lt;<a href=3D"mailto:JPE=
Whacker@gmail.com" target=3D"_blank">JPEWhacker@gmail.com</a>&gt; wrote:<br=
>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Wed, Oct 14, 2020, 6:26 AM Ross Burton &lt;<a href=3D"mailto:r=
oss@burtonini.com" target=3D"_blank">ross@burtonini.com</a>&gt; wrote:<br>
&gt;&gt;&gt; We don&#39;t assume Python 2 is on the host and don&#39;t exp=
ose an unversioned<br>
&gt;&gt;&gt; python in HOSTTOOLS, but waf uses the unversion python binary=
.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Typically this is solved by patching waf (see the glmark2 rec=
ipe) but<br>
&gt;&gt;&gt; this can be solved centrally by invoking python3 directly.=C2=
=
=A0 All wscripts<br>
&gt;&gt;&gt; that needed Python 2 would have been fixed by now.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@=
arm.com" target=3D"_blank">ross.burton@arm.com</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;=C2=A0 =C2=A0meta/classes/waf.bbclass | 8 ++++----<br>
&gt;&gt;&gt;=C2=A0 =C2=A01 file changed, 4 insertions(+), 4 deletions(-)<b=
r>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbcl=
ass<br>
&gt;&gt;&gt; index 309f625a40..df6d4d53e8 100644<br>
&gt;&gt;&gt; --- a/meta/classes/waf.bbclass<br>
&gt;&gt;&gt; +++ b/meta/classes/waf.bbclass<br>
&gt;&gt;&gt; @@ -42,7 +42,7 @@ python waf_preconfigure() {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0subsrcdir =3D d.getVar(&#39;S&#39;)=
<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0wafbin =3D os.path.join(subsrcdir, =
&#39;waf&#39;)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D subprocess.check_outp=
ut([wafbin, &#39;--version&#39;], cwd=3Dsubsrcdir, stderr=3Dsubprocess.STDO=
UT)<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D subprocess.check_outp=
ut([&#39;python3&#39;, wafbin, &#39;--version&#39;], cwd=3Dsubsrcdir, stder=
r=3Dsubprocess.STDOUT)<br>
&gt;&gt;<br>
&gt;&gt; This will break our internal usage... We still use waf 1 which ru=
ns under python 2 only :(, although we are working on transitioning<br>
&gt; this is for master and we have already said goodbye to python2 in<br>
&gt; oe-core. perhaps reverse patching waf in your app might be an option =
?<br>
<br>
a.k.a. upgrading to waf 2 :)<br>
<br>
Can we deal with it by importing either `pythonnative` or <br>
`python3native` in the recipes along with waf.bbclass, e.g.<br>
<br>
=C2=A0=C2=A0=C2=A0=C2=A0 inherit waf pythonnative # waf 1<br>
<br>
or<br>
<br>
=C2=A0=C2=A0=C2=A0=C2=A0 inherit waf python3native # waf 2<br>
<br>
Then you get the interpreter than matches the waf in your repo.</blockquot=
e><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>This is going to be a large set of recipes I would imagine and perhaps not=
 worth it for supporting old version of waf which is not used in any packag=
es on open layers it will aggravate serialization of waf recipes due to pyt=
hon native dependency on the other hand there are recipes in meta-Oe which =
need this change where patches are pending</div><div dir=3D"auto"><br></div=
><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><b=
r>
<br>
I do appreciate that oe-core has dumped python 2 support (and we should <b=
r>
have *ages* ago also)... but I also don&#39;t really want a fire drill whe=
n <br>
most of our applications no longer build on 3.2, especially we can just <b=
r>
inherit python3native as shown.<br>
<br>
&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0version =3D result.de=
code(&#39;utf-8&#39;).split()[1]<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if StrictVersion(vers=
ion) &gt;=3D StrictVersion(&quot;1.8.7&quot;):<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVa=
r(&quot;WAF_EXTRA_CONF&quot;, &quot;--bindir=3D${bindir} --libdir=3D${libdi=
r}&quot;)<br>
&gt;&gt;&gt; @@ -55,16 +55,16 @@ python waf_preconfigure() {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0do_configure[prefuncs] +=3D &quot;waf_preconfigur=
e&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0waf_do_configure() {<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0(cd ${S} &amp;&amp; ./waf configu=
re -o ${B} --prefix=3D${prefix} ${WAF_EXTRA_CONF} ${EXTRA_OECONF})<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0(cd ${S} &amp;&amp; python3 ./waf=
 configure -o ${B} --prefix=3D${prefix} ${WAF_EXTRA_CONF} ${EXTRA_OECONF})<=
br>
&gt;&gt;&gt;=C2=A0 =C2=A0}<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0do_compile[progress] =3D &quot;outof:^\[\s*(\d+)/=
\s*(\d+)\]\s+&quot;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0waf_do_compile()=C2=A0 {<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0(cd ${S} &amp;&amp; ./waf build $=
{@oe.utils.parallel_make_argument(d, &#39;-j%d&#39;, limit=3D64)} ${EXTRA_O=
EWAF_BUILD})<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0(cd ${S} &amp;&amp; python3 ./waf=
 build ${@oe.utils.parallel_make_argument(d, &#39;-j%d&#39;, limit=3D64)} $=
{EXTRA_OEWAF_BUILD})<br>
&gt;&gt;&gt;=C2=A0 =C2=A0}<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0waf_do_install() {<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0(cd ${S} &amp;&amp; ./waf install=
 --destdir=3D${D} ${EXTRA_OEWAF_INSTALL})<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0(cd ${S} &amp;&amp; python3 ./waf=
 install --destdir=3D${D} ${EXTRA_OEWAF_INSTALL})<br>
&gt;&gt;&gt;=C2=A0 =C2=A0}<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0EXPORT_FUNCTIONS do_configure do_compile do_insta=
ll<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; 2.25.1<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt; <br>
&gt;&gt;<br>
</blockquote></div></div>

--0000000000005dae4205b1a95014--
