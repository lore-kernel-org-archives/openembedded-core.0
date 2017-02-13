Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id C0E2A7319F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 20:20:11 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id v23so93862271qtb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 12:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=R1fyDS0GGzyNDzEbVJttOshm81FfbQ0RN4gQA5/1/YU=;
	b=eDbFQKbqB3eXVvMBF/A2BdQ7OU5CTmFx/tTBOYt+46PciiMpaouLdII1YyHdWwEr0V
	VArk5wcmOqyf3ygCW0z0SUo9Zzi3Uz3ml1YYDESJJSjummWi3lZY9+lsoZWJtmYzwb/u
	WKEikgO40InIFr5qiNqLFLrj/8qREMr7o5Ta9Nw0/F8YQKqCIDlF7yo1QJDR25M7Dtgx
	JmNf3gpu9YYkRxbRXAtk1DME0I7e7rIuaegjay4DGXaH1wh8z4Cexnh63KoO0sNQ6+ju
	WRG045FnaHNAkp++djvAzvKPvDJF6FKzxBYhGbKJCtQItutXN9b0/AYhoZ+uI3xxi5nC
	8Icg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=R1fyDS0GGzyNDzEbVJttOshm81FfbQ0RN4gQA5/1/YU=;
	b=IdvtHmX/KX4mSvKLLH+GmsiFG5IggnQdNewUg4mh4n4lFXxW3Ke49jJjeJxuvbBDP8
	R1/D1+2uWbv2HXnJBhs+h78moAIVw3/C52bL2MOm0T9T5fYV9iJtjZz8izLDRLBnTtIC
	Yd1VKaC5rhQMtin6l1Civ6ZURdHl9uCUp2D1RsTBO+Ml8r3T0V0/a07LmDrBbNiH0tUu
	Gzh3HZMI/SQL/qkfZy4s5hepthtJ00OWo1MICI55Tm+9bxAQp1oUsL850eGwcXGBcWmm
	APK1Sco2q9jWsSOUQ3hmu2yrwUHeBzxmgqEojrFLDi5N8Ff3JV+gX7HCLNgS1FG7U0wW
	IgyQ==
X-Gm-Message-State: AMke39mIT+BT5iKDe6dHiXwf1Qs5tX+gx7fCLUmXCIwV/mBL5gFe1jP1n+brKrbLpQmzo6M2lkee8zwlkUa15hVV
X-Received: by 10.237.54.1 with SMTP id e1mr22279475qtb.68.1487017211823; Mon,
	13 Feb 2017 12:20:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Mon, 13 Feb 2017 12:19:51 -0800 (PST)
In-Reply-To: <20170213182143.GA23802@mcrowe.com>
References: <20170213124142.17081-1-mac@mcrowe.com>
	<CAMKF1sqa-TunzUMu_ZsHftcj=XdZpk9q_bctT=Y2wYmTRfDKOw@mail.gmail.com>
	<20170213182143.GA23802@mcrowe.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 Feb 2017 20:19:51 +0000
Message-ID: <CAJTo0LaDvtEpxkjzZNUct6d9F1vxL9u9XhSmf3w-9Ak3-7RR1Q@mail.gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image: Attempt to work around do_image_complete race
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
X-List-Received-Date: Mon, 13 Feb 2017 20:20:12 -0000
Content-Type: multipart/alternative; boundary=001a1142dcf0afacb305486f2c90

--001a1142dcf0afacb305486f2c90
Content-Type: text/plain; charset=UTF-8

On 13 February 2017 at 18:21, Mike Crowe <mac@mcrowe.com> wrote:

> Or, we could just lose the common README file altogether. :)
>

I'd look very favourable on a patch to remove the README entirely, and I
think RP would too.

Ross

--001a1142dcf0afacb305486f2c90
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 February 2017 at 18:21, Mike Crowe <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:mac@mcrowe.com" target=3D"_blank">mac@mcrowe.com</a>&gt;</span> wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><div id=3D":2i" class=3D"a3s aXjCH m15a=
38b671c6d0261">Or, we could just lose the common README file altogether. :)=
<br></div></blockquote><div><br></div><div>I&#39;d look very favourable on =
a patch to remove the README entirely, and I think RP would too.</div><div>=
<br></div><div>Ross=C2=A0</div></div><br></div></div>

--001a1142dcf0afacb305486f2c90--
