Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id DABF8784B9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 14:50:54 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id m88so82056764iod.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 07:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=f9YcTGnuIOBKJtLhXgeDXwYu0ak8gNDVChvJZ0bbuLs=;
	b=ljd3stpX5vpP9E8fiuwE1rO9O4FDCJhlt3yo/y0/90yepV0oDY5L2d5pOf6fadFLN0
	sUyMIh9aQ2vv2foN33arq8z22IDT3GG0XiM5D6IVznFG9bmm099f5LWp0I6pWiMNk0FM
	KpGxb1prrtyWQiUJ1iPsjE1e51jV0D+aNqKitkeUsFYsI2x+a5KWm09u1d+UUL2R5clA
	08ifAKwWmbJ0DbgOwfRg3fU3Xc/IZqn9Yw5VCnYFITugSO9ibTBvF2cpf8z+q0U62Wyn
	NJN462WW1MDoC/yxzfhdPR2NressGz3ODqFbdXuYFnXNcq9OpCQvYo1+eadiTHUeVTVG
	/f6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=f9YcTGnuIOBKJtLhXgeDXwYu0ak8gNDVChvJZ0bbuLs=;
	b=DEDpIyMyrMpSo1YEEdYUs2eqWkWO5FRJm18vAqEGH1R/LZYSMaXKjiGzDsAnYcJHdh
	ZLtvym+3DPsGy0ed63k5gh/DfuqBZivRxNVtZsEUxKYoyORt1Z9o+cHWgzPIXcl/TRpg
	h2iBv2kXEYe3vI6HhdUgvrOmFoY4A0O0EEm43ol+iqK8mGTrRuEN8oKdh+c9dyx6gQjH
	yER+CIBMuhdy5SIBiAhuOkLmatOfNmcI+gRudQBV4L25peOuhGSweyCeFJw1v6KmFy1z
	Wdq9mYEW97tKwPlbbRPbDKlIoeQIkOdle7I+ytM96FYbhM/a1lAYS0bMjkuJZTy5JBL3
	a3Ig==
X-Gm-Message-State: AIVw113qvK2htRDQ0QgYCPLvs5bgjdP8mOzFFQofFio5gVSvvv7KF7Wi
	ypjrJnQwhtSI+YDM60TkHP3Vdge250Q4fk8=
X-Received: by 10.107.205.72 with SMTP id d69mr9635227iog.224.1501253455780;
	Fri, 28 Jul 2017 07:50:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Fri, 28 Jul 2017 07:50:35 -0700 (PDT)
In-Reply-To: <CAMKF1so7BKN37KMUBDcDw9zHqZmO6YJuFpM8igAHo40QG_CkkQ@mail.gmail.com>
References: <20170724142818.44403-1-alexander.kanavin@linux.intel.com>
	<20170724142818.44403-5-alexander.kanavin@linux.intel.com>
	<CAJTo0LbJvsviFJGW8k=Hgsr=kCgFhv7MX=wyjxYz2t23zkSQ1Q@mail.gmail.com>
	<CAMKF1so7BKN37KMUBDcDw9zHqZmO6YJuFpM8igAHo40QG_CkkQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 28 Jul 2017 15:50:35 +0100
Message-ID: <CAJTo0LbDLYh1vOOt6UqjbMpK86b5TuhcXRBqFz=EhzjEp0J1mA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/11] gperf: upgrade to 3.1
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
X-List-Received-Date: Fri, 28 Jul 2017 14:50:55 -0000
Content-Type: multipart/alternative; boundary="94eb2c189baef342c7055561ce66"

--94eb2c189baef342c7055561ce66
Content-Type: text/plain; charset="UTF-8"

And libid3tag:

| compat.gperf:116:1: error: conflicting types for 'id3_compat_lookup'
| In file included from compat.gperf:37:0:
| ../libid3tag-0.15.1b/compat.h:36:26: note: previous declaration of
'id3_compat_lookup' was here
|  struct id3_compat const *id3_compat_lookup(register char const *,
|                           ^~~~~~~~~~~~~~~~~

http://git.savannah.gnu.org/cgit/gperf.git/commit/?id=d519d1a821511eaa22eae6d9019a548aea21e6d3
is the upstream commit that breaks everything, because the API of the
generated files has changed.

Ross

On 25 July 2017 at 14:53, Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Jul 25, 2017 at 6:12 AM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > This breaks the libcap build:
> >
> > | In file included from <command-line>:0:0:
> > | ./_caps_output.gperf:71:80: error: unknown type name 'size_t'
>
> include <stddef.h> might help
>
> > |  gperf_case_strncmp (register const char *s1, register const char *s2,
> > register size_t n)
> > |
> > ^~~~~~
> > | ./_caps_output.gperf:96:53: error: unknown type name 'size_t'
> > |  __cap_hash_name (register const char *str, register size_t len)
> > |                                                      ^~~~~~
>
> gcc is putting a caret pointer in wrong place hmm may be a cut and paste
> error
>
> > | ./_caps_output.gperf:200:55: error: unknown type name 'size_t'
> > |  __cap_lookup_name (register const char *str, register size_t len)
> > |                                                        ^~~~~~
> > | ./_caps_output.gperf:200:1: error: conflicting types for
> > '__cap_lookup_name'
> > |  __cap_lookup_name (register const char *str, register size_t len)
> > |  ^~~~~~~~~~~~~~~~~
> > | ./_caps_output.gperf:33:29: note: previous declaration of
> > '__cap_lookup_name' was here
> > |  const struct __cap_token_s *__cap_lookup_name(const char *, unsigned
> > int);
> > |                              ^~~~~~~~~~~~~~~~~
> > | cap_text.c: In function 'cap_to_name':
> > | cap_text.c:291:2: warning: ignoring return value of 'asprintf',
> declared
> > with attribute warn_unused_result [-Wunused-result]
> > |   asprintf(&tmp, "%u", cap);
> > |   ^~~~~~~~~~~~~~~~~~~~~~~~~
> > | Makefile:63: recipe for target 'cap_text.o' failed
> >
> > Ross
> >
> > On 24 July 2017 at 15:28, Alexander Kanavin
> > <alexander.kanavin@linux.intel.com> wrote:
> >>
> >> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> >> ---
> >>  meta/recipes-extended/gperf/gperf_3.0.4.bb | 5 -----
> >>  meta/recipes-extended/gperf/gperf_3.1.bb   | 5 +++++
> >>  2 files changed, 5 insertions(+), 5 deletions(-)
> >>  delete mode 100644 meta/recipes-extended/gperf/gperf_3.0.4.bb
> >>  create mode 100644 meta/recipes-extended/gperf/gperf_3.1.bb
> >>
> >> diff --git a/meta/recipes-extended/gperf/gperf_3.0.4.bb
> >> b/meta/recipes-extended/gperf/gperf_3.0.4.bb
> >> deleted file mode 100644
> >> index 64003fc0bb7..00000000000
> >> --- a/meta/recipes-extended/gperf/gperf_3.0.4.bb
> >> +++ /dev/null
> >> @@ -1,5 +0,0 @@
> >> -require gperf.inc
> >> -
> >> -
> >> -SRC_URI[md5sum] = "c1f1db32fb6598d6a93e6e88796a8632"
> >> -SRC_URI[sha256sum] =
> >> "767112a204407e62dbc3106647cf839ed544f3cf5d0f0523aaa2508623aad63e"
> >> diff --git a/meta/recipes-extended/gperf/gperf_3.1.bb
> >> b/meta/recipes-extended/gperf/gperf_3.1.bb
> >> new file mode 100644
> >> index 00000000000..942820b91d5
> >> --- /dev/null
> >> +++ b/meta/recipes-extended/gperf/gperf_3.1.bb
> >> @@ -0,0 +1,5 @@
> >> +require gperf.inc
> >> +
> >> +
> >> +SRC_URI[md5sum] = "9e251c0a618ad0824b51117d5d9db87e"
> >> +SRC_URI[sha256sum] =
> >> "588546b945bba4b70b6a3a616e80b4ab466e3f33024a352fc2198112cdbb3ae2"
> >> --
> >> 2.13.2
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
>

--94eb2c189baef342c7055561ce66
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">And libid3tag:<div><br></div><div><pre style=3D"font-famil=
y:&#39;Courier New&#39;,courier,monotype,monospace;color:rgb(0,0,0)"><span =
class=3D"gmail-stdout">| compat.gperf:116:1: error: conflicting types for &=
#39;id3_compat_lookup&#39;
| In file included from compat.gperf:37:0:
| ../libid3tag-0.15.1b/compat.h:36:26: note: previous declaration of &#39;i=
d3_compat_lookup&#39; was here
|  struct id3_compat const *id3_compat_lookup(register char const *,
|                           ^~~~~~~~~~~~~~~~~
</span></pre></div><div><span class=3D"gmail-stdout"><a href=3D"http://git.=
savannah.gnu.org/cgit/gperf.git/commit/?id=3Dd519d1a821511eaa22eae6d9019a54=
8aea21e6d3">http://git.savannah.gnu.org/cgit/gperf.git/commit/?id=3Dd519d1a=
821511eaa22eae6d9019a548aea21e6d3</a> is the upstream commit that breaks ev=
erything, because the API of the generated files has changed.</span></div><=
div><span class=3D"gmail-stdout"><br></span></div><div><span class=3D"gmail=
-stdout">Ross</span></div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On 25 July 2017 at 14:53, Khem Raj <span dir=3D"ltr">&lt;<=
a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On =
Tue, Jul 25, 2017 at 6:12 AM, Burton, Ross &lt;<a href=3D"mailto:ross.burto=
n@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt; This breaks the libcap build:<br>
&gt;<br>
&gt; | In file included from &lt;command-line&gt;:0:0:<br>
&gt; | ./_caps_output.gperf:71:80: error: unknown type name &#39;size_t&#39=
;<br>
<br>
</span>include &lt;stddef.h&gt; might help<br>
<span class=3D""><br>
&gt; |=C2=A0 gperf_case_strncmp (register const char *s1, register const ch=
ar *s2,<br>
&gt; register size_t n)<br>
&gt; |<br>
&gt; ^~~~~~<br>
&gt; | ./_caps_output.gperf:96:53: error: unknown type name &#39;size_t&#39=
;<br>
&gt; |=C2=A0 __cap_hash_name (register const char *str, register size_t len=
)<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~<br>
<br>
</span>gcc is putting a caret pointer in wrong place hmm may be a cut and p=
aste error<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; | ./_caps_output.gperf:200:55: error: unknown type name &#39;size_t&#3=
9;<br>
&gt; |=C2=A0 __cap_lookup_name (register const char *str, register size_t l=
en)<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~<br>
&gt; | ./_caps_output.gperf:200:1: error: conflicting types for<br>
&gt; &#39;__cap_lookup_name&#39;<br>
&gt; |=C2=A0 __cap_lookup_name (register const char *str, register size_t l=
en)<br>
&gt; |=C2=A0 ^~~~~~~~~~~~~~~~~<br>
&gt; | ./_caps_output.gperf:33:29: note: previous declaration of<br>
&gt; &#39;__cap_lookup_name&#39; was here<br>
&gt; |=C2=A0 const struct __cap_token_s *__cap_lookup_name(const char *, un=
signed<br>
&gt; int);<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~<br>
&gt; | cap_text.c: In function &#39;cap_to_name&#39;:<br>
&gt; | cap_text.c:291:2: warning: ignoring return value of &#39;asprintf&#3=
9;, declared<br>
&gt; with attribute warn_unused_result [-Wunused-result]<br>
&gt; |=C2=A0 =C2=A0asprintf(&amp;tmp, &quot;%u&quot;, cap);<br>
&gt; |=C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~~~~~<br>
&gt; | Makefile:63: recipe for target &#39;cap_text.o&#39; failed<br>
&gt;<br>
&gt; Ross<br>
&gt;<br>
&gt; On 24 July 2017 at 15:28, Alexander Kanavin<br>
&gt; &lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com">alexander.kan=
avin@linux.<wbr>intel.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alexander.k=
anavin@linux.intel.com">alexander.kanavin@linux.<wbr>intel.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/recipes-extended/gperf/<a href=3D"http://gperf_3.0.4.bb=
" rel=3D"noreferrer" target=3D"_blank">gp<wbr>erf_3.0.4.bb</a> | 5 -----<br=
>
&gt;&gt;=C2=A0 meta/recipes-extended/gperf/<a href=3D"http://gperf_3.1.bb" =
rel=3D"noreferrer" target=3D"_blank">gp<wbr>erf_3.1.bb</a>=C2=A0 =C2=A0| 5 =
+++++<br>
&gt;&gt;=C2=A0 2 files changed, 5 insertions(+), 5 deletions(-)<br>
&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-extended/gperf/<a href=3D"ht=
tp://gperf_3.0.4.bb" rel=3D"noreferrer" target=3D"_blank">gp<wbr>erf_3.0.4.=
bb</a><br>
&gt;&gt;=C2=A0 create mode 100644 meta/recipes-extended/gperf/<a href=3D"ht=
tp://gperf_3.1.bb" rel=3D"noreferrer" target=3D"_blank">gp<wbr>erf_3.1.bb</=
a><br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-extended/gperf/<a href=3D"http://gperf_3=
.0.4.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>gperf_3.0.4.bb</a><br>
&gt;&gt; b/meta/recipes-extended/gperf/<a href=3D"http://gperf_3.0.4.bb" re=
l=3D"noreferrer" target=3D"_blank"><wbr>gperf_3.0.4.bb</a><br>
&gt;&gt; deleted file mode 100644<br>
&gt;&gt; index 64003fc0bb7..00000000000<br>
&gt;&gt; --- a/meta/recipes-extended/gperf/<a href=3D"http://gperf_3.0.4.bb=
" rel=3D"noreferrer" target=3D"_blank"><wbr>gperf_3.0.4.bb</a><br>
&gt;&gt; +++ /dev/null<br>
&gt;&gt; @@ -1,5 +0,0 @@<br>
&gt;&gt; -require gperf.inc<br>
&gt;&gt; -<br>
&gt;&gt; -<br>
&gt;&gt; -SRC_URI[md5sum] =3D &quot;<wbr>c1f1db32fb6598d6a93e6e88796a86<wbr=
>32&quot;<br>
&gt;&gt; -SRC_URI[sha256sum] =3D<br>
&gt;&gt; &quot;<wbr>767112a204407e62dbc3106647cf83<wbr>9ed544f3cf5d0f0523aa=
a2508623aa<wbr>d63e&quot;<br>
&gt;&gt; diff --git a/meta/recipes-extended/gperf/<a href=3D"http://gperf_3=
.1.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>gperf_3.1.bb</a><br>
&gt;&gt; b/meta/recipes-extended/gperf/<a href=3D"http://gperf_3.1.bb" rel=
=3D"noreferrer" target=3D"_blank"><wbr>gperf_3.1.bb</a><br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 00000000000..942820b91d5<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-extended/gperf/<a href=3D"http://gperf_3.1.bb" =
rel=3D"noreferrer" target=3D"_blank"><wbr>gperf_3.1.bb</a><br>
&gt;&gt; @@ -0,0 +1,5 @@<br>
&gt;&gt; +require gperf.inc<br>
&gt;&gt; +<br>
&gt;&gt; +<br>
&gt;&gt; +SRC_URI[md5sum] =3D &quot;<wbr>9e251c0a618ad0824b51117d5d9db8<wbr=
>7e&quot;<br>
&gt;&gt; +SRC_URI[sha256sum] =3D<br>
&gt;&gt; &quot;<wbr>588546b945bba4b70b6a3a616e80b4<wbr>ab466e3f33024a352fc2=
198112cdbb<wbr>3ae2&quot;<br>
&gt;&gt; --<br>
&gt;&gt; 2.13.2<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; ______________________________<wbr>_________________<br>
&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openem=
bedded-core@lists.<wbr>openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.o=
rg/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<=
wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;<br>
</div></div></blockquote></div><br></div>

--94eb2c189baef342c7055561ce66--
