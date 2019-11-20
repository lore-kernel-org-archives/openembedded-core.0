Return-Path: <ryan.harkin@linaro.org>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 61D607F696
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 21:29:40 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id t20so1175860qtn.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 13:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NXr9yQLUNYJqlAtF6AJpnC4zo45gkzUzpPa9f8wP4mk=;
	b=gI2XDg6B7dvhOvjsRhajish7Zh5nJSVEKl2OskjapQ1LDDNZFjipJggG2oeLdvJJ7M
	BzvEsrrQrTjkdlSfU5td0xx1jTd0CX0dU3zNOpJi3MCWp1fp0XCicxtZ0eyMuoHcJMgC
	lQYiS4y+eB0Oj6vgKsqm9CXpr8KwbMvo/5eiaIOs+nXACiKWfhnDf1+FYEjy1qwWJZjc
	7v9qzux9HJynBP8hBBlPI6ZNHGPibQTW+xd4yDvp4znupWOQc7qnlZ47KlHeY/obwJra
	KPZEqW8lKTOpBsRXYuKekwJYANHRFEobEdCsbTcTZM/pgFI1RswdBerO7Ow5KUY83WFH
	mRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NXr9yQLUNYJqlAtF6AJpnC4zo45gkzUzpPa9f8wP4mk=;
	b=akPNpVVwRPu6TLdTCLU8+rLmK9Kt6qH2mWdyagR4qKnAGV8vo78tsJKLrOyS9R0u++
	LecZdyWONIhujemYxVyu8cSrBkRWlneyqyO6Ddc6vnGDKytYNmNx3ck6Ge9Qf3gadbeQ
	+vl+NBVQEGmy3h+b65h/GZwKxO2HE5+5yXDVWYQa0x27CQq1nWQinBVzDFdTBqT7/LOq
	o0nx+dNlLSnpwGnzILILTIwL/2cRvgLll3oqGR1fcI1ObV3tU6mORxWn5boy0AGpWkLc
	Jw/93JB3JSCE9YYI3VBJuXGvQ1tZnfT1lt9ZQ1jkFAjxsiz37GsIvsbNplKAYRJOeiLi
	e01Q==
X-Gm-Message-State: APjAAAVyYxWMDj9jcJ+txEANCBv+WVPaMFunH1fKpHpWKR/8BhTljiDm
	9RYqzzJaa/kauKqihcok+qWOV/cslxfZRRvaqDUmFrhboX4=
X-Google-Smtp-Source: APXvYqyssA/bbWiVd6CzzyEn4qZKcWR5ImZ5Ai/ON36O0ggtuADcDTlHjrzac5nJQYvVo5z3ZsVXlY+4xB4hzMR57Vo=
X-Received: by 2002:ac8:f88:: with SMTP id b8mr4946089qtk.382.1574285381224;
	Wed, 20 Nov 2019 13:29:41 -0800 (PST)
MIME-Version: 1.0
References: <CAD0U-hKudOEYkkPQQ1He3=Cg1hLqT7u5Uhsn_e2ZK0vGmo+z3w@mail.gmail.com>
	<5c9cb09a-e0b3-f43b-36cd-bc9a7df2dd6c@kernel.crashing.org>
	<CAD0U-hLzTxYw3F-tPbj5m1+iqW+2PZcU5n4bE1sxL9KxGmuVUw@mail.gmail.com>
	<31b224ae-8e1a-943c-0554-684557ef33bc@kernel.crashing.org>
In-Reply-To: <31b224ae-8e1a-943c-0554-684557ef33bc@kernel.crashing.org>
From: Ryan Harkin <ryan.harkin@linaro.org>
Date: Wed, 20 Nov 2019 21:29:29 +0000
Message-ID: <CAD0U-hKMtXR+tvpS45D9=+XqaZVZBs7jMm9U3Vk7r+mJuVW5-A@mail.gmail.com>
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: How to backport openssl to Sumo
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
X-List-Received-Date: Wed, 20 Nov 2019 21:29:40 -0000
Content-Type: multipart/alternative; boundary="000000000000ec67760597cde01e"

--000000000000ec67760597cde01e
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Nov 2019 at 19:09, Mark Hatle <mark.hatle@kernel.crashing.org>
wrote:

>
>
> On 11/20/19 1:06 PM, Ryan Harkin wrote:
> >
> >
> > On Wed, 20 Nov 2019 at 18:36, Mark Hatle <mark.hatle@kernel.crashing.org
> > <mailto:mark.hatle@kernel.crashing.org>> wrote:
> >
> >
> >
> >     On 11/20/19 12:18 PM, Ryan Harkin wrote:
> >     > Hi all,
> >     >
> >     > I'm struggling with backporting OpenSSL to my Sumo build [1], so
> wondered if
> >     > anyone else had done something similar with success.
> >     >
> >     > I copied "meta/recipes-connectivity/openssl" from Poky master
> branch [2]
> >     into my
> >     > own layer [3]. It didn't pick up, so I discovered I needed to add
> >     > a PREFERRED_VERSION, eg:
> >     >
> >     > +PREFERRED_VERSION_openssl ?= "1.1.%"
> >     > +PREFERRED_VERSION_openssl-native ?= "1.1.%"
> >     > +PREFERRED_VERSION_nativesdk-openssl ?= "1.1.%"
> >     >
> >     > Now it builds fine. However, I no longer have /usr/bin/openssl in
> my disk
> >     image.
> >     >
> >     > It doesn't appear in FILES_${PN}, and adding it to the recipes
> doesn't seem to
> >     > make any difference.
> >     >
> >     > What am I missing?
> >     >
> >     > Thanks,
> >     > Ryan.
> >     >
> >     > [1] I'm looking for CVE fixes, 1.0.2p has a lot of CVEs.
> >
> >     You know that 1.0.2 and 1.1 APIs are not compatible?  So you will
> need to update
> >     everything that needs OpenSSL to understand the new API.
> >
> >
> > So far, we're only using it in a shell script to sign an image and later
> verify
> > the image, so I've assumed, perhaps naively, that the API changes won't
> matter...
>
> Correct, but there may be other components of the system that could be
> using the
> API that you are unaware of.  On a system as old as Sumo, you will need to
> take
> precautions to ensure that ONLY the 1.1x version is being used.  (There
> may be
> an openssl10 for compatibility that will need to be blacklisted.)
>

Good point. I'll check on it once I get it to work.


>
> >
> >     For CVE fixes, typically you would patch 1.0.2p, or update to the
> latest
> >     (1.0.2t) as you go.  (If you have an OSV, this should be part of the
> services
> >     that they offer you.)
> >
> >
> >     In my opinion, 1.0.2 will be around for at least another 4-5 years
> due to the
> >     number of people actively using it in the world.  Until 1.1/3.0
> (won't be a 2.0
> >     from what I read) exists and has a FIPS-140-2 support available --
> people will
> >     continue to use 1.0.2 and maintain it as necessary for security.
> >
> >     As an FYI:
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-openssl102/
> >
> >     This version is for thud, warrior, zeus and master.  It is intended
> to be
> >     maintained until either 1.0.2 is no longer maintainable -- or the
> FIPS-140-2
> >     needs have been met by OpenSSL.
> >
> >
> > Great, that looks like a better option anyway, assuming it has the
> latest fixes
> > I need, and doesn't give me the same build problem.  Thanks for pointing
> it out.
> > I'll give it a go.
>
> It's better to work with the Sumo version for your needs.  I just posted
> that as
> an example of openssl 1.0.2 being needed still by others, even as
> oe-core/Yocto
> Project have changed their defaults.
>

I pulled the whole openssl dir from your repo, added the layer.conf changes
to my layer.conf and rebuilt openssl and my image.

Unfortunately, I still have no /usr/bin/openssl in my disk image. So I've
added the RPROVIDES from Andre's in a vain attempt to get it to work:

RPROVIDES_${PN} += "openssl-bin"

... although I'm not hopeful it'll do the trick...


> --Mark
>
> > Thanks,
> > Ryan.
> >
> >
> >
> >     --Mark
> >
> >     > [2] http://git.yoctoproject.org/git/poky
> >     > I'm at SHA a616ffebdc, so I copied openssl_1.1.1d.bb
> >     <http://openssl_1.1.1d.bb> <http://openssl_1.1.1d.bb>
> >     > and all the other files in the directory.
> >     >
> >     > [3] I have a clone of Linaro's meta-backports. I'm trying to
> generate a
> >     patch to
> >     > submit for review there.
> >     > https://git.linaro.org/openembedded/meta-backports.git
> >     >
> >
>

--000000000000ec67760597cde01e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, 20 Nov 2019 at 19:09, Mark Ha=
tle &lt;<a href=3D"mailto:mark.hatle@kernel.crashing.org">mark.hatle@kernel=
.crashing.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><br>
<br>
On 11/20/19 1:06 PM, Ryan Harkin wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Wed, 20 Nov 2019 at 18:36, Mark Hatle &lt;<a href=3D"mailto:mark.ha=
tle@kernel.crashing.org" target=3D"_blank">mark.hatle@kernel.crashing.org</=
a><br>
&gt; &lt;mailto:<a href=3D"mailto:mark.hatle@kernel.crashing.org" target=3D=
"_blank">mark.hatle@kernel.crashing.org</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 11/20/19 12:18 PM, Ryan Harkin wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hi all,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I&#39;m struggling with backporting OpenSSL to=
 my Sumo build [1], so wondered if<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; anyone else had done something similar with su=
ccess.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I copied &quot;meta/recipes-connectivity/opens=
sl&quot; from Poky master branch [2]<br>
&gt;=C2=A0 =C2=A0 =C2=A0into my<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; own layer [3]. It didn&#39;t pick up, so I dis=
covered I needed to add<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; a=C2=A0PREFERRED_VERSION, eg:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +PREFERRED_VERSION_openssl ?=3D &quot;1.1.%&qu=
ot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +PREFERRED_VERSION_openssl-native ?=3D &quot;1=
.1.%&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +PREFERRED_VERSION_nativesdk-openssl ?=3D &quo=
t;1.1.%&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Now it builds fine. However, I no longer have =
/usr/bin/openssl in my disk<br>
&gt;=C2=A0 =C2=A0 =C2=A0image.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; It doesn&#39;t appear in FILES_${PN}, and addi=
ng it to the recipes doesn&#39;t seem to<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; make any difference.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; What am I missing?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Thanks,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Ryan.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; [1] I&#39;m looking for CVE fixes, 1.0.2p has =
a lot of CVEs.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0You know that 1.0.2 and 1.1 APIs are not compatible=
?=C2=A0 So you will need to update<br>
&gt;=C2=A0 =C2=A0 =C2=A0everything that needs OpenSSL to understand the new=
 API.<br>
&gt; <br>
&gt; <br>
&gt; So far, we&#39;re only using it in a shell script to sign an image and=
 later verify<br>
&gt; the image, so I&#39;ve assumed, perhaps naively, that the API changes =
won&#39;t matter...<br>
<br>
Correct, but there may be other components of the system that could be usin=
g the<br>
API that you are unaware of.=C2=A0 On a system as old as Sumo, you will nee=
d to take<br>
precautions to ensure that ONLY the 1.1x version is being used.=C2=A0 (Ther=
e may be<br>
an openssl10 for compatibility that will need to be blacklisted.)<br></bloc=
kquote><div><br></div><div>Good point. I&#39;ll check on it once I get it t=
o work.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0For CVE fixes, typically you would patch 1.0.2p, or=
 update to the latest<br>
&gt;=C2=A0 =C2=A0 =C2=A0(1.0.2t) as you go.=C2=A0 (If you have an OSV, this=
 should be part of the services<br>
&gt;=C2=A0 =C2=A0 =C2=A0that they offer you.)=C2=A0<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0In my opinion, 1.0.2 will be around for at least an=
other 4-5 years due to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0number of people actively using it in the world.=C2=
=A0 Until 1.1/3.0 (won&#39;t be a 2.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0from what I read) exists and has a FIPS-140-2 suppo=
rt available -- people will<br>
&gt;=C2=A0 =C2=A0 =C2=A0continue to use 1.0.2 and maintain it as necessary =
for security.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0As an FYI:=C2=A0 <a href=3D"http://git.yoctoproject=
.org/cgit/cgit.cgi/meta-openssl102/" rel=3D"noreferrer" target=3D"_blank">h=
ttp://git.yoctoproject.org/cgit/cgit.cgi/meta-openssl102/</a><br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0This version is for thud, warrior, zeus and master.=
=C2=A0 It is intended to be<br>
&gt;=C2=A0 =C2=A0 =C2=A0maintained until either 1.0.2 is no longer maintain=
able -- or the FIPS-140-2<br>
&gt;=C2=A0 =C2=A0 =C2=A0needs have been met by OpenSSL.<br>
&gt; <br>
&gt; <br>
&gt; Great, that looks like a better option anyway, assuming it has the lat=
est fixes<br>
&gt; I need, and doesn&#39;t give me the same build problem.=C2=A0 Thanks f=
or pointing it out.<br>
&gt; I&#39;ll give it a go.<br>
<br>
It&#39;s better to work with the Sumo version for your needs.=C2=A0 I just =
posted that as<br>
an example of openssl 1.0.2 being needed still by others, even as oe-core/Y=
octo<br>
Project have changed their defaults.<br></blockquote><div><br></div>I pulle=
d the whole openssl dir from your repo, added the layer.conf changes to my =
layer.conf and rebuilt openssl and my image.<br><br>Unfortunately, I still =
have no /usr/bin/openssl in my disk image. So I&#39;ve added the RPROVIDES =
from Andre&#39;s in a vain attempt to get it to work:<br><br>RPROVIDES_${PN=
} +=3D &quot;openssl-bin&quot;</div><div class=3D"gmail_quote"><br>... alth=
ough I&#39;m not hopeful it&#39;ll do the trick...</div><div class=3D"gmail=
_quote"><br><div></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
--Mark<br>
<br>
&gt; Thanks,<br>
&gt; Ryan.<br>
&gt; =C2=A0<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0--Mark<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; [2]=C2=A0<a href=3D"http://git.yoctoproject.or=
g/git/poky" rel=3D"noreferrer" target=3D"_blank">http://git.yoctoproject.or=
g/git/poky</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I&#39;m at SHA a616ffebdc, so I copied=C2=A0<a=
 href=3D"http://openssl_1.1.1d.bb" rel=3D"noreferrer" target=3D"_blank">ope=
nssl_1.1.1d.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://openssl_1.1.1d.bb" rel=3D"nor=
eferrer" target=3D"_blank">http://openssl_1.1.1d.bb</a>&gt; &lt;<a href=3D"=
http://openssl_1.1.1d.bb" rel=3D"noreferrer" target=3D"_blank">http://opens=
sl_1.1.1d.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; and all the other files in the directory.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; [3] I have a clone of Linaro&#39;s meta-backpo=
rts. I&#39;m trying to generate a<br>
&gt;=C2=A0 =C2=A0 =C2=A0patch to<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; submit for review there.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; <a href=3D"https://git.linaro.org/openembedded=
/meta-backports.git" rel=3D"noreferrer" target=3D"_blank">https://git.linar=
o.org/openembedded/meta-backports.git</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; <br>
</blockquote></div></div>

--000000000000ec67760597cde01e--
