Return-Path: <ryan.harkin@linaro.org>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 415447F836
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 19:06:16 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id r20so664535qtp.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 11:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ANsyXe30OIC9PHxWm6QxQe8R8I6E4Me9X4pp+9YObho=;
	b=fSCuO5fUJ/H/m4faONXEBPpeuXgTdTeKHuK1eNMlQmOBb4ZV98aPpTTFY3pLDSK7Ks
	6pcSGCfAe6gTlx+5mPiu9ZtrwZ23TYIyQDgFxudea2gHgX2tuoHRUs8S5oT7yYz+LXXs
	NleuAz7IffVy/s274c2yWbF5ZEkwdf3EFhiXRwakZRPNo9xDOBWZ5Q5LV6k9d3TrdGdQ
	O6sLfSr+yiBEhOM1hWvq3HhrgrPkYhHUqHEXEhvwr15D5xkNzsUvErgZw/ROZnsgRpds
	ymwHbvd1+5Kx69hb3A9rGOiqG5xhUR8bDd3vk5+b9L99+PYVMnnl0r/QW15tIwGgGWen
	qPWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ANsyXe30OIC9PHxWm6QxQe8R8I6E4Me9X4pp+9YObho=;
	b=nHZfVodf/4lGyhCj0x4+jRC1RMA3I34M/ksw0bAOsHVwQvrAgwg73KMeJNFbS6Ow4D
	UlhBYHzHdMXkWOQuRTwz3yJ6qnApZ8ia0YDOO6gdgDsEDWuweUrP58QTLbZWTSLgdWdQ
	SPPI51gg0uYtFul1ekGDEvCKbG3eAYFu3H8is1dM9LssTcvIYg6ZnePc1Obu5NI78eE4
	A4/gjkSzlbcpl4Sw/rK8oAXed5JYCxjwJN9Ng2HRR3mgbO+2HZQ2wDx9DI6Fdh8YT6ov
	KUBezpibQWb9hU5502VM1O3NGn7W7q0DlAAjZ2IDAtC+UIdZfdmogTvN02T7xd6xdjWj
	Rzuw==
X-Gm-Message-State: APjAAAVEYWgNTgcPE2rC1S3Xgp7DF0zdeSOLTtrcQLM7iRQACnrtclEd
	9Lym3Ib2GSDyLhI3PtQRVXC1EZH5a4Pt0IoC1qu79w==
X-Google-Smtp-Source: APXvYqwt85tv39nXocX6AHLJRO4JKQuAz2PfK+KrLlfchvAUgd7Il0ZeMDs0zIzAmjf8ZRBdSMI1mpMk+O7bnozMgqM=
X-Received: by 2002:ac8:177c:: with SMTP id u57mr4036213qtk.216.1574276777119; 
	Wed, 20 Nov 2019 11:06:17 -0800 (PST)
MIME-Version: 1.0
References: <CAD0U-hKudOEYkkPQQ1He3=Cg1hLqT7u5Uhsn_e2ZK0vGmo+z3w@mail.gmail.com>
	<5c9cb09a-e0b3-f43b-36cd-bc9a7df2dd6c@kernel.crashing.org>
In-Reply-To: <5c9cb09a-e0b3-f43b-36cd-bc9a7df2dd6c@kernel.crashing.org>
From: Ryan Harkin <ryan.harkin@linaro.org>
Date: Wed, 20 Nov 2019 19:06:04 +0000
Message-ID: <CAD0U-hLzTxYw3F-tPbj5m1+iqW+2PZcU5n4bE1sxL9KxGmuVUw@mail.gmail.com>
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
X-List-Received-Date: Wed, 20 Nov 2019 19:06:16 -0000
Content-Type: multipart/alternative; boundary="0000000000001459530597cbe051"

--0000000000001459530597cbe051
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Nov 2019 at 18:36, Mark Hatle <mark.hatle@kernel.crashing.org>
wrote:

>
>
> On 11/20/19 12:18 PM, Ryan Harkin wrote:
> > Hi all,
> >
> > I'm struggling with backporting OpenSSL to my Sumo build [1], so
> wondered if
> > anyone else had done something similar with success.
> >
> > I copied "meta/recipes-connectivity/openssl" from Poky master branch [2]
> into my
> > own layer [3]. It didn't pick up, so I discovered I needed to add
> > a PREFERRED_VERSION, eg:
> >
> > +PREFERRED_VERSION_openssl ?= "1.1.%"
> > +PREFERRED_VERSION_openssl-native ?= "1.1.%"
> > +PREFERRED_VERSION_nativesdk-openssl ?= "1.1.%"
> >
> > Now it builds fine. However, I no longer have /usr/bin/openssl in my
> disk image.
> >
> > It doesn't appear in FILES_${PN}, and adding it to the recipes doesn't
> seem to
> > make any difference.
> >
> > What am I missing?
> >
> > Thanks,
> > Ryan.
> >
> > [1] I'm looking for CVE fixes, 1.0.2p has a lot of CVEs.
>
> You know that 1.0.2 and 1.1 APIs are not compatible?  So you will need to
> update
> everything that needs OpenSSL to understand the new API.
>

So far, we're only using it in a shell script to sign an image and later
verify the image, so I've assumed, perhaps naively, that the API changes
won't matter...

>
> For CVE fixes, typically you would patch 1.0.2p, or update to the latest
> (1.0.2t) as you go.  (If you have an OSV, this should be part of the
> services
> that they offer you.)


> In my opinion, 1.0.2 will be around for at least another 4-5 years due to
> the
> number of people actively using it in the world.  Until 1.1/3.0 (won't be
> a 2.0
> from what I read) exists and has a FIPS-140-2 support available -- people
> will
> continue to use 1.0.2 and maintain it as necessary for security.
>
> As an FYI:  http://git.yoctoproject.org/cgit/cgit.cgi/meta-openssl102/
>
> This version is for thud, warrior, zeus and master.  It is intended to be
> maintained until either 1.0.2 is no longer maintainable -- or the
> FIPS-140-2
> needs have been met by OpenSSL.
>

Great, that looks like a better option anyway, assuming it has the latest
fixes I need, and doesn't give me the same build problem.  Thanks for
pointing it out. I'll give it a go.

Thanks,
Ryan.


>
> --Mark
>
> > [2] http://git.yoctoproject.org/git/poky
> > I'm at SHA a616ffebdc, so I copied openssl_1.1.1d.bb <
> http://openssl_1.1.1d.bb>
> > and all the other files in the directory.
> >
> > [3] I have a clone of Linaro's meta-backports. I'm trying to generate a
> patch to
> > submit for review there.
> > https://git.linaro.org/openembedded/meta-backports.git
> >
>

--0000000000001459530597cbe051
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, 20 Nov 2019 at 18:36, Mark Ha=
tle &lt;<a href=3D"mailto:mark.hatle@kernel.crashing.org">mark.hatle@kernel=
.crashing.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><br>
<br>
On 11/20/19 12:18 PM, Ryan Harkin wrote:<br>
&gt; Hi all,<br>
&gt; <br>
&gt; I&#39;m struggling with backporting OpenSSL to my Sumo build [1], so w=
ondered if<br>
&gt; anyone else had done something similar with success.<br>
&gt; <br>
&gt; I copied &quot;meta/recipes-connectivity/openssl&quot; from Poky maste=
r branch [2] into my<br>
&gt; own layer [3]. It didn&#39;t pick up, so I discovered I needed to add<=
br>
&gt; a=C2=A0PREFERRED_VERSION, eg:<br>
&gt; <br>
&gt; +PREFERRED_VERSION_openssl ?=3D &quot;1.1.%&quot;<br>
&gt; +PREFERRED_VERSION_openssl-native ?=3D &quot;1.1.%&quot;<br>
&gt; +PREFERRED_VERSION_nativesdk-openssl ?=3D &quot;1.1.%&quot;<br>
&gt; <br>
&gt; Now it builds fine. However, I no longer have /usr/bin/openssl in my d=
isk image.<br>
&gt; <br>
&gt; It doesn&#39;t appear in FILES_${PN}, and adding it to the recipes doe=
sn&#39;t seem to<br>
&gt; make any difference.<br>
&gt; <br>
&gt; What am I missing?<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Ryan.<br>
&gt; <br>
&gt; [1] I&#39;m looking for CVE fixes, 1.0.2p has a lot of CVEs.<br>
<br>
You know that 1.0.2 and 1.1 APIs are not compatible?=C2=A0 So you will need=
 to update<br>
everything that needs OpenSSL to understand the new API.<br></blockquote><d=
iv><br></div><div>So far, we&#39;re only using it in a shell script to sign=
 an image and later verify the image, so I&#39;ve assumed, perhaps naively,=
 that the API changes won&#39;t matter...</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
<br>
For CVE fixes, typically you would patch 1.0.2p, or update to the latest<br=
>
(1.0.2t) as you go.=C2=A0 (If you have an OSV, this should be part of the s=
ervices<br>
that they offer you.)=C2=A0</blockquote><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<br>
In my opinion, 1.0.2 will be around for at least another 4-5 years due to t=
he<br>
number of people actively using it in the world.=C2=A0 Until 1.1/3.0 (won&#=
39;t be a 2.0<br>
from what I read) exists and has a FIPS-140-2 support available -- people w=
ill<br>
continue to use 1.0.2 and maintain it as necessary for security.<br>
<br>
As an FYI:=C2=A0 <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-=
openssl102/" rel=3D"noreferrer" target=3D"_blank">http://git.yoctoproject.o=
rg/cgit/cgit.cgi/meta-openssl102/</a><br>
<br>
This version is for thud, warrior, zeus and master.=C2=A0 It is intended to=
 be<br>
maintained until either 1.0.2 is no longer maintainable -- or the FIPS-140-=
2<br>
needs have been met by OpenSSL.<br></blockquote><div><br></div><div>Great, =
that looks like a better option anyway, assuming it has the latest fixes I =
need, and doesn&#39;t give me the same build problem.=C2=A0 Thanks for poin=
ting it out. I&#39;ll give it a go.</div><div><br></div><div>Thanks,</div><=
div>Ryan.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
--Mark<br>
<br>
&gt; [2]=C2=A0<a href=3D"http://git.yoctoproject.org/git/poky" rel=3D"noref=
errer" target=3D"_blank">http://git.yoctoproject.org/git/poky</a><br>
&gt; I&#39;m at SHA a616ffebdc, so I copied=C2=A0<a href=3D"http://openssl_=
1.1.1d.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1d.bb</a> &lt;<=
a href=3D"http://openssl_1.1.1d.bb" rel=3D"noreferrer" target=3D"_blank">ht=
tp://openssl_1.1.1d.bb</a>&gt;<br>
&gt; and all the other files in the directory.<br>
&gt; <br>
&gt; [3] I have a clone of Linaro&#39;s meta-backports. I&#39;m trying to g=
enerate a patch to<br>
&gt; submit for review there.<br>
&gt; <a href=3D"https://git.linaro.org/openembedded/meta-backports.git" rel=
=3D"noreferrer" target=3D"_blank">https://git.linaro.org/openembedded/meta-=
backports.git</a><br>
&gt; <br>
</blockquote></div></div>

--0000000000001459530597cbe051--
