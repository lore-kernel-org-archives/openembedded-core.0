Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SoAQo-0004Vl-HS
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 11:39:02 +0200
Received: by ghbz2 with SMTP id z2so9179069ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2012 02:27:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=LOEffNMzauQIGJSQvIZiMbkCF+2pqd+ubxLSNWG9P9E=;
	b=Ps3GsZ0/cyFGjsV7L7uEXBaXR4ojkl8bzyrIhCgH/jJwUSVDsG7omdNGNeja3rTiPd
	8NRGAQibaPqDrlVe9ChCEdaHq3R5pjLXQnl7X7j1YZ10e81n8r1B3kcy8Yhaf1gm+bNT
	ue6XyBovPYlCI5SLB55TkCzARrcyB5K+tanEGUqZJF6bBFV/Bzl90BipgL4LgWS56lKL
	CLnFQZ3Fvsu8ORYeMxdP5QZ4vip2oKQ+WYdX3IGx6XyHmjnzYVwfpe0H7kChx4cjwjlG
	FZFRveRsUU5aHPFRKLc0gbpVACl/Iygyq+Hmhf/RXkGmMUa31fVOzK/MiYVDnrTTH/At
	LvJg==
Received: by 10.43.59.71 with SMTP id wn7mr8965281icb.0.1341826072931; Mon, 09
	Jul 2012 02:27:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.98.162 with HTTP; Mon, 9 Jul 2012 02:27:32 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <alpine.DEB.2.02.1207070649530.18262@oneiric>
References: <alpine.DEB.2.02.1207070649530.18262@oneiric>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Mon, 9 Jul 2012 12:27:32 +0300
Message-ID: <CAK18fxGjWFXQ4C40QgmCnk5G3PucaN4JzDAsDhMb4m6+pxNxzg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQl0qPgsYKvab0PSkjCTcqP7crkTgJAcffVKX4fjKrUEQzjMsctHcvQiUbcouBfUdpN12fHO
Subject: Re: tcf-agent, matchbox-wm-2: Correct "proto=git" to "protocol=git".
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Jul 2012 09:39:02 -0000
Content-Type: multipart/alternative; boundary=bcaec51ddaa76d6ef404c4623a78

--bcaec51ddaa76d6ef404c4623a78
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Jul 7, 2012 at 1:54 PM, Robert P. J. Day <rpjday@crashcourse.ca>wrote:

>
> "proto=git" is not a valid parameter for the git fetcher.
>
> NOTE: package
matchbox-wm-2-0.1+git1+01fa5465743c9ee43d040350f4405d35293e4869-r1: task
do_fetch: Succeeded

Anyway, in the git.py, code is searching for "protocol" parameter:
*ud.proto = ud.parm['protocol']*
*
*
... so your change seems legit.

On another hand, svn.py is using:
* proto = ud.parm.get('proto', 'svn')*

A good think would be to use the same parameter names for all protocols.

@g

--bcaec51ddaa76d6ef404c4623a78
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Sat, Jul 7, 2012 at 1:54 PM, Robert P. J. Day=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:rpjday@crashcourse.ca" target=3D"_=
blank">rpjday@crashcourse.ca</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">

<br>
&quot;proto=3Dgit&quot; is not a valid parameter for the git fetcher.<br><b=
r></blockquote><div>NOTE: package matchbox-wm-2-0.1+git1+01fa5465743c9ee43d=
040350f4405d35293e4869-r1: task do_fetch: Succeeded=A0</div><div><br></div>

<div>Anyway, in the git.py, code is searching for &quot;protocol&quot; para=
meter:</div><div><i>ud.proto =3D ud.parm[&#39;protocol&#39;]</i></div><div>=
<i><br></i></div><div>... so your change seems legit.=A0</div><div><br></di=
v>

<div>On another hand, svn.py is using:</div><div><i>=A0proto =3D ud.parm.ge=
t(&#39;proto&#39;, &#39;svn&#39;)</i></div><div><br></div><div>A good think=
 would be to use the same parameter names for all protocols.=A0</div><div><=
br>

</div><div>@g</div></div>

--bcaec51ddaa76d6ef404c4623a78--
