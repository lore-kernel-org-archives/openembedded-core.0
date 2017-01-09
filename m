Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yw0-f179.google.com (mail-yw0-f179.google.com
	[209.85.161.179])
	by mail.openembedded.org (Postfix) with ESMTP id 7DBD671AC2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 09:31:55 +0000 (UTC)
Received: by mail-yw0-f179.google.com with SMTP id v81so318807369ywb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jan 2017 01:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qNOTsStgZC1gPsnzC/JJuhdXA5znwwOBzbx3ce9XIcY=;
	b=yHst7tCjHAB8T1Sj/r6FucADPC9p3Athtq7IOob4J25VDPi5MNXhO/H4RMS1EJnlvO
	8ppebCiH4zK+ouPBYybTLsUfC3Aq0acvMaiAx8tS03LLlh6qOB3XqxATvrBw96dhZfo/
	2Y0gdNZAca/gixiviqFgxcDAHW9xINJXVhzFYrOxyOs9FOVhl3Or4oLUrnLn41q04JGn
	AaWIrocGJbJaDsiT51nf+/7zDBDLKYGFPlTqH7cOqxT4Vt+3ty0nYJcYrz2qF/T7eZ4P
	UxrNmqm+2PbcXzMhIsBUqXgz21quYt5tfHWjeoArSgyp6YkQBE96jSzR2Yy+NgGudSJ4
	0VKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qNOTsStgZC1gPsnzC/JJuhdXA5znwwOBzbx3ce9XIcY=;
	b=mK+xs1rBkgBjxHWE1hunos/KMIxqLzePmZKMvJZXDu2ufiY8hdwYKGnI4Rf/rXGEW1
	TyspzKi6wrypd79tFL7LOBHsxx6ZhBmXONZhpmZSRcX9eMReiuO4+VkcUHBIFYM0pngI
	lTL3XKQtC2wutvCcxDkJBXGgr2bUACRAKBBNYE0FC1sy6AcvCxmScy0ErefPM8zVAsLk
	QWHLM6/n8mFaSKa1djT36WO3dU0A8wma6Dqx7zAaqb8w4UZnDky50NZ3SK713m6+Dy/w
	WRdvzlpS2fvuSf5uuMqJ0oW7UN62NotFR/kZK59Nb0JX5t5cYIyXkH7beDvUvleX9HdZ
	1JcQ==
X-Gm-Message-State: AIkVDXKOZ10tUl6cpIr44cNsnz5dHFw/agmLuPRItMs9y7GfiwgDbfgpeGkZwAXA+p4QRVKFzUquKLCxyWGB3+e1
X-Received: by 10.13.205.4 with SMTP id p4mr86027589ywd.337.1483954315676;
	Mon, 09 Jan 2017 01:31:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.13.234.11 with HTTP; Mon, 9 Jan 2017 01:31:25 -0800 (PST)
In-Reply-To: <1483930443-12454-1-git-send-email-Haiqing.Bai@windriver.com>
References: <1483930443-12454-1-git-send-email-Haiqing.Bai@windriver.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 9 Jan 2017 11:31:25 +0200
Message-ID: <CAHiDW_FHs0Vnu9ofMZ10LFrhM9ntRqVTC3HoDj1+9eoeeoDeBA@mail.gmail.com>
To: Haiqing Bai <Haiqing.Bai@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-2.0: add configure option to control dbus related checking
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
X-List-Received-Date: Mon, 09 Jan 2017 09:31:55 -0000
Content-Type: multipart/alternative; boundary=94eb2c08b380d982f30545a60938

--94eb2c08b380d982f30545a60938
Content-Type: text/plain; charset=UTF-8

On 9 January 2017 at 04:54, Haiqing Bai <Haiqing.Bai@windriver.com> wrote:

> Fixed the issue that checking dbus modules is not controlled by switch
> '--enable-dbus/--disable-dbus" which causes the inconsistent building
> output by the package building sequence of glib-2.0 and dbus.
> Also add PACKAGECONFIG line to automatically get the right configure
> option.
>

Since the PACKAGECONFIG is not set by default does this mean our test
images used to get gdbus tests in ptests (even if by accident) but would
not have them with this patch?

 - Jussi

--94eb2c08b380d982f30545a60938
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 9=
 January 2017 at 04:54, Haiqing Bai <span dir=3D"ltr">&lt;<a href=3D"mailto=
:Haiqing.Bai@windriver.com" target=3D"_blank">Haiqing.Bai@windriver.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Fixed the issue that c=
hecking dbus modules is not controlled by switch<br>
&#39;--enable-dbus/--disable-dbus&quot; which causes the inconsistent build=
ing<br>
output by the package building sequence of glib-2.0 and dbus.<br>
Also add PACKAGECONFIG line to automatically get the right configure option=
.<br></blockquote><div><br></div><div>Since the PACKAGECONFIG is not set by=
 default does this mean our test images used to get gdbus tests in ptests (=
even if by accident) but would not have them with this patch?</div><div>=C2=
=A0</div><div>=C2=A0- Jussi</div></div></div></div>

--94eb2c08b380d982f30545a60938--
