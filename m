Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id E44B161BCA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 20:46:29 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id n6so2292814vsc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 13:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OI9Ignvir+03IhwzfhmRVLvM2r4iNQwmcGqGC+B5A8g=;
	b=dHRyTyi8b/g6wJDUw7ScFlKhiQnbrSSdRc3eBJU15lxKLNENFLdwLpOmjVdGVLqTAd
	KCcq6I5zhr3Vsl1W660sd0fYfPdvKpBXIyaIMCGhipPfuoawoC9KIrpxBv7gA5CYHncl
	AkcU8AWCSSdAdBhp/JkT2o5XIEsowikM9Um00WMBgXHf+jhFGEfIW5lMikCyjFrU2u6X
	rHhJOqn1PKrGao5etYJzVLlHTqc1dxsYp2xqOznRXYrNvDr+k+v1uRgOkFG882Tm7GGt
	q6nWcJ+cgMu1VoeI8XRCAAFHutOxgZuoQEwjk0VW2Zp4LJDfelsv4hm2ZUZzb+cl4ORB
	ex+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OI9Ignvir+03IhwzfhmRVLvM2r4iNQwmcGqGC+B5A8g=;
	b=h+KrkfmZuy700p44lf55yaGqMYsHKFLhf6aEXAvM5/8Tq7Rvv9pY+OM01b+7ucu9c2
	sN33QojQyiQzFW37rEui4MKrOq7D57tE8FDokcUAVxiypWdUNRm1lAaGoaO6hw2ZUY/e
	lVC71Fa9wxNj0TKllM5muaSKHACr08Z/yEjaSL378B4QrWN6UqRTgU1W7jHVD98J694W
	EwCYfDrmEyM2WUDUOoBjBlRNd4T3Dh6DLKqgoKc6ZqTA5eS/lK+26Om9FKjxh9ieU6sd
	8vS4jv/1LF9xXx2b77t9EWEnrYXLfUPmTsXPWnVzBg9Uf6x0mVDk4fBGQUkC3Ea67GCw
	y1YA==
X-Gm-Message-State: ANhLgQ0LVsoX7vZXzJUxSKMigb6w9ERNoqu/a48ieZm5XUjrJLI5Q17T
	gqKxb+TQM6MWdgPm+c/GRT2FQbmgcBZB3AhLn0I=
X-Google-Smtp-Source: ADFU+vsQIsqahZmAvorNMFYDwvtclUJYcoecNvEoTLqvsoEEzUqF8d+l1M0wNA386zu/9GockOW9uJv4YbNSFndKpYg=
X-Received: by 2002:a67:de97:: with SMTP id r23mr3486401vsk.23.1583959590800; 
	Wed, 11 Mar 2020 13:46:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200311163730.78078-1-sk@typedivision.de>
	<c487b390822a86c1f5dd9339324e86c973142e0e.camel@linuxfoundation.org>
	<d950b7b1-b5f1-8395-69d8-dde1d17725a8@typedivision.de>
In-Reply-To: <d950b7b1-b5f1-8395-69d8-dde1d17725a8@typedivision.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 11 Mar 2020 21:46:19 +0100
Message-ID: <CANNYZj-BW-y=Ky_WLdGaJR6-5g-Ok00a7dRDTdnxuN3M7Vt5FQ@mail.gmail.com>
To: Stefan Kral <sk@typedivision.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa: enable testresults.json for testexport
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
X-List-Received-Date: Wed, 11 Mar 2020 20:46:30 -0000
Content-Type: multipart/alternative; boundary="000000000000bf92c105a09a549a"

--000000000000bf92c105a09a549a
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Mar 2020 at 21:38, Stefan Kral <sk@typedivision.de> wrote:

> I just started to evaluate the use of testexport.
>
> If you think about removing that feature, what is the preferred way to
> test a deployed target image?
> The idea here is to have two separate pipelines:
>
> 1. build
> - a target-image-test (same as target-image but additional test
> facilities enabled, like ptest)
> - the testexport output
>
> 2. test
> - fetch build results and install the target-image-test to the real
> hardware
> - run the exported runtime tests (host and target based cases)
> - check/save the generated testresults.json
>

You can do all of these in a single pipeline using testimage:

1. built target-image-test
2. flash target-image-test to real hardware
3. bitbake -c testimage target-image-test (set TEST_TARGET to
'simpleremote', and ip/port for ssh access in local.conf)

Is there a reason you need two pipelines?

Alex

--000000000000bf92c105a09a549a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 11 Mar 2020 at 21:38, Stefan Kral=
 &lt;<a href=3D"mailto:sk@typedivision.de">sk@typedivision.de</a>&gt; wrote=
:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">I just started to evaluate the use of testexport.<br>
<br>
If you think about removing that feature, what is the preferred way to <br>
test a deployed target image?<br>
The idea here is to have two separate pipelines:<br>
<br>
1. build<br>
- a target-image-test (same as target-image but additional test <br>
facilities enabled, like ptest)<br>
- the testexport output<br>
<br>
2. test<br>
- fetch build results and install the target-image-test to the real hardwar=
e<br>
- run the exported runtime tests (host and target based cases)<br>
- check/save the generated testresults.json<br></blockquote><div><br></div>=
<div>You can do all of these in a single pipeline using testimage:</div><di=
v><br></div><div>1. built target-image-test</div><div>2. flash target-image=
-test to real hardware</div><div>3. bitbake -c testimage target-image-test =
(set TEST_TARGET to &#39;simpleremote&#39;, and ip/port for ssh access in l=
ocal.conf)</div><div><br></div><div>Is there a reason you need two pipeline=
s?</div><div><br></div><div>Alex<br></div></div></div>

--000000000000bf92c105a09a549a--
