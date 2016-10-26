Return-Path: <ticotimo@gmail.com>
Received: from mail-ua0-f174.google.com (mail-ua0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 975BC719E6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 03:20:58 +0000 (UTC)
Received: by mail-ua0-f174.google.com with SMTP id 6so493985uau.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 20:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jmSbMm2fu61nUecw/C5U+I0xzLfjlMpLYIFD2ia8k94=;
	b=eYuvEgRppBBTOhhT7B6dZwkXEEiiFUpfr+tdY4NXTaNNs8uDqNui54yw4xOUEuxZRc
	SPns7tpQWxUM75QklQEubtSps7MO4LGaP+FfmEbOjHz8l6ye5aJg2w3/dkfBIv9KPi27
	+gMDWzLtKuYjFdLmeMDoGbd7tJa6krcliXrip+ml0JwF/Cj6l33i2FFbNwJxeNkGo6Qm
	wCBnsSU6iZIN7ymRlvFfG1DeMmZz/Dsfhkwl6h9Yfhv58zt/qmao/EwV5/ogqYu2/BpU
	Czq3TpUZE9vEzcCLVmRQO3GynMS/LFI23KKEcAdpIeyi0jPipTsGuUwBVnYyzdzQ33qn
	kcVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jmSbMm2fu61nUecw/C5U+I0xzLfjlMpLYIFD2ia8k94=;
	b=V5mJwMZwupdzR/hjB5E8ndC/yhmuXikyy50RUYbDu+aYAkGS7JVsg6BYvVosve4Fpk
	Pzb21/OIqtst6wk2SeYVYlcRT5wfqjg94l3uLBDB58KlKaH9f+qnm4pZ3Y83DfjPvBwF
	OzKpKiKuB/5E6x6bHiSUfEu+NvrbQhROAsfrlsC4X4D5ayxCvnmJbNjZ9EGIQ6cPBAAi
	IZbKEI+Oih9DMUu27iK/CauRZLTImTvrcMu4fgUVVpLANH/rRRXy5QhT1QJQBpxgFWT1
	QPwJG5ODYgYIhA+KVaWn+/0+0Kr8WLtu9+UWFhg8oGUS2ZGeh1CVwNIYLFvIkbihAo9r
	O5lg==
X-Gm-Message-State: ABUngveqCGgQjcuMo+7c200FQG2jtOuCLDaOF4hjsp1MOSB5nk0UpAWELXtixsx6LdhLxnRMSu9QtsbeMX6Ibw==
X-Received: by 10.176.1.65 with SMTP id 59mr17876308uak.170.1477452059237;
	Tue, 25 Oct 2016 20:20:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.94.15 with HTTP; Tue, 25 Oct 2016 20:20:58 -0700 (PDT)
In-Reply-To: <CABcZANnku9xzQ=Zz6NnUX+myzbAX9K34gPVjkTCd0jKSAXSXRw@mail.gmail.com>
References: <alpine.LFD.2.20.1610241644480.15919@localhost.localdomain>
	<CABcZANnYLS0pfSpdzf3NVV4KEg_88b9mPark9gpstJUFHZTzxQ@mail.gmail.com>
	<alpine.LFD.2.20.1610250246460.19688@localhost.localdomain>
	<alpine.LFD.2.20.1610250303460.20837@localhost.localdomain>
	<CABcZANnku9xzQ=Zz6NnUX+myzbAX9K34gPVjkTCd0jKSAXSXRw@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 25 Oct 2016 20:20:58 -0700
Message-ID: <CANx9H-Con-15wFVpU3mW0tuBV=R8t7=LGmO2U69uyyptXPha6g@mail.gmail.com>
To: Christopher Larson <clarson@kergoth.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: most efficient way to map perl RH rpms to OE package names?
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
X-List-Received-Date: Wed, 26 Oct 2016 03:20:58 -0000
Content-Type: multipart/alternative; boundary=001a113d14e029e3f6053fbc1da2

--001a113d14e029e3f6053fbc1da2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Robert,

You did not mention meta-perl:
http://git.openembedded.org/meta-openembedded/tree/meta-perl/recipes-perl

The perl modules in meta-perl follow Debian naming:
https://www.debian.org/doc/packaging-manuals/perl-policy/ch-module_packages=
.html
https://anonscm.debian.org/cgit/?q=3Dperl

When Jens developed meta-cpan, he was trying to improve the packaging of
perl modules, but did not necessarily follow the "established guidelines"
for OE perl module naming (which was the meta-perl layer at the time). What
he did provide is a method to use the CPAN metadata to create OE perl
modules.

The perl packaging in OE-Core follows yet another pattern. I assume it grew
out of a need to not package all the modules in a monolithic "perl-modules"
package (like Debian does) for our embedded-specific usage.

Not an ideal situation, but we have similar issues with python modules.

Cheers.

--Tim

On Tue, Oct 25, 2016 at 8:07 AM, Christopher Larson <clarson@kergoth.com>
wrote:

>
> On Tue, Oct 25, 2016 at 12:05 AM, Robert P. J. Day <rpjday@crashcourse.ca=
>
> wrote:
>
>> On Tue, 25 Oct 2016, Robert P. J. Day wrote:
>>
>> > On Mon, 24 Oct 2016, Christopher Larson wrote:
>> >
>> > >
>> > > On Mon, Oct 24, 2016 at 1:53 PM, Robert P. J. Day <
>> rpjday@crashcourse.ca> wrote:
>> > >         i've just been handed a list of about 200 perl packages by
>> their
>> > >       centos rpm names, and i want to map most, if not all, of them
>> to their
>> > >       equivalent OE package names.
>> > >
>> > >        my first instinct (based on not having used a lot of perl OE
>> > >       packages) is to add both "perl" and "perl-modules" to
>> IMAGE_INSTALL,
>> > >       just to fetch and build every possible module available throug=
h
>> the OE
>> > >       perl recipe -- that will at least give me an idea of what's
>> available.
>> > >
>> > >         next, i can see the pattern in some OE package names -- i've
>> > >       verified that the Time::HiRes package is available in OE as
>> > >       perl-module-time-hires, which i assume is part of the dynamic
>> naming
>> > >       being done in perl_5.22.1.bb.
>> > >
>> > >        am i approaching this the right way?
>> > >
>> > >
>> > > Could also bitbake perl, then use oe-pkgdata-util to locate the
>> > > actual perl modules in the packages, i.e. */Time/HiRes.pm.
>> >
>> >   i once wrote a wiki page on "bb", distinguishing between queries
>> > you could make before you did a build, versus queries that needed a
>> > build. it seems like oe-pkgdata-util needs a completed build for
>> > pretty much everything, do i have that right?
>>
>>   never mind, i just read this snippet from the YP ref manual:
>>
>> "You can use the oe-pkgdata-util command-line utility to query
>> PKGDATA_DIR and display various package-related information. When you
>> use the utility, you must use it to view information on packages that
>> have already been built."
>>
>> so i'm assuming that means for *all* oe-pkgdata subcommands, no
>> exceptions.
>
>
> Right, oe-pkgdata-util is about inspecting build output via pkgdata,
> whereas most of bb is inspection tools about the metadata =E2=80=94 befor=
e the
> build. The only exception is bb-contents, which is a convenience, just
> wraps oe-pkgdata-util under the hood and tells the user the oe-pkgdata-ut=
il
> command in case they want to run it directly.
> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a113d14e029e3f6053fbc1da2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Robert,<div><br></div><div>You did not mention meta-perl: =
<a href=3D"http://git.openembedded.org/meta-openembedded/tree/meta-perl/rec=
ipes-perl">http://git.openembedded.org/meta-openembedded/tree/meta-perl/rec=
ipes-perl</a><div><br></div><div>The perl modules in meta-perl follow Debia=
n naming:<div><a href=3D"https://www.debian.org/doc/packaging-manuals/perl-=
policy/ch-module_packages.html">https://www.debian.org/doc/packaging-manual=
s/perl-policy/ch-module_packages.html</a><br></div><div><a href=3D"https://=
anonscm.debian.org/cgit/?q=3Dperl">https://anonscm.debian.org/cgit/?q=3Dper=
l</a><br></div><div><br></div><div>When Jens developed meta-cpan, he was tr=
ying to improve the packaging of perl modules, but did not necessarily foll=
ow the &quot;established guidelines&quot; for OE perl module naming (which =
was the meta-perl layer at the time). What he did provide is a method to us=
e the CPAN metadata to create OE perl modules.</div><div><br></div><div>The=
 perl packaging in OE-Core follows yet another pattern. I assume it grew ou=
t of a need to not package all the modules in a monolithic &quot;perl-modul=
es&quot; package (like Debian does) for our embedded-specific usage.</div><=
div><br></div><div>Not an ideal situation, but we have similar issues with =
python modules.</div></div><div><br></div><div>Cheers.</div><div><br></div>=
<div>--Tim</div></div></div><div class=3D"gmail_extra"><br><div class=3D"gm=
ail_quote">On Tue, Oct 25, 2016 at 8:07 AM, Christopher Larson <span dir=3D=
"ltr">&lt;<a href=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@=
kergoth.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div di=
r=3D"ltr"><div class=3D"gmail_extra"><div><div class=3D"h5"><br><div class=
=3D"gmail_quote">On Tue, Oct 25, 2016 at 12:05 AM, Robert P. J. Day <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">r=
pjday@crashcourse.ca</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><span>On Tue, 25 Oct 2016, Robert P. J. Day wrote:<br>
<br>
&gt; On Mon, 24 Oct 2016, Christopher Larson wrote:<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; On Mon, Oct 24, 2016 at 1:53 PM, Robert P. J. Day &lt;<a href=3D"=
mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</a>&g=
t; wrote:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 i&#39;ve just been handed a list=
 of about 200 perl packages by their<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0centos rpm names, and i want to map mos=
t, if not all, of them to their<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0equivalent OE package names.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0my first instinct (based on not h=
aving used a lot of perl OE<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0packages) is to add both &quot;perl&quo=
t; and &quot;perl-modules&quot; to IMAGE_INSTALL,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0just to fetch and build every possible =
module available through the OE<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0perl recipe -- that will at least give =
me an idea of what&#39;s available.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 next, i can see the pattern in s=
ome OE package names -- i&#39;ve<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0verified that the Time::HiRes package i=
s available in OE as<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0perl-module-time-hires, which i assume =
is part of the dynamic naming<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0being done in <a href=3D"http://perl_5.=
22.1.bb" rel=3D"noreferrer" target=3D"_blank">perl_5.22.1.bb</a>.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0am i approaching this the right w=
ay?<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Could also bitbake perl, then use oe-pkgdata-util to locate the<b=
r>
&gt; &gt; actual perl modules in the packages, i.e. */Time/HiRes.pm.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0i once wrote a wiki page on &quot;bb&quot;, distinguishing=
 between queries<br>
&gt; you could make before you did a build, versus queries that needed a<br=
>
&gt; build. it seems like oe-pkgdata-util needs a completed build for<br>
&gt; pretty much everything, do i have that right?<br>
<br>
</span>=C2=A0 never mind, i just read this snippet from the YP ref manual:<=
br>
<br>
&quot;You can use the oe-pkgdata-util command-line utility to query<br>
PKGDATA_DIR and display various package-related information. When you<br>
use the utility, you must use it to view information on packages that<br>
have already been built.&quot;<br>
<br>
so i&#39;m assuming that means for *all* oe-pkgdata subcommands, no<br>
exceptions.</blockquote></div><br></div></div>Right, oe-pkgdata-util is abo=
ut inspecting build output via pkgdata, whereas most of bb is inspection to=
ols about the metadata =E2=80=94 before the build. The only exception is bb=
-contents, which is a convenience, just wraps oe-pkgdata-util under the hoo=
d and tells the user the oe-pkgdata-util command in case they want to run i=
t directly.<span class=3D""><br>-- <br><div class=3D"m_9108964149688831291g=
mail_signature" data-smartmail=3D"gmail_signature">Christopher Larson<br>cl=
arson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>=
Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</span></div></div>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div>

--001a113d14e029e3f6053fbc1da2--
