Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1252A71E47
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 16:18:06 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id p16so111101001qta.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 08:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=L4iyBEjqJgWK4Aak+KoKo9rPSE7GlnqdzXyMiHOplt0=;
	b=DsdMFoshkJ6YHNmH54QpYeIXjjsN1X9aSavxHw259oU8Mt6Dns79fhn7O068nP1QHy
	7naRhovwnoTBC73hm4JVo1NUY/46gYgi7pnqcfy+egglva3TuaTKHBVsAu8rV7vGtBN8
	7yQkDrXK6CMwqVLbtItJlh+uwxwyu7r4aIAhQj7eYsjXj/ikmBGP2ofDTR0+16a13rJY
	Z3YavGgzpqTLxxvBL6rc9HGzT+0zKIwDr7YaS2CesZOdtLNAbiVfPXUpwhhTEM+yP5Oj
	PwmNsAdB7BoUIFR+FcLKuEApAIDWfBbwe/LuVO0ZZcqCm96vtASsvTuH3FX7Lj5ZHMfu
	QhAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=L4iyBEjqJgWK4Aak+KoKo9rPSE7GlnqdzXyMiHOplt0=;
	b=eWtgotrlWKTtaN1BXbSWUz7HqsvJIubHXjCMSjikgLZR2uDIscNsT2EJWXlVG65o8Y
	rE96gNdQ8Srf4gatJkU1b1qxD41PfWv8Gi9bhQ8PMjfy6WRNxEhwrdxbbxbcEIqD/KiS
	i3vjuWzCtxh86ExxNFt9G9otlkP8jnfi4Tkf7rhh25tF4mhXz9FqfD90mH7FJzmQz/SU
	ihNt51TmOJ6lOUbVH+0byVEaJJQq6WJfLKkejs5IRpMD1TgJF/rXfQVJ0YpVa06qPiGR
	SLrs206viEMh77LTfGjU8HJfSQxkq5LhZftzFBU9jI+Bzzmi1t/oeNF5bN6ZPGBoWEVH
	whHw==
X-Gm-Message-State: AKaTC014rknBNWTZKhJzRfdo37a7xR7xZ4sAGzIWzNC2PAa/5b7tUNqBeedqlR4xK9ktLZkDkbAsfs7RlNl4l8V9
X-Received: by 10.237.36.154 with SMTP id t26mr82310380qtc.188.1481645887876; 
	Tue, 13 Dec 2016 08:18:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 13 Dec 2016 08:17:47 -0800 (PST)
In-Reply-To: <1479227073-13133-1-git-send-email-jose.perez.carranza@linux.intel.com>
References: <1479227073-13133-1-git-send-email-jose.perez.carranza@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Dec 2016 16:17:47 +0000
Message-ID: <CAJTo0LZ1cj5Nm+iSO5aaHRMgf1Syhx6wQ3R2OaBe99A-SKX5Yg@mail.gmail.com>
To: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] oe-tests: Migrate tests from /oe/test to /oeqa/selftest/oe-tests
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
X-List-Received-Date: Tue, 13 Dec 2016 16:18:07 -0000
Content-Type: multipart/alternative; boundary=001a1141058ed482f905438c9026

--001a1141058ed482f905438c9026
Content-Type: text/plain; charset=UTF-8

On 15 November 2016 at 16:24, <jose.perez.carranza@linux.intel.com> wrote:

> Currently the unittests for scripts on meta/lib/oe/tests are not being
> executed by any suite hence the best option is migrate them to
> meta/lib/oeqa/selftest/oelib-tests to be executed along with the selftest
> suite.
>

For some reason the discovery is very slow:

$ oe-selftest  -r oelib-tests.elf oelib-tests.license oelib-tests.path
oelib-tests.types oelib-tests.utils
2016-12-13 16:15:00,014 - selftest - INFO - Running bitbake -e to get BBPATH
2016-12-13 16:15:03,143 - selftest - INFO - Checking that everything is in
order before running the tests
2016-12-13 16:15:06,512 - selftest - INFO - Running bitbake -p
2016-12-13 16:15:10,203 - selftest - INFO - test runner init'ed like
unittest
2016-12-13 16:15:13,428 - selftest - INFO - Loading tests from:
oeqa.selftest.oelib-tests.elf
2016-12-13 16:15:16,489 - selftest - INFO - Loading tests from:
oeqa.selftest.oelib-tests.license
2016-12-13 16:15:29,391 - selftest - INFO - Loading tests from:
oeqa.selftest.oelib-tests.path
2016-12-13 16:15:38,822 - selftest - INFO - Loading tests from:
oeqa.selftest.oelib-tests.types
2016-12-13 16:15:57,719 - selftest - INFO - Loading tests from:
oeqa.selftest.oelib-tests.utils

It took over a minute to load a few tests.  Do you have any idea why the
discovery is so slow?

Ross

--001a1141058ed482f905438c9026
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 November 2016 at 16:24,  <span dir=3D"ltr">&lt;<a href=3D"mailto:jose=
.perez.carranza@linux.intel.com" target=3D"_blank">jose.perez.carranza@linu=
x.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(2=
04,204,204);border-left-style:solid;padding-left:1ex"><div id=3D"gmail-:1up=
" class=3D"gmail-a3s gmail-aXjCH gmail-m15868c796a11fd24">Currently the uni=
ttests for scripts on meta/lib/oe/tests are not being<br>
executed by any suite hence the best option is <span class=3D"gmail-il">mig=
rate</span> them to<br>
meta/lib/<span class=3D"gmail-il">oeqa</span>/selftest/oelib-<wbr>tests to =
be executed along with the selftest suite.<br></div></blockquote></div><br>=
For some reason the discovery is very slow:</div><div class=3D"gmail_extra"=
><br></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">$ oe-selft=
est =C2=A0-r oelib-tests.elf oelib-tests.license oelib-tests.path oelib-tes=
ts.types oelib-tests.utils</div><div class=3D"gmail_extra">2016-12-13 16:15=
:00,014 - selftest - INFO - Running bitbake -e to get BBPATH</div><div clas=
s=3D"gmail_extra">2016-12-13 16:15:03,143 - selftest - INFO - Checking that=
 everything is in order before running the tests</div><div class=3D"gmail_e=
xtra">2016-12-13 16:15:06,512 - selftest - INFO - Running bitbake -p</div><=
div class=3D"gmail_extra">2016-12-13 16:15:10,203 - selftest - INFO - test =
runner init&#39;ed like unittest</div><div class=3D"gmail_extra">2016-12-13=
 16:15:13,428 - selftest - INFO - Loading tests from: oeqa.selftest.oelib-t=
ests.elf</div><div class=3D"gmail_extra">2016-12-13 16:15:16,489 - selftest=
 - INFO - Loading tests from: oeqa.selftest.oelib-tests.license</div><div c=
lass=3D"gmail_extra">2016-12-13 16:15:29,391 - selftest - INFO - Loading te=
sts from: oeqa.selftest.oelib-tests.path</div><div class=3D"gmail_extra">20=
16-12-13 16:15:38,822 - selftest - INFO - Loading tests from: oeqa.selftest=
.oelib-tests.types</div><div class=3D"gmail_extra">2016-12-13 16:15:57,719 =
- selftest - INFO - Loading tests from: oeqa.selftest.oelib-tests.utils</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">It took o=
ver a minute to load a few tests.=C2=A0 Do you have any idea why the discov=
ery is so slow?</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">Ross</div></div></div>

--001a1141058ed482f905438c9026--
