Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
	[209.85.217.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3AF317F2B1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 19:52:54 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id q16so4696741vsm.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 12:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dlnXny7rD+nDncLPxwpPBo0vHGWbfFzsq+ojjIl00nw=;
	b=Hn/MqN5lbVKioL5JkCnfkyiZLkRiIODp2xaFTusM28k777eiAfUWvpYTYCFXQH1gKX
	dGBRXsH9NH78Bf6vI6Ongn4satuwuqOM799Na4MPcuDJj1C7QfUDG5uXjfNC0g96sVvD
	LYs7fqU1jNBr+9YUKtCQVcgn8go+Iv2OB7XFFSmAWS4S06AoVyu/21ZRkZ8tI6cINnTv
	R6MzQFiKzh73iyUt535mcE/3QCWNCJ2BIxR46t8lNdGfU8Cb/xqQckNfBhBArnXu9NB1
	KHC+5Cl6zuys6yRzZ4K6cvEkuKZ6JSFalr/WRULMOgZjs1OV0nKB7dHXpQ2nLmnxV7ko
	IuXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dlnXny7rD+nDncLPxwpPBo0vHGWbfFzsq+ojjIl00nw=;
	b=XtxBP/mExKt8yWv+wavWpnfZr4fcEnwHtc5BRa8OrMgoVZfTyY3PYRgyAUfJTc8FUG
	3RMIhQ8rQkl+RbT8xqneqIyRCqWxCTbT00yrmCK39ZyaJu+Pc1Cp7vOy527uTd+0t6Ig
	FkYEeYvXnEz1lP5TJMe5kLGB2jb98gGxSlc25AKvQG0zhNvLKlyew+rG2nUDcPFsAu92
	Y1xqVKPproVWAZ5Qv041v3jnW5shHYNCU0QySYERcTP67xA+i0zYULCst71a5bYQECgc
	wVU1j/ZZF2bLex2EEGoQkBvl8glZOwKXWuMy6N4vDX5qZO6TG3PRYGgYJ4g/QFEUsuzk
	6IzQ==
X-Gm-Message-State: APjAAAXAL57OtA8A3dOJRwo3OuSYf392gsIFHu6pEGjNpxaCvWhnqXlg
	T90epU3v8/Du0/j9sfqshsKtPIC2nw9s0YT08+A=
X-Google-Smtp-Source: APXvYqwo/KoVs78K4efhDxqYcFP9CKeZCMb54vBSQGuUYJ2gCF/MvTMWU/NTS8+gf7Bhl/eUomKZrYBRsYAe/9KXBpA=
X-Received: by 2002:a67:1c87:: with SMTP id c129mr574164vsc.23.1566503575058; 
	Thu, 22 Aug 2019 12:52:55 -0700 (PDT)
MIME-Version: 1.0
References: <a01c66d2-4603-5633-9b3e-6180ba8c904d@windriver.com>
In-Reply-To: <a01c66d2-4603-5633-9b3e-6180ba8c904d@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 22 Aug 2019 21:52:43 +0200
Message-ID: <CANNYZj9nmZqD2C3zN7RVNQS3d8U0j0unO2fTpgzGmEwaBxgt1Q@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: boost 1.69 -> 1.71 upgrade for 3.0?
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
X-List-Received-Date: Thu, 22 Aug 2019 19:52:54 -0000
Content-Type: multipart/alternative; boundary="000000000000217cb30590ba0932"

--000000000000217cb30590ba0932
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Aug 2019 at 21:20, Randy MacLeod <randy.macleod@windriver.com>
wrote:

> I'm checking if you have done any work on upgrading the
> boost recipe? Trevor will work on it if you haven't started.
> He's relatively new to YP so depending on how easy the
> update is he might bail or need help or take a while.
>

I made a preliminary update to 1.70, but I had to hold it back because
there is a significant regression in do_install(). Bjam spins the CPU at
100% for many minutes, while making glacial progress with the installation.
I couldn't figure out what is it doing, and so decided to wait and see if
things get better with 1.71 (also all the major desktop distros are at
various older versions still, so the upstream is probably oblivious to the
problem).

The patch is here, so you can first check if you see the same problem, and
then if 1.71 helps:
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=akanavin/package-version-updates-later&id=39bcdb4184a9108561249d5a89b69a9250ff686d

Alex

--000000000000217cb30590ba0932
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 22 Aug 2019 at 21:20, Randy MacLeod &lt;<a href=3D"mailto:ra=
ndy.macleod@windriver.com">randy.macleod@windriver.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">I&#39;m checking if y=
ou have done any work on upgrading the<br>
boost recipe? Trevor will work on it if you haven&#39;t started.<br>
He&#39;s relatively new to YP so depending on how easy the<br>
update is he might bail or need help or take a while.<br>
</blockquote><div><br></div><div>I made a preliminary update to 1.70, but I=
 had to hold it back because there is a significant regression in do_instal=
l(). Bjam spins the CPU at 100% for many minutes, while making glacial prog=
ress with the installation. I couldn&#39;t figure out what is it doing, and=
 so decided to wait and see if things get better with 1.71 (also all the ma=
jor desktop distros are at various older versions still, so the upstream is=
 probably oblivious to the problem).</div><div><br></div><div>The patch is =
here, so you can first check if you see the same problem, and then if 1.71 =
helps:</div><div><a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky-=
contrib/commit/?h=3Dakanavin/package-version-updates-later&amp;id=3D39bcdb4=
184a9108561249d5a89b69a9250ff686d">http://git.yoctoproject.org/cgit/cgit.cg=
i/poky-contrib/commit/?h=3Dakanavin/package-version-updates-later&amp;id=3D=
39bcdb4184a9108561249d5a89b69a9250ff686d</a></div><div><br></div><div>Alex<=
br></div></div></div>

--000000000000217cb30590ba0932--
