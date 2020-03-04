Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
	[209.85.222.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5036E60ADE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 13:01:05 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id 1so629846uao.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 05:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+pcP+rBKtcuVBpUJLxqXCGskARAMIWV8I9vejmviIqs=;
	b=KVtftRzdObkUqY0jPmqH/sukrAPm9KIyOXCm1PaJLCysuYVBw/Wrd4t1N38YYF+wPb
	VsLNaIpLocxmvBq1ano9x/xBm4LSi1sVeNOFYuKm8wEoGCIWRQWpQ8jPR3bNxwL2jMak
	5J7frZJTPsCzmr9RVAnQKakRgkHkK9fn7s4QYAfzUlZU0rmVRV/VBOTLxno9Zu8EPehS
	TwEnUTVASBYOXm06e5S/mx7RkwZsVKU6WZBzyWS5xkF+Ftc3wLLtbINe207VEcBGfzxo
	t7dQCbsaUP7rUERB7XZSrupJqz/EItRrLE3e1PSfhB+Cl6YOL6ZqtI+8PGPdaTrTPChi
	/f4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+pcP+rBKtcuVBpUJLxqXCGskARAMIWV8I9vejmviIqs=;
	b=nGJ7rzUxLpnIL6Dqr6m6XYRAIAl9AMdp2bkgcUPRg7/+eM1kP1xN/cMpgx9teT3tPZ
	lqIA8w8ABmoI8+d5rEwvV+8ltZb/34CSeLwI6frSX5UXsCeEoiQyA+tvhEleQycg/aVy
	SAXu8mvQw6RyZkwX7jsvzjSQlR843GLclBRRutUC8749IBNXKnbOVZvgUq3ge5KfqtI7
	72jtahPR0wSGGmBmxaoLv/kP1NkVXzzh8WcUapG0R10xeMv9JCEgCeXBcAk/0TKk6EHU
	Ztmjw0h08Qfr35NOy5kN1OTyo3lnxIVlNQzJXjV1I+5nCzj3LJXgy8vUsOfeMrKaJK+K
	+new==
X-Gm-Message-State: ANhLgQ2GWFMc8EK2oN2ruWHRAINvtlQ7jeCxbtv4PV8TT2s5S1Iv4Rzr
	kET8uPmieVfEzOH0EdYivKIZGn86Q7LiMAv5Jgik9A==
X-Google-Smtp-Source: ADFU+vtmlnl5rbWVfIGMKtwtU6LaNOgK7DEZUGIoIKa7eswFUc/2709lk5zjVPxD9A8JDyxnGaObNO1S/J6zLcDJCiY=
X-Received: by 2002:ab0:7802:: with SMTP id x2mr1371602uaq.100.1583326866213; 
	Wed, 04 Mar 2020 05:01:06 -0800 (PST)
MIME-Version: 1.0
References: <107c01d5f174$bbf566a0$33e033e0$@gmail.com>
In-Reply-To: <107c01d5f174$bbf566a0$33e033e0$@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 4 Mar 2020 14:00:54 +0100
Message-ID: <CANNYZj83rytWFgGPj6BS6R874eqa6_KCoeoMA5afgnx-_YBunw@mail.gmail.com>
To: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Yocto Project Status WW09'20
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
X-List-Received-Date: Wed, 04 Mar 2020 13:01:05 -0000
Content-Type: multipart/alternative; boundary="0000000000006c8d7305a0070368"

--0000000000006c8d7305a0070368
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Mar 2020 at 16:59, <sjolley.yp.pm@gmail.com> wrote:

> coreutils ptest blocked on libmodule-build-perl reproducibility issue
>

I sent a patch for this.

Alex

--0000000000006c8d7305a0070368
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 3 Mar 2020 at 16:59, &lt;<a href=
=3D"mailto:sjolley.yp.pm@gmail.com">sjolley.yp.pm@gmail.com</a>&gt; wrote:<=
br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div lang=3D"EN-US"><div><span style=3D"font-family:&quot;Arial&=
quot;,sans-serif">coreutils ptest blocked on libmodule-build-perl reproduci=
bility issue</span><br>
</div></div></blockquote><div><br></div><div>I sent a patch for this.</div>=
<div><br></div><div>Alex<br></div></div></div>

--0000000000006c8d7305a0070368--
