Return-Path: <ryan.harkin@linaro.org>
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2714F6C3E1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 13:15:41 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id n4so3629147qte.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 05:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nuHqm8ncWslqAyygXu3xyIJjKFauC83sWUv/8M9QBTU=;
	b=ck2gLAX/dRSbIAOUHP9kdaosiTGGOVTOeyghoxITzSsGYWeN7OW2L1VgGIuJNYDlJo
	YzF+gJdbbKyDcjxFofnICn+N5g67QWKywRM1MGq0B5IywllwvdA8jsxk7Spbk7AQO6eu
	RybndcXues64oSFS+746iKonkclWNCUHN7P/3HAd0gd1x9wxGk8fyFrxcNk5zhipHu+z
	7X8iXkRiKuWKHETEAGwhA3i/8bRcvImG8iS7XCt1z5L4qndPOxovGS0RRmRPKFcOloPr
	bzX69zd1J03L/E7lkUimvFIPBD6AnqcuR75aptL/O0kItNLSWrN/XaX9lXRKDu3YTeJ5
	HZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nuHqm8ncWslqAyygXu3xyIJjKFauC83sWUv/8M9QBTU=;
	b=IjS2CT2cJ3EwS0NFVxiU+zoEpqKuw34rSZh3MA2ajOouClGGFcllET0SPpCnCG4liu
	xV0+mz01cesxJj8KXk67hpawgdf8exk9fLCTkvsveqezWNz+8VtKffoTXL5Cvad638v1
	mvJn91kwmTTE0I1H1+XK7gXtb/uFj6jFJipN2XHWedsspzJAngC2H2SxFXGfOBXthXEx
	w946vpYXGyJCybTSbGevkQmJnUDnBzEGkaQV9cDzFCHG4AFbECknIZ8Yqt7dvhByNf7t
	GLYY3em63/T+Cx1QJphm7m6ZuZweoWcbMsDksCTTpkW5s4/vhOUBw00qokDqEbA+pOWh
	4tKg==
X-Gm-Message-State: APjAAAWXZkhPZU5GIfLJS+Zx11E76zQ0y0OrocZW9QEKLqc63JrfKr9E
	kl4taLnBbkWuK//QEGEkmarGbnXV3o+31QniuxOp9g==
X-Google-Smtp-Source: APXvYqyQSESK8vQe/hzZdwNz4JUB1WsUEXne3QN9A9ykMllGTZjpTRBRWRwmapuGAw2UatTWAfBxoJ3NhAJaOCh2VZQ=
X-Received: by 2002:ac8:2bd1:: with SMTP id n17mr1657820qtn.382.1574342142873; 
	Thu, 21 Nov 2019 05:15:42 -0800 (PST)
MIME-Version: 1.0
References: <CAD0U-hKudOEYkkPQQ1He3=Cg1hLqT7u5Uhsn_e2ZK0vGmo+z3w@mail.gmail.com>
	<5c9cb09a-e0b3-f43b-36cd-bc9a7df2dd6c@kernel.crashing.org>
	<CAD0U-hLzTxYw3F-tPbj5m1+iqW+2PZcU5n4bE1sxL9KxGmuVUw@mail.gmail.com>
	<31b224ae-8e1a-943c-0554-684557ef33bc@kernel.crashing.org>
	<CAD0U-hKMtXR+tvpS45D9=+XqaZVZBs7jMm9U3Vk7r+mJuVW5-A@mail.gmail.com>
	<CAD0U-hJ96imEfDwAyMQyjvABmaNYxEexQWNvpHJr+wsNzpGSbw@mail.gmail.com>
	<CAJ86T=Ucx125+XdRrpnh64km1WypAyyc1fUN5pWbjXzmUSXu3g@mail.gmail.com>
In-Reply-To: <CAJ86T=Ucx125+XdRrpnh64km1WypAyyc1fUN5pWbjXzmUSXu3g@mail.gmail.com>
From: Ryan Harkin <ryan.harkin@linaro.org>
Date: Thu, 21 Nov 2019 13:15:31 +0000
Message-ID: <CAD0U-h+RGNRr2omcsCdKkD7qsnbQiGqW3MzGc93ZtgmVXEagLA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
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
X-List-Received-Date: Thu, 21 Nov 2019 13:15:42 -0000
Content-Type: multipart/alternative; boundary="0000000000002e677d0597db18b2"

--0000000000002e677d0597db18b2
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Nov 2019 at 23:53, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Wed, Nov 20, 2019 at 2:41 PM Ryan Harkin <ryan.harkin@linaro.org>
> wrote:
> > On Wed, 20 Nov 2019 at 21:29, Ryan Harkin <ryan.harkin@linaro.org>
> wrote:
> >>
> >> I pulled the whole openssl dir from your repo, added the layer.conf
> changes to my layer.conf and rebuilt openssl and my image.
> >>
> >> Unfortunately, I still have no /usr/bin/openssl in my disk image. So
> I've added the RPROVIDES from Andre's in a vain attempt to get it to work:
> >>
> >> RPROVIDES_${PN} += "openssl-bin"
> >>
> >> ... although I'm not hopeful it'll do the trick...
> >
> > It didn't work. Once thing that's puzzling me: where is the package
> "openssl-bin"? I can only find references to it, but no package.
>
> The "openssl-bin" package is created by the openssl 1.1.x recipe.
>
> Adding "openssl-bin" to RPROVIDES in the openssl 1.0.2 recipe is a
> solution for users who are switching from openssl 1.1.x back to 1.0.2
> and have an image which is tries to include the new openssl-bin
> package. I don't think that's what you are trying to do (?).
>

Correct. I only tried it because the 1.0.2t recipe wasn't working.

To be clear - I have /usr/bin/openssl in my image when using 1.0.2p from
the Poky Sumo branch. When I add the 1.0.2t recipe to my own layer, openssl
builds without errors, but I don't get the binary.


> If you are using openssl 1.0.2 then the openssl command line tool is
> in the openssl package... so to include the openssl command line tool,
> add the "openssl" package to your image.
>
> If you are using openssl 1.1.x then the openssl command line tool is
> in the openssl-bin package... so to include the openssl command line
> tool, add the "openssl-bin" package to your image.
>
> But anyway, in all cases, the way to debug what's going on isn't to
> try random recipe changes and then rebuild the final image. Instead
> you should build your chosen version of openssl, look in the
> packages-split directory to see which package includes the openssl
> command line tool and then add that package to your image.
>

I don't have a packages-split. I was unaware of it, and reading the manual,
it seems I should have one. But I don't. Running 'bitbake -e openssl | grep
"PKGDEST="' tells me I should have one, but there are no instances in a
directory called "packages-split" in my tmp dir.

Anyway, I'm giving up for now. I'll come back to another time... or more
likely, get someone smarter than me to sort it out ;-)

--0000000000002e677d0597db18b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, 20 Nov 2019 at 23:53, Andre M=
cCurdy &lt;<a href=3D"mailto:armccurdy@gmail.com">armccurdy@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed=
, Nov 20, 2019 at 2:41 PM Ryan Harkin &lt;<a href=3D"mailto:ryan.harkin@lin=
aro.org" target=3D"_blank">ryan.harkin@linaro.org</a>&gt; wrote:<br>
&gt; On Wed, 20 Nov 2019 at 21:29, Ryan Harkin &lt;<a href=3D"mailto:ryan.h=
arkin@linaro.org" target=3D"_blank">ryan.harkin@linaro.org</a>&gt; wrote:<b=
r>
&gt;&gt;<br>
&gt;&gt; I pulled the whole openssl dir from your repo, added the layer.con=
f changes to my layer.conf and rebuilt openssl and my image.<br>
&gt;&gt;<br>
&gt;&gt; Unfortunately, I still have no /usr/bin/openssl in my disk image. =
So I&#39;ve added the RPROVIDES from Andre&#39;s in a vain attempt to get i=
t to work:<br>
&gt;&gt;<br>
&gt;&gt; RPROVIDES_${PN} +=3D &quot;openssl-bin&quot;<br>
&gt;&gt;<br>
&gt;&gt; ... although I&#39;m not hopeful it&#39;ll do the trick...<br>
&gt;<br>
&gt; It didn&#39;t work. Once thing that&#39;s puzzling me: where is the pa=
ckage &quot;openssl-bin&quot;? I can only find references to it, but no pac=
kage.<br>
<br>
The &quot;openssl-bin&quot; package is created by the openssl 1.1.x recipe.=
<br>
<br>
Adding &quot;openssl-bin&quot; to RPROVIDES in the openssl 1.0.2 recipe is =
a<br>
solution for users who are switching from openssl 1.1.x back to 1.0.2<br>
and have an image which is tries to include the new openssl-bin<br>
package. I don&#39;t think that&#39;s what you are trying to do (?).<br></b=
lockquote><div><br></div><div>Correct. I only tried it because the 1.0.2t r=
ecipe wasn&#39;t working.</div><div><br></div><div>To be clear - I have /us=
r/bin/openssl in my image when using 1.0.2p from the Poky Sumo branch. When=
 I add the 1.0.2t recipe to my own layer, openssl builds without errors, bu=
t I don&#39;t get the binary.</div><div><br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
<br>
If you are using openssl 1.0.2 then the openssl command line tool is<br>
in the openssl package... so to include the openssl command line tool,<br>
add the &quot;openssl&quot; package to your image.<br>
<br>
If you are using openssl 1.1.x then the openssl command line tool is<br>
in the openssl-bin package... so to include the openssl command line<br>
tool, add the &quot;openssl-bin&quot; package to your image.<br>
<br>
But anyway, in all cases, the way to debug what&#39;s going on isn&#39;t to=
<br>
try random recipe changes and then rebuild the final image. Instead<br>
you should build your chosen version of openssl, look in the<br>
packages-split directory to see which package includes the openssl<br>
command line tool and then add that package to your image.<br></blockquote>=
<div><br></div><div>I don&#39;t have a packages-split. I was unaware of it,=
 and reading the manual, it seems I should have one. But I don&#39;t. Runni=
ng &#39;bitbake -e openssl | grep &quot;PKGDEST=3D&quot;&#39; tells me I sh=
ould have one, but there are no instances in a directory called &quot;packa=
ges-split&quot; in my tmp dir.</div><div>=C2=A0</div><div>Anyway, I&#39;m g=
iving up for now. I&#39;ll come back to another time... or more likely, get=
 someone smarter than me to sort it out ;-)</div></div></div>

--0000000000002e677d0597db18b2--
