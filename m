Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
	[209.85.210.41])
	by mail.openembedded.org (Postfix) with ESMTP id B49F77503E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Oct 2018 11:53:04 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id w67so19284713ota.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Oct 2018 04:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9JpMMvIJj8zNanLLcMqQtZaQkgXYpqvOkxaYeCA9hD0=;
	b=aOm/qmEdrPrVkhwVvolkQzaHegmKDZjzZXW9gwcD8jgjZUse72e2KrQYVLZQtjIuS+
	UZAwMrZ6oRwvrxY/IZWyyaKQLz06KLYB6I80Z6iJmJmAzc1F1HC6I0Jpbq3MHCY9BjRr
	4HH6EbWkZL0fgbI3gdptD/u4UzA6GOEIlcvzZz1TZscHrB9ggiljG1/T0p43fyqZ0vTe
	A/AT32cU05hyZC5kDy0N3PXQaFg4IIn+cnrs2Lr4sybkktmbqvBf3T0jDJZMrxIC9ojS
	z3gGjcUjwWHF+LsG1nXY5F2DnEVzPogD1GUOp3Zip3XvMzSUy4Bz4+Bu7HxfGSx1nkyP
	eWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9JpMMvIJj8zNanLLcMqQtZaQkgXYpqvOkxaYeCA9hD0=;
	b=SR1NEAAtnYXF112X8plDFujXiqYu6JcQcd8xNTLaBqiDPE4UeDmPNeZd835/GBLFv/
	rqXBPL+vYXF+b2QQFIgsR5/XIL+S5oENuIEcPL1jL+EePjlsJTK2NUyn8uUTanSQBT5z
	wACzXl90BWedWvnd38IxawN/2u3O2jOEY7GaVub9yy/OkcDbju705fe8W1ypnz2eh2vt
	bm3PhyI1Lr7DDH+yH1C9IMxOLUyHv0tMgqwkqf8efXaAtt0mV8LdzyCxca1M1awjGiM/
	88jftVcBm4wKvP0l/jPuzcy+yGmK+fyL8njOnDBAZV11ZuAW41beIcegyMMCuvL3USMB
	rUiA==
X-Gm-Message-State: ABuFfohuB9lfyDVIuBRBV9CDcIKoW8Ckyf48/iOa7rW5qzt6yc+3zTnE
	zdV/IwbiY/JBRdBsPOIalJkjft408iiEVHlw3Ny4dtUd
X-Google-Smtp-Source: ACcGV61C067wykHuBXlNzwcFDAV7TcZLlrvPDX0fn9oUNH3toIn9wSAwACOJF2JOgFDmeZghLut6YNcpDUVCWIFaLmE=
X-Received: by 2002:a9d:7613:: with SMTP id
	k19-v6mr13931234otl.297.1538999585648; 
	Mon, 08 Oct 2018 04:53:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAMRMzCDLn8_0sh+PqoC=FnpspLm4o3gx=UULsRZiExOL7_YhMQ@mail.gmail.com>
	<CAJTo0LaopKzbbnUDR5fixoiE4pt=9S8T-f3JMCa6NL9U1kf5uQ@mail.gmail.com>
	<CAMRMzCDi=7129TPUGmMtqgr9GdnANS7r4N2QDEc4Fz_iyRCtCA@mail.gmail.com>
In-Reply-To: <CAMRMzCDi=7129TPUGmMtqgr9GdnANS7r4N2QDEc4Fz_iyRCtCA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Oct 2018 12:52:54 +0100
Message-ID: <CAJTo0LZGfjV_-QiDNAZ6HAtfjZou8izu1Oc0+FVx4e4+b5TTug@mail.gmail.com>
To: Marc Ferland <ferlandm@amotus.ca>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Python3 and HTTPS issue
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
X-List-Received-Date: Mon, 08 Oct 2018 11:53:05 -0000
Content-Type: multipart/alternative; boundary="0000000000009cc9f20577b64369"

--0000000000009cc9f20577b64369
Content-Type: text/plain; charset="UTF-8"

Python3 would be overkill, but the SSL libraries probably should yes.

Ross

On Sat, 6 Oct 2018 at 02:54, Marc Ferland <ferlandm@amotus.ca> wrote:

> On Fri, Oct 5, 2018 at 5:22 PM Burton, Ross <ross.burton@intel.com> wrote:
> >
> > Did you install ca-certificates?
> >
>
> Looks like it did the trick, thanks.
>
> Just wondering: why isn't ca-certificates not RRECOMMENDed by openssl
> or maybe python3?
>
> Marc
>

--0000000000009cc9f20577b64369
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Python3 would be overkill, but the SSL libraries probably =
should yes.<div><br></div><div>Ross</div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr">On Sat, 6 Oct 2018 at 02:54, Marc Ferland &lt;<a href=
=3D"mailto:ferlandm@amotus.ca">ferlandm@amotus.ca</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">On Fri, Oct 5, 2018 at 5:22 PM Burton, Ross &=
lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@i=
ntel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Did you install ca-certificates?<br>
&gt;<br>
<br>
Looks like it did the trick, thanks.<br>
<br>
Just wondering: why isn&#39;t ca-certificates not RRECOMMENDed by openssl<b=
r>
or maybe python3?<br>
<br>
Marc<br>
</blockquote></div>

--0000000000009cc9f20577b64369--
