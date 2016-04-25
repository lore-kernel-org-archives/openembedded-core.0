Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id A728D6B6EA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 15:26:20 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id u185so187163590iod.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 08:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rt9csakwgkMsYIL6aGQZtR+PrLoVQWzH/hP7hKczx/E=;
	b=HNn4/ybcEZlCS0Nn15hoalArOy0O6H0QkeYwOVM0QmE5xspBtcqKm2hqB3qsYCoIam
	zAGXI/aoDfRgYPwXuFns/Gs3K28tyWHMjhFq2M0WI497Q5XE0kI6vgDXZFsbNIocaaqt
	Otdh3gKAMv15lL29QKAAQrf5g4mXXzQEYS4PUT1rRY9KCklxsf4i/ZvDGzPOm7uAe9fH
	yEEPtHxC/J0Ph2itGMeguobth4Q9xJ3B2tFwBapyEALOhZ0tbHf20T7F1t1cUWF0fhEx
	l5H508YiIcljQjd4KljS8l6bVdFcH1DuOHhQHdF4jBDwJvcT66sFcU2YY7ZTvR3J9EuW
	zlcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rt9csakwgkMsYIL6aGQZtR+PrLoVQWzH/hP7hKczx/E=;
	b=balJ0D/r2AhKQNActNCcoRzjq12QOn39G65z4CofYJLRMqaqfH9+/akpbNe3Ws4XY3
	yyaQosH0DeXrV2XTrm5V4y6QlWjl83eDc2Cqmb5HBcBX4URPT+Y5acbL7maYa7f2bLCw
	gddAM1UjwWr28RAuKe27jKgcgZHJPI7zUYHRXcPCqiR1I+nyLxSjMyyJc3IayUX/hJlo
	ijiwHqrmHokbGpXIbUBrd5iTZBx4jCv86RUH0hW2v9yNz9ggoiWT7Gn0vcCJ6LpHBGty
	DuB3FxEtfOHENSPbnMcZjcDQYjoe/adgxbSCQ/vgdnoM9F5dipYvlOJtYwe9YHcs5e3e
	EEYQ==
X-Gm-Message-State: AOPr4FWQsRy7gk9Mr4aFKverQwE93INDy+1xZDOZ5La51fABryF25yY1FMlPtN6U9+63l0hgntXLfrbtlbA+et1b
X-Received: by 10.107.179.136 with SMTP id c130mr23646388iof.99.1461597981098; 
	Mon, 25 Apr 2016 08:26:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.106 with HTTP; Mon, 25 Apr 2016 08:26:01 -0700 (PDT)
In-Reply-To: <e76f32f4bb513453ffd80704adf19540b8f35d2a.1461592183.git.liezhi.yang@windriver.com>
References: <cover.1461592183.git.liezhi.yang@windriver.com>
	<e76f32f4bb513453ffd80704adf19540b8f35d2a.1461592183.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 25 Apr 2016 16:26:01 +0100
Message-ID: <CAJTo0LZgtTN+6M_Xvwm2zQAibJR0jBXB15eU12HfUtz2ERuYKA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] libxsettings-client: fix LICENSE
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
X-List-Received-Date: Mon, 25 Apr 2016 15:26:21 -0000
Content-Type: multipart/alternative; boundary=001a1148578c77dbef053150ccbe

--001a1148578c77dbef053150ccbe
Content-Type: text/plain; charset=UTF-8

On 25 April 2016 at 14:51, Robert Yang <liezhi.yang@windriver.com> wrote:

> The tarball has a COPYING file now, and is GPLv2+.
>

Just had a proper look at this.  The tarball has a COPYING that says GPL,
but the source files are all clearly marked MIT.

Ross

--001a1148578c77dbef053150ccbe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 April 2016 at 14:51, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1h5" cl=
ass=3D"a3s aXjCH">The tarball has a COPYING file now, and is GPLv2+.<br></d=
iv></blockquote></div><br>Just had a proper look at this.=C2=A0 The tarball=
 has a COPYING that says GPL, but the source files are all clearly marked M=
IT.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ro=
ss</div></div>

--001a1148578c77dbef053150ccbe--
