Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9C50060B98
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 16:07:49 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id v195so6131053qkb.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 08:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oVO06/T9bWqxJYrrNc9gmK1NprsaFgRvF2BfQA9jgLQ=;
	b=QDeYbwUnYxTs8dXxxJGLQh6AFFvMWncGFlgB9PUDtEx1zHocCP6u6k0FdJPpLT+fxe
	l+HV/sEPWV/3ftYanOkxEwq82ZhKNf0vBLJOPzo3TwcENHNYKZwGddGjCKhCfe+OY9Va
	LVs+I6mFYXE0NJojN7pBRGhpJprfsXH+V+vkF2zTSv/Mq78okABkvArdff70AMULzcdn
	SHKhxIKtngskqebv8kZwCfEKp+uYSqDaUBSfDNo7PVCcmwk+P7X2VDgEXHsd9vXG8GyL
	TBl/nG6mXXBm9kHfMsmc9jWI5Z7s826Bbx6o5jw+clQAiWxIRpA8XLP5Nw4NJdu/1eYq
	XKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oVO06/T9bWqxJYrrNc9gmK1NprsaFgRvF2BfQA9jgLQ=;
	b=Xf8b4sFXOq3qWbv4DI+hMiMhJcayXEbSW27Th7T5NTN7/UHSvRjtglPQIL4x0QI3VH
	atmnXByYzBEuQ0+OClRM0oTlVHLqkJlaW3jVGdvuYFC4c85esBKjQLs8/i54ksomI9Cq
	XLJLPwZiiqPvktKOQbRPmcZRMZ8KRtjkifJBIJWjm7n/mYoIdZcoy0bRsAq/I9t+SVt5
	dZDqe1NXbg/WonMMOgzbKf2lroWRYkneNgTqpykfeE0a3ShTKuFA5RkwIK+N5FEHzbIF
	DdlJSHhzyS9XG0ZNJQoAMIhjyAGG4CsTazbLFsB+DwMSaH2I62sEJOQSG8tH2+EgeTYx
	invg==
X-Gm-Message-State: APjAAAVUOG5VXJjkKIJbiccyLI5+LQsW5coujrudPXCTP28kWWsKKY5H
	6UY62dpiCqMQ3vI8/MOF0I4MvRY2/37yZhq9OrQ=
X-Google-Smtp-Source: APXvYqzEcjPdxxcgOjpqlh3RnltQPEciWvBtivOkT3oUS0TP600Vc9VE444JNfiaw1NGYl1rOPr0MM4aPTQQ6m6B074=
X-Received: by 2002:a37:40c:: with SMTP id 12mr16497843qke.212.1581610070299; 
	Thu, 13 Feb 2020 08:07:50 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581575578.git.raj.khem@gmail.com>
	<CANNYZj_T=J2fs39fpPKQjC5rGSg_opTeUGzPokeiU-5jwhRzTQ@mail.gmail.com>
In-Reply-To: <CANNYZj_T=J2fs39fpPKQjC5rGSg_opTeUGzPokeiU-5jwhRzTQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Feb 2020 08:07:38 -0800
Message-ID: <CAMKF1sqJTPVFALwd0qx+zfWq3MsmhVL=n58CDMns1MwJH2mTsw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/9] recipe updates, testing fixes
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
X-List-Received-Date: Thu, 13 Feb 2020 16:07:49 -0000
Content-Type: multipart/alternative; boundary="00000000000069d984059e774a89"

--00000000000069d984059e774a89
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2020 at 12:21 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Thu, 13 Feb 2020 at 07:38, Khem Raj <raj.khem@gmail.com> wrote:
>
>>   libsolv: Enable rpm packageconfig by default only if rpm O_P_M is
>>     enabled
>>   dnf,libdnf: Ignore if PACKAGE_CLASSES does not have rpm
>>
>
> I'd like to request that these two are held back until we figure out what
> is going wrong with the rpm test (see separate thread).
>

We already know what=E2=80=99s going on what more
Do you want to know ?


> Alex
>

--00000000000069d984059e774a89
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Feb 13, 2020 at 12:21 AM Alexander Kanavin &lt;<a h=
ref=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 13 Feb 2020 at 07:3=
8, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj=
.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">=C2=A0 libsolv: Enable rpm packageconfig by default only if =
rpm O_P_M is<br>
=C2=A0 =C2=A0 enabled<br>
=C2=A0 dnf,libdnf: Ignore if PACKAGE_CLASSES does not have rpm<br></blockqu=
ote><div><br></div><div>I&#39;d like to request that these two are held bac=
k until we figure out what is going wrong with the rpm test (see separate t=
hread).</div></div></div></blockquote><div dir=3D"auto"><br></div><div dir=
=3D"auto">We already know what=E2=80=99s going on what more</div><div dir=
=3D"auto">Do you want to know ?</div><div dir=3D"auto"><br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div></div=
><div><br></div><div>Alex<br></div></div></div>
</blockquote></div></div>

--00000000000069d984059e774a89--
