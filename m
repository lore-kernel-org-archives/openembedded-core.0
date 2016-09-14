Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 044CA70057
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 21:13:17 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id r192so64348346ita.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 14:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wQbKgUbxdbye6b30uauXDemt3QO2xqr4hdsH7+9eqYY=;
	b=Yf62ROSy8MqCCu8i10iPsWOD6reaHfpPouJ4MBvDbZuahtXy5VCGaCLIuF4Z5EbBjZ
	eF2LM9xfKqxzi5nOSKzTSAHfP8SY4rt2blLr8793C3WzWNbb2MgS2BFgaYZUVNi01DPX
	vbBoGi9rjQudFeX0nl/gt12DQOmbQhO2JCWCdeO5rn3XNb7NtwFk5flMR5w+o8X5Apsr
	pBn5/JfK2CBSMH7JWd/BC7QNHTToOZKQe4zqaxO+ggV2OZDlI16fq8qJM4JyLQeP2P7l
	UvWPZL7qPQm5HZVWE+rHwhr6Ia4rXQpUOe7kKUNqy5mhTvLFXIx/TW1lG4OaUdUhtuZP
	+VOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wQbKgUbxdbye6b30uauXDemt3QO2xqr4hdsH7+9eqYY=;
	b=PY6IZo8uo6wl1a+GUMQ93hGToHXyieei/xt15ZZiuk5SMlq3OgLQDb4s9y2xz27+Wu
	V+K40kEyO7q2qqVFVw2bCjTyoytYOhLMvu6lRyM3mkN01U9CcjjHn0iTylZQPhJkpF0c
	86PRSEgjk7ZFTbtim9zNphL0/m9v0PfTmePExLVR8ebgeCsjHhBHt3/UXTwZ05MWvWIy
	Kzursl+IVKxAh2Ayi47FPHAFTr5OSkQMtud3ZTLU30tEHhsScqvqdusEuijLckPKPTK4
	SL27MHHV9RuddAw3KRsc2MmMbLPdSo7ODoCJKy1561em3mI/vVGPSd4/ukHrWDiGipBb
	Pxog==
X-Gm-Message-State: AE9vXwM/4p51dW76RINF4WA+PE5jO86qO5xHspWBcpGPU2X4Xul0SodL+SiPcHPXNrzTMlvyUMoT3MLk285jIU6S
X-Received: by 10.107.35.13 with SMTP id j13mr9914393ioj.189.1473887598143;
	Wed, 14 Sep 2016 14:13:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.27 with HTTP; Wed, 14 Sep 2016 14:12:57 -0700 (PDT)
In-Reply-To: <CAP9ODKqHt2RgF4sD2ai_+2DGfJ9+hu9+by67YBqAyN+=AD=baQ@mail.gmail.com>
References: <1473871297-28966-1-git-send-email-ross.burton@intel.com>
	<1473871297-28966-2-git-send-email-ross.burton@intel.com>
	<CAP9ODKowGs-bZ2oyAmUn4=b6BCZPZKR9vhS9Hd==etoU5o2Pvg@mail.gmail.com>
	<CAJTo0LYK=k1bFjbbBcDEu+RJ5zHFvogOsNmeYHnFJnjiM3AVRQ@mail.gmail.com>
	<CAP9ODKqHt2RgF4sD2ai_+2DGfJ9+hu9+by67YBqAyN+=AD=baQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 14 Sep 2016 22:12:57 +0100
Message-ID: <CAJTo0LZtYe9bt7x8G=N3v_DCgDBchKaTOZ2gLz+CPZx=TnO52g@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] cmake: use convenience options for clarity
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
X-List-Received-Date: Wed, 14 Sep 2016 21:13:18 -0000
Content-Type: multipart/alternative; boundary=001a1140292aba2618053c7e32b2

--001a1140292aba2618053c7e32b2
Content-Type: text/plain; charset=UTF-8

On 14 September 2016 at 22:06, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> Ok; but this means it should be right?
>
> If so, we can work on a recipe for it. It is better to avoid bundled
> copies of recipe specially because security flaws...
>

Nothing else wants it, cmake ships with its own trimmed copy.  I'm not
massively convinced it's worth the bother (especially now).

Ross

--001a1140292aba2618053c7e32b2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 September 2016 at 22:06, Otavio Salvador <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.salv=
ador@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><div id=3D":3e1" class=3D"a3s aXjCH m1572a85a620e6528">Ok; but this mean=
s it should be right?<br>
<br>
If so, we can work on a recipe for it. It is better to avoid bundled<br>
copies of recipe specially because security flaws...<br></div></blockquote>=
<div><br></div><div>Nothing else wants it, cmake ships with its own trimmed=
 copy.=C2=A0 I&#39;m not massively convinced it&#39;s worth the bother (esp=
ecially now).</div><div><br></div><div>Ross</div></div></div></div>

--001a1140292aba2618053c7e32b2--
