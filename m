Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
	[209.85.222.47])
	by mail.openembedded.org (Postfix) with ESMTP id DB6587E3B6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Dec 2019 18:28:07 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id v18so753599uaq.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Dec 2019 10:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xfDf+Hx6IEqtXx1h2XO0Ih9zFsy3uBG7I91WX63CV8E=;
	b=Lu2mdmDD2o/a5BSNZC6gK9PIs/JD/WBUajlCM4dbKouk3eJD8FzAd1v4UlOpC6dLeB
	iYfC8kR6A3VnoEl7ZC2dt2z9fn/DaL9nWRiNa41HjgFZiImtdAiAyF3aUmcgnOfkTWC+
	86LRMaFBx/bONBuc06vFWdRBgy+f70WxpCE6ZS7bdQ9o/N+3J2JpwnNqhs9pVuxiyh/D
	xp//5i8moFz5r630KKldX6/EW6gJ2u3CfWJ2YWPYFk5YihMfkIJMgROtXtrTkOY/4+yK
	7YMLbABH/TSZFBQzaSf5+rJfiCuJxzVjkBNCL2xXB8kgC04LhySXgdjCMZLCREnwoGQ+
	3jCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xfDf+Hx6IEqtXx1h2XO0Ih9zFsy3uBG7I91WX63CV8E=;
	b=NsOW4j7xrPF8uqE08ulw17JMCLUtyf0DWkO3wgxr7po5LzjfFmWR8MZnkyKKoTzydu
	OpYXYVexG3MPOoyCB8Cy/auyFdX/re5R3N5z1vvKoTBzPhOx/paTeannEftjXIaSYKIK
	WbkIZfkRmsUuXmPa6IYSfRbvsjqlRT4afkXHWxqKKOH3Fx89SBozCTHm7mw0ukR7vjLw
	pTR23ofr/sdbLas2i6Zrn+DDdJ+lnkz+02AdCuxaZrBmW7BuLPgxzG5RepJ2++Ga/8G/
	72CbT4hhNh0dBuG3/UQv1Zr3FIgby8E6oCUsT8OwVw3F/3tDYja0Qoe6Clp0XO1oL9xm
	QYPA==
X-Gm-Message-State: APjAAAV4n0gPv26VYdsKTg43VB/PTzeyweRcqTlg9jlyBtQuNTsmS6T/
	KDeLsWjAU/tiAhHE3/ZQB2Z66CFWEbvlVEff9Uk=
X-Google-Smtp-Source: APXvYqxc9zZNU+AQXcvlriPwWYv8fOnMgv/QoXXyhChcl1N5481gaac3WsiFT7HfPlKYj9muRUijWbQTJSOyUSSdfLM=
X-Received: by 2002:ab0:3381:: with SMTP id y1mr17214736uap.93.1576348088680; 
	Sat, 14 Dec 2019 10:28:08 -0800 (PST)
MIME-Version: 1.0
References: <1575472180-11923-1-git-send-email-wangmy@cn.fujitsu.com>
	<699e48bc46b4e96c13393b2d61dbe366c3c88825.camel@linuxfoundation.org>
	<CANNYZj8u8ZkM1ZbbKnXpnUL8LtUwChAtJRi3pfsfeek3BzEa8Q@mail.gmail.com>
	<CALbNGRSHCS1B_SfjWuGVmgh9t+=A=jPFU5ZY4hnvz1rJCJbdMw@mail.gmail.com>
	<CANNYZj_-MimTZeueDybg87q=CrDGs5FTo07EH7DoBu-1gWjVxQ@mail.gmail.com>
	<CAMKF1sry2H9eCDUvsNThpN8xRcsoxruV5kDonfmRj_uJtQ+H-Q@mail.gmail.com>
In-Reply-To: <CAMKF1sry2H9eCDUvsNThpN8xRcsoxruV5kDonfmRj_uJtQ+H-Q@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 14 Dec 2019 19:27:57 +0100
Message-ID: <CANNYZj9YEHYYZBvXL11JoO8L3Ge2jwQ4J3OUtVkEhUN--oFasg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Denys Dmytriyenko <denys@ti.com>, Jon Mason <Jon.Mason@arm.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nss: 3.45 -> 3.47.1
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
X-List-Received-Date: Sat, 14 Dec 2019 18:28:08 -0000
Content-Type: multipart/alternative; boundary="000000000000de540f0599ae23dc"

--000000000000de540f0599ae23dc
Content-Type: text/plain; charset="UTF-8"

On Sat, 14 Dec 2019 at 17:29, Khem Raj <raj.khem@gmail.com> wrote:

> > This option is only available with gyp, and not plain Makefiles
> unfortunately. And the way I read it,
> > it's not actually possible to disable :-/
> >
>
> nss is used in quite a few apps, and disabling armv7a is not a good
> option, plus hw crypto is only in armv8
> thing.
>

I guess I could patch that bit to make it conditional then. It is not
actually mandatory, it's just that they don't have a config switch to
disable it.

In oe-core the only user of nss is rpm, and we're going to switch it over
to openssl or gcrypt.

Alex

--000000000000de540f0599ae23dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, 14 Dec 2019 at 17:29, Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<b=
r></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">&gt; This option is only available with gyp, and not plain Makef=
iles unfortunately. And the way I read it,<br>
&gt; it&#39;s not actually possible to disable :-/<br>
&gt;<br>
<br>
nss is used in quite a few apps, and disabling armv7a is not a good<br>
option, plus hw crypto is only in armv8<br>
thing.<br></blockquote><div><br></div><div>I guess I could patch that bit t=
o make it conditional then. It is not actually mandatory, it&#39;s just tha=
t they don&#39;t have a config switch to disable it.</div><div><br></div><d=
iv>In oe-core the only user of nss is rpm, and we&#39;re going to switch it=
 over to openssl or gcrypt.<br></div><div><br></div><div>Alex<br></div></di=
v></div>

--000000000000de540f0599ae23dc--
