Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 676D478279
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 16:27:45 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id u75so11202522qka.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 09:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZlznkzUDv+Lc4ayevWBt82VL3DbXMaKCK46uzSkTC+Y=;
	b=usZnDrII5QXGHPvOWWh+Co3AY+AkSYUQWl0seuIdV7lOaY3itxvq6yhPHHzWmKLm95
	AKk6lcN69ePjMC/Qw3ltKg4Ukk6XAbbY5Yn+XmwyGK0FRUj70D4962loa6no84InyZ65
	2an7lBmjxYsV7Rg6B1sxpcZ2vsHKAxQWKSJZVmJAvmu0Od8UT5r7y/SSji1Kwbq6d270
	J9KkobIwHgbEt8UL6R5VzBrT9NpAZ4mYqw9Q+Ym3sWA+EwXv8/C1PCabFfxcA0TyOFNM
	8qH0HHguXFBMMeSaJEeDKfEbQ4kiiryQKGxmfXJWewNTjDzWxHeigV8Twojzw2T2dO5o
	oGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZlznkzUDv+Lc4ayevWBt82VL3DbXMaKCK46uzSkTC+Y=;
	b=nTM+ln9W2O8dn6Pu8bsEztKZ00N4XC00q3EoQHJd7LmoMbqpWMdctmSqVGHdgrxMNX
	GPUK0FoNNiDTlJyMNjZUU9+K2YHIt2QNXqtgsFyq4t2YsapV1nZ4e26kN3rYC/UYxQOg
	JW1WEZxegZq88AE+xCNKhvaTQIljYJG6lOgwhgLYmewMhLD+gCni7ghsNe7c51SggNE0
	SZ0PlkM6ly8E885LBKz8aJLz4DoXBDW0RCWgZ0hX3FsZLtloMNbDFgJSvEmelcL6EQZ9
	1Be7x9Pkhxy3wcokJKzlMn5VzpJNNXdLw1aKQtlyz+GimAmeeQWdvkN7PaF5bjua/dy9
	Fmwg==
X-Gm-Message-State: AODbwcAGFRPL37bDxiotTsNcfGYZ0rS3mArL89qWUAOAw0dd+T+IgMf4
	uS0p6P3UgFN7P3zW8tmyeAWXCJU6+Hgb
X-Received: by 10.55.146.199 with SMTP id u190mr2853863qkd.109.1495816067385; 
	Fri, 26 May 2017 09:27:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Fri, 26 May 2017 09:27:26 -0700 (PDT)
In-Reply-To: <CAMKF1sqWjyXxv8dgtooat_BByt3-Sbf2HTjKCQA8Syu-6JQZKA@mail.gmail.com>
References: <1495815229-10309-1-git-send-email-ross.burton@intel.com>
	<CAMKF1sqWjyXxv8dgtooat_BByt3-Sbf2HTjKCQA8Syu-6JQZKA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 May 2017 17:27:26 +0100
Message-ID: <CAJTo0LZ7kgZO9U3wNkJ1R3EGv5eStotU67Poi1zOK-pyyw-B6w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kconfig-frontends: fix another build race
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
X-List-Received-Date: Fri, 26 May 2017 16:27:46 -0000
Content-Type: multipart/alternative; boundary="94eb2c08bd7058a40d05506fd1f4"

--94eb2c08bd7058a40d05506fd1f4
Content-Type: text/plain; charset="UTF-8"

On 26 May 2017 at 17:25, Khem Raj <raj.khem@gmail.com> wrote:

> this package should probably be retired from oe-core. I added it as
> part of eglibc
> kconfig support which we have dropped few releases back.
>

If you added it, and nobody else really wants it, feel free to submit a
removal patch.

Ross

--94eb2c08bd7058a40d05506fd1f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 May 2017 at 17:25, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:r=
aj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div id=3D":3bo" class=3D"a3s aXjCH m1=
5c4594d2fa5f899">this package should probably be retired from oe-core. I ad=
ded it as<br>
part of eglibc<br>
kconfig support which we have dropped few releases back.<br></div></blockqu=
ote><div><br></div><div>If you added it, and nobody else really wants it, f=
eel free to submit a removal patch.</div><div><br></div><div>Ross=C2=A0</di=
v></div><br></div></div>

--94eb2c08bd7058a40d05506fd1f4--
