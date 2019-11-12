Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
	[209.85.222.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4FF9C6BC44
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 18:28:44 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id r13so741464uan.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 10:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DzQ/N14wx1H9fYovD0E21gihpJ4fIV6bD8f8MoYICgQ=;
	b=LU77r85dkcvP2chMJIEuqvfG1CDke/lhkcuR5Sl/69+ORC3eDbSlEfmYARq1u5MZjC
	GBdUPrCGjFbl7PqAdr439wS42ic7QoN6uy48PUdsocxZVxMomDpiMlqfyobi1XlqFNiz
	suDclv6cDK17u6bQbJnynziFWEBjWnRazOUFPpBC4JJO5clDeqxr5nLXQg4EKgzV2uhx
	xtcIegsNPBZ/Jgn5PiW71EFHGJ0vpUzAYVZK++z1ZBfaQHR/A4RAc5s8ujrvJBnhTihS
	T2CiOjWfriv/iX5TTVQE2c/Nj8L1jJw58oe/VJM9AnViqGfe0I2+fSpyeXqD7Y/j0hoj
	qRxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DzQ/N14wx1H9fYovD0E21gihpJ4fIV6bD8f8MoYICgQ=;
	b=KydwLlIeOhr37y1ZIf1BxKZufqmHvC/cwhXMrfhz4gdRj9KNQPXc7Pn/yVrdA15owa
	Gri+g3C0CtBKniqjTZDzTChmyA7emmIP64rIW21Hr8SaeNJBTDJKl8b16/FUf6Zfx2Ga
	FK8VQG2oyOBePh2mU5BE5wrxffc0K5CXlE8t12R3g+kVLu9LVeNFxLJWRywh9HeYF0a4
	EEy3zzcI+gCeDOejsQKnDF+M/JWVuM9xmbHkpXBY8uWPblarqLshTNXweUp4RuzIIjlb
	gxeW03Zk03T9B9pB67LUCSp+toRtUffmZwEgLy7c4v1+AKgJ6xUsjLK3Feecn6c2XbZO
	wEaw==
X-Gm-Message-State: APjAAAUOR/oVlomUPLUz6K+18v/pDoMt7byQa7elzJVk7x/vTxFs+g7L
	CQ6dfwKAmig8/4gwPlQCMMPU+mHCLs1xGYvVlQc=
X-Google-Smtp-Source: APXvYqzIctyJEyt+ZcMdwjxRm/ft/Zcevf369TP/B4gBwAeWK+pYsCe+hYKy6WeIbPs9hHo5jiUM+l1VGY+jc6Osjlw=
X-Received: by 2002:ab0:3399:: with SMTP id y25mr4266231uap.100.1573583324983; 
	Tue, 12 Nov 2019 10:28:44 -0800 (PST)
MIME-Version: 1.0
References: <20191104224805.3149-1-alistair.francis@wdc.com>
	<fd81b5bc-cb84-8857-ea5e-bce2c931750b@intel.com>
	<CAMKF1srMzPL4pBAQYscX6fxPPL2SExcYFw+Ti2B656nK3hyH0g@mail.gmail.com>
	<CAKmqyKNtUpuqodwxjsseOwdQn3AhG+yU0kJx1K0DCXH3sc4VBw@mail.gmail.com>
	<CANNYZj8=PbGVmE+9C4mnJv3BW0Y-G8f5zG=AmGD0vDpoPNU2XQ@mail.gmail.com>
	<CAMKF1srk1NG6Eu6_CKiw=18fwnZef0GeZUPwj0_vFmv8atq9sQ@mail.gmail.com>
	<CAKmqyKOxaSvL5cq_SkucYZOmfoCX6o6piSr0iW-r+sFbCJL9Lw@mail.gmail.com>
	<CAMKF1sqyrY3mA+5rjx1VBBE=SFst=QnBZzVR5yOAWH+zambVqA@mail.gmail.com>
In-Reply-To: <CAMKF1sqyrY3mA+5rjx1VBBE=SFst=QnBZzVR5yOAWH+zambVqA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 12 Nov 2019 19:28:33 +0100
Message-ID: <CANNYZj9ezut=i0jmn5aXVBeitzCN14mzNFL4y8=iBQezxtFEcw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v6] mesa: Upgrade to 19.2.1
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
X-List-Received-Date: Tue, 12 Nov 2019 18:28:44 -0000
Content-Type: multipart/alternative; boundary="0000000000001c36db05972a6b7f"

--0000000000001c36db05972a6b7f
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Nov 2019 at 19:16, Khem Raj <raj.khem@gmail.com> wrote:

> > > in this case, texrel will endup causing sigsegv, this is a mesa issue,
> > > primarily we have been working it around so far.
> >
> > I sent a new patch, it probably doesn't fix this issue though.
> >
>
> sure, and I think we should be able to address it with a patch or some
> feature disable/enable a mechanism
> I wonder what changed in new build system that it cant be knobbed out
> as it used to be with autotools
>

It is probably upstream's removal of the 'asm' configuration switch which
was previously set to false and now is always on.
Seems like switching that on enables poorly written assembly code that
causes the qa issue?

Also there should be a runtime test for all of this. There is a test for
kmscube over virgl but only for glibc.

Alex

--0000000000001c36db05972a6b7f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 12 Nov 2019 at 19:16, Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.co=
m</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">&gt; &gt; in this case, texrel will endup causi=
ng sigsegv, this is a mesa issue,<br>
&gt; &gt; primarily we have been working it around so far.<br>
&gt;<br>
&gt; I sent a new patch, it probably doesn&#39;t fix this issue though.<br>
&gt;<br>
<br>
sure, and I think we should be able to address it with a patch or some<br>
feature disable/enable a mechanism<br>
I wonder what changed in new build system that it cant be knobbed out<br>
as it used to be with autotools<br></blockquote><div><br></div><div>It is p=
robably upstream&#39;s removal of the &#39;asm&#39; configuration switch wh=
ich was previously set to false and now is always on. <br></div><div></div>=
<div></div><div>Seems like switching that on enables poorly written assembl=
y code that causes the qa issue?<br></div></div><div class=3D"gmail_quote">=
<br></div><div class=3D"gmail_quote">Also there should be a runtime test fo=
r all of this. There is a test for kmscube over virgl but only for glibc.<b=
r></div><div class=3D"gmail_quote"><br><div>Alex<br></div></div></div>

--0000000000001c36db05972a6b7f--
