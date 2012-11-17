Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TZnVg-0006u9-Cg
	for openembedded-core@lists.openembedded.org;
	Sat, 17 Nov 2012 19:52:57 +0100
Received: by mail-la0-f47.google.com with SMTP id u2so2693204lag.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Nov 2012 10:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=FjEmtPEHhkrCOZ6iY6dMOJuv+A2UiXgjR71gEnHgLOs=;
	b=j5RD1mSk3XanKV8RC7apXBmRfy5QALbj4IjemvqrTYVPuCUeN9FKxtvKZdI4xX6nzD
	rILOUCJZ9bB6oYtFHKyWBNl18daH85F8X3smNaxpIT6tkQw/gWGeNUjlJPlpVN19/H8A
	4Bl/S9dMiPIrfB3tQYayL4U2Fyov74keguQx7VpZLYbNJru3KrLG/tW7h1TgSapXSryp
	r2Lf0SzxozbvnF6yJ37fgl7mXGLquxacQoWBpFNXp2CRQv1bzmY0uff8CRXCW5YT9Xhz
	c7mjJJBbW1UkLxPZ8X3OU0W7b7XeS4Yu/khN9jvOJYI97XXu2TtX37evtKKpn4Egs1Om
	+1Ew==
Received: by 10.112.24.6 with SMTP id q6mr3416980lbf.24.1353177536245; Sat, 17
	Nov 2012 10:38:56 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.18.239 with HTTP; Sat, 17 Nov 2012 10:38:36 -0800 (PST)
In-Reply-To: <CAHod+GeYEUMW6z25i0xOEqGvRHfKrWV3TNHyEO8B9ZjFeDEBOA@mail.gmail.com>
References: <1353096699-19130-1-git-send-email-dromede@gmail.com>
	<20121116213636.GC3411@jama.jama.net>
	<CAHod+GfAof60ycR5EXosair15O87dvZhnxWSouhdF49x8sZQqQ@mail.gmail.com>
	<20121116222855.GD3411@jama.jama.net>
	<CABcZANnSgJYUvwPFzcHaD-W7aBK+7Q=uh785-sQzbokSrq2UoQ@mail.gmail.com>
	<CAHod+GeYEUMW6z25i0xOEqGvRHfKrWV3TNHyEO8B9ZjFeDEBOA@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 17 Nov 2012 11:38:36 -0700
X-Google-Sender-Auth: uK3c1YMDEdDPkLjLiNJb0fut21Y
Message-ID: <CABcZANksE98pw4N6hGntTGtm4__gSO1cy4GSx6ULsqkg_yUAZQ@mail.gmail.com>
To: =?UTF-8?B?TWFya28gS2F0acSH?= <dromede@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [PATCH] udev: Remove deprecated binaries from packaging
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 17 Nov 2012 18:52:57 -0000
Content-Type: multipart/alternative; boundary=e0cb4efe2a0a5daf5604ceb5328f

--e0cb4efe2a0a5daf5604ceb5328f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 17, 2012 at 11:02 AM, Marko Kati=C4=87 <dromede@gmail.com> wrot=
e:

> A proper solution might be to:
>
> a) Leave udevtest and udevinfo in udev-utils to properly support older
> versions of udev that have these packages.
> b) Move udevadm into the main udev package. This makes a lot of sense
> since udevadm is crucial for proper udev operation.
> c) Remove udev-utils from RRECOMMENDS.
>

This sounds like a clean, solid route to me. Hopefully someone else will
chime in with input on it as well.
--=20
Christopher Larson

--e0cb4efe2a0a5daf5604ceb5328f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_extra">On Sat, Nov 17, 2012 at 11:02 AM, Marko Kati=C4=
=87 <span dir=3D"ltr">&lt;<a href=3D"mailto:dromede@gmail.com" target=3D"_b=
lank">dromede@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_quote"=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">

<div id=3D":17f">A proper solution might be to:<br>
<br>
a) Leave udevtest and udevinfo in udev-utils to properly support older<br>
versions of udev that have these packages.<br>
b) Move udevadm into the main udev package. This makes a lot of sense<br>
since udevadm is crucial for proper udev operation.<br>
c) Remove udev-utils from RRECOMMENDS.</div></blockquote></div><br>This sou=
nds like a clean, solid route to me. Hopefully someone else will chime in w=
ith input on it as well.<br>-- <br>Christopher Larson<br>
</div>

--e0cb4efe2a0a5daf5604ceb5328f--
