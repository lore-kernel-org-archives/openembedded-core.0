Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2D45860043
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Nov 2015 23:32:01 +0000 (UTC)
Received: by qkcl124 with SMTP id l124so58078721qkc.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Nov 2015 15:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=2rgIlGRjQMPozQuM1W/6kPU1O97DSLgaJBJ/LSsBaTY=;
	b=SpfmCZO+IFHFo+p96V4NmjRTdEnSL67zf88XR+pkeqY4imQ5cdEpiGWISJoCjqyReV
	omhtaoIct0cbnUIscKxdJKi+E1/uYWwQugrdT5ukVkFCBAIYdlK4xa1KiksO926ga5aT
	oKSEi93NA7USGtnOFYIpQak+tQqhQMZJcy7+8uYm7rX6y2RcavuWb+ltuki1wXso9hiT
	rDI7jszEPdKI+0nP8kaboVSshLjWDAQJpC+AfhDFeteJJH7d2m/0KznWQxruJqlBAwcv
	bJUc0fuCf+GFoJGJQFlsGv0AkWvre0Fa9eQgHHca7sBQKSL5Z7d8xzRUwM+riyQs22Ap
	pXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=2rgIlGRjQMPozQuM1W/6kPU1O97DSLgaJBJ/LSsBaTY=;
	b=anF2QZF5byKGRJ1LWWMqUhK40yNyJTW2sAut8lMSQW9cNaNAUvrYQWzErUGGg5Wedk
	D9WYVZRfOuK/oUbn+7BTSx+183ModX/RnnYdsg1SnepYssrV74aw2wJvnhBvBVXVc+fO
	Oe4jxDUNC5R4xw07MABoQE8EYIxJIUcEzLIIs9T9ozGkzGlugOI5cfDWEqoI4m0tXkzc
	902KtfTw68xtZ38fpSvTqdFJToVD8Gz+AQv8itn23Pu7c/5X0LvBDgApN8neH9CJwCQ+
	guAE3+jop+4udHTdNKd1EC3wzWxQYCBXiJAnKeLB/IOj0imVjckfYmXYwSEFt5h/tf2R
	WgJw==
X-Gm-Message-State: ALoCoQmtBfe+I2fOYi8lDxGEZdHp6gxeDDD4gzX87M52ssffE5gAoMD3iyX1st5Fi8kmNTOY1NT7
X-Received: by 10.55.73.144 with SMTP id w138mr20990685qka.104.1446939121380; 
	Sat, 07 Nov 2015 15:32:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.94.110 with HTTP; Sat, 7 Nov 2015 15:31:41 -0800 (PST)
In-Reply-To: <A2AEDEA2-FB1D-4D6F-8B2F-F420AC123C9B@gmail.com>
References: <6A0E85DF-31B7-4955-B4A2-0F3E099FCF99@gmail.com>
	<CAJTo0Lb7w0XAJ-H-T2Uz-mdmjUZGFX9wQyzCUJ_4bU8re9rswQ@mail.gmail.com>
	<A2AEDEA2-FB1D-4D6F-8B2F-F420AC123C9B@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 7 Nov 2015 23:31:41 +0000
Message-ID: <CAJTo0LYOMeiaie9=3i908aAj3H4U0_qSdf7RmXSofosBMzcW9w@mail.gmail.com>
To: Jens Rehsack <rehsack@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Update libusb1 from 1.0.19 to 1.0.20
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
X-List-Received-Date: Sat, 07 Nov 2015 23:32:02 -0000
Content-Type: multipart/alternative; boundary=001a114a9f4457876a0523fbc43c

--001a114a9f4457876a0523fbc43c
Content-Type: text/plain; charset=UTF-8

On 7 November 2015 at 10:36, Jens Rehsack <rehsack@gmail.com> wrote:

> I look into it and send a v2, if necessary
>

Thanks Jens!

Ross

--001a114a9f4457876a0523fbc43c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 November 2015 at 10:36, Jens Rehsack <span dir=3D"ltr">&lt;<a href=3D"=
mailto:rehsack@gmail.com" target=3D"_blank">rehsack@gmail.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":3r0" class=3D"a3s" s=
tyle=3D"overflow:hidden">I look into it and send a v2, if necessary<br></di=
v></blockquote></div><br>Thanks Jens!</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">Ross</div></div>

--001a114a9f4457876a0523fbc43c--
