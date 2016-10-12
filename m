Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 347BA6093F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 09:38:05 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id e203so81748913itc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 02:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ETFf8OZyC4ADOJD99He9qH4mjPxaiBTlel7R4O0md/M=;
	b=O0+2JNdyC/As+UfgsCin4cWkB+7yuDIuq1jn6tSwYipFdeIzbw/Hp9NowwGG1Ga07z
	YkJqt9jjNlugP+mXo/MJv+EwkdvykT82zQq9/tcTrUSPPgLVaayFLEmnv6S71VeI8xmE
	JCsfcyJJWVPPbjvhM94H90K1p4oMAlG3mVZPkt/5J1YCh6Ho+gGMAXubfAZ1wVjs/etV
	+/hUGu6vtcB7eaZUSwusbbIkh28r0xcCbmWiK9uVLsBOzvjQUHL0q1qQhMpGoo7ESsjJ
	lDfNOK93VcaV9nbw6Ei4PpRvRCn7LDAmYUJq6pMzVo5KVSqgjBELfqtovQIShr9pUu6u
	Bvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ETFf8OZyC4ADOJD99He9qH4mjPxaiBTlel7R4O0md/M=;
	b=DzXKLQKNRxlOpzlKDP50Q42yQmkvY8TN0dEoAqBWFcq0cCgVgsyQtNqH+61vZbtJSi
	o9QT4jrn4uDHAOVT4wiaQiruVeaR2yFIK/pCj4NL7tA4+JCu9z2G1UzFuDmc3MVOCFUa
	GYiVY34j7F3hjQZFKbDbfyMVkwitoYle+VbkSysROkllan+45Lb/rzJwQXxknRDmrJ3V
	0Dw7qjTUP1D5xRlcQqOG6k5mPCNq8OJlPj/ch2/1ztg5BV9OeQV81jo3ms+tln+YFvXd
	OFpeRADw+cyw2ILH2zbHfWJ75CbVsCRXf1sfDQv3JU0AY1uWYwSP+Sc964H5VK89sT1R
	j8YQ==
X-Gm-Message-State: AA6/9RnOemLz2jwcSogHtsR9Tzt60vmrvvAkVTd3Vxj75CkcB+Qh6Kl8vmzpiU4iJZhM85L7JekLOn00xOqKNhd8
X-Received: by 10.36.144.68 with SMTP id x65mr474093itd.70.1476265087158; Wed,
	12 Oct 2016 02:38:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Wed, 12 Oct 2016 02:37:46 -0700 (PDT)
In-Reply-To: <66ca8239a28434c2db142e18a1a112122d13e910.1476263868.git.liezhi.yang@windriver.com>
References: <cover.1476263868.git.liezhi.yang@windriver.com>
	<66ca8239a28434c2db142e18a1a112122d13e910.1476263868.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Oct 2016 10:37:46 +0100
Message-ID: <CAJTo0LZgK6spkEd2jZ=Xd5HyJ+3gkxtMLBD30Z1dJLKCzoYhOw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] package_ipk/rpm/deb: remove unneeded dir settings
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
X-List-Received-Date: Wed, 12 Oct 2016 09:38:07 -0000
Content-Type: multipart/alternative; boundary=94eb2c07e8061d6f2b053ea7c036

--94eb2c07e8061d6f2b053ea7c036
Content-Type: text/plain; charset=UTF-8

On 12 October 2016 at 10:19, Robert Yang <liezhi.yang@windriver.com> wrote:

> There is a do_package_write_foo[cleandirs], so the
> do_package_write_foo[dirs] is not needed.
>

[dirs] changes the cwd whereas [cleandirs] doesn't, so assuming that you've
verified this isn't a problem the message should explain that the tasks
chdir() themselves.

Ross

--94eb2c07e8061d6f2b053ea7c036
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 October 2016 at 10:19, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":80h" =
class=3D"a3s aXjCH m157b8315ec9da9d4">There is a do_package_write_foo[<wbr>=
cleandirs], so the<br>
do_package_write_foo[dirs] is not needed.<br></div></blockquote></div><br>[=
dirs] changes the cwd whereas [cleandirs] doesn&#39;t, so assuming that you=
&#39;ve verified this isn&#39;t a problem the message should explain that t=
he tasks chdir() themselves.</div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra">Ross</div></div>

--94eb2c07e8061d6f2b053ea7c036--
