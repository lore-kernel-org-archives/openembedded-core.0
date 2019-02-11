Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f172.google.com (mail-it1-f172.google.com
	[209.85.166.172])
	by mail.openembedded.org (Postfix) with ESMTP id A3BC979980
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 12:29:04 +0000 (UTC)
Received: by mail-it1-f172.google.com with SMTP id r11so20415249itc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 04:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OKASGjfjQifRPbySR5Q+tftHQ05Rt64zpjhWZNcl+v8=;
	b=p2YwIuDtD7kmnqjPF73abKt24mvZhjEvrDMoEbFExZ+3yqGdbAqFM5ifV7osAdePfC
	LP2HK1f9Gq7B+ok3VhBWTu+VBN8sd+y7Aajzx2CGnRADXX54f1Az4QxX9etHqeSyd28J
	viPqRL4pwxXgbu5Tr5HA0xu+cB5G3hVvpoEVSD8rBiJrtVoGGusk+7RUOoBOHAIQmP+n
	h2w2suKgFBlTg0U6ayEqVzraANwDehuzpcxWA+RJBlKRTQnY/GoFuCK1sbrTRAtqJRty
	j8oIdWQn5kUl4tTcIrcjrfpfQisc1CIvGSUwuZ78oOrpap3Ej0EmZPJqLol33HOGSdVX
	Mx5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OKASGjfjQifRPbySR5Q+tftHQ05Rt64zpjhWZNcl+v8=;
	b=Ja/sYt1JIucCmUDEZEEbUKXDaOqxCCa1Q3+bzgfalHNkCJcK8qYFx+lAtxqHpez/jE
	J27PojceU3VLOSMJ9sh0WDrBQ+2tcyelv+fX/b3Wp/prpSHo6zRpjA1/f3NNEH/O0Eql
	vwfv7GCtdXx/Z7mYs1RrTOmL5PiaXiVySE/FefnHqIXsu/dyJlxGnJaE6diEBWeg553s
	JmITeoUUpDwrQNGK7HKPe3ZJpV7P9pBNyF0OPNovcrQDk/o+mSwbqWPntz1kiTQsRQ6+
	E5D7sldzLIgVu9/Ffl/GrmPsFU56Hdrcvter8y5bR7KOffhv1g20pwnP31B+RFNgu2L5
	zNTA==
X-Gm-Message-State: AHQUAuZKpVCup0t4GXU8Zc7J1QxIVabFxFQbed7MqYRwKrfPvhzeMYiJ
	yao11qrHJS4Wl3PcPySOzsn8y4gZDfPiiO0yaHUkBg==
X-Google-Smtp-Source: AHgI3Ib63jiP9423SdKLXBzLufvFxN4KMr9hpluakTpXWvIRP2PEReQCG/6O2KyUk7RPqToFE6d8v7pP5tGaVHytj84=
X-Received: by 2002:a5d:848b:: with SMTP id t11mr4075866iom.270.1549888145731; 
	Mon, 11 Feb 2019 04:29:05 -0800 (PST)
MIME-Version: 1.0
References: <cover.1549821635.git.silvio.fricke@gmail.com>
	<4c3dabb9814914747119a28172f38e2a32c0bd36.1549821635.git.silvio.fricke@gmail.com>
	<CAJTo0Laft-Z97PmWL8G4i-qrHxQUmurL6dYz_fp1PJjkwmS2hw@mail.gmail.com>
	<20190211121417.podjcgrldnykucgb@sfserver>
In-Reply-To: <20190211121417.podjcgrldnykucgb@sfserver>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Feb 2019 12:28:55 +0000
Message-ID: <CAJTo0LYKNFDGmLkTeFhxWRbO1tyJkaOKpNDFGQUTAKBoaThYcg@mail.gmail.com>
To: "S. Fricke" <silvio.fricke@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v1 1/1] image_types: add base64 conversion
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
X-List-Received-Date: Mon, 11 Feb 2019 12:29:04 -0000
Content-Type: multipart/alternative; boundary="0000000000005e42db05819d7467"

--0000000000005e42db05819d7467
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Feb 2019 at 12:14, S. Fricke <silvio.fricke@gmail.com> wrote:

> Hi,
>
> >    Is it?  I'm genuinely curious when a base64 encoded image is useful.
>
> It is! :-)
> We are using a softwarestack which use base64 (I am delighted thats no one
> is
> using uuencode ^^) encoded images to transfer them via wire. I can not
> change
> this stack.
>

Ah, fair enough.  Yes in that case I guess that it's not uu is good :)


> If this isn't useful, maybe you can help me to get a own conversion cmd
> into
> my own bbclasses? I have tried it in several ways, but nothing worked. The
> last approach was to change the image_type.bbclass.


It's very low-impact so I don't object to this in oe-core.

Ross

--0000000000005e42db05819d7467
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 11 Feb 2019 at 12:14, S. Fricke &=
lt;<a href=3D"mailto:silvio.fricke@gmail.com">silvio.fricke@gmail.com</a>&g=
t; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-st=
yle:solid;border-left-color:rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
&gt;=C2=A0 =C2=A0 Is it?=C2=A0 I&#39;m genuinely curious when a base64 enco=
ded image is useful.=C2=A0<br>
<br>
It is! :-)<br>
We are using a softwarestack which use base64 (I am delighted thats no one =
is<br>
using uuencode ^^) encoded images to transfer them via wire. I can not chan=
ge<br>
this stack.<br></blockquote><div><br></div><div>Ah, fair enough.=C2=A0 Yes =
in that case I guess that it&#39;s not uu is good :)</div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);p=
adding-left:1ex">
If this isn&#39;t useful, maybe you can help me to get a own conversion cmd=
 into<br>
my own bbclasses? I have tried it in several ways, but nothing worked. The<=
br>
last approach was to change the image_type.bbclass.</blockquote><div><br></=
div><div>It&#39;s very low-impact so I don&#39;t object to this in oe-core.=
</div><div><br></div><div>Ross</div></div></div>

--0000000000005e42db05819d7467--
