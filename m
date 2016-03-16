Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 77D9B6FFFE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 12:59:30 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id m184so57987239iof.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 05:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=r8K7Ng7jkawxF3iJsijTOw7TywXK/jIcYrL4OZIZC1Y=;
	b=gdV9O1YWdxvO/n14cJ2whym1W0OhmHNJhFugPQS+/QkCvsoIuAR1uIBmJqIxkdcSz1
	oATWBlO2N3PV5vYrQZdGD/cws0E4a7ikVun7JLs5pLEaRF02SA3ZxOsA7XA3JAQZUj5P
	Eb0vCKQ3YOXpeIrXgOdxZIcsCFMzKLjODdaB07QW/+JvGV6KZNRJhVPUQDZKQyQqHfsY
	mC/4KPL8VqwngHqxlv9VCSRgAcaHIQCRn7SCBlh7On8SZRxZABVocz8rfbletJ1JAyNq
	NgePtDkjEoW8JCwQr1xgBjQkhYVHNN2wxI/BXhcPhxT+nVro5RyBh6MBIyXfd+1oPKUr
	8Lsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=r8K7Ng7jkawxF3iJsijTOw7TywXK/jIcYrL4OZIZC1Y=;
	b=FtflMAarxrzcVBioleU2aur8kKUsb4NKDmtQstSad2A72ARqsOdKa4dCq8WACHyVPq
	XfIn+pbtEWf/boPawJ2eIo/lk/sa4X3P4mBT3fnwsE5Rk/5p4zQ+JdQUVtCH1x3zEImf
	1FP8zB5aGh8JxENmii7KTI0V2Xgt81rPCMmxra0mj9ZS7Lz00nVgp8Mf8xwS5JRhtEbm
	DGlxhQBcnKum3LD6KhT3EDVRrZKfl6Cip40J/mhOeOyfLSN0Xadu5seedV88PKvKtllV
	jEy+Erpw/YGqN+B9cOfAyH+nfwE7fr2mh/1aOvvasE30qZntwj9DLJGSxL4rTy8kHSAo
	WzjQ==
X-Gm-Message-State: AD7BkJLU+gI02FGVo0PgYUHo2tXjVlqCtSjrvdF0mqdjzyuex9+vfnt73sTAaaqLf4Eje5R8Xmk78pWt/wL3YyqU
X-Received: by 10.107.6.32 with SMTP id 32mr3239913iog.99.1458133171268; Wed,
	16 Mar 2016 05:59:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 16 Mar 2016 05:59:11 -0700 (PDT)
In-Reply-To: <1458131361.2038.28.camel@pbcl.net>
References: <1458131361.2038.28.camel@pbcl.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 16 Mar 2016 12:59:11 +0000
Message-ID: <CAJTo0LZVWPcneQzqB5hWaphESAUtVjNggto4oNcTDjdOXj9jFA@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: X.org licenses
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
X-List-Received-Date: Wed, 16 Mar 2016 12:59:34 -0000
Content-Type: multipart/alternative; boundary=001a113fbf5cb580a9052e2a15be

--001a113fbf5cb580a9052e2a15be
Content-Type: text/plain; charset=UTF-8

On 16 March 2016 at 12:29, Phil Blundell <pb@pbcl.net> wrote:

> This morning it came to my notice that libxdmcp, and a bunch of other
> files (mostly, though not exclusively, in xorg-libs) contain things
> like:
>
> LICENSE = "MIT-style"
>
> It's not very clear to me whether "MIT-style" is meant to mean "an
> unspecified license in the same general style as the MIT one" or whether
> it refers to a single concrete license.  (There is no MIT-style in
> meta/files/common-licenses.)
>
> Does anybody happen to know what the intended meaning of this license
> is?
>

So the license class has a mapping to let people use a variety of different
strings to mean the same actual license.  For example all the variations of
GPLv2 (GPL-2, GPLv2, GPLv2.0) all map to the SPDX canonical name of GPL-2.0.

Ditto, MIT-style and MIT-X all map to MIT.

Considering xorg-lib-common.inc already sets LICENSE="MIT-X" and these
recipes are overriding that assignment, we should probably remove all
instances of MIT-style from the xorg recipes as they should probably be
MIT-X.

Ross

--001a113fbf5cb580a9052e2a15be
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 March 2016 at 12:29, Phil Blundell <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:pb@pbcl.net" target=3D"_blank">pb@pbcl.net</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><div id=3D":4m5" class=3D"a3s" style=3D"overf=
low:hidden">This morning it came to my notice that libxdmcp, and a bunch of=
 other<br>
files (mostly, though not exclusively, in xorg-libs) contain things<br>
like:<br>
<br>
LICENSE =3D &quot;MIT-style&quot;<br>
<br>
It&#39;s not very clear to me whether &quot;MIT-style&quot; is meant to mea=
n &quot;an<br>
unspecified license in the same general style as the MIT one&quot; or wheth=
er<br>
it refers to a single concrete license.=C2=A0 (There is no MIT-style in<br>
meta/files/common-licenses.)<br>
<br>
Does anybody happen to know what the intended meaning of this license<br>
is?</div></blockquote></div><div class=3D"gmail_extra"><br></div>So the lic=
ense class has a mapping to let people use a variety of different strings t=
o mean the same actual license.=C2=A0 For example all the variations of GPL=
v2 (GPL-2, GPLv2, GPLv2.0) all map to the SPDX canonical name of GPL-2.0.</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ditto, =
MIT-style and MIT-X all map to MIT.</div><div class=3D"gmail_extra"><br>Con=
sidering xorg-lib-common.inc already sets LICENSE=3D&quot;MIT-X&quot; and t=
hese recipes are overriding that assignment, we should probably remove all =
instances of MIT-style from the xorg recipes as they should probably be MIT=
-X.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ro=
ss</div></div>

--001a113fbf5cb580a9052e2a15be--
