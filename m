Return-Path: <ticotimo@gmail.com>
Received: from mail-ua0-f179.google.com (mail-ua0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id E6835600EB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 18:37:48 +0000 (UTC)
Received: by mail-ua0-f179.google.com with SMTP id 12so154545949uas.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2016 10:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2mKaROcQT1Vg5c6JpXN/fzwxkoAO/E1TiZCAMUt2CAY=;
	b=O6EVxEw2fHi5JnY05XiqAm4F84o1btcZHQMFJKETwQeaaf7zqSreBWfEK0N7LNIpYe
	nljUmfQKYpGEhCNMLjITjvB+mloJCK+WAqVcvKrbktEdBpTsHGsJ48hXMtwcgzJ6Q6y0
	/hVc8qQZ/B+vZExnVJ8eGNWj+s89yBuded/2eHZ0SF1gS5ftNJwZJnQhjwTyykb/orYu
	NIpeKh7OGmJ5gBbomZAaL2U11cNZkyxM8lOZ8zqRVolq8hsVVwV4pJV2HHmb4kv0EsA4
	0WoSaY+pmV5FnDTvEk0blzufgjraZDChpfo4CP3xr0LPh3tzmUbPCkEHgDE07RttzNPX
	F9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2mKaROcQT1Vg5c6JpXN/fzwxkoAO/E1TiZCAMUt2CAY=;
	b=GlZHGQf/+BK88HKEYsjRsfLpiNvRRVG8dFByE2ez47O07V4MMaYJrlNHoLfleQXThT
	mmxbx1b+Kin4UFi3nLDoVZFjnmcH5VMXahnAs+r/Gv50BSbxxhZSTSb5RZH6upg1Kzg0
	Au4iliWex+R/h/vBHEsIbGJ8o11IRq8WYCh4sRNEAK/SLlXefjdzblsyx65n19Kt7VNx
	OZ10yhu3a2+2I5mWonkPQ1qmfwm453+8523QwpCmnUlhiYue//UkHdAEqwzwUW6BmSuH
	z09jC0+SYuOaHxjsYyVf8xzJHNeUvnPOH4cu6GIIy9XahU/sKb5ZNPe4POIFDfb/5maC
	5WGA==
X-Gm-Message-State: ABUngvcrdpkFzRSGXK0Gw9ONUb9U7YBMhL9a4/yypcPPf40Ua1DSqxpWd4yuaQnohO73VgxoJERxtqOLyr8oqw==
X-Received: by 10.176.1.3 with SMTP id 3mr9070370uak.170.1478630269790; Tue,
	08 Nov 2016 10:37:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.107.142 with HTTP; Tue, 8 Nov 2016 10:37:49 -0800 (PST)
In-Reply-To: <alpine.LFD.2.20.1611080556150.4555@ca624034.mitel.com>
References: <alpine.LFD.2.20.1611080334060.19840@localhost.localdomain>
	<alpine.LFD.2.20.1611080556150.4555@ca624034.mitel.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 8 Nov 2016 10:37:49 -0800
Message-ID: <CANx9H-Bfd6hKhcKhNbx8DVYBUTRPQbpxM7naw+aEW5dNc+vhKw@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: compile error for handwritten "perl-RPM2", 'RPM_GNUC_NULL_TERMINATED' error
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
X-List-Received-Date: Tue, 08 Nov 2016 18:37:50 -0000
Content-Type: multipart/alternative; boundary=001a11475752fc35fd0540ce6f90

--001a11475752fc35fd0540ce6f90
Content-Type: text/plain; charset=UTF-8

NOTE: by convention, OE perl recipes follow debian naming so this should be
librpm2-perl_1.3.bb
Obviously, in your own layer you are free to do what you want, but it will
require the name change if you want it to go into meta-perl.

For dependencies, since you are looking at CentOS rpms, you can look at,
e.g. [0]  to see the DEPENDS (BuildRequires:) and RDEPENDS (Requires:).
This would have shown you the need for rpm-devel.

I also use metacpan, e.g. [1], to look for dependencies in perl modules. It
also has a very slick ElasticSearch JSON API that you can use to
automatically query data [2].

To pass in the extra variables, for 'inherit cpan' you probably need to set
EXTRA_CPANFLAGS [3] or for 'inherit cpan_build' EXTRA_CPAN_BUILD_FLAGS [4],
e.g. [5].

You might want to file a documentation bug for the next release?

[0]
http://pkgs.fedoraproject.org/cgit/rpms/perl-RPM2.git/tree/perl-RPM2.spec?h=epel7
[1] https://metacpan.org/pod/RPM2
[2] https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md
[3]
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/cpan.bbclass#n20
[4]
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/cpan_build.bbclass#n21
[5]
http://git.openembedded.org/meta-openembedded/tree/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0121.bb#n37

On Tue, Nov 8, 2016 at 3:17 AM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>
>   replying to my earlier post with additional info ... man, i want to
> debug this ...
>
> On Tue, 8 Nov 2016, Robert P. J. Day wrote:
>
> >   following on my earlier post, here's the specific issue i'm
> > tackling. having found no existing OE recipe equivalent to a centos
> > "perl-RPM2" RPM, i wrote my own. here's the info about that RH RPM on
> > my fedora system, so i know what the final result should look like:
> >
> >   $ rpm -ql perl-RPM2
> >   /usr/lib64/perl5/vendor_perl/RPM2.pm
> >   /usr/lib64/perl5/vendor_perl/auto/RPM2
> >   /usr/lib64/perl5/vendor_perl/auto/RPM2/RPM2.so
> >   /usr/share/doc/perl-RPM2
> >   /usr/share/doc/perl-RPM2/Changes
> >   /usr/share/doc/perl-RPM2/README
> >   /usr/share/man/man3/RPM2.3pm.gz
> >   $
> >
> > so, as before, track down the source at cpan:
> >
> >   https://metacpan.org/pod/RPM2
> >
> > and write a boilerplate recipe, "perl-rpm2", containing the following
> > line since it's an older style recipe:
> >
> >   inherit cpan_build
> >
> > fetching works fine:
> >
> >   $ bitbake -c fetchall perl-rpm2
> >
> > but here's the problem:
> >
> >   $ bitbake perl-rpm2
> >
> > ... snip ...
> >
> > | DEBUG: Executing shell function do_compile
> > | Copying lib/RPM2.pm -> blib/lib/RPM2.pm
> > | lib/RPM2.xs -> lib/RPM2.c
> > | powerpc-poky-linux-gcc -m32 -mhard-float -mcpu=7400 -mno-spe
> > --sysroot=/home/rpjday/oe/builds/msm_qemuppc/tmp/sysroots/qemuppc
> > -I/home/rpjday/oe/builds/msm_qemuppc/tmp/sysroots/qemuppc/
> usr/lib/perl/5.22.1/CORE
> > -DVERSION="1.3" -DXS_VERSION="1.3" -fPIC -DRPM2_API=5004
> > -I/home/rpjday/oe/builds/msm_qemuppc/tmp/sysroots/qemuppc/
> usr/include/rpm
> > -c -O2 -pipe -g -feliminate-unused-debug-types
> > -fdebug-prefix-map=/home/rpjday/oe/builds/msm_qemuppc/
> tmp/work/ppc7400-poky-linux/perl/5.22.1-r0=/usr/src/debug/perl/5.22.1-r0
> > -fdebug-prefix-map=/home/rpjday/oe/builds/msm_qemuppc/
> tmp/sysroots/x86_64-linux=
> > -fdebug-prefix-map=/home/rpjday/oe/builds/msm_qemuppc/
> tmp/sysroots/qemuppc=
> > -DDEBIAN -D_REENTRANT -D_GNU_SOURCE -fwrapv -fno-strict-aliasing -pipe
> > -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=2 -O2
> > -pipe -g -feliminate-unused-debug-types
> > -fdebug-prefix-map=/home/rpjday/oe/builds/msm_qemuppc/
> tmp/work/ppc7400-poky-linux/perl-rpm2/1.3-r0=/usr/src/
> debug/perl-rpm2/1.3-r0
> > -fdebug-prefix-map=/home/rpjday/oe/builds/msm_qemuppc/
> tmp/sysroots/x86_64-linux=
> > -fdebug-prefix-map=/home/rpjday/oe/builds/msm_qemuppc/
> tmp/sysroots/qemuppc=
> > -O2 -o lib/RPM2.o lib/RPM2.c
> > | In file included from
> > /home/rpjday/oe/builds/msm_qemuppc/tmp/sysroots/qemuppc/
> usr/include/rpm/rpmcli.h:9:0,
> > |                  from lib/RPM2.xs:3:
> > |
> > /home/rpjday/oe/builds/msm_qemuppc/tmp/sysroots/qemuppc/
> usr/include/rpm/rpmmacro.h:
> > In function 'rpmExpand':
> > |
> > /home/rpjday/oe/builds/msm_qemuppc/tmp/sysroots/qemuppc/
> usr/include/rpm/rpmmacro.h:249:2:
> > error: expected declaration specifiers before
> > 'RPM_GNUC_NULL_TERMINATED'
> > |   RPM_GNUC_NULL_TERMINATED
> > |   ^~~~~~~~~~~~~~~~~~~~~~~~
> > |
> > /home/rpjday/oe/builds/msm_qemuppc/tmp/sysroots/qemuppc/
> usr/include/rpm/rpmmacro.h:260:2:
> > error: expected '=', ',', ';', 'asm' or '__attribute__' before
> > 'RPM_GNUC_NULL_TERMINATED'
> > |   RPM_GNUC_NULL_TERMINATED
> > |   ^~~~~~~~~~~~~~~~~~~~~~~~
> >
> > ... big snip, lots more errors ...
>
>   ok, here's my wildly-uneducated record of what is going on:
>
>   first, unpacking and configuring perl-RPM2 source (and running XS
> processor) gives me the source file "lib/RPM2.c" (which is what is
> generating the first build error above), which includes the header
> file:
>
>   #include <rpm/rpmcli.h>
>
>   next, wander over to the qemuppc sysroot, to usr/include/rpm/, to
> check out that header file, which contains (among other things):
>
>   #include <popt.h>
>   #include <rpmmacro.h>      <----- there
>   #include <rpmtypes.h>
>   #include <rpmtag.h>
>   #include <rpmps.h>
>   #include <rpmrc.h>
>   #include <rpmfi.h>      /* XXX rpmfileAttrs */
>   #include <rpmts.h>      /* XXX rpmdepFlags *
>
>   next, in the same directory, examine rpmmacro.h, which contains:
>
>   #if defined(_MACRO_INTERNAL)
>   #include <rpmiotypes.h>
>   ... snip ...
>
>   at this point, inclusion is now conditional on _MACRO_INTERNAL, so
> move on to rpmiotypes.h, which contains:
>
>   #include <rpmutil.h>
>
> and finally visit that header file in the qemuppc sysroot to find:
>
>   #if     __GNUC__ >= 4
>   #define RPM_GNUC_NULL_TERMINATED __attribute__((__sentinel__))
>   #else
>   #define RPM_GNUC_NULL_TERMINATED
>   #endif
>
> where we find the definition of that macro.
>
>   now, is it my imagination, or could a lot of this compile-time error
> be resolved by simply defining the macro "_MACRO_INTERNAL" for the
> build? and if so, what is the proper way to add that setting to the
> compile step for this recipe?
>
>   would i use the standard EXTRA_* variables? or are there
> perl-specific variables one would use when build CPAN recipes? or am i
> totally off-track here?
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11475752fc35fd0540ce6f90
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">NOTE: by convention, OE perl recipes follow debian naming =
so this should be <a href=3D"http://librpm2-perl_1.3.bb">librpm2-perl_1.3.b=
b</a><div>Obviously, in your own layer you are free to do what you want, bu=
t it will require the name change if you want it to go into meta-perl.<br><=
div><br></div><div>For dependencies, since you are looking at CentOS rpms, =
you can look at, e.g. [0] =C2=A0to see the DEPENDS (BuildRequires:) and RDE=
PENDS (Requires:). This would have shown you the need for rpm-devel.</div><=
div><br></div><div>I also use metacpan, e.g. [1], to look for dependencies =
in perl modules. It also has a very slick ElasticSearch JSON API that you c=
an use to automatically query data [2].</div><div><br></div><div>To pass in=
 the extra variables, for &#39;inherit cpan&#39; you probably need to set E=
XTRA_CPANFLAGS [3] or for &#39;inherit cpan_build&#39; EXTRA_CPAN_BUILD_FLA=
GS [4], e.g. [5].</div><div><br></div><div>You might want to file a documen=
tation bug for the next release?=C2=A0</div><div><br></div></div><div>[0] <=
a href=3D"http://pkgs.fedoraproject.org/cgit/rpms/perl-RPM2.git/tree/perl-R=
PM2.spec?h=3Depel7">http://pkgs.fedoraproject.org/cgit/rpms/perl-RPM2.git/t=
ree/perl-RPM2.spec?h=3Depel7</a></div><div>[1] <a href=3D"https://metacpan.=
org/pod/RPM2">https://metacpan.org/pod/RPM2</a></div><div>[2]=C2=A0<a href=
=3D"https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md">=
https://github.com/metacpan/metacpan-api/blob/master/docs/API-docs.md</a></=
div><div>[3] <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree=
/meta/classes/cpan.bbclass#n20">http://git.yoctoproject.org/cgit/cgit.cgi/p=
oky/tree/meta/classes/cpan.bbclass#n20</a></div><div>[4] <a href=3D"http://=
git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/cpan_build.bbclas=
s#n21">http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/cpa=
n_build.bbclass#n21</a></div><div>[5] <a href=3D"http://git.openembedded.or=
g/meta-openembedded/tree/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2=
.0121.bb#n37">http://git.openembedded.org/meta-openembedded/tree/meta-perl/=
recipes-perl/libxml/libxml-libxml-perl_2.0121.bb#n37</a></div></div><div cl=
ass=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Nov 8, 2016 at 3=
:17 AM, Robert P. J. Day <span dir=3D"ltr">&lt;<a href=3D"mailto:rpjday@cra=
shcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><br>
=C2=A0 replying to my earlier post with additional info ... man, i want to<=
br>
debug this ...<br>
<div><div class=3D"h5"><br>
On Tue, 8 Nov 2016, Robert P. J. Day wrote:<br>
<br>
&gt;=C2=A0 =C2=A0following on my earlier post, here&#39;s the specific issu=
e i&#39;m<br>
&gt; tackling. having found no existing OE recipe equivalent to a centos<br=
>
&gt; &quot;perl-RPM2&quot; RPM, i wrote my own. here&#39;s the info about t=
hat RH RPM on<br>
&gt; my fedora system, so i know what the final result should look like:<br=
>
&gt;<br>
&gt;=C2=A0 =C2=A0$ rpm -ql perl-RPM2<br>
&gt;=C2=A0 =C2=A0/usr/lib64/perl5/vendor_perl/<wbr>RPM2.pm<br>
&gt;=C2=A0 =C2=A0/usr/lib64/perl5/vendor_perl/<wbr>auto/RPM2<br>
&gt;=C2=A0 =C2=A0/usr/lib64/perl5/vendor_perl/<wbr>auto/RPM2/RPM2.so<br>
&gt;=C2=A0 =C2=A0/usr/share/doc/perl-RPM2<br>
&gt;=C2=A0 =C2=A0/usr/share/doc/perl-RPM2/<wbr>Changes<br>
&gt;=C2=A0 =C2=A0/usr/share/doc/perl-RPM2/<wbr>README<br>
&gt;=C2=A0 =C2=A0/usr/share/man/man3/RPM2.3pm.<wbr>gz<br>
&gt;=C2=A0 =C2=A0$<br>
&gt;<br>
&gt; so, as before, track down the source at cpan:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://metacpan.org/pod/RPM2" rel=3D"noreferre=
r" target=3D"_blank">https://metacpan.org/pod/RPM2</a><br>
&gt;<br>
&gt; and write a boilerplate recipe, &quot;perl-rpm2&quot;, containing the =
following<br>
&gt; line since it&#39;s an older style recipe:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0inherit cpan_build<br>
&gt;<br>
&gt; fetching works fine:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0$ bitbake -c fetchall perl-rpm2<br>
&gt;<br>
&gt; but here&#39;s the problem:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0$ bitbake perl-rpm2<br>
&gt;<br>
&gt; ... snip ...<br>
&gt;<br>
&gt; | DEBUG: Executing shell function do_compile<br>
&gt; | Copying lib/RPM2.pm -&gt; blib/lib/RPM2.pm<br>
&gt; | lib/RPM2.xs -&gt; lib/RPM2.c<br>
&gt; | powerpc-poky-linux-gcc -m32 -mhard-float -mcpu=3D7400 -mno-spe<br>
&gt; --sysroot=3D/home/rpjday/oe/<wbr>builds/msm_qemuppc/tmp/<wbr>sysroots/=
qemuppc<br>
&gt; -I/home/rpjday/oe/builds/msm_<wbr>qemuppc/tmp/sysroots/qemuppc/<wbr>us=
r/lib/perl/5.22.1/CORE<br>
&gt; -DVERSION=3D&quot;1.3&quot; -DXS_VERSION=3D&quot;1.3&quot; -fPIC -DRPM=
2_API=3D5004<br>
&gt; -I/home/rpjday/oe/builds/msm_<wbr>qemuppc/tmp/sysroots/qemuppc/<wbr>us=
r/include/rpm<br>
&gt; -c -O2 -pipe -g -feliminate-unused-debug-types<br>
&gt; -fdebug-prefix-map=3D/home/<wbr>rpjday/oe/builds/msm_qemuppc/<wbr>tmp/=
work/ppc7400-poky-linux/<wbr>perl/5.22.1-r0=3D/usr/src/debug/<wbr>perl/5.22=
.1-r0<br>
&gt; -fdebug-prefix-map=3D/home/<wbr>rpjday/oe/builds/msm_qemuppc/<wbr>tmp/=
sysroots/x86_64-linux=3D<br>
&gt; -fdebug-prefix-map=3D/home/<wbr>rpjday/oe/builds/msm_qemuppc/<wbr>tmp/=
sysroots/qemuppc=3D<br>
&gt; -DDEBIAN -D_REENTRANT -D_GNU_SOURCE -fwrapv -fno-strict-aliasing -pipe=
<br>
&gt; -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_FORTIFY_SOURCE=3D2 -O2=
<br>
&gt; -pipe -g -feliminate-unused-debug-types<br>
&gt; -fdebug-prefix-map=3D/home/<wbr>rpjday/oe/builds/msm_qemuppc/<wbr>tmp/=
work/ppc7400-poky-linux/<wbr>perl-rpm2/1.3-r0=3D/usr/src/<wbr>debug/perl-rp=
m2/1.3-r0<br>
&gt; -fdebug-prefix-map=3D/home/<wbr>rpjday/oe/builds/msm_qemuppc/<wbr>tmp/=
sysroots/x86_64-linux=3D<br>
&gt; -fdebug-prefix-map=3D/home/<wbr>rpjday/oe/builds/msm_qemuppc/<wbr>tmp/=
sysroots/qemuppc=3D<br>
&gt; -O2 -o lib/RPM2.o lib/RPM2.c<br>
&gt; | In file included from<br>
&gt; /home/rpjday/oe/builds/msm_<wbr>qemuppc/tmp/sysroots/qemuppc/<wbr>usr/=
include/rpm/rpmcli.h:9:0,<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from l=
ib/RPM2.xs:3:<br>
&gt; |<br>
&gt; /home/rpjday/oe/builds/msm_<wbr>qemuppc/tmp/sysroots/qemuppc/<wbr>usr/=
include/rpm/rpmmacro.h:<br>
&gt; In function &#39;rpmExpand&#39;:<br>
&gt; |<br>
&gt; /home/rpjday/oe/builds/msm_<wbr>qemuppc/tmp/sysroots/qemuppc/<wbr>usr/=
include/rpm/rpmmacro.h:<wbr>249:2:<br>
&gt; error: expected declaration specifiers before<br>
&gt; &#39;RPM_GNUC_NULL_TERMINATED&#39;<br>
&gt; |=C2=A0 =C2=A0RPM_GNUC_NULL_TERMINATED<br>
&gt; |=C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~~~~<br>
&gt; |<br>
&gt; /home/rpjday/oe/builds/msm_<wbr>qemuppc/tmp/sysroots/qemuppc/<wbr>usr/=
include/rpm/rpmmacro.h:<wbr>260:2:<br>
&gt; error: expected &#39;=3D&#39;, &#39;,&#39;, &#39;;&#39;, &#39;asm&#39;=
 or &#39;__attribute__&#39; before<br>
&gt; &#39;RPM_GNUC_NULL_TERMINATED&#39;<br>
&gt; |=C2=A0 =C2=A0RPM_GNUC_NULL_TERMINATED<br>
&gt; |=C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~~~~<br>
&gt;<br>
&gt; ... big snip, lots more errors ...<br>
<br>
</div></div>=C2=A0 ok, here&#39;s my wildly-uneducated record of what is go=
ing on:<br>
<br>
=C2=A0 first, unpacking and configuring perl-RPM2 source (and running XS<br=
>
processor) gives me the source file &quot;lib/RPM2.c&quot; (which is what i=
s<br>
generating the first build error above), which includes the header<br>
file:<br>
<br>
=C2=A0 #include &lt;rpm/rpmcli.h&gt;<br>
<br>
=C2=A0 next, wander over to the qemuppc sysroot, to usr/include/rpm/, to<br=
>
check out that header file, which contains (among other things):<br>
<br>
=C2=A0 #include &lt;popt.h&gt;<br>
=C2=A0 #include &lt;rpmmacro.h&gt;=C2=A0 =C2=A0 =C2=A0 &lt;----- there<br>
=C2=A0 #include &lt;rpmtypes.h&gt;<br>
=C2=A0 #include &lt;rpmtag.h&gt;<br>
=C2=A0 #include &lt;rpmps.h&gt;<br>
=C2=A0 #include &lt;rpmrc.h&gt;<br>
=C2=A0 #include &lt;rpmfi.h&gt;=C2=A0 =C2=A0 =C2=A0 /* XXX rpmfileAttrs */<=
br>
=C2=A0 #include &lt;rpmts.h&gt;=C2=A0 =C2=A0 =C2=A0 /* XXX rpmdepFlags *<br=
>
<br>
=C2=A0 next, in the same directory, examine rpmmacro.h, which contains:<br>
<br>
=C2=A0 #if defined(_MACRO_INTERNAL)<br>
=C2=A0 #include &lt;rpmiotypes.h&gt;<br>
=C2=A0 ... snip ...<br>
<br>
=C2=A0 at this point, inclusion is now conditional on _MACRO_INTERNAL, so<b=
r>
move on to rpmiotypes.h, which contains:<br>
<br>
=C2=A0 #include &lt;rpmutil.h&gt;<br>
<br>
and finally visit that header file in the qemuppc sysroot to find:<br>
<br>
=C2=A0 #if=C2=A0 =C2=A0 =C2=A0__GNUC__ &gt;=3D 4<br>
=C2=A0 #define RPM_GNUC_NULL_TERMINATED __attribute__((__sentinel__))<br>
=C2=A0 #else<br>
=C2=A0 #define RPM_GNUC_NULL_TERMINATED<br>
=C2=A0 #endif<br>
<br>
where we find the definition of that macro.<br>
<br>
=C2=A0 now, is it my imagination, or could a lot of this compile-time error=
<br>
be resolved by simply defining the macro &quot;_MACRO_INTERNAL&quot; for th=
e<br>
build? and if so, what is the proper way to add that setting to the<br>
compile step for this recipe?<br>
<br>
=C2=A0 would i use the standard EXTRA_* variables? or are there<br>
perl-specific variables one would use when build CPAN recipes? or am i<br>
totally off-track here?<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
rday<br>
<br>
--<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
Robert P. J. Day=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Ottawa, Ontario,=
 CANADA<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 <a href=3D"http://crashcourse.ca" rel=3D"noreferrer" target=3D"_=
blank">http://crashcourse.ca</a><br>
<br>
Twitter:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a=
 href=3D"http://twitter.com/rpjday" rel=3D"noreferrer" target=3D"_blank">ht=
tp://twitter.com/rpjday</a><br>
LinkedIn:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://ca.linkedin.=
com/in/rpjday" rel=3D"noreferrer" target=3D"_blank">http://ca.linkedin.com/=
in/<wbr>rpjday</a><br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
<br>
<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a11475752fc35fd0540ce6f90--
