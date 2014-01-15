Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9A6616BF4E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 11:21:06 +0000 (UTC)
Received: by mail-ob0-f176.google.com with SMTP id va2so980381obc.21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 03:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=5bNjfKQ6Ut+w8/ic2ZVyGWA9jBgrBjeUZuBTKYHYIYo=;
	b=LsuGsBCu3p4VrI05NXaftkrUYYNYgT2nABd8DO372SYqMGbrIe4Uy71W+ZmrEblYj2
	vJPpZZwDACq+ANM1lJfIi9jqLMJ9OjoIDiqE5WmP4vHfuXfeM/W+kkNE51PusxHTyHTB
	G5I60ijFV0MtwsC/8yidlwdWys1FwVOBrEkmz+eNPLRJQCiuI6bNJHkxDZEmLX8FMnQR
	OiNHWjzXboyLoKtwLABW6NL9kE+AbC99tD+zojKGm3U8jCaggCTNs2IA+D40dxHMmL37
	qAiE96/KJpn0ngw7Ou2OiAGChxEflGVod9p2YGPYn10E/yOsboeM1+a0XWsOKO2YVox7
	fhfQ==
MIME-Version: 1.0
X-Received: by 10.182.241.8 with SMTP id we8mr1026784obc.62.1389784867082;
	Wed, 15 Jan 2014 03:21:07 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 15 Jan 2014 03:21:07 -0800 (PST)
In-Reply-To: <1389752246-4296-1-git-send-email-paul@paulbarker.me.uk>
References: <1389752246-4296-1-git-send-email-paul@paulbarker.me.uk>
Date: Wed, 15 Jan 2014 09:21:07 -0200
X-Google-Sender-Auth: o5E1ryeA_GqHjFHzMUOsEARNRK0
Message-ID: <CAP9ODKqxc2h2nFByXnfFbitotd+UDADe0Sj8+U5eU=Za75G45Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Barker <paul@paulbarker.me.uk>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Change update-alternatives provider
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
X-List-Received-Date: Wed, 15 Jan 2014 11:21:06 -0000
Content-Type: multipart/alternative; boundary=001a11c322c051181204f000813d

--001a11c322c051181204f000813d
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 15, 2014 at 12:17 AM, Paul Barker <paul@paulbarker.me.uk> wrote:

> The update-alternatives script has been copied from opkg to opkg-utils so
> the
> openembedded recipe for opkg-utils is updated accordingly. Changing the
> default
> provider of update-alternatives to opkg-utils allows dependencies to be
> added to
> the opkg recipe without causing circular dependency loops. This series
> partially
> solves Yocto Project issue 4836.
>
> Tested on Raspberry Pi hardware both with and without "gpg" added to
> PACKAGECONFIG for opkg.
>

Nice; I didn't test the patchset but I couldn't spot any mistake.

I will try to put it in my builder for testing...

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--001a11c322c051181204f000813d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Wed, Jan 15, 2014 at 12:17 AM, Paul Barker <span dir=3D"ltr">&lt=
;<a href=3D"mailto:paul@paulbarker.me.uk" target=3D"_blank">paul@paulbarker=
.me.uk</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">The update-alternatives script has been copi=
ed from opkg to opkg-utils so the<br>
openembedded recipe for opkg-utils is updated accordingly. Changing the def=
ault<br>
provider of update-alternatives to opkg-utils allows dependencies to be add=
ed to<br>
the opkg recipe without causing circular dependency loops. This series part=
ially<br>
solves Yocto Project issue 4836.<br>
<br>
Tested on Raspberry Pi hardware both with and without &quot;gpg&quot; added=
 to<br>
PACKAGECONFIG for opkg.<br></blockquote><div><br></div><div>Nice; I didn&#3=
9;t test the patchset but I couldn&#39;t spot any mistake.</div><div><br></=
div><div>I will try to put it in my builder for testing...</div><div>=A0</d=
iv>
</div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 O.S. Systems<br><a href=3D"http://www.ossystems.com.br" target=
=3D"_blank">http://www.ossystems.com.br</a> =A0 =A0 =A0 =A0<a href=3D"http:=
//code.ossystems.com.br" target=3D"_blank">http://code.ossystems.com.br</a>=
<br>
<span>Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: <span id=3D=
"gc-number-3" class=3D"gc-cs-link" title=3D"Call with Google Voice">+1 (347=
) 903-9750</span></span><br>
</div></div>

--001a11c322c051181204f000813d--
