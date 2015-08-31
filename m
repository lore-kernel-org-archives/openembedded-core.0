Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7280D76FC6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 18:20:07 +0000 (UTC)
Received: by iod35 with SMTP id 35so38001130iod.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 11:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=9rsfFe7PBU7tv6gutePuhiNOd8EDvmx3PQbTpcpyE/E=;
	b=yUq7hXz0nHUmmjXLL0K1bQGBuvBhNJBB74DfQNtHoESFo4u8gOa9q4xSME+KyiIj5i
	cFVVr1mbHG/O1JV/hskRlhiU+0pEzoJIZql8jSEPXbwK0hfoTUUmuHXxIykvbC4HtkHe
	GpGoSNOOi8bW8kOqdVkmHveTHcT0V/XkzrU1hGagTOniBJrheQ32hN1Mh0civsIbikVU
	MSJlDMNENVnJSPMl91VRr/nwFJmJChbOUg2NeEuiLiJA7EuWFzodjiawtwf+L/LS2RM3
	M0s5QZWlQNaqZRjV9h+cKoGtU6ohH36ap9GTKwjY8HnUwt3o9VBl7C3eo0g1ZxDoOYXp
	9Dpw==
X-Received: by 10.107.38.10 with SMTP id m10mr30199233iom.98.1441045207276;
	Mon, 31 Aug 2015 11:20:07 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.71 with HTTP; Mon, 31 Aug 2015 11:19:47 -0700 (PDT)
In-Reply-To: <55E4940B.5050105@windriver.com>
References: <1440952270-9085-1-git-send-email-raj.khem@gmail.com>
	<CAPhnLPBue6s_m7rYYyuy6hyxdBTz8y1MedgspDeOLcL1XaunYQ@mail.gmail.com>
	<CAMKF1srWus=7f3EoCGtMVez0FbsFPsa1g8COMM87pqxxpkg2zw@mail.gmail.com>
	<CABcZANmWhU5sFXSU1j=3GOPu0gOCY3Nt_b54oQkRLhzs=ERSYQ@mail.gmail.com>
	<55E4940B.5050105@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 31 Aug 2015 11:19:47 -0700
X-Google-Sender-Auth: TN8T_GpIdht_KqhGPbQrxYuoPUM
Message-ID: <CABcZANnZNg4m_ofR8DZnJOsZLG8=2EPxPgTLRt+BYM0p6QnOJg@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xz: Correctly specify GPL-3.0 with autoconf exception
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
X-List-Received-Date: Mon, 31 Aug 2015 18:20:07 -0000
Content-Type: multipart/alternative; boundary=001a1140e7b8af6ba2051e9f7b69

--001a1140e7b8af6ba2051e9f7b69
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 31, 2015 at 10:51 AM, Mark Hatle <mark.hatle@windriver.com>
wrote:

> On 8/31/15 12:35 PM, Christopher Larson wrote:
> >
> > On Mon, Aug 31, 2015 at 10:10 AM, Khem Raj <raj.khem@gmail.com
> > <mailto:raj.khem@gmail.com>> wrote:
> >
> >     On Mon, Aug 31, 2015 at 10:05 AM, Flanagan, Elizabeth
> >     <elizabeth.flanagan@intel.com <mailto:elizabeth.flanagan@intel.com>>
> wrote:
> >     > On 30 August 2015 at 17:31, Khem Raj <raj.khem@gmail.com <mailto:
> raj.khem@gmail.com>> wrote:
> >     >> There is m4/ax_pthread.m4 macro which uses GPL-3.0 with autoconf
> >     >> exception, there is no other occurance of GPL-3.0 use, lets mark
> the
> >     >> licence correctly.
> >     >
> >     > Unless the macro is actually shipped with any of the packages, I
> don't
> >     > think we actually need to do this. Generally, LICENSE should be the
> >     > intersection of all LICENSE_${PN}*.
> >
> >     its not shipped on target,
> >
> >     >
> >     > I think the correct fix here is actually:
> >     >
> >     > LICENSE = "GPLv2+ & PD"
> >
> >     why did you drop LGPLv2.1+
> >
> >
> > I think we need a way to indicate the license of the source in addition
> to the
> > license of what we ship, to cover the case where the license affects the
> ability
> > to redistribute sources. I'd thought that the base LICENSE was
> essentially that.
> > If that's not the case, then we should give some careful thought to how
> to cover
> > both.
>
> The way the recipe 'LICENSE =' field was defined, AFAIK, was that it was
> the
> license of the source used to construct the binaries.
>
> So if the autoconf was GPLv3, but the package and it's sources are GPLv2+,
> it
> would be listed as GPLv2+.
>
> Making this assumption allows us to be confident that the general license
> of
> recipe matches the binaries constructed by the recipe, allowing
> LICENSE-${PN} =
> ${LICENSE} in the general case.
>
> This does certainly put in an interesting situation though if there is an
> obscure license where the binaries and sources are effectively under
> different
> restrictions.  (Perhaps if a build environment contained a license that
> required
> an advertising clause, but the produced binaries did not include it.  The
> obligation to advertise or not could be up for some debate by a lawyer,
> even
> though the source code may need to be redistributed.)
>

Indeed, that's one case I had in mind when thinking about this.


> Do you know of any cases where this may be true or where end users may have
> concerns that a license is not properly represented?


In the past, I've encountered situations where one is in a position legally
to distribute the binaries, but not the source, of recipes under a
particular license. I don't think I've yet seen a situation where this was
a license that sources were under but which wasn't listed in LICENSE, yet,
though, it's theoretically possible we could encounter such a thing.

If the license with problematic source distribution requirements was not
listed in LICENSE, we'd not only be hiding that knowledge, we'd not be able
to use the license filtered source distribution in archiver to limit
distribution of those sources :) Possibly an unlikely case, but one I think
there's value in considering, at the very least.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1140e7b8af6ba2051e9f7b69
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Aug 31, 2015 at 10:51 AM, Mark Hatle <span dir=3D"ltr">&lt;<a href=
=3D"mailto:mark.hatle@windriver.com" target=3D"_blank">mark.hatle@windriver=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D=
"">On 8/31/15 12:35 PM, Christopher Larson wrote:<br>
&gt;<br>
&gt; On Mon, Aug 31, 2015 at 10:10 AM, Khem Raj &lt;<a href=3D"mailto:raj.k=
hem@gmail.com">raj.khem@gmail.com</a><br>
</span><span class=3D"">&gt; &lt;mailto:<a href=3D"mailto:raj.khem@gmail.co=
m">raj.khem@gmail.com</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0On Mon, Aug 31, 2015 at 10:05 AM, Flanagan, Elizabe=
th<br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:elizabeth.flanagan@int=
el.com">elizabeth.flanagan@intel.com</a> &lt;mailto:<a href=3D"mailto:eliza=
beth.flanagan@intel.com">elizabeth.flanagan@intel.com</a>&gt;&gt; wrote:<br=
>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0&gt; On 30 August 2015 at 17:31, K=
hem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a> &l=
t;mailto:<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;&g=
t; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; There is m4/ax_pthread.m4 macro which uses=
 GPL-3.0 with autoconf<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; exception, there is no other occurance of =
GPL-3.0 use, lets mark the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; licence correctly.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Unless the macro is actually shipped with any =
of the packages, I don&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; think we actually need to do this. Generally, =
LICENSE should be the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; intersection of all LICENSE_${PN}*.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0its not shipped on target,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I think the correct fix here is actually:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; LICENSE =3D &quot;GPLv2+ &amp; PD&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0why did you drop LGPLv2.1+<br>
&gt;<br>
&gt;<br>
&gt; I think we need a way to indicate the license of the source in additio=
n to the<br>
&gt; license of what we ship, to cover the case where the license affects t=
he ability<br>
&gt; to redistribute sources. I&#39;d thought that the base LICENSE was ess=
entially that.<br>
&gt; If that&#39;s not the case, then we should give some careful thought t=
o how to cover<br>
&gt; both.<br>
<br>
</span>The way the recipe &#39;LICENSE =3D&#39; field was defined, AFAIK, w=
as that it was the<br>
license of the source used to construct the binaries.<br>
<br>
So if the autoconf was GPLv3, but the package and it&#39;s sources are GPLv=
2+, it<br>
would be listed as GPLv2+.<br>
<br>
Making this assumption allows us to be confident that the general license o=
f<br>
recipe matches the binaries constructed by the recipe, allowing LICENSE-${P=
N} =3D<br>
${LICENSE} in the general case.<br>
<br>
This does certainly put in an interesting situation though if there is an<b=
r>
obscure license where the binaries and sources are effectively under differ=
ent<br>
restrictions.=C2=A0 (Perhaps if a build environment contained a license tha=
t required<br>
an advertising clause, but the produced binaries did not include it.=C2=A0 =
The<br>
obligation to advertise or not could be up for some debate by a lawyer, eve=
n<br>
though the source code may need to be redistributed.)<br></blockquote><div>=
<br></div><div>Indeed, that&#39;s one case I had in mind when thinking abou=
t this.</div><div>=C2=A0=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Do you k=
now of any cases where this may be true or where end users may have<br>
concerns that a license is not properly represented?</blockquote></div><br>=
In the past, I&#39;ve encountered situations where one is in a position leg=
ally to distribute the binaries, but not the source, of recipes under a par=
ticular license. I don&#39;t think I&#39;ve yet seen a situation where this=
 was a license that sources were under but which wasn&#39;t listed in LICEN=
SE, yet, though, it&#39;s theoretically possible we could encounter such a =
thing.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>If the license with problematic source distribution requirements was not l=
isted in LICENSE, we&#39;d not only be hiding that knowledge, we&#39;d not =
be able to use the license filtered source distribution in archiver to limi=
t distribution of those sources :) Possibly an unlikely case, but one I thi=
nk there&#39;s value in considering, at the very least.</div><div class=3D"=
gmail_extra">-- <br><div class=3D"gmail_signature">Christopher Larson<br>cl=
arson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>=
Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a1140e7b8af6ba2051e9f7b69--
