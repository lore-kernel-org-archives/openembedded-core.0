Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
	[209.85.222.65])
	by mail.openembedded.org (Postfix) with ESMTP id E54AA7E668
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 11:25:16 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id b41so4729638uad.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 04:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zj72/ZSr2pDDYsYvzmWowclmeOyz4/VLfirVsm2Z8vc=;
	b=FKHS7DeUCgNThll1+mzGrgSjQvpZRXLftGsbzfT1b3hUyIk7IHMwgjaqkizEfF75QE
	0GN1ta5oS5TsfDlRGSsFAbcunfFKKCxDbBhYDKZn7vx9rRvBm2GjTC2rMcAF8gSVa7kD
	/BvyniZ+HNOU1vys1RsEVFbhyP8XRJiMsn/IfgM5XAXw5ReUF9Dd6NhXb4z5Qd3YWsbJ
	vot4FiTQvSJJpmsDn04VbhToot0s5gedmQRhWio9Ya0tyG00ptl3Sa5FeIbzrOzuexS4
	7eqyabBsWIq377KWzWg0cC3oYl1ocL6JtRigw6SR0AUU9eJXgL1s5H22vDfm8Zb+UKt4
	+HoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zj72/ZSr2pDDYsYvzmWowclmeOyz4/VLfirVsm2Z8vc=;
	b=gg9e8XNmYyj5QXCnFk4I3PlX/1DCfnBJtc0flumhWkbvpcWjwlkJ0tCfVpCLBJgWSX
	UrRaVlaJnnCYLxoDSzyVfnpRm91hDTSqvz3WWeqmCldH4Po1eCa8QXocfY7YlzMg0qNH
	h54wDJrRUbAFbdnlINOMdzMtb8O8p5hpToyCciH+hfYR1WzGKvf81NkzaCb2HSEfcWRJ
	kVlyMP9rgkprlpXTluZ8fCXGJ3qO7K00ktcO93XMvTWefIVy7m5DzunFMlB0565ntYV2
	ijXiWCv/8cqSGIItPIdRj6y0wZENR0qV3y8LwzticjqOLCy89Ufz+nzCgVD3Yf9U0Nx8
	ievQ==
X-Gm-Message-State: APjAAAVExHErbDHXAUjAwtui8mdrp+TS75XtS9wpsa3og1baX6Q0s9A0
	mdy7W5UzEmJwICJz+Ng5mdpDtu7IzuGvhvZSFms=
X-Google-Smtp-Source: APXvYqzNA5aJnF6RLIfhDUmb1AdTIOfelaPVTc10pJWqafpbljiWzxU83qqEnedu/5Ni5qFVaZ/ndz9B8+kXLxpafGQ=
X-Received: by 2002:ab0:70b1:: with SMTP id q17mr1345092ual.100.1565781917690; 
	Wed, 14 Aug 2019 04:25:17 -0700 (PDT)
MIME-Version: 1.0
References: <fcc15178e58e4ef0a8e2cf3047109bd5@xbox06.axis.com>
	<33bca828a78daaefc32fe497e7f244e3208bc968.camel@linuxfoundation.org>
	<2a106fcffc331009abdb6498ffe8c4f3c99ee80b.camel@linuxfoundation.org>
In-Reply-To: <2a106fcffc331009abdb6498ffe8c4f3c99ee80b.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 14 Aug 2019 13:25:06 +0200
Message-ID: <CANNYZj9HHxJa5NKWU9r09NXgBy8aD0RTkugQ-k6esVNCTVOa6w@mail.gmail.com>
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
X-List-Received-Date: Wed, 14 Aug 2019 11:25:17 -0000
Content-Type: multipart/alternative; boundary="000000000000ffeea505901202ee"

--000000000000ffeea505901202ee
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Aug 2019 at 21:18, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> I had a glance at the profile output from master-next and the problem
> wasn't where I thought it would be, it was in the scheduler code. That
> is good as those classes are effectively independent of the other
> changes and hence are a separate fix.
>
> I've put a patch in -next which takes the above test to 36s which is
> close to the older bitbake.
>
> Could be interesting to see how it looks for others and different
> workloads.
>

I just tried the same test I did yesterday with
ab56d466452148e5fce330d279d13e2495eceb1f. Unfortunately it doesn't seem to
improve things much: bitbake is stuck at "NOTE: Executing Tasks" for 15
minutes now.

Alex

--000000000000ffeea505901202ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 13 Aug 2019 at 21:18, Richard Pur=
die &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdi=
e@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">I had a glance at the profi=
le output from master-next and the problem<br>
wasn&#39;t where I thought it would be, it was in the scheduler code. That<=
br>
is good as those classes are effectively independent of the other<br>
changes and hence are a separate fix.<br>
<br>
I&#39;ve put a patch in -next which takes the above test to 36s which is<br=
>
close to the older bitbake.<br>
<br>
Could be interesting to see how it looks for others and different<br>
workloads.<br></blockquote><div><br></div><div>I just tried the same test I=
 did yesterday with ab56d466452148e5fce330d279d13e2495eceb1f. Unfortunately=
 it doesn&#39;t seem to improve things much: bitbake is stuck at &quot;NOTE=
: Executing Tasks&quot; for 15 minutes now.</div><div><br></div><div>Alex<b=
r> </div></div></div>

--000000000000ffeea505901202ee--
