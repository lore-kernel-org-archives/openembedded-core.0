Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 978D573BB8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 19:57:24 +0000 (UTC)
Received: by qkbm65 with SMTP id m65so3307337qkb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 12:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ISkyz8jiotim71hzcJqalCMe/0DXMVfYdqHCmSyZzuM=;
	b=PR2ei/otPVqdhOwUnawORg1DSWo7vhZw1uq4ndTLYozQmXmX0AfHMlM4nMx759Kd9h
	4TXqmpAU+/kEi3RLjYWZQXDn0LAfrTDNP8W23kljrMjmkZpVaSJjPTiLYMEuC19W1FAQ
	YDyJn3Crs0xwNvCiMSaU1+ToU1L4S6WMw/gm9HDomwwiP3MCTcDMcukQecVQHs66YDnh
	aW+9XK+VKXhmhMe8WOAqz3fMmi2vNHvBthZC0Xa6HnJMb0Qz7re9ryRqOUbmcDH7vKqM
	LtDPP5UqzT1t0LiKn2EY3vHrHlZKopPAOzJS9jmKc8ITPYo1zEwbN0T6m8eeRXqoFmP3
	cVgQ==
X-Gm-Message-State: ALoCoQlXlIm1xevOz/3pLbuIluO7OUwm4poW2azktZ1x1RQIcmXER86D076t+z6Yl5NNB19QKxda
X-Received: by 10.140.88.80 with SMTP id s74mr19765597qgd.59.1437076644450;
	Thu, 16 Jul 2015 12:57:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 16 Jul 2015 12:57:05 -0700 (PDT)
In-Reply-To: <1437009464-31315-1-git-send-email-rongqing.li@windriver.com>
References: <1437009464-31315-1-git-send-email-rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 16 Jul 2015 20:57:05 +0100
Message-ID: <CAJTo0Lbs-5EP4g_m_hqZgKgtG7TUqiwdcrxqnuawxbOFq-nbdA@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] weston: fix two building issue
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
X-List-Received-Date: Thu, 16 Jul 2015 19:57:26 -0000
Content-Type: multipart/alternative; boundary=001a11c114c4e86adc051b037a45

--001a11c114c4e86adc051b037a45
Content-Type: text/plain; charset=UTF-8

On 16 July 2015 at 02:17, <rongqing.li@windriver.com> wrote:

> 2. create tests dir and ivi-shell to fix the building rule dependency
> issue.
>    sed "..." ivi-shell/weston.ini.in > ivi-shell/weston.ini
>    ivi-shell/weston.ini: No such file or directory
>

Please add some mkdir calls to the Makefile instead of fixing this in
do_compile_prepend.

Ross

--001a11c114c4e86adc051b037a45
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 July 2015 at 02:17,  <span dir=3D"ltr">&lt;<a href=3D"mailto:rongqing=
.li@windriver.com" target=3D"_blank">rongqing.li@windriver.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":2yk" class=3D"a3s" =
style=3D"overflow:hidden">2. create tests dir and ivi-shell to fix the buil=
ding rule dependency issue.<br>
=C2=A0 =C2=A0sed &quot;...&quot; ivi-shell/<a href=3D"http://weston.ini.in"=
 rel=3D"noreferrer" target=3D"_blank">weston.ini.in</a> &gt; ivi-shell/west=
on.ini<br>
=C2=A0 =C2=A0ivi-shell/weston.ini: No such file or directory</div></blockqu=
ote></div><br>Please add some mkdir calls to the Makefile instead of fixing=
 this in do_compile_prepend.</div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra">Ross</div></div>

--001a11c114c4e86adc051b037a45--
