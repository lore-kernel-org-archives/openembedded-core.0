Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4663A72F60
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jun 2017 19:36:06 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id w1so142414898qtg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Jun 2017 12:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vCBN5K681kkwTMGWlu9sZ6UA2lEFShEOdnhc8UF4BY4=;
	b=yhpdJvv//v+h3HL/yi9T0Lr+A40Bf4lYovgMVxMXuq0eDUZJ2jCDMkJBFK6XT968/x
	Ol7+5Cu3i4zn5f5fW/lUm7RXrQtFRe9Oid1mU/rvABbiFmEI9diBTQwDgurLvb+UxLeZ
	HKWd+44d91JpOfTku+nkwMNHAOFFBt/JqMb6VYozMNRFXP9U9RU9kTPHuc7VTYC+Zmjz
	5cJx8SgwoLl8CpLSqJVZEVraybrOgMNhu09bSWLpREVMFmEFoxuEIvwm+i8ZV/7ig9aE
	WQngl5/EnHY+CckWCQbN5iA8m8/lHYMQ+N59ebCJgTCmYxywrDzf08WxqS0R65gAdLZs
	w77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vCBN5K681kkwTMGWlu9sZ6UA2lEFShEOdnhc8UF4BY4=;
	b=kb0srghtV76X/ERyO4HXy3fjFO6jXBy+0zlkcwQCkac2oQQgQkUtvbu2k/xyCFMd/d
	dL1323FmkLQbl4IfI+APjwqs42/ODOlIblnSx4fb+2wmC/EgMG4fCAH3xz9RoH0wMflc
	B88ejoTa81bcvWTRjrXXFtMJpwCvXSmR0NJkxiEaGE+TVB3N4t8TGGBRFVuFY24SD5Gg
	Xu2O7RWnrrxz3Hd+nUMnYohaidLtoXVmB1MywKGGsDBwiWu3wYmmNoQyWYa8geJ1ADGS
	1uQvjnuVkE0m8yXvFleHp6omypTuCSQVVoShBtOjwpXLoXZ4/hyWRRdl64SH84YIFzPn
	iXMA==
X-Gm-Message-State: AKS2vOy5mNqnQUst+fhaWt1tXFpS4sZN0zh+k4MwytKKeFXtJqLlCGLs
	k/gOrNl49n2vWvTMNl0qyyWfy/HU2+je
X-Received: by 10.55.140.193 with SMTP id o184mr16141672qkd.127.1496777766783; 
	Tue, 06 Jun 2017 12:36:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Tue, 6 Jun 2017 12:35:46 -0700 (PDT)
In-Reply-To: <CA+chaQfM0Kvu-LXN7yXxx8xoYe1P9Le5em6ref3VPALZ2xbcOQ@mail.gmail.com>
References: <1496696005-28913-1-git-send-email-ross.burton@intel.com>
	<CA+chaQfM0Kvu-LXN7yXxx8xoYe1P9Le5em6ref3VPALZ2xbcOQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Jun 2017 20:35:46 +0100
Message-ID: <CAJTo0LYBxpC388nX+hmWa=9PfbsM=HF==aGQQSQCm-wGpyoYyQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libunwind: fix build failure on MIPS
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
X-List-Received-Date: Tue, 06 Jun 2017 19:36:09 -0000
Content-Type: multipart/alternative; boundary="001a114f0ce818e09105514fbb8e"

--001a114f0ce818e09105514fbb8e
Content-Type: text/plain; charset="UTF-8"

On 6 June 2017 at 20:04, Martin Jansa <martin.jansa@gmail.com> wrote:

> Do you also have a fix for armv5t build issue with this new libunwind
> version?
>

Goddamnit libunwind!

No, I don't.

I've got a patch locally to enable libunwind in perf to give it better
coverage as currently it is only built in world builds on the autobuilder,
which isn't all architectures.

Ross

--001a114f0ce818e09105514fbb8e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 June 2017 at 20:04, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mail=
to:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Do you al=
so have a fix for armv5t build issue with this new libunwind version?<div><=
/div></div></blockquote></div><br>Goddamnit libunwind!</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">No, I don&#39;t.</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">I&#39;ve got a =
patch locally to enable libunwind in perf to give it better coverage as cur=
rently it is only built in world builds on the autobuilder, which isn&#39;t=
 all architectures.</div><div class=3D"gmail_extra"><br></div><div class=3D=
"gmail_extra">Ross</div></div>

--001a114f0ce818e09105514fbb8e--
