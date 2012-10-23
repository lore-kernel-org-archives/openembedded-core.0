Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1TQgY3-0005Yf-QY
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 17:37:43 +0200
Received: by mail-oa0-f47.google.com with SMTP id h1so3668031oag.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2012 08:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ionnfHvGXTWz+jCTQ3p4o2cx1RpYE8xtBTNH7ZWum3M=;
	b=k3UK3Fzsf/89Zo/c+++yGB3zJpIBI0ha8R3UtNZc6qmOLcExin+B9V1rI1EMnUh01H
	kyO8bCwkQnds2qdNbose2CceMmkFkuaQfphbSLVXC9EzJqNcp9KTZ0s1os07UdptuRgH
	PY5WcXQjdqFZAmNTpj5u/165ju+RqRt4F6rwwmfXFPv8WZMezGeBAhsn7Q5Xt75oIbQj
	szOyvQoF7W4vfHIdjV1yep5Ojn0M+ONfs6NcQaeya/YbqBsRCYBazQsdjZHfplJd1Pai
	tiybbU6LPbfxMpuneMQk0BUwKixB+sVmqb1ugPw4Xk0pcyj7j/6pCdabmMQ5Em4Motn+
	tM+g==
MIME-Version: 1.0
Received: by 10.60.29.3 with SMTP id f3mr11214639oeh.97.1351005857287; Tue, 23
	Oct 2012 08:24:17 -0700 (PDT)
Received: by 10.60.123.47 with HTTP; Tue, 23 Oct 2012 08:24:17 -0700 (PDT)
In-Reply-To: <1351005775.3259.350.camel@phil-desktop>
References: <CAOHjBZtTso5LuxjUX=Y+z7UNwnBLKo2rsYRs1oOyMeNfc5oTJg@mail.gmail.com>
	<1351005775.3259.350.camel@phil-desktop>
Date: Tue, 23 Oct 2012 17:24:17 +0200
Message-ID: <CAOHjBZv1k=_fHmJ2DCiYrCf1TYRJgG17MwdRtObfKWB89AY4ug@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Phil Blundell <philb@gnu.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: add init applet to busybox
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Oct 2012 15:37:44 -0000
Content-Type: multipart/alternative; boundary=e89a8fb20278368fb804ccbb903e

--e89a8fb20278368fb804ccbb903e
Content-Type: text/plain; charset=ISO-8859-1

Well, many thanks Phil for your fast reply.

Cheers,
Giuseppe

2012/10/23 Phil Blundell <philb@gnu.org>

> On Tue, 2012-10-23 at 17:22 +0200, Giuseppe Condorelli wrote:
> > I need to enable init applet in the current version of busybox.
> > Do I have to create my own defconfig to pass via .bbappend file
>
> That's probably the best approach, yes.
>
> p.
>
>
>
>

--e89a8fb20278368fb804ccbb903e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Well, many thanks Phil for your fast reply.</div><div>=A0</div><div>Ch=
eers,</div><div>Giuseppe<br><br></div><div class=3D"gmail_quote">2012/10/23=
 Phil Blundell <span dir=3D"ltr">&lt;<a href=3D"mailto:philb@gnu.org" targe=
t=3D"_blank">philb@gnu.org</a>&gt;</span><br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-=
color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=
=3D"gmail_quote"><div class=3D"im">On Tue, 2012-10-23 at 17:22 +0200, Giuse=
ppe Condorelli wrote:<br>

&gt; I need to enable init applet in the current version of busybox.<br>
&gt; Do I have to create my own defconfig to pass via .bbappend file<br>
<br>
</div>That&#39;s probably the best approach, yes.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
p.<br>
<br>
<br>
<br>
</font></span></blockquote></div><br>

--e89a8fb20278368fb804ccbb903e--
