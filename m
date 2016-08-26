Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id B35F06FF60
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 08:56:00 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id n128so134355677ith.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 01:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KFI/Z6Y5zX2B1dW19GrxbWo7N5rV+IU+2smugdzYMAw=;
	b=v//0ZnWcTmwn3LNDDG1z7PiHAn8uxqN3Gzu+8XfURbKj0FQuYhtPOeL5FT3D535R3e
	e8MCkHvARhXxUS473Sl5MQFj+PZyh4UTfd4FEaeNPAd8NAK5RqbpCUktR8gyJNaIUlEO
	R3MZQhXWP2EY5BaxO474yL+ipcoKh8xt1vOz17uzKlEOT6gdn3so7KAgwS5BbXjVwQ2E
	KbX/uF3036ploba3J3Rqjjon+4kDYX5UIuY0rmufecyaZUWI7vXebDFQ/aa5mptbTEzD
	UPwtAhVbTKtcT3csG9llg6i+wl3bbUtTUtYYinlNscyC9kZcPQHmpt0QsucSsQduf4zo
	sB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KFI/Z6Y5zX2B1dW19GrxbWo7N5rV+IU+2smugdzYMAw=;
	b=JGwAaOQTCvQi5NdSJ35FNv1R3CuBIa82/wVS4D9fCuTO2jJ9stEEyUcMmoa1sg4oDa
	S5/ekQytefQWgS+ZCbFn/U2VACuFuHPGnVet8c1ZI57XI/+lwOu2XEI9YUjfC7jCjOXT
	lCbj62GfqXoYH73on7dPTi5zmOiNnoS2mjyQ/U1uj4iPRpinJw3ZrVIpS1SvbQzX5D5U
	m9WxAXZ6HeffCjh5JWj3N14GKc0AM/YO0tPLY9R5xrU6CZ8C6gA2BNrBzoMjeW5lAmHl
	Hwvk9jV9puA2zyXmGIb+qObwpjzUWJZRzEto7YlfsJxJSAllQN68bjscJccVsELW2u0g
	accA==
X-Gm-Message-State: AE9vXwO0xjWd38Zx5NB5oawXzZnD1ZOoE6c5s5oy//1FI7441adwZle7o41kH+33yB8TvyKvqYefrhxSI17k6mcq
X-Received: by 10.107.138.212 with SMTP id c81mr2519603ioj.148.1472201760894; 
	Fri, 26 Aug 2016 01:56:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Fri, 26 Aug 2016 01:55:40 -0700 (PDT)
In-Reply-To: <1472178349-32199-1-git-send-email-mingli.yu@windriver.com>
References: <1472178349-32199-1-git-send-email-mingli.yu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Aug 2016 09:55:40 +0100
Message-ID: <CAJTo0Lajz4nb5S5T4rq=F6fmfGvRPEuAyKF=U-OZdWfo+JoOqQ@mail.gmail.com>
To: Mingli Yu <mingli.yu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] groff: add file-homedir-perl to RDEPENDS
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
X-List-Received-Date: Fri, 26 Aug 2016 08:56:00 -0000
Content-Type: multipart/alternative; boundary=001a113ed932ff0662053af5aec2

--001a113ed932ff0662053af5aec2
Content-Type: text/plain; charset=UTF-8

On 26 August 2016 at 03:25, <mingli.yu@windriver.com> wrote:

> The series add file-homedir-perl to RDEPENDS for groff as
> glilypond rdepends on File/HomeDir.pm provided by file-homedir-perl
>

Isn't lilypond the music score layout tool?  This seems very specialist.  I
suggest adding the new recipes to meta-perl, and then if someone does want
to use it then the requirements are available.

Unless you're only hitting this because of testing, in which case I'd
suggest skipping this test.

Ross

--001a113ed932ff0662053af5aec2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 August 2016 at 03:25,  <span dir=3D"ltr">&lt;<a href=3D"mailto:mingli=
.yu@windriver.com" target=3D"_blank">mingli.yu@windriver.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":1vs" class=3D"a3s aXj=
CH m156c4ace489e45c8">The series add file-homedir-perl to RDEPENDS for grof=
f as<br>
glilypond rdepends on File/HomeDir.pm provided by file-homedir-perl<br></di=
v></blockquote></div><br>Isn&#39;t lilypond the music score layout tool?=C2=
=A0 This seems very specialist.=C2=A0 I suggest adding the new recipes to m=
eta-perl, and then if someone does want to use it then the requirements are=
 available.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">Unless you&#39;re only hitting this because of testing, in which case=
 I&#39;d suggest skipping this test.</div><div class=3D"gmail_extra"><br></=
div><div class=3D"gmail_extra">Ross</div></div>

--001a113ed932ff0662053af5aec2--
