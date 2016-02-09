Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 24C4670030
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 10:00:42 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id xg9so74302147igb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Feb 2016 02:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=immkYiQTAxNSIItOWznL+lOQDn/IHSE90YsUwlftHWY=;
	b=SSjpTiSoVZTKWW2UM/rN3TQhYfEZjeAatTB0xgMxfOLdOENdFgCCpjXDAqzDHwN3lG
	wbCJ2glNcAoASN68sy5cf+A5UXvMUeS6a9Hi5Wo/1V4UZzM0qgka4Acct58vFI4pGAsj
	95NbwhwGnFzWz6h6irsl1aKlE4SibyiozuBZchziFjz1FfNwvdbUqEkj3keFVNdAKEgu
	MEk4JMuc/vY0kJC1fe6AT7wR4D9pp07gI1gVitY19rctj4DhH4/VE7eepdZTP3XyrG+m
	uI0tUe6mY+5vzKw2eZTC26vH71XJx97gL1f0WO/L8xsoBBVOiWMSOiAL33oZDPxMxTUp
	J3WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=immkYiQTAxNSIItOWznL+lOQDn/IHSE90YsUwlftHWY=;
	b=bWkjzOxpmCPkA7x9AQ2C1o+I+RrSa2WO/mDQQYNFgd0cUOg1tyZ14X0ZyLFs3SkUxf
	SikWPO5ijW1VwqYm2tsvBxBst7JOYMkeUHpJl6RaJwgvYmWfbNx8HtQNaCEWL2phz2GH
	Tp7HUHbi5vkfrRgQyfA6VU2itfuDIkn2gDd/fA6GG2nCnaMFsi9QHdWcSYNLvj95ZtCi
	bf2V/JVDdtQ1wdfEInOBVHgFLQcRve7Hv4w2IHJonkQNiM8fIOahaNL0zEzJOhPdgSg8
	vwaQHACfY695jiSdceBuhioak7GsS4TMre1ErI6xmVEVNAghEZq02LeQi3WGI+Q+0ipX
	239Q==
X-Gm-Message-State: AG10YOQWkvRMC+snLyyTcAtq66iqB/i5QHGkm/NnIfz+2e2pcLW3TXBvu6uGtntVkl+phwqQXKvT7zdB3br/qCnS
X-Received: by 10.50.126.8 with SMTP id mu8mr3332717igb.52.1455012043714; Tue,
	09 Feb 2016 02:00:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 9 Feb 2016 02:00:24 -0800 (PST)
In-Reply-To: <56B95575.7030505@gmail.com>
References: <56B922B3.9070604@gmail.com> <56B931EA.6060107@windriver.com>
	<56B95575.7030505@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Feb 2016 10:00:24 +0000
Message-ID: <CAJTo0LYQx1cZT=bwmXhJqHtFvujqMNH7qNR=05Ciw_+SCekwKg@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: noticeably longer build (link?) times with binutils 2.26
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
X-List-Received-Date: Tue, 09 Feb 2016 10:00:43 -0000
Content-Type: multipart/alternative; boundary=047d7b1635bf028cda052b5364ae

--047d7b1635bf028cda052b5364ae
Content-Type: text/plain; charset=UTF-8

On 9 February 2016 at 02:56, Trevor Woerner <twoerner@gmail.com> wrote:

> MACHINE           = "qemux86-64"
>
> Essentially: minnowboard max (turbot, specifically)
>

As an aside, if you're actually building for the MinnowMax then the
meta-intel BSP will be a lot better.

Ross

--047d7b1635bf028cda052b5364ae
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 February 2016 at 02:56, Trevor Woerner <span dir=3D"ltr">&lt;<a href=
=3D"mailto:twoerner@gmail.com" target=3D"_blank">twoerner@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":28d" class=3D"=
a3s" style=3D"overflow:hidden">MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D &quot;qemux86-64&quot;<br><br>
Essentially: minnowboard max (turbot, specifically)</div></blockquote></div=
><br>As an aside, if you&#39;re actually building for the MinnowMax then th=
e meta-intel BSP will be a lot better.</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra">Ross</div></div>

--047d7b1635bf028cda052b5364ae--
