Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4ADD760030;
	Mon, 18 Aug 2014 19:14:36 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id l13so8586667iga.7
	for <multiple recipients>; Mon, 18 Aug 2014 12:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=0FaXe83G92+jVtWY92NDkYr0kdaAwHflfhqfdMIgf7I=;
	b=tChUbYIZ63K6TO8mJhBcjn2BwdLqDtLBAG9TDjmrmxl5nhU3e5iQqhPTKwNxHUUzwS
	5MKdX8Of5d+FY7Inc5DXdg+4zCSW+h6dE7ZnJReC5hS9kTb1iVqcyWDlHAdlUw4+YFNd
	fL8z/rIOmyn8NIY8qm1jgiBA7A6WFA+Zp9zBHCif6U1Bsrdb5K50OCTXETN4M4zGRFQw
	hQLbs3tanOIRGIukHGiBYDO16SAvDywj1CMz6K/2hgwZTWn5+DIYHzadfW4zOhdfvbpJ
	wJA3x9++y3qyRecVik90eIKTq3h83XErqCsQYqHmxMG3LTscimONUmheccGSBzk+CCwl
	8Q+g==
X-Received: by 10.42.103.143 with SMTP id m15mr36197761ico.50.1408389278076;
	Mon, 18 Aug 2014 12:14:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.126.103 with HTTP; Mon, 18 Aug 2014 12:14:08 -0700 (PDT)
In-Reply-To: <20140818190814.GB7174@gmail.com>
References: <CAMKF1sp9Z6vj1Dz96_WYiHOtYFqa-zECrNHOFgb=dBUDJN2Z_g@mail.gmail.com>
	<20140818181424.GG12992@gmail.com>
	<CAMKF1srjVfmfAWZ0mx+AfE_nR4erYtAEYt2OVhEsU+q++XKVrg@mail.gmail.com>
	<20140818185009.GA7174@gmail.com>
	<CAMKF1spkQkfbZMkL2Gg41hF9bm=+HS8sU8LME3pV6yMzDLLs-Q@mail.gmail.com>
	<20140818190814.GB7174@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Aug 2014 12:14:08 -0700
Message-ID: <CAMKF1sq+qbSPSOaU4iyi1Vr8=Xvzuyd2gHx2QN5PPNtUo0JLAQ@mail.gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>, musl@lists.openwall.com,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Announcing meta-musl OE/Yocto layer supporting musl C library
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
X-List-Received-Date: Mon, 18 Aug 2014 19:14:43 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 18, 2014 at 12:08 PM, Paul Barker <paul@paulbarker.me.uk> wrote:
>> That would be handy too. But I wanted was to keep this info in project
>> for folks to try it out.
>>
>
> I'll just post one ticket for now.
>

Thats fine too.

> I think I've got a fix for e2fsprogs as well.

Great. when we write patches that arise out of musl systems we should
make sure that

1. If patch fixes a genuine issue surfaced with musl, fight it out ar
respective package upstream and in OE universe add it to the original
layer where recipe primarily resides
but we can keep the patches in meta-musl as a last resort.

2. If its something musl specific then lets keep it in meta-musl and
see how musl can be changed to fix it.

Thanks
-Khem

