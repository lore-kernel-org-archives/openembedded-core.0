Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id C87576A997
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 15:00:14 +0000 (UTC)
Received: by mail-lb0-f173.google.com with SMTP id v1so2757680lbd.18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 08:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=LamjZWTZKixvUuXOwzrOf/00p+wvTep9GtUZYWLQWJU=;
	b=T8tT4VrowYVcSqV1O9uKUkqAJ7xH5YRybv6phovpog6kO/OSGLm53pPVQwb3rpMQyP
	L2IXHbsVziM0p188VXMPcKEFp51uphVTl5y2IvyGEBjaCN7+5ch4sYetijrUPPcJxPUV
	EY6O5UOYCU23Ua4xjC4wijrQZKlTLTjsV2kDM2Wm9tJZYU63uYQKff1Zp93cDqiMr1Fy
	klHg62G4tro/FTCjynr+e/5ihCvvLRuxjLmYfS/iJpcsgWBZjk0jz8S9zAUXatyhMd3X
	P53RbTfJpRpv/OtvdS3SXq8irE8YpdP7hNVyydxQ1t5GD3PL62JXbrOnNwJlnPA65nO2
	zWfg==
X-Received: by 10.152.1.137 with SMTP id 9mr7623260lam.10.1370962814912; Tue,
	11 Jun 2013 08:00:14 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.4.66 with HTTP; Tue, 11 Jun 2013 07:59:54 -0700 (PDT)
In-Reply-To: <cover.1370960556.git.peter.seebach@windriver.com>
References: <cover.1370960556.git.peter.seebach@windriver.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 11 Jun 2013 07:59:54 -0700
X-Google-Sender-Auth: T94kKKT_p7HzoymAqY-IHLjwz6A
Message-ID: <CABcZANm9xYBFzmAdGqKFDQtLyL4H1zhdbew-MXoFqf9mck6mTw@mail.gmail.com>
To: Peter Seebach <peter.seebach@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] tmux new does not take tw commands
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
X-List-Received-Date: Tue, 11 Jun 2013 15:00:15 -0000
Content-Type: multipart/alternative; boundary=089e013c6a90954cfe04dee22778

--089e013c6a90954cfe04dee22778
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 11, 2013 at 7:28 AM, Peter Seebach
<peter.seebach@windriver.com>wrote:

> This got routed to me because the visible error message says
>         Execution of "pseudo /bin/bash" failed
>
> but actually it's nothing to do with pseudo. The real
> problem is that the tmux class in terminal.py is producing
> a string like:
>         'tmux new <args> {command}'
>
> This then gets .format called on it, substituting in a command. If
> the comand is "pseudo /bin/bash", this is:
>         'tmux new <args> pseudo /bin/bash'
> which is a usage error. It would be okay if it were:
>         'tmux new <args> "pseudo /bin/bash"'
>
> So add double quotes. Of course, that assumes that <command> never has
> double quotes in it... If it does, that may need a fancier solution.
>

 I'd suggest calling pipes.quote() on the value being passed into format().
-- 
Christopher Larson

--089e013c6a90954cfe04dee22778
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Jun 11, 2013 at 7:28 AM, Peter Seebach <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:peter.seebach@windriver.com" target=3D"_blank">peter.seebach@wi=
ndriver.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":296" style=3D"overflow:hidden">T=
his got routed to me because the visible error message says<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Execution of &quot;pseudo /bin/bash&quot; faile=
d<br>
<br>
but actually it&#39;s nothing to do with pseudo. The real<br>
problem is that the tmux class in terminal.py is producing<br>
a string like:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;tmux new &lt;args&gt; {command}&#39;<br>
<br>
This then gets .format called on it, substituting in a command. If<br>
the comand is &quot;pseudo /bin/bash&quot;, this is:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;tmux new &lt;args&gt; pseudo /bin/bash&#39=
;<br>
which is a usage error. It would be okay if it were:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;tmux new &lt;args&gt; &quot;pseudo /bin/ba=
sh&quot;&#39;<br>
<br>
So add double quotes. Of course, that assumes that &lt;command&gt; never ha=
s<br>
double quotes in it... If it does, that may need a fancier solution.</div><=
/blockquote><div><br></div><div>=C2=A0I&#39;d suggest calling pipes.quote()=
 on the value being passed into format().</div></div></div><div class=3D"gm=
ail_extra">

-- <br>Christopher Larson</div></div>

--089e013c6a90954cfe04dee22778--
