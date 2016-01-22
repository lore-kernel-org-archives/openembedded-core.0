Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id CCDF3731DA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 12:27:15 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id q21so86502585iod.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 04:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=eMzEl1sE11a1deOrl9H/QhzfuTMlwGpYKEC9ZpCtZGo=;
	b=gKcX0RUbzq5dp3LQV+kduH8fUqjnxVGZYmNWKyKYYXBHRcJoVXGbVK9ENAeOBG7DqV
	L0KY9zItp/7cm00L4CzcfHks5OPpwoivX4by7QMtlP/9srgMxOygytoURY/dZpohJhQz
	J9u7ukANrVsQtvtkni8iJJi/+t+ZwUVAVWJAiuXLbS+0fOjnOfVTgvxwQ0wXATZN4PUI
	mBaNRKKCjWJpKGd54vEY/7iIVh/2zAbgtZ0L1wpKfwRXbkMV6Xvre60S/7IFflYj0SUq
	TptQqAGzENoFakeecJn40AEbUXkxaBD7sb9296IzpNhkQlCaKoV8W91UI73CYABhtYSg
	bQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=eMzEl1sE11a1deOrl9H/QhzfuTMlwGpYKEC9ZpCtZGo=;
	b=Mcf3x03BC39J8bIueoD0fPeIECl0eVKpEBqrMznb3/a2Z2Swpx3fG2LUp80LgTWj4h
	rbrefN9olnEVR3h39Xi9hURTBgzGQ5dirS6jjkV2mnsHOseCkTpNT1Y3YHuiSuZZsgDn
	LlYkoL0qDFCY4UhjTBbutUHOWUeYp9JEmjPM+4AsNxHkdQ7wP0Rz8KC0Mg0Po52Aarns
	3v9Yh/fW+JRmT60wz/fM0iiC3xQR6E5UzZ8dAgRuBJkNvAmsRq7+o/Y9r1IMm9vXjEfJ
	E2XiLZLflFqz8AjeYV/2zkY9VdZz4QD3NFmvWIepPTV5JKoVex+T5NgDGmxi6nIN8ZgS
	M0AA==
X-Gm-Message-State: AG10YOR1iIH16tj45vC2bLQyeZizD7Oqx6xn+zV/oRvBzfjY9ylBUCBupGdcNIscAwKXmveZXak/GG0Mcj+cPTl6
X-Received: by 10.107.135.104 with SMTP id j101mr3752138iod.133.1453465635768; 
	Fri, 22 Jan 2016 04:27:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 22 Jan 2016 04:26:56 -0800 (PST)
In-Reply-To: <30b9847bc3bd6931817a7c1d1ceceddb81ec7cc4.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
	<30b9847bc3bd6931817a7c1d1ceceddb81ec7cc4.1453029952.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 Jan 2016 12:26:56 +0000
Message-ID: <CAJTo0LaXcMADdSEyTQQ7QrfpJmUmy8TsaJ+BfbEb0C2aJ0aRyw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 14/73] elfutils: Fix build with uclibc/musl
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
X-List-Received-Date: Fri, 22 Jan 2016 12:27:16 -0000
Content-Type: multipart/alternative; boundary=001a113ebe92e9e5c70529eb569e

--001a113ebe92e9e5c70529eb569e
Content-Type: text/plain; charset=UTF-8

On 17 January 2016 at 11:35, Khem Raj <raj.khem@gmail.com> wrote:

> Remove mempcpy patch its already in uclibc now
> refresh libargp patch to match latest elfutils
>
> Add ALLOW_EMPTY for musl
>
> core-image-cmdline-full asks for elfutils package to be added to package
> it has all eu-* tools but we dont build them on musl. nevertheless lets
> satisfy the dependency so image can build for musl
>
> Build libdw,libasm,libebl along with libelf
>
> enhance the musl portability patch to compile every other library
> except the eu-* tools
>
> Fix build on aarch64/musl issues
>
> Header inclusion ends up with duplicate definitions of iovec struct
> since uclibc defines the same in usersapce, we have been depending upong
> including the kernel header on aarch64, using sys/uio.h is the right
> approach
>
> Fix x86 build warning seen on musl
>

The new patches are missing their Upstream-Status tags.

Ross

--001a113ebe92e9e5c70529eb569e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 January 2016 at 11:35, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":qhp" class=3D"a3s" sty=
le=3D"overflow:hidden">Remove mempcpy patch its already in uclibc now<br>
refresh libargp patch to match latest <span class=3D"il">elfutils</span><br=
>
<br>
Add ALLOW_EMPTY for musl<br>
<br>
core-image-cmdline-full asks for <span class=3D"il">elfutils</span> package=
 to be added to package<br>
it has all eu-* tools but we dont build them on musl. nevertheless lets<br>
satisfy the dependency so image can build for musl<br>
<br>
Build libdw,libasm,libebl along with libelf<br>
<br>
enhance the musl portability patch to compile every other library<br>
except the eu-* tools<br>
<br>
Fix build on aarch64/musl issues<br>
<br>
Header inclusion ends up with duplicate definitions of iovec struct<br>
since uclibc defines the same in usersapce, we have been depending upong<br=
>
including the kernel header on aarch64, using sys/uio.h is the right<br>
approach<br>
<br>
Fix x86 build warning seen on musl</div></blockquote></div><br>The new patc=
hes are missing their Upstream-Status tags.</div><div class=3D"gmail_extra"=
><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ebe92e9e5c70529eb569e--
