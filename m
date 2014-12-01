Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 77C06718ED
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Dec 2014 16:45:02 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id f51so7727564qge.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Dec 2014 08:45:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=HEnoDUjnurjn9xWtIXkFbKYWZLBr0gBdCPp+1arrluM=;
	b=Cbv7cLv2HBHBv+XHJiCLx7dBguXVuwNLrng1Clab+yIxzeFW1gSOUe2APMDQmhEScP
	pg3PLSoad5ercffNmBq6UlnLMXb2JwH1ngumDH/ZHuEpf6cWg3AYClTcfWdt6GQQgOGo
	5NTa263nsnFZ4EjNEcDPwRYq5UgDoZLC90lnCZ+Y4pbEbxepxeMNgjxx7tnuzqzlp5kq
	/+x8H6q/2mKuJjva5mANdwtsphimzfe1ZEwmaR58YVuGUcoC5UqA223P0vLp2bu2hZQB
	g9avjNqcIbWwZgeJl6frtRB6IQluIDQunjV86Sf/4KWjs+zXQKQkWa8ZyJXeCAhZy3oL
	4L9g==
X-Gm-Message-State: ALoCoQlStgGWSzpi57OUFiKswlwFJwRC/hx5XVczz1U5WDoNIqZ1zQonVo/mHXMWWk31KhFzFfhD
X-Received: by 10.140.96.101 with SMTP id j92mr86265201qge.87.1417452302920;
	Mon, 01 Dec 2014 08:45:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Mon, 1 Dec 2014 08:44:42 -0800 (PST)
In-Reply-To: <3316034.dGek4aGvY6@peggleto-mobl5.ger.corp.intel.com>
References: <1407438629-13369-1-git-send-email-marex@denx.de>
	<CAJTo0Lbk2eOtBbOFj5d8oEpW6N9p3wmuw5kUMEqzsRKPyakt6w@mail.gmail.com>
	<1417446810.15614.28.camel@linuxfoundation.org>
	<3316034.dGek4aGvY6@peggleto-mobl5.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Dec 2014 16:44:42 +0000
Message-ID: <CAJTo0LayXWcmDG623USQP5Z081CooTM0JAzpW2bMaWV=cE6LxA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Marek Vasut <marex@denx.de>, Koen Kooi <koen@dominion.thruhere.net>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Yocto: Install full set of python modules in Qt SDK toolchain
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
X-List-Received-Date: Mon, 01 Dec 2014 16:45:10 -0000
Content-Type: multipart/alternative; boundary=001a113a9d8a00cd6e05092a55a4

--001a113a9d8a00cd6e05092a55a4
Content-Type: text/plain; charset=UTF-8

On 1 December 2014 at 15:21, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

> > Make nativesdk-python-core RRECOMMEND python-modules?
>
> This sounds like a reasonable option to me. The split as it is at the
> moment
> exists mainly for trimming the target; the SDK is perhaps less sensitive to
> size constraints.


Patch sent.

Ross

--001a113a9d8a00cd6e05092a55a4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 December 2014 at 15:21, Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D=
"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@linu=
x.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span c=
lass=3D"">&gt; Make nativesdk-python-core RRECOMMEND python-modules?<br>
<br>
</span>This sounds like a reasonable option to me. The split as it is at th=
e moment<br>
exists mainly for trimming the target; the SDK is perhaps less sensitive to=
<br>
size constraints.</blockquote></div><br>Patch sent.</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113a9d8a00cd6e05092a55a4--
