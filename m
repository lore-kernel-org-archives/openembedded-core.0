Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id B835A77260
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 20:47:09 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id f81so141161921iof.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 12:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=GB7zXEuZtko6Z6vyPbMG3HIMEY4xhEcswKxmBaCKe9Q=;
	b=hN0htV4sqhma0F9ffFsc51KT3z4fGdGumOtMg7zD/QOayUPXHKU3mm+AMR6E40+8SQ
	DnZUf5VAjmoAxiHIk08GsP1umZNwmF/RCWwavokdOUjt/JrJFYu1hvaMe2QtboW4IrAk
	Xy7j83HNjvAFSrG+jqU/cVlGNGrgdxLD04U5aHiCrs3suABdZVuGxrWuJRF84sx7rfKd
	W7viqbXNKfkJu3MDVszVcEWuffn3qmT2yh34FBFQ1DPynSLp6y66G/xESeDgNpY30qY7
	ERlhHTbFmUKLq4Xw51LRZgqPKEzYa8xeVaZLU8NmIv8Mx7P1wyWMYoh2j3o7i8mcbMt3
	Cbbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=GB7zXEuZtko6Z6vyPbMG3HIMEY4xhEcswKxmBaCKe9Q=;
	b=BxJUACZTrZrinmtD9moq5WdKLXKRw24veBMqpW9qWuIQObR5LBe1KAMVtJJYvP5t93
	JLG2YAtnTS1t8CIJNic615tknlHoQQfbNq7Ldj73SQIoIGYmuMWAebzvWeJY+nkDFpCX
	6sbKSRvf4xuOJsbrroiTOEcW6NDpjUvCTnHe9d4Ownu8uIb6LNcqAPfxENjEiPe/Yl/4
	9cXeF2bhGnqTUYUCZ41kw4LKSj33QNXf4zrvzJ6iBj8WlNDvMRrxQVVLMcD0YXieuWi4
	sf+aUgb9HLI1011H9PBua9x3j66iKdQ9tma+7xqustZzb9fs5FBRgmug5jaoKxw2xDiZ
	9XHA==
X-Gm-Message-State: AG10YOQsU7/qOSjImGJOGMeXi4Qwve/UI7ZK5Sr4ZKRDzqmwci8n/Uxge2JTN8Ud6c64W6GeyGlHXGrEzlLqAogb
X-Received: by 10.107.164.15 with SMTP id n15mr15453511ioe.148.1454705230142; 
	Fri, 05 Feb 2016 12:47:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 5 Feb 2016 12:46:50 -0800 (PST)
In-Reply-To: <CAMKF1spmN7Y3bQVFhghUG80sYyuwbGAj6MMMm9oPKehhm-s3Sw@mail.gmail.com>
References: <1454704804-11605-1-git-send-email-nicolas.dechesne@linaro.org>
	<CAMKF1spmN7Y3bQVFhghUG80sYyuwbGAj6MMMm9oPKehhm-s3Sw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Feb 2016 20:46:50 +0000
Message-ID: <CAJTo0LZT0UFrabh1U5LOLF9qcuL7QGoVVXGvo0NWYM4Y5H83tg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RESEND PATCH] mesa: upgrade 10.6.3 -> 11.1.1
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
X-List-Received-Date: Fri, 05 Feb 2016 20:47:09 -0000
Content-Type: multipart/alternative; boundary=001a113776827ef880052b0bf40e

--001a113776827ef880052b0bf40e
Content-Type: text/plain; charset=UTF-8

On 5 February 2016 at 20:44, Khem Raj <raj.khem@gmail.com> wrote:

> its added new to this version. May be packageconfig is better place
> for --with-sha1 stuff
>

Agreed - some may not want openssl at all and being able to switch it for
another alternative would be useful.

Ross

--001a113776827ef880052b0bf40e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 February 2016 at 20:44, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":ias" class=3D"a3s" sty=
le=3D"overflow:hidden">its added new to this version. May be packageconfig =
is better place<br>
for --with-sha1 stuff</div></blockquote><div><br></div><div>Agreed - some m=
ay not want openssl at all and being able to switch it for another alternat=
ive would be useful.</div><div><br></div><div>Ross=C2=A0</div></div></div><=
/div>

--001a113776827ef880052b0bf40e--
