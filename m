Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id EB7D67E8B7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 13:20:46 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id 190so3819409vsf.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 06:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CyMlT4kcNwAba/bcxfHp7i09WHe+L9g8CHB6Iu7YBPM=;
	b=I6ASR58vFiA2V1gGIXbHwxyfhkAp/zydJ3w1nTi11AZPMyMYkKuk2qDY5L1kC8oNTp
	WvZW8asuccrn/zHBULIBEc4NsVr17fubxhyofB2We+0+egEAhIKKphBXkA1EBDhsBvbU
	J51L1gyeoCO1dy1JFkrK06ObpVvZM5tlA2V8akPP+r5tda1QLgbcrDkHw/1QRif2WrKV
	vzbs3aX+dv4Vt68AHTjDf7p0/tYqz5v1j6cXfT9syb+dj0D54IRmDa/2I78DG95+BK9s
	OhzlCyDjH17wJ1McIy6qElSmZ65k8Fmpb2gQi2i7hPlA4MNNEk2zEWAlDeh6wUhAf77Y
	mOFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CyMlT4kcNwAba/bcxfHp7i09WHe+L9g8CHB6Iu7YBPM=;
	b=WC0+zl/UrGf/Qk6+GmrXXLS7EUfiZfp/LJqF9++1u6oeDeaDwA3ytQoYf6W86OztRQ
	uIHEjKc1TWGlKauSiAIDlzuh3fPpYs3Ngcs5e45hQg4yyW/vou518ivAQU0AsBhw4mRU
	fiucdD51Fv/KEUcLJKCJ1PiMTUlw1l7QpvxV9Wli3tSwQP6Y2aoE/jEhnKCeOtWsma3V
	jPMhEVOAK9slolpKBYcaWTmJIV5vSH1p1fqNr+8YeU5UOeg/MY4+8K8obqfSyLpUloSF
	+C9aSeNP0Bo5PHNisJC1uKcVKt7do7ZRQYFWbRZ2RE2+DQSnNJgr/l6CoqifLt5Jer0s
	skAg==
X-Gm-Message-State: APjAAAXnqJsDTE67YbQUlxVYasKoiQJH+AGtaVNYhN84+IhDj1iHfN+r
	byWVEQFwGAqYq1ebDFhiMd4mF6ffE692OHEFcPI=
X-Google-Smtp-Source: APXvYqzX79RJRr89E+qWjz3o/EJnB86tt5aJAPWKWGCvtVlGlMG+KPEpYMx9MVkDxt0PQOikZr4EwDBuXSkUIpT4wqM=
X-Received: by 2002:a67:62c5:: with SMTP id w188mr9269021vsb.25.1565702447755; 
	Tue, 13 Aug 2019 06:20:47 -0700 (PDT)
MIME-Version: 1.0
References: <fcc15178e58e4ef0a8e2cf3047109bd5@xbox06.axis.com>
	<33bca828a78daaefc32fe497e7f244e3208bc968.camel@linuxfoundation.org>
In-Reply-To: <33bca828a78daaefc32fe497e7f244e3208bc968.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 13 Aug 2019 15:20:36 +0200
Message-ID: <CANNYZj9W_9o2DqFoT1q_xmuFQM=-WUgdJzJu1ViMhpdWHM-8CQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Long delays with latest bitbake (was: [PATCH 1/7] insane.bbclass: in file-rdeps do not look into RDEPENDS recursively)
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
X-List-Received-Date: Tue, 13 Aug 2019 13:20:47 -0000
Content-Type: multipart/alternative; boundary="00000000000038f528058fff82e7"

--00000000000038f528058fff82e7
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Aug 2019 at 11:04, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> We talked on irc and you pointed at the commit things started to go
> wrong. Just to summarise things for the benefit of the list, this is
> some quick testing I did:
>
> "bitbake -p; time bitbake core-image-minimal -n"
>
> 30.0s 6c7c0cefd34067311144a1d4c01986fe0a4aef26
> 30.6s a0d941c787cf3ef030d190903279d311bc05d752
> 40.3s 7df31ff36892c2f9c65326b06b4c70
> 42.2s a0542ed3ff700eca35f9195f743c9e28bcd50f3e
> 45.4s 9983b07fffd19082abded7c3f15cc77d306dd69c
> 76.9s master-next
>
> So basically the original changes showed a 25% hit but the performance
> of -next is dire.
>

Sadly with larger sets the performance hit is much worse. I enabled all of
the layers in meta-oe, and ran this with empty sstate and build directories:
bitbake -p; time bitbake -n -k world

The outcomes are:

6c7c0cefd34067311144a1d4c01986fe0a4aef26
12m51,848s
(this is the baseline; the bulk of the time goes towards going through the
task list without executing the tasks - the 'spinning task counter" part)

9983b07fffd19082abded7c3f15cc77d306dd69c
66m29,563s

So there could be something quadratically-growing going on with these new
commits :(

I didn't dare to try master-next after seeing above how it hits
core-image-minimal and master already regressing to over an hour :-(

Alex

--00000000000038f528058fff82e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Tue, 13 Aug 2019 at 11:04, Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.pu=
rdie@linuxfoundation.org</a>&gt; wrote:<br><div class=3D"gmail_quote"><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">We talked on irc and you point=
ed at the commit things started to go<br>
wrong. Just to summarise things for the benefit of the list, this is<br>
some quick testing I did:<br>
<br>
&quot;bitbake -p; time bitbake core-image-minimal -n&quot;<br>
<br>
30.0s 6c7c0cefd34067311144a1d4c01986fe0a4aef26<br>
30.6s a0d941c787cf3ef030d190903279d311bc05d752<br>
40.3s 7df31ff36892c2f9c65326b06b4c70 <br>
42.2s a0542ed3ff700eca35f9195f743c9e28bcd50f3e <br>
45.4s 9983b07fffd19082abded7c3f15cc77d306dd69c <br>
76.9s master-next<br>
<br>
So basically the original changes showed a 25% hit but the performance<br>
of -next is dire.<br></blockquote><div><br></div><div>Sadly with larger set=
s the performance hit is much worse. I enabled all of the layers in meta-oe=
, and ran this with empty sstate and build directories:<br></div><div></div=
><div>bitbake -p; time bitbake -n -k world <br></div><div><br></div><div>Th=
e outcomes are:</div><div></div><div><div dir=3D"ltr"><br></div><div dir=3D=
"ltr">6c7c0cefd34067311144a1d4c01986fe0a4aef26<br></div><div dir=3D"ltr">12=
m51,848s</div>(this is the baseline; the bulk of the time goes towards goin=
g through the task list without executing the tasks - the &#39;spinning tas=
k counter&quot; part)<br></div><div><br></div><div>9983b07fffd19082abded7c3=
f15cc77d306dd69c</div><div>66m29,563s</div><div><br></div><div>So there cou=
ld be something quadratically-growing going on with these new commits :(<br=
></div><div><br></div><div>I didn&#39;t dare to try master-next after seein=
g above how it hits core-image-minimal and master already regressing to ove=
r an hour :-(</div><div><br></div><div>Alex<br> </div></div>
</div>

--00000000000038f528058fff82e7--
