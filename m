Return-Path: <sstncr@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 79DB460750
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 17:01:52 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id w1so9485777qka.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 09:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=2tYlnGAFUnlAqEwYgnYYY+FsiRDHzYHgPZUx25yyLIQ=;
	b=A14ymfQCtQpkJnchRFTeps4gEnx1UOoRKYmhK9Wsp9xN9GLamwsifUkLffooLWU2gt
	uxrwKdqI+H0G6pLLpDinQ3Ro8Rv9wclYz6lTSxfcnFMIuoSb+y9kY0kOTIPachOraZd5
	yjDX/wwcQYH4FNQ+ptCgKQMd6QG5qCD+2F25wRZihPLHUGn7jL5TaxcV11IydetZMjHF
	nG8fNWXNbPQ3HI+fAVFBTlK2xSihH1c4dQ2rBIrnkVAEuUlQlLLOWGBwlzUKXT0lP8Xi
	847R6X7Q9ClK5G0lEux7cJgbkCIxbjJ6DcFDOk9yKEyNqicvsT4hYCFDfqFp5h6QPuNz
	76Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=2tYlnGAFUnlAqEwYgnYYY+FsiRDHzYHgPZUx25yyLIQ=;
	b=NTICsDjGDEjzZfr2hRar0di7QvrNshlxKc7+TN2VBdvqkj5hYFoyc4Tazl+oBZjw12
	Vy3CRfiSjleUG4eqoIqW+R2sJFFb9rcdaxd+cso3miZyIHhKXHs8Hvp/pCCZjbn41JK3
	NDSckWX5vKqKny5+wpDGYffiuX8GYL/cdqIOqoxyHkIpEXLjCzDyqwMWPmz/Dlf7YzNn
	MGxFF99hoXtrSx85eeLpHhLDGP73YzZK1ArnymLvsdvxaQ+1FADRaX8VdtnaQ20T/7Ct
	0q00TH9UIwAzL/jWwH3i+Kk8zo+SNgYQF+yxsdUEjZRs9EeO4CBKuh8KLBk0aFLN2ZCI
	cslQ==
X-Gm-Message-State: AKwxytcyBXmJS73i5bX8V29majd7BP5oG2qLIPuygsmMzgojsjcy2O1g
	B0NlxYP2iHuWXjpK3O02yfLREK9ulJ4PlnqVXWK0nYKh
X-Google-Smtp-Source: ACJfBosnZ/Vz2KNKUYabBmfpK8Ma2asvxsbPPqKJt0mQBb84ZNomkOt7FiKDzyc1JJoy72ZyLxo6U0TMzlGnF47U2r0=
X-Received: by 10.55.112.199 with SMTP id l190mr37065382qkc.342.1515776513249; 
	Fri, 12 Jan 2018 09:01:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.200.34.97 with HTTP; Fri, 12 Jan 2018 09:01:52 -0800 (PST)
In-Reply-To: <1515774102.30068.56.camel@gmail.com>
References: <1515686841-28097-1-git-send-email-sstncr@gmail.com>
	<1515774102.30068.56.camel@gmail.com>
From: Stefan Stanacar <sstncr@gmail.com>
Date: Fri, 12 Jan 2018 19:01:52 +0200
Message-ID: <CANr+NRtTuxXVViJBDXWKh7rEs7mG+4TMf6ESnkabmnZ4E_2X+A@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [morty][PATCH] kernelsrc/perf: fix dependency on non existant task when using externalsrc
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
X-List-Received-Date: Fri, 12 Jan 2018 17:01:52 -0000
Content-Type: multipart/alternative; boundary="001a114fe86ea19da60562973837"

--001a114fe86ea19da60562973837
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 12, 2018 at 6:21 PM, Joshua Watt <jpewhacker@gmail.com> wrote:

> On Thu, 2018-01-11 at 16:07 +0000, Stefan Stanacar wrote:
> > When externalsrc is enabled for kernel, do_patch doesn't exist since
> > is in
> > SRCTREECOVEREDTASKS, so make these depend on a real task.
> >
> > Fixes:
> >     ERROR: Task do_unpack in /data/yocto/poky/meta/recipes-
> > kernel/perf/perf.bb
> >     depends upon non-existent task do_patch in
> > /data/yocto/poky/meta/recipes-kernel/linux/linux-yocto_4.8.bb
> >
> > Signed-off-by: Stefan Stanacar <sstncr@gmail.com>
> > ---
> >  meta/classes/kernelsrc.bbclass   | 2 +-
> >  meta/recipes-kernel/perf/perf.bb | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/classes/kernelsrc.bbclass
> > b/meta/classes/kernelsrc.bbclass
> > index 9efd46a..ce6c999 100644
> > --- a/meta/classes/kernelsrc.bbclass
> > +++ b/meta/classes/kernelsrc.bbclass
> > @@ -1,6 +1,6 @@
> >  S = "${STAGING_KERNEL_DIR}"
> >  do_fetch[noexec] = "1"
> > -do_unpack[depends] += "virtual/kernel:do_patch"
> > +do_unpack[depends] += "virtual/kernel:do_configure"
>
> I was looking at fixing this as well, but I had another approach.
> Instead of perpetually changing these to handle externalsrc corner
> cases, perhaps externalsrc.bbclass should not delete the tasks, but
> instead mark them as noexec as follows (I'll push this up for real if
> in a moment...). Then recipes should be able to work transparently
> regardless of externalsrc being used or not.
>
>

+1
Yup, I like this, it's a better fix. I've sent another patch for
kernel.bbclass (both for master and morty) which I think is still needed
even with your patch.

Cheers,
Stefan



> diff --git a/meta/classes/externalsrc.bbclass
> b/meta/classes/externalsrc.bbclass
> index 65dd13ddc1f..12046d74e17 100644
> --- a/meta/classes/externalsrc.bbclass
> +++ b/meta/classes/externalsrc.bbclass
> @@ -102,7 +102,7 @@ python () {
>          for task in d.getVar("SRCTREECOVEREDTASKS").split():
>              if local_srcuri and task in fetch_tasks:
>                  continue
> -            bb.build.deltask(task, d)
> +            d.setVarFlag(task, 'noexec', '1')
>
>          d.prependVarFlag('do_compile', 'prefunc
> s', "externalsrc_compile_prefunc ")
>          d.prependVarFlag('do_configure', 'prefuncs',
> "externalsrc_configure_prefunc ")
>
>
> >  do_unpack[noexec] = "1"
> >  do_patch[noexec] = "1"
> >  do_package[depends] += "virtual/kernel:do_populate_sysroot"
> > diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-
> > kernel/perf/perf.bb
> > index 03ae446..145774b 100644
> > --- a/meta/recipes-kernel/perf/perf.bb
> > +++ b/meta/recipes-kernel/perf/perf.bb
> > @@ -47,7 +47,7 @@ export PYTHON_SITEPACKAGES_DIR
> >  #kernel 3.1+ supports WERROR to disable warnings as errors
> >  export WERROR = "0"
> >
> > -do_populate_lic[depends] += "virtual/kernel:do_patch"
> > +do_populate_lic[depends] += "virtual/kernel:do_configure"
> >
> >  # needed for building the tools/perf Perl binding
> >  inherit perlnative cpan-base
> > --
> > 2.7.4
> >
>

--001a114fe86ea19da60562973837
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Jan 12, 2018 at 6:21 PM, Joshua Watt <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:jpewhacker@gmail.com" target=3D"_blank">jpewhacker@gmail.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<span class=3D"gmail-">On Thu, 2018-01-11 at 16:07 +0000, Stefan Stanacar w=
rote:<br>
&gt; When externalsrc is enabled for kernel, do_patch doesn&#39;t exist sin=
ce<br>
&gt; is in<br>
&gt; SRCTREECOVEREDTASKS, so make these depend on a real task.<br>
&gt;<br>
&gt; Fixes:<br>
&gt;=C2=A0 =C2=A0 =C2=A0ERROR: Task do_unpack in /data/yocto/poky/meta/reci=
pes-<br>
&gt; kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer" target=3D"_b=
lank">perf.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0depends upon non-existent task do_patch in<br>
&gt; /data/yocto/poky/meta/recipes-<wbr>kernel/linux/<a href=3D"http://linu=
x-yocto_4.8.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_4.8.<wbr>b=
b</a><br>
&gt;<br>
&gt; Signed-off-by: Stefan Stanacar &lt;<a href=3D"mailto:sstncr@gmail.com"=
>sstncr@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/kernelsrc.bbclass=C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noref=
errer" target=3D"_blank">perf.<wbr>bb</a> | 2 +-<br>
&gt;=C2=A0 2 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes/kernelsrc.<wbr>bbclass<br>
&gt; b/meta/classes/kernelsrc.<wbr>bbclass<br>
&gt; index 9efd46a..ce6c999 100644<br>
&gt; --- a/meta/classes/kernelsrc.<wbr>bbclass<br>
&gt; +++ b/meta/classes/kernelsrc.<wbr>bbclass<br>
&gt; @@ -1,6 +1,6 @@<br>
&gt;=C2=A0 S =3D &quot;${STAGING_KERNEL_DIR}&quot;<br>
&gt;=C2=A0 do_fetch[noexec] =3D &quot;1&quot;<br>
&gt; -do_unpack[depends] +=3D &quot;virtual/kernel:do_patch&quot;<br>
&gt; +do_unpack[depends] +=3D &quot;virtual/kernel:do_configure&quot;<br>
<br>
</span>I was looking at fixing this as well, but I had another approach.<br=
>
Instead of perpetually changing these to handle externalsrc corner<br>
cases, perhaps externalsrc.bbclass should not delete the tasks, but<br>
instead mark them as noexec as follows (I&#39;ll push this up for real if<b=
r>
in a moment...). Then recipes should be able to work transparently<br>
regardless of externalsrc being used or not.<br>
<br></blockquote><div><br></div><div><div><br></div><div>+1<br></div><div>Y=
up, I like this, it&#39;s a better fix. I&#39;ve sent=20
another patch for kernel.bbclass (both for master and morty) which I=20
think is still needed even with your patch.<br></div><div><br></div><div>Ch=
eers,</div>Stefan</div><div><br></div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
diff --git a/meta/classes/externalsrc.<wbr>bbclass<br>
b/meta/classes/externalsrc.<wbr>bbclass<br>
index 65dd13ddc1f..12046d74e17 100644<br>
--- a/meta/classes/externalsrc.<wbr>bbclass<br>
+++ b/meta/classes/externalsrc.<wbr>bbclass<br>
@@ -102,7 +102,7 @@ python () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for task in d.getVar(&quot;SRCTREECOVERED=
TASKS&quot;<wbr>).split():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if local_srcuri and task in=
 fetch_tasks:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.deltask(task, d)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVarFlag(task, &#39;noexec&#=
39;, &#39;1&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.prependVarFlag(&#39;do_compile&#39;, &#=
39;prefunc<br>
s&#39;, &quot;externalsrc_compile_prefunc &quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.prependVarFlag(&#39;do_<wbr>configure&#=
39;, &#39;prefuncs&#39;,<br>
&quot;externalsrc_configure_prefunc &quot;)<br>
<div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5"><br>
<br>
&gt;=C2=A0 do_unpack[noexec] =3D &quot;1&quot;<br>
&gt;=C2=A0 do_patch[noexec] =3D &quot;1&quot;<br>
&gt;=C2=A0 do_package[depends] +=3D &quot;virtual/kernel:do_populate_<wbr>s=
ysroot&quot;<br>
&gt; diff --git a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=
=3D"noreferrer" target=3D"_blank">per<wbr>f.bb</a> b/meta/recipes-<br>
&gt; kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer" target=3D"_b=
lank">perf.bb</a><br>
&gt; index 03ae446..145774b 100644<br>
&gt; --- a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noref=
errer" target=3D"_blank">per<wbr>f.bb</a><br>
&gt; +++ b/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noref=
errer" target=3D"_blank">per<wbr>f.bb</a><br>
&gt; @@ -47,7 +47,7 @@ export PYTHON_SITEPACKAGES_DIR<br>
&gt;=C2=A0 #kernel 3.1+ supports WERROR to disable warnings as errors<br>
&gt;=C2=A0 export WERROR =3D &quot;0&quot;<br>
&gt;<br>
&gt; -do_populate_lic[depends] +=3D &quot;virtual/kernel:do_patch&quot;<br>
&gt; +do_populate_lic[depends] +=3D &quot;virtual/kernel:do_configure&quot;=
<br>
&gt;<br>
&gt;=C2=A0 # needed for building the tools/perf Perl binding<br>
&gt;=C2=A0 inherit perlnative cpan-base<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
</div></div></blockquote></div><br></div></div>

--001a114fe86ea19da60562973837--
