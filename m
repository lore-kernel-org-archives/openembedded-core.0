Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id 961D76E688
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 11:17:50 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id e62so69746311ita.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 04:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9rndhGRyazqV9nN6aKWP85VO4hFJKibyLlv7WpWcPcw=;
	b=2ABDsz4risMqMXiewdMNQg3a6wBpTIJ8AUwBgQic763gEJp7OoI0yXC3hhBUWPDIl0
	0vxpzpKPLVhOjeeqdul/w034hZtPFhUE0Ur6szqjG2LfFVtB4Wpf3bMug30apSUJueMd
	hXHuvoCLHsGZEt46mNn7DzrUfrg+N/zi1TB9x/A78pP5FGFC5vIaCqOm7Hlj8hR90jIb
	EdfYiDitQNfmY4C4AejLf75RRr+ntZLU/vpig1ORAtqLOa5AlkUrsd7g8o5DGfXSak4d
	+y2kFsmFc2QAaIj732BTBIDlvilhuZgCmpxxk3BBF4OT4Hx97VBXxYZeDulPHovH8Rih
	CrTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9rndhGRyazqV9nN6aKWP85VO4hFJKibyLlv7WpWcPcw=;
	b=IFdof64HuBUmcW1z9GNAUg8Hy1k6gQ9PuyfUAlelPVvhzKYhnU6Hxp3/7DH8txjtC0
	HE3buaDRwjLVZDI8OaUgsZh6f2hOWORfweVzsa99FfOwtJkMM8N7MPiYHxUUYwurxyRJ
	gfxCfc8kTi70IyUNrNiXnsJB0CEhEqvKFB7EHQUDh0fiWTOSpi/P09tYGay7atQc203v
	ZLZ5a9lweTMBzsaJO1SAi8a1j44+5LoOQtdbXWoQsM77jf5eeEh8jzZI5rUeW8IiwG4v
	M+MVLU8gGcGLRC1ySWjEhodaIx9bgCMKok5PHWrlQnbtRUaJA1PlPvD3wXq9LUXVnNY+
	aDeA==
X-Gm-Message-State: AOPr4FUOHbWiF/ukYrKpA0ystl5ogm3fl0mceUssuNlz2T8zSu0Jnb5pAvANGqy46VPlE3eLuXcE0To8voSBr7+C
X-Received: by 10.36.2.71 with SMTP id 68mr22775394itu.38.1464175071033; Wed,
	25 May 2016 04:17:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Wed, 25 May 2016 04:17:31 -0700 (PDT)
In-Reply-To: <1357d837c72abd1d9552aa77fd63126f7275aa23.1464168189.git.liezhi.yang@windriver.com>
References: <cover.1464168189.git.liezhi.yang@windriver.com>
	<1357d837c72abd1d9552aa77fd63126f7275aa23.1464168189.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 25 May 2016 12:17:31 +0100
Message-ID: <CAJTo0Lb0W-tTtcjnAA1pVFU2=nDWxX2Fc7HXjYs2WYGfRYQx-A@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] utility-tasks.bbclass: fix do_listtasks
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
X-List-Received-Date: Wed, 25 May 2016 11:17:50 -0000
Content-Type: multipart/alternative; boundary=001a1144b1d0ff88d40533a8d26f

--001a1144b1d0ff88d40533a8d26f
Content-Type: text/plain; charset=UTF-8

On 25 May 2016 at 10:23, Robert Yang <liezhi.yang@windriver.com> wrote:

> It lists deleted tasks which is unexpected, use __BBTASKS to fix the
> problem since deltask() which is defined in bitbake/lib/bb/build.py
> updates __BBTASKS correctly.
>

Wouldn't an alternative be to change deltask so that it also remove the
"task" flag from the variable?

Ross

--001a1144b1d0ff88d40533a8d26f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 May 2016 at 10:23, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":31k" clas=
s=3D"a3s aXjCH m154e73aa80226a8c">It lists deleted tasks which is unexpecte=
d, use __BBTASKS to fix the<br>
problem since deltask() which is defined in bitbake/lib/bb/build.py<br>
updates __BBTASKS correctly.</div></blockquote></div><br>Wouldn&#39;t an al=
ternative be to change deltask so that it also remove the &quot;task&quot; =
flag from the variable?</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Ross</div></div>

--001a1144b1d0ff88d40533a8d26f--
