Return-Path: <jpuhlman@mvista.com>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5AECE60657
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Oct 2015 22:17:53 +0000 (UTC)
Received: by lfaz124 with SMTP id z124so114912753lfa.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Oct 2015 15:17:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=66JYOqJdnfCNimTreohwknUnnLop3O7/EI49/MSdKg8=;
	b=hNw7ibfWfJ+8B7Eb0C2oJrbWWyTu6I8tYdewtQi0W7MHfTQx8egvqmiW0IupE6htRB
	HF52vOTVyN19F73dSEe71+NP2bCGUadCkjr7K1ybG/VEtKRlpTvS56G8Ls03oLOkFPhn
	i3G9Y0I2SjzS3KUVE+5TbjIrWyRd0vI0zWm2P7FK2GDWPcG9/g2dkGOjHqOzeGZy3orY
	9xbjMmNB4BmW5Isw4T27RhjR6qFIK6jQxYFyHk6dYglvmoQNCUpDAsReSEN5Rg5BImeR
	yhn77cdoA8TD5VdTbfHeB3xLQlhA0RZSlrYnw+x0HDx0PzTb/It65vTCQZdkWrQKodQY
	6Xpg==
X-Gm-Message-State: ALoCoQmv+rTh0/njBQauMYnkH6Ekema1rJS9f/hsGTmwLM1vAUUllqMky50GbhUZojvrDijPM0RE
MIME-Version: 1.0
X-Received: by 10.112.17.105 with SMTP id n9mr14671392lbd.78.1445725072501;
	Sat, 24 Oct 2015 15:17:52 -0700 (PDT)
Received: by 10.112.5.162 with HTTP; Sat, 24 Oct 2015 15:17:52 -0700 (PDT)
Received: by 10.112.5.162 with HTTP; Sat, 24 Oct 2015 15:17:52 -0700 (PDT)
In-Reply-To: <A4A69420-4397-4ACA-9471-66126153BE89@gmail.com>
References: <1445620687-9578-1-git-send-email-jpuhlman@mvista.com>
	<A4A69420-4397-4ACA-9471-66126153BE89@gmail.com>
Date: Sat, 24 Oct 2015 15:17:52 -0700
Message-ID: <CADe5tdMyJ+u6t5AgYn0cWC7ew2-=Yy2TnM_0KVBBd5-_rnUYUA@mail.gmail.com>
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: Jens Rehsack <rehsack@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Perl: Use CC version not $Config(gccversion)
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
X-List-Received-Date: Sat, 24 Oct 2015 22:17:54 -0000
Content-Type: multipart/alternative; boundary=001a11c3bfee63e0d00522e11922

--001a11c3bfee63e0d00522e11922
Content-Type: text/plain; charset=UTF-8

On Oct 24, 2015 5:15 AM, "Jens Rehsack" <rehsack@gmail.com> wrote:
>
>
> > Am 23.10.2015 um 19:18 schrieb Jeremy Puhlman <jpuhlman@mvista.com>:
> >
> > Get version data from querying $CC rather then
> > $Config(gccversion) which comes from running version of
> > perl. Since perl-native is not likely compiled by gcc
> > 5 at this point, it will never trigger the required
> > fixes for gcc 5.
> >
> > [YOCTO #8367]
> >
> > Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
> > ---
> > .../perl/perl/perl-errno-generation-gcc5.patch     | 23
++++++++++++++++++++++
> > meta/recipes-devtools/perl/perl_5.22.0.bb          |  1 +
> > 2 files changed, 24 insertions(+)
> > create mode 100644
meta/recipes-devtools/perl/perl/perl-errno-generation-gcc5.patch
> >
> > diff --git
a/meta/recipes-devtools/perl/perl/perl-errno-generation-gcc5.patch
b/meta/recipes-devtools/perl/perl/perl-errno-generation-gcc5.patch
> > new file mode 100644
> > index 0000000..efbc55d
> > --- /dev/null
> > +++ b/meta/recipes-devtools/perl/perl/perl-errno-generation-gcc5.patch
> > @@ -0,0 +1,23 @@
> > +Upstream-Status:Inappropriate [embedded specific]
>
> Did you ask p5-porters?
>
> I strongly suggest to open an RT for 2 reasons:
>
> 1) Let the people know that I'm not the only one encountering problems
with the way they deal situation

Yeah we have been having fun cross compiling perl since 2000, lots of fun.

> 2) Those tickets enlighten over time.
>
> Cross-compiling is not restricted to embedded.
>
> The patch self looks more than sane and I'm happy to support it when
reported (so tell me the ticket number or put me on CC when creating the
ticket).

Is there a specific mailing list?
> > +The upstream code assumes that the compiler version used to compiler
miniperl/perl-native
> > +is the same as the one being used to build the perl binary. Since most
people are not running
> > +systems with gcc 5, it is unlikely that it will work on any supported
host. Switch out gccversion
> > +for the version extracted from $CC --version.
> > +
> > +--- perl-5.22.0/ext/Errno/Errno_pm.PL        2015-10-19
18:01:20.622143786 -0400
> > ++++ perl-5.22.0-fixed/ext/Errno/Errno_pm.PL  2015-10-19
17:50:35.662137367 -0400
> > +@@ -224,9 +224,12 @@
> > +
> > +     {       # BeOS (support now removed) did not enter this block
> > +     # invoke CPP and read the output
> > ++        my $compiler = $ENV{'CC'};
> > ++        my $compiler_out = `$compiler --version`;
> > ++        my @compiler_version = split / /,$compiler_out;
> > +
> > +     my $inhibit_linemarkers = '';
> > +-    if ($Config{gccversion} =~ /\A(\d+)\./ and $1 >= 5) {
> > ++    if (@compiler_version[2] =~ /\A(\d+)\./ and $1 >= 5) {
> > +         # GCC 5.0 interleaves expanded macros with line numbers
breaking
> > +         # each line into multiple lines. RT#123784
> > +         $inhibit_linemarkers = ' -P';
> > diff --git a/meta/recipes-devtools/perl/perl_5.22.0.bb
b/meta/recipes-devtools/perl/perl_5.22.0.bb
> > index 3ce7849..66e074d 100644
> > --- a/meta/recipes-devtools/perl/perl_5.22.0.bb
> > +++ b/meta/recipes-devtools/perl/perl_5.22.0.bb
> > @@ -62,6 +62,7 @@ SRC_URI += " \
> >         file://ext-ODBM_File-hints-linux.pl-link-libgdbm_compat.patch \
> >
 file://ext-ODBM_File-t-odbm.t-fix-the-path-of-dbmt_common.p.patch \
> >         file://perl-PathTools-don-t-filter-out-blib-from-INC.patch \
> > +        file://perl-errno-generation-gcc5.patch \
> > "
> >
> > # Fix test case issues
> > --
> > 2.6.2
>
> Cheers
> --
> Jens Rehsack - rehsack@gmail.com
>

--001a11c3bfee63e0d00522e11922
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Oct 24, 2015 5:15 AM, &quot;Jens Rehsack&quot; &lt;<a href=3D"mailto:reh=
sack@gmail.com">rehsack@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; &gt; Am 23.10.2015 um 19:18 schrieb Jeremy Puhlman &lt;<a href=3D"mail=
to:jpuhlman@mvista.com">jpuhlman@mvista.com</a>&gt;:<br>
&gt; &gt;<br>
&gt; &gt; Get version data from querying $CC rather then<br>
&gt; &gt; $Config(gccversion) which comes from running version of<br>
&gt; &gt; perl. Since perl-native is not likely compiled by gcc<br>
&gt; &gt; 5 at this point, it will never trigger the required<br>
&gt; &gt; fixes for gcc 5.<br>
&gt; &gt;<br>
&gt; &gt; [YOCTO #8367]<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Jeremy Puhlman &lt;<a href=3D"mailto:jpuhlman@mvis=
ta.com">jpuhlman@mvista.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; .../perl/perl/perl-errno-generation-gcc5.patch=C2=A0 =C2=A0 =C2=
=A0| 23 ++++++++++++++++++++++<br>
&gt; &gt; meta/recipes-devtools/perl/<a href=3D"http://perl_5.22.0.bb">perl=
_5.22.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; &gt; 2 files changed, 24 insertions(+)<br>
&gt; &gt; create mode 100644 meta/recipes-devtools/perl/perl/perl-errno-gen=
eration-gcc5.patch<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/perl/perl/perl-errno-generatio=
n-gcc5.patch b/meta/recipes-devtools/perl/perl/perl-errno-generation-gcc5.p=
atch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..efbc55d<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta/recipes-devtools/perl/perl/perl-errno-generation-gcc5.=
patch<br>
&gt; &gt; @@ -0,0 +1,23 @@<br>
&gt; &gt; +Upstream-Status:Inappropriate [embedded specific]<br>
&gt;<br>
&gt; Did you ask p5-porters?<br>
&gt;<br>
&gt; I strongly suggest to open an RT for 2 reasons:<br>
&gt;<br>
&gt; 1) Let the people know that I&#39;m not the only one encountering prob=
lems with the way they deal situation</p>
<p dir=3D"ltr">Yeah we have been having fun cross compiling perl since 2000=
, lots of fun. </p>
<p dir=3D"ltr">&gt; 2) Those tickets enlighten over time.<br>
&gt;<br>
&gt; Cross-compiling is not restricted to embedded.<br>
&gt;<br>
&gt; The patch self looks more than sane and I&#39;m happy to support it wh=
en reported (so tell me the ticket number or put me on CC when creating the=
 ticket).<br></p>
<p dir=3D"ltr">Is there a specific mailing list?<br>
&gt; &gt; +The upstream code assumes that the compiler version used to comp=
iler miniperl/perl-native<br>
&gt; &gt; +is the same as the one being used to build the perl binary. Sinc=
e most people are not running<br>
&gt; &gt; +systems with gcc 5, it is unlikely that it will work on any supp=
orted host. Switch out gccversion<br>
&gt; &gt; +for the version extracted from $CC --version.<br>
&gt; &gt; +<br>
&gt; &gt; +--- perl-5.22.0/ext/Errno/Errno_pm.PL=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 2015-10-19 18:01:20.622143786 -0400<br>
&gt; &gt; ++++ perl-5.22.0-fixed/ext/Errno/Errno_pm.PL=C2=A0 2015-10-19 17:=
50:35.662137367 -0400<br>
&gt; &gt; +@@ -224,9 +224,12 @@<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0{=C2=A0 =C2=A0 =C2=A0 =C2=A0# BeOS (support =
now removed) did not enter this block<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0# invoke CPP and read the output<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 my $compiler =3D $ENV{&#39;CC&#39;}=
;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 my $compiler_out =3D `$compiler --v=
ersion`;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 my @compiler_version =3D split / /,=
$compiler_out;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0my $inhibit_linemarkers =3D &#39;&#39;;<br>
&gt; &gt; +-=C2=A0 =C2=A0 if ($Config{gccversion} =3D~ /\A(\d+)\./ and $1 &=
gt;=3D 5) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (@compiler_version[2] =3D~ /\A(\d+)\./ and $1 =
&gt;=3D 5) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# GCC 5.0 interleaves expanded=
 macros with line numbers breaking<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# each line into multiple line=
s. RT#123784<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$inhibit_linemarkers =3D &#39;=
 -P&#39;;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/perl/<a href=3D"http://perl_5.=
22.0.bb">perl_5.22.0.bb</a> b/meta/recipes-devtools/perl/<a href=3D"http://=
perl_5.22.0.bb">perl_5.22.0.bb</a><br>
&gt; &gt; index 3ce7849..66e074d 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/perl/<a href=3D"http://perl_5.22.0.bb=
">perl_5.22.0.bb</a><br>
&gt; &gt; +++ b/meta/recipes-devtools/perl/<a href=3D"http://perl_5.22.0.bb=
">perl_5.22.0.bb</a><br>
&gt; &gt; @@ -62,6 +62,7 @@ SRC_URI +=3D &quot; \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ext-ODBM_File-hints-linux=
.pl-link-libgdbm_compat.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ext-ODBM_File-t-odbm.t-fi=
x-the-path-of-dbmt_common.p.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://perl-PathTools-don-t-filt=
er-out-blib-from-INC.patch \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://perl-errno-generation-gcc5.pa=
tch \<br>
&gt; &gt; &quot;<br>
&gt; &gt;<br>
&gt; &gt; # Fix test case issues<br>
&gt; &gt; --<br>
&gt; &gt; 2.6.2<br>
&gt;<br>
&gt; Cheers<br>
&gt; --<br>
&gt; Jens Rehsack - <a href=3D"mailto:rehsack@gmail.com">rehsack@gmail.com<=
/a><br>
&gt;<br>
</p>

--001a11c3bfee63e0d00522e11922--
