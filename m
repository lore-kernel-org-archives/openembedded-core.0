Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 9B1A5731A6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 20:58:16 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id q126so68571448iof.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 12:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=MYeXcU/Zv4uRGTnUy4soOO5V4piZcgBKxl609KWveSE=;
	b=hEF1Yl15lUA5oUFtd1N3gNy0sosyr75P5026mkEY+9Zc38/4guIiQq0waaNvIezNnl
	9dErnHMlBv99WbzFsCDnmuqS/Nq46A1CunPAbNTtIjEvi7HME7GZf1T01Mlp+i9uHEEe
	dw2duaazKzViEYeghxS84ed9kX6ugWEH6NKZLzKQXfnHXpI0hbm/LtvpUoIipA6PYKhj
	dlDMpss9549K9q6c80+61VlE+ebOEY4qye8AxRu+BMCIKWmYHjVGd97Vin4VGZnK7RZH
	LbeBqpy6g/9wVvgWvhXxzwksGrETaiCvsiBaLryWMz1xAS7a6fJx5NmVm8RkqkPsgQ5y
	JUEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=MYeXcU/Zv4uRGTnUy4soOO5V4piZcgBKxl609KWveSE=;
	b=eeq0JNsTcfGSya75ZOGLYFrFJSw8iDGh9t3Ec+pJVXBkNgKN/+618nIYrofUPvxsy0
	f5yyLGZtMym3YQ8aXSIjr8vaFFWBOvIy/ULzZpS4b0PH6xuRSZz4rfxUcHKdvPG3QKM3
	aqh1haVzMVogXLqRBd4Tu+/kRvw7y8kd/xpvBO0RYj4/ZddpKTLDINoRf00x5RmC9IyX
	IWhxJaXMUL4ye82vFANlkCXRo/mUXtmVU0eU0DC/qVVnbV1n/RI/VINPLC6lalSoC+lB
	+4QNm4tUFB5vMkjF3L+ih3MhtViuGAhU7u7DSvIql+EK2j2/BWe6EWvDe7ps55aLisvp
	o/7w==
X-Gm-Message-State: ALoCoQlfY+YDAJOJpqzR+IvwNxjyrV8RHt7m8dNvdyODVVmY8XQgTwQgdYir+xEnZBUxipCdjuzCOKKcPkVmSXdHugfrjcXRX0uHXnrB45vBjIjrgxxSAY4=
X-Received: by 10.107.155.209 with SMTP id d200mr525084ioe.133.1450385896698; 
	Thu, 17 Dec 2015 12:58:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Thu, 17 Dec 2015 12:57:57 -0800 (PST)
In-Reply-To: <551819BB-909A-4462-BDF7-C27A1DA00C96@gmail.com>
References: <cover.1450073907.git.raj.khem@gmail.com>
	<a2dd5384b2607cf7e507cf280addd31ee6df2391.1450073907.git.raj.khem@gmail.com>
	<6c5db9084bed25c8ae9fb93cfe2e3d0ba76121d2.1450073907.git.raj.khem@gmail.com>
	<CAJ86T=WgFsVHRxvC70+xDr_N-=jUu9ircbdvXZNYz37U16+uzg@mail.gmail.com>
	<551819BB-909A-4462-BDF7-C27A1DA00C96@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 17 Dec 2015 20:57:57 +0000
Message-ID: <CAJTo0La3SXE9TK4eZdShnhDs97r3oGS-RS=vqm+seNLUfSqFJA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/6] systemd: Upgrade to 228
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
X-List-Received-Date: Thu, 17 Dec 2015 20:58:18 -0000
Content-Type: multipart/alternative; boundary=001a11403402290aa205271e488c

--001a11403402290aa205271e488c
Content-Type: text/plain; charset=UTF-8

On 17 December 2015 at 20:55, Khem Raj <raj.khem@gmail.com> wrote:

> Ugh yes. but they are harmless fortunately. I will send a refresh update
> to fix it
>

Done already, don't worry.

Ross

--001a11403402290aa205271e488c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 December 2015 at 20:55, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":2uk" class=3D"a3s" st=
yle=3D"overflow:hidden">Ugh yes. but they are harmless fortunately. I will =
send a refresh update to fix it<br>
<div class=3D"HOEnZb"></div></div></blockquote></div><br>Done already, don&=
#39;t worry.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">Ross</div></div>

--001a11403402290aa205271e488c--
