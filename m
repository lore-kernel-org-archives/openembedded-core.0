Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 74C76606D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 13:35:25 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id 38so161372960iol.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 06:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=elTK1zv8tUwP/oQrJ4xX9Jd7miY+Bk6jiw2y20mrtBA=;
	b=Nmk00wSYBGpaU3eSp2Tk6o2K3VtRESCNacf1Nk1i/SD+hmYtf/YXy69jpw0Tjg2l53
	ObDeHYBfsdazniuUNpz1lazZy+yFq72Rq8XtDs9ij/xQDj0EcYwJL7Msz7B2+1oqzn/7
	D+NK/mC+iMzErKE/vMEqsCl0oHDE165w7KM/cOuPcHsorTh7smByMaBiWWFTPIDg3bUJ
	ZMOp0ojg5rO8aY5lq+2b3pC9ECH5bfpyAWmVgnoSKbweVPtYiqbDK9abGBf9BNIbkD7C
	iCqeiewJo5E5bRqd6jE2TXfLYQQy/Z8NgV09FFc/ZHirif3jDTBD5VTsSk1d3CLkXSOc
	RPRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=elTK1zv8tUwP/oQrJ4xX9Jd7miY+Bk6jiw2y20mrtBA=;
	b=CnintvRYBFHOh/50/t02661sxO3PiE1WMBYcDaC4dL9t+x/8BHCs9VJpHa207U5IfA
	BlGImoq1JfKHp9NhfDCvTs7SB7ev1uIQhpLA+QqXmQaciWnPOyguu/Od8tiIgZA4er4j
	O4+q2W6TT0QK7zr0zhedrzALh7/D5ntWRfECx0ykfkZbxwRtU2qtdIsAZ9+WXrgvudVA
	FEVHpTW9R94GlqqbVlrbO+Ocoy6XZwG8x7Zm1fWLGypGnn7QAb99McKluqMz+Km5xL0d
	7Py4Tbx5ziG2zJDfiUXPnf4dyw1XnDeslj0wKRQH6cr8gypF33PAxUJyEBnnzP2H5XF2
	CDUA==
X-Gm-Message-State: AEkoousfXHCfpKAUVycCqrCF1pUXR02oafWXd4fk3fzgokennNLeMB/BcxCNJ8RZQ0WFlFEAHhHTC3tGanooL7xZ
X-Received: by 10.107.154.196 with SMTP id c187mr19379406ioe.99.1469453725822; 
	Mon, 25 Jul 2016 06:35:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 25 Jul 2016 06:35:06 -0700 (PDT)
In-Reply-To: <CA+chaQckZcAKrVbj1Rt5=PhW1n5kj6hhDoCo61ckKs3PUsos6w@mail.gmail.com>
References: <20160708085912.13734.77555@opal.openembedded.org>
	<20160708085918.3A528501B3@opal.openembedded.org>
	<20160724121138.i7fp26ateflny4kl@jama>
	<CAMKF1spvPZ_tSZ_FDeZt6baoG4afvvys++PwVRnGY6j_DFsSZw@mail.gmail.com>
	<CA+chaQckZcAKrVbj1Rt5=PhW1n5kj6hhDoCo61ckKs3PUsos6w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 25 Jul 2016 14:35:06 +0100
Message-ID: <CAJTo0LZpGXgtOs2msaRCzuxxm3YA0xKWQSXp=6eEWF90rn9uTw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	"openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 21/28: rt-tests: move ptest to python3
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
X-List-Received-Date: Mon, 25 Jul 2016 13:35:26 -0000
Content-Type: multipart/alternative; boundary=001a1140e81e57aa18053875db3a

--001a1140e81e57aa18053875db3a
Content-Type: text/plain; charset=UTF-8

On 24 July 2016 at 19:30, Martin Jansa <martin.jansa@gmail.com> wrote:

> so it' probably some missing space in append or some wrong sed call in
> some Makefile or something like that.
>

CFLAGS_prepend is missing a trailing space, sounds like it.  Patch incoming.

Ross

--001a1140e81e57aa18053875db3a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 July 2016 at 19:30, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>so =
it&#39; probably some missing space in append or some wrong sed call in som=
e Makefile or something like that.</div></div><div class=3D"HOEnZb"></div><=
/blockquote></div><br>CFLAGS_prepend is missing a trailing space, sounds li=
ke it.=C2=A0 Patch incoming.</div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra">Ross</div></div>

--001a1140e81e57aa18053875db3a--
