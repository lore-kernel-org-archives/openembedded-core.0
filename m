Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id EBAA572FAF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 18:07:58 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id b16so68721884qte.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 10:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Hip+gG2Z2eAxKGbZPKD+s2+tTqEXLI0YOZll4UWcZJk=;
	b=xdGU5X0fT7od3A2IRlSW1bGjdWsT3aBiZ8/2a2lW4KXSXCe+uEb3qtYYn6/mU5mHcU
	cU6ls6cpsCmcX+9UyJM+YeHkx2qGB0J1Xmg3qIGWdpEyR3nN3EyidhtG/jyyFgNC6r9f
	IreQJydvWGC8D+mpmv/ewGe++jjo97B4oo0qqeGb0QDyoQ6DDe0XToNAt360T/MOeMH5
	k6+7QfweOcu5qe6fgPb//bfB8XEOInJwJzd5MWZcERJUjyt1b9dQhCyY5ZODKWTotuwc
	TcFJ36CnGpSf14zBjGccwM2dSDZQ59+BIDtvEShZ0BANEFcEAdfHIXs/ghJkSn6PkjgN
	0Fhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Hip+gG2Z2eAxKGbZPKD+s2+tTqEXLI0YOZll4UWcZJk=;
	b=FGlaaGJpdcZfrazovvktUIy8iKtgUuVW6JHxRictQbafnJ9ZQbWPEmlIbdqSf4HcQe
	hQBnn0hmkV4w5JojrCoHImeQMsHu6Q6rjRzNY9HpBP8xMwBerpuQ3iHfcIq1IoTxV8ri
	0KPuT2WzB1DSON4mGBx4P7wqUMUnMREMJh2PI3kAG3zwva/jGZG3jPa9X/Yb/iCxCIO8
	P4dacR/7TeLZGWu5iuxKYPxF0YRrg+PxTtg+hgeW6rvaRTt5N89kPtHlV4y0hhOINTdV
	yi/7wJvtPWLI8QGDMjFSgFm/dcvwSO80tR1VCHYoJ8sO+rLD1/f+d/5Jt5y+mwgOvv9+
	kYhg==
X-Gm-Message-State: AMke39lJyJnzkDf9UU6MNv4G0SayCrOSlFUTtdnVXZwWOF5ep/237T9fT3PYvmVZB1X1M7V2qBO+Nss0J08eVKn0
X-Received: by 10.200.45.247 with SMTP id q52mr28266252qta.197.1487700479144; 
	Tue, 21 Feb 2017 10:07:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Tue, 21 Feb 2017 10:07:38 -0800 (PST)
In-Reply-To: <CA+aJhH0nEHuOjJJQE7=JeYg6ppjM7FdF+u=yc3TGvExUrQaUTw@mail.gmail.com>
References: <20170130074552.32419-0-nathan@nathanrossi.com>
	<CA+aJhH0nEHuOjJJQE7=JeYg6ppjM7FdF+u=yc3TGvExUrQaUTw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 21 Feb 2017 18:07:38 +0000
Message-ID: <CAJTo0LbYG98-XKeuUFUjvRebOo1p4mN8SpmqBkRW9qjJRZPPTA@mail.gmail.com>
To: Nathan Rossi <nathan@nathanrossi.com>
Cc: Alistair Francis <alistai@xilinx.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] glib-2.0 changes for nativesdk and packaging
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
X-List-Received-Date: Tue, 21 Feb 2017 18:08:00 -0000
Content-Type: multipart/alternative; boundary=001a1139cdf097ecb605490e42ba

--001a1139cdf097ecb605490e42ba
Content-Type: text/plain; charset=UTF-8

On 21 February 2017 at 10:34, Nathan Rossi <nathan@nathanrossi.com> wrote:

> Ping, any comments or feedback for this series?
>

Sorry, looks good, I'll stage them shortly.

Ross

--001a1139cdf097ecb605490e42ba
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 February 2017 at 10:34, Nathan Rossi <span dir=3D"ltr">&lt;<a href=3D=
"mailto:nathan@nathanrossi.com" target=3D"_blank">nathan@nathanrossi.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":5op" clas=
s=3D"a3s aXjCH m15a603c8161e9af7">Ping, any comments or feedback for this s=
eries?<br></div></blockquote></div><br>Sorry, looks good, I&#39;ll stage th=
em shortly.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">Ross</div></div>

--001a1139cdf097ecb605490e42ba--
