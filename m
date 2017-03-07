Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id AC86271CB1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Mar 2017 14:45:46 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id 1so6876953qkl.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Mar 2017 06:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VjjoUoP0TjhnvuSr0Ss7mtCkhpqAb7gt3hbE1Nk3XHo=;
	b=I7GEwfeS+5TfiyW3Rf2d4kFE3dnUAVINlId/ZEYwmPMsvUmhO3flDPhUWMjTwDE00F
	eDgoTZwyI9W9F/iOf1cmyg4olFAwEkApr3DV6pQy0iVrK2IxWpU6he3Z/ZUj4CTvdkhv
	YXrDOodoegdoEBOmplfk0IqJQD5EKguU5LsegtI9rp2jaKNhOuQPYwwwiRrO0eEP6aZf
	5jWr2zFQqceWUgQIW2AKexJlT/8FOqbdC5S3ZyWm8rc3g3Ty5zwRIBXpmkOWcR/uVaWw
	V/VNj71r0A+ZyuAOq1hmg1iQPBlcgHfs5yKHcb9NYhVNquRUmoNLSFotXOVCexRXE8ZE
	hFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VjjoUoP0TjhnvuSr0Ss7mtCkhpqAb7gt3hbE1Nk3XHo=;
	b=mHtXhtbA4+QUk/92srasVEFZunT2QbQMp7jHLiWjyJ8kYgft11sAS0q82S3As+ulGF
	rT6u0TjCKVKhROlkOv1tvXHUmhuKar/Iu9vRU18zUWDAeNwgnddDsVOTHiXuI4Z4rybM
	et79BzhedaLHeUOKw06x81duDy0efzJ8UZZ0834u6v7nW3o24TywYGrBmYMo+93OKxl6
	bMZWG/UvOHhLKuxHBELGNxqnmUkF4vRRKu8JsvI8NvNj7UyazNClSCOMeVSJXqry4a4H
	UsCSUcVnl9K0SAWui7iUsiDgsGt4qAf6gmRkhlZM9v2AfN6M0BMG/GCInTYCCxDpN8iL
	CQUw==
X-Gm-Message-State: AFeK/H23PnX+sgZqRfsjXZYD5zs/UHLby2FikwAs5xnupwDbnOX8Rek8w22YE0xGjeWKwHi0PZ8akM9Jvkglcy6y
X-Received: by 10.55.175.195 with SMTP id y186mr771784qke.26.1488897947625;
	Tue, 07 Mar 2017 06:45:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Tue, 7 Mar 2017 06:45:27 -0800 (PST)
In-Reply-To: <f417ea5c-df83-ef34-648f-5a526f3d2e16@windriver.com>
References: <1488862727-25152-1-git-send-email-armccurdy@gmail.com>
	<CAJTo0LaNUQW=Qsyxm7eC9hFduzVMy5v+1Sy9aBMfgNoBgAqoow@mail.gmail.com>
	<f417ea5c-df83-ef34-648f-5a526f3d2e16@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 7 Mar 2017 14:45:27 +0000
Message-ID: <CAJTo0LZKkhLFR9-bR2TV4EDJ_8A=3UYeVmAgaBMNZAeYsmDqrQ@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] [PATCH] meta: start to ignore the largefile distro feature
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
X-List-Received-Date: Tue, 07 Mar 2017 14:45:46 -0000
Content-Type: multipart/alternative; boundary=94eb2c06093c46c199054a251154

--94eb2c06093c46c199054a251154
Content-Type: text/plain; charset=UTF-8

On 7 March 2017 at 14:43, Mark Hatle <mark.hatle@windriver.com> wrote:

> At this point, I'm not sure there is any reason to NOT using largefile
> system
> wide.  It's a common enough feature, and even 'small' devices (with sdcard
> slots) can run into large file problems now.
>

My thoughts exactly, fwiw.

Ross

--94eb2c06093c46c199054a251154
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 March 2017 at 14:43, Mark Hatle <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:mark.hatle@windriver.com" target=3D"_blank">mark.hatle@windriver.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":55c" class=
=3D"a3s aXjCH m15aa939d2ecf3252">At this point, I&#39;m not sure there is a=
ny reason to NOT using largefile system<br>
wide.=C2=A0 It&#39;s a common enough feature, and even &#39;small&#39; devi=
ces (with sdcard<br>
slots) can run into large file problems now.<br></div></blockquote></div><b=
r>My thoughts exactly, fwiw.</div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra">Ross</div></div>

--94eb2c06093c46c199054a251154--
