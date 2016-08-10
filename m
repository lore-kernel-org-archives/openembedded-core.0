Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 492997709E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 19:17:04 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id q83so50868027iod.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 12:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oQ0q10eSEAhe+XFPkE2ZLcjMHjRM+Zk21faFtkD01jk=;
	b=iE+3Rr9LAyMTc3yceVQTsspoaYOChcVNin3Yn4Hx6c8un2Gy+Z/cqAT4L9JWnatLse
	y6f8AO5j4hHRSBB0v+UUSHzbknVE698OaVOmDjmgcYZWrihjLwbws5HExUaq2L9Jl/2t
	S8tYg2DIiW5l2F7DR7ktISIgZ9FOVmmxffwHwc0JnGtZMQqBGRCAY6PkjfeINxyB63sy
	djcQPBp4e20svgi71W+x0RHGpXlbUlkvTQOZo4wFqlVKH4dewZZs3MdhKR5L9ZmdPqGX
	gF2OEoBtrnK9uc12LJELvzV8P+FMNFwjlYj4C50IGtp7qpTZEWLvsmaESRog/7M+25LW
	/xQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oQ0q10eSEAhe+XFPkE2ZLcjMHjRM+Zk21faFtkD01jk=;
	b=fABFjoJb0nipeb35sGx+ZuA4jzJQOMmKgz9p4ZWvY1m8mqzQaItzGKc62eWYCmSo/V
	7s3YhNaAqGnUqZBXUTc7DayTVxVOmvyvujP9zsWyI9p5YvS87H6C+sMJP1z+ZgOvpzWt
	xxYAjSrArQlKujb2J6K/bPk83w3oHivVIqIGOyl+XDsunTBtmQpmo3WzZEHJCEGF2dD3
	zmm7Rckk60R3gbVeWNfUu3B0iA31fRyjqxwIRfTmNiq996r0Kp0vj2BQDBKdDQaOMmX0
	lp4ZVcYYZGPLQZn4DwxbLXkmt2RbWzTmkOFaKNheBL8bgm93jsf2jZvekK7U+eFN20qP
	FrwQ==
X-Gm-Message-State: AEkoouvaOlWNpHR6ntgRsHewd/mwkHe2C7JT752FX6xZHhh6akEujkkCXm/VhgLwaiEzTk1GR+pCM2HHJJkH8GwL
X-Received: by 10.107.154.196 with SMTP id c187mr6935424ioe.99.1470856625451; 
	Wed, 10 Aug 2016 12:17:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Wed, 10 Aug 2016 12:16:45 -0700 (PDT)
In-Reply-To: <1470856303-24490-1-git-send-email-michael.davis@essvote.com>
References: <1470856303-24490-1-git-send-email-michael.davis@essvote.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 10 Aug 2016 20:16:45 +0100
Message-ID: <CAJTo0LbgAqamUsRrO3158=7b4eDtawZJcYOFP8sEWwo4kbc_fA@mail.gmail.com>
To: "Davis, Michael" <michael.davis@essvote.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] pcsc-lite: Seperate GPLV3 portions from BSD
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
X-List-Received-Date: Wed, 10 Aug 2016 19:17:05 -0000
Content-Type: multipart/alternative; boundary=001a1140e81ead1c560539bc7e71

--001a1140e81ead1c560539bc7e71
Content-Type: text/plain; charset=UTF-8

On 10 August 2016 at 20:12, Davis, Michael <michael.davis@essvote.com>
wrote:

> GPLV3 and BSD portions were originally placed in the same package.
> The GPLv3 portion has been seperated into pcsc-lite-spy so the package can
> be used with GPLv3 blacklisted.
>

Wrong list - openembedded-devel@ for meta-oe.

Ross

--001a1140e81ead1c560539bc7e71
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 August 2016 at 20:12, Davis, Michael <span dir=3D"ltr">&lt;<a href=3D=
"mailto:michael.davis@essvote.com" target=3D"_blank">michael.davis@essvote.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":289=
" class=3D"a3s aXjCH m15675df90ec0d0f2">GPLV3 and BSD portions were origina=
lly placed in the same package.<br>
The GPLv3 portion has been seperated into pcsc-lite-spy so the package can =
be used with GPLv3 blacklisted.<br></div></blockquote></div><br>Wrong list =
- openembedded-devel@ for meta-oe.</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div>

--001a1140e81ead1c560539bc7e71--
