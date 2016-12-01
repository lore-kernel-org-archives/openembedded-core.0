Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 0C14271B23
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 17:41:25 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id x190so252626153qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2016 09:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TwGmHvm7ydvc2KbKsDc+S0e6MSaYIasfrtZe+jr7WX8=;
	b=TpzRVI/e+DQQarHe10OULWi+HKfUiTh89n/G90tG2Dl58sKjnJ5IwJ0BkxoGIJtD5D
	mJ6KMgquYUfdYXwwzwBTscWFR+DLuwRz1+kUo3EzshUf3SqCasMd5a7hNDvqpg4dyGlG
	R8a4lhNVQ2pgCo14GZ0+o5tXMop9RQuWd7RNg0vMzR29q2yqCIMEGXr2gETr9k5ev09H
	k7wfteWe0MexJoDnKWLHkiEn2R+AYk786gIKuV+7GF+/e86Z28+Z8A+XI4K9JGD51zVt
	CK410jcX/yk2OvX6QIi6miaYj21YYp18drcD8A5M9cJ3H61uYpkZ81vt81Ed2Gc7G7QD
	CIAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TwGmHvm7ydvc2KbKsDc+S0e6MSaYIasfrtZe+jr7WX8=;
	b=kB/9psoi10R80wBePp42iV8CXVqAK0ciiyS2R0DdHEoW0t4kjIzLpBu0dx3JY4zIPS
	LCBGps18lPkRht0iFhfaQ5vcoycWzzgeOsQDE8RQ24sBICkGJasxQX0aDjTMdLZhey0r
	pbzDEVNbweY+6vX4zy8Sd6021XpFDporRvPLO6SqZTRsSD4VzOITzvwEIsei3I09hSNH
	yCqkknc+SRfVrsr/MnfPCKRCbnuyAMFSAsuj1ZLJEAp/RsX4BIZ0QTh0Xqmvu5jynQM6
	tT4VvCbbtrqlO4JPy4GtEqBzMDPcEY/EvMUUFYV+KXWCyqxdRUMyjB3NzoiuxB85/RHL
	I1bw==
X-Gm-Message-State: AKaTC03ZARgLJV6YodbKD4JgbdvgG5WIAR/M2U3bCVbhi+UcmDi3j67U0OVzjWPftXcWHT12JyJkfJIai5DUg2hf
X-Received: by 10.55.39.88 with SMTP id n85mr33463856qkn.244.1480614086548;
	Thu, 01 Dec 2016 09:41:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Thu, 1 Dec 2016 09:41:06 -0800 (PST)
In-Reply-To: <1480531827-11799-1-git-send-email-obi@opendreambox.org>
References: <1480531827-11799-1-git-send-email-obi@opendreambox.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 1 Dec 2016 17:41:06 +0000
Message-ID: <CAJTo0Lbt2APOm5ZfMQqF3Rg16W-AyBPJTYZCdd_OsXPOH-9pDA@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] bash: use update-alternatives for the bash binary
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
X-List-Received-Date: Thu, 01 Dec 2016 17:41:26 -0000
Content-Type: multipart/alternative; boundary=94eb2c094b16adba5405429c548b

--94eb2c094b16adba5405429c548b
Content-Type: text/plain; charset=UTF-8

On 30 November 2016 at 18:50, Andreas Oberritter <obi@opendreambox.org>
wrote:

> Busybox may offer a bash applet. If enabled, the alternatives mechanism
>

Wait, what?  busybox can ship a /bin/bash that isn't bash?  That's
*hideous*!

Ross

--94eb2c094b16adba5405429c548b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 November 2016 at 18:50, Andreas Oberritter <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:obi@opendreambox.org" target=3D"_blank">obi@opendreambox.org<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":56e" cl=
ass=3D"a3s aXjCH m158b693bb3701d30">Busybox may offer a bash applet. If ena=
bled, the alternatives mechanism<br></div></blockquote></div><br>Wait, what=
? =C2=A0busybox can ship a /bin/bash that isn&#39;t bash?=C2=A0 That&#39;s =
*hideous*!</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra">Ross</div></div>

--94eb2c094b16adba5405429c548b--
