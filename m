Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id A789D731DF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 16:15:13 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id f6so249706287ith.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Aug 2016 09:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MBkUHEXFwHbNy0+Ssu/t+c6J89iqDBTlCtCzTF8ujho=;
	b=KeNGeGMNpsvPU9pgMHXzewELRz8dp/F7aBaoCpMx/TTOSmwOghRU3k0K4gWr51tiH1
	1Ppq1huBghvio3xWQ8bgVt3wXp3jJvaNVI2e7mJWJoVqhk9Z4gNenWVu2v2L14ymaAIp
	HIqGU5zy9qISWSmZnNNOF6EdvA8vRge/WVbC0XUj4dVlalxn6Qv04JgFUR2aXgQpq+p9
	YN0ffzL4sUa2IxossRj6NmbuHXoSpM6nwRXobjUbQc5Y1EDV6BaLWzWI2no3kQBvY2kn
	0FDgScg0CTM+o5H/t9Ww24KvVYJtcUmgrorehdZzmshYsnV2PWxU1O6DQHSBmvprU55V
	vgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MBkUHEXFwHbNy0+Ssu/t+c6J89iqDBTlCtCzTF8ujho=;
	b=nBEd50hYi423VyZAT1Wymc7gcOKPNqyBtjqguL+FeOg7p4VXGB/p/jMxyN8fjgXRXE
	U4EkWXKgHaZslCoLibaDkP7EVPY1CZdprRvFWxX6JzaTPGoK0hHh8hAG4aG3Dv/i1wRZ
	PZ6Mm0XxINZz+K4kGpLDTXty3kJ0t6WtdRTiwtondGLuijyC1SVeXCKx25oiSz5aJAcP
	IwCkPxyUMUkZuaaOXB25iJDMQbcz8tzxRV3hCUY/9+Ry3re7nLvHdvWMLMDa7Tbvhuvh
	NTq/LrtNM7dCytq8MBHvtzf2H794rnKznsTha3KEo8gaJiWHosBCbGR9VsrUrjUv+Oyt
	Mh7Q==
X-Gm-Message-State: AEkooutqzrhpFabciQ3Vbg3w1vG132biHZnJSb+l7XZhen3xkrmVRQkAzH1eLTQCaty7K0qiLnGp7tI2D8tXadEr
X-Received: by 10.36.87.140 with SMTP id u134mr60754372ita.38.1470068113486;
	Mon, 01 Aug 2016 09:15:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 1 Aug 2016 09:14:53 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1607290750390.23975@localhost.localdomain>
References: <alpine.LFD.2.20.1607290725440.23675@localhost.localdomain>
	<alpine.LFD.2.20.1607290735180.23808@localhost.localdomain>
	<1469792913.9142.56.camel@linuxfoundation.org>
	<alpine.LFD.2.20.1607290750390.23975@localhost.localdomain>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Aug 2016 17:14:53 +0100
Message-ID: <CAJTo0LY3mTbJLpGLnJBTqf2+=aNkHOEmRVcCa5CTme0M6FKtPg@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: want to verify proper use of run-postinsts, if i may
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
X-List-Received-Date: Mon, 01 Aug 2016 16:15:15 -0000
Content-Type: multipart/alternative; boundary=001a1135018cb3544e053904e723

--001a1135018cb3544e053904e723
Content-Type: text/plain; charset=UTF-8

On 29 July 2016 at 12:54, Robert P. J. Day <rpjday@crashcourse.ca> wrote:

>   it's not just package post stuff here, i'm looking at run-postinsts
> to do a *lot* of subsequent setup of the target system -- effectively
> downloading and installing the entire proprietary application.
>

I wouldn't target run-postinst directly here, but either write your own
recipe shipping an init script that self-destructs, or has a postinst that
defers using so it runs on first boot.

I'm not very happy with the layout of run-postinsts so may end up changing
it in the next release cycle.  Assuming things about it - such as the name
of the package or where to drop scripts - could bite you in the future.

Ross

--001a1135018cb3544e053904e723
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 July 2016 at 12:54, Robert P. J. Day <span dir=3D"ltr">&lt;<a href=3D=
"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1ry" class=
=3D"a3s aXjCH m15636824fbb12e69">=C2=A0 it&#39;s not just package post stuf=
f here, i&#39;m looking at run-postinsts<br>
to do a *lot* of subsequent setup of the target system -- effectively<br>
downloading and installing the entire proprietary application.<br></div></b=
lockquote></div><br>I wouldn&#39;t target run-postinst directly here, but e=
ither write your own recipe shipping an init script that self-destructs, or=
 has a postinst that defers using so it runs on first boot.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">I&#39;m not very happ=
y with the layout of run-postinsts so may end up changing it in the next re=
lease cycle.=C2=A0 Assuming things about it - such as the name of the packa=
ge or where to drop scripts - could bite you in the future.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1135018cb3544e053904e723--
