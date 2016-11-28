Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4FEFB719A4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 14:10:14 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id n204so140466727qke.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 06:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yNh7gLDxPMUCHoM4ANVA7N7Fexq8LbmkyUXPeG4zPpE=;
	b=Kn8OKbQUqNa9QXlpvt7kJqWviIxXOhUweuXeufpH3jk/MscUHUwEGl9y+b4iQ4Vwxk
	kG0mTFPaf0HxR5mWlsHEHr+BcT0bXZFCJFgzaGEEvjWplBS3SeW+m27QZkyi5c9BmC5+
	e80g3KKfBkvIrSlmNAKs9b8EnVBKzzvAUFFehUowXcjzh5mMwzeZ6vGYL6lXCraZOLx+
	nIpioHtdQmQzyJox8qsQAUlllRBAkD0bCZymi28OUWEdmYlIimm4EE+eBVBMIDRrxUiV
	+i1UClfjh2TQJvtzygw5tSV8ZPsyDYQoEQ+ukm5g/9BEosGrO7O3wSX0+T6yicCN8iu1
	lGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yNh7gLDxPMUCHoM4ANVA7N7Fexq8LbmkyUXPeG4zPpE=;
	b=kSMe2lIfboMi/sOocog9hriP76O3f3LBcsLrAK4BRBEvcG/i5PVOa1G1C6/F8yeiNK
	cx4O0k3qJy9+BGwn+T5Pzrg0CzK2kygP3ZNhOC4tUWdtsn2aq4d9w6DiqIHGnicRTTka
	urSXYq+DL63CNgEzYsUwCOi0pOKrBODWoP+jcryXDcC9Mgr3ZAfgL9LI6sKL4zeTfWqd
	lLQz2KLoyGk5N61BeyiZ2rQcWhDTJqPSVZSzvS8QAmt5Kk2xDmxQLUoQMLNyayxH3WFH
	qa0DCnJbnnk5ipHgKu2hMXilG9MR7cUQGoa+X+cUFZbzWCuuaIb7QD3As++hlthaLkq/
	gFbw==
X-Gm-Message-State: AKaTC00ySn+8YAiHqJxOUmcb6aeBB88AyBDYAEHq+0D6Bt30t20MeYw/Fj6wF8RPCvWFRWr7MqRbHnUnMmFLsetL
X-Received: by 10.55.5.145 with SMTP id 139mr18858348qkf.77.1480342216253;
	Mon, 28 Nov 2016 06:10:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Mon, 28 Nov 2016 06:09:55 -0800 (PST)
In-Reply-To: <1480339031.6873.181.camel@intel.com>
References: <alpine.LFD.2.20.1611280544090.16875@localhost.localdomain>
	<1480334664.28508.167.camel@linuxfoundation.org>
	<1480339031.6873.181.camel@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 28 Nov 2016 14:09:55 +0000
Message-ID: <CAJTo0LaLhqDT=f=6kREfmTTdvRYhjKrY3qOV3Op0a=EoxVNHmg@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: ASSUME_PROVIDED versus SANITY_REQUIRED_UTILITIES versus "The Build Host Packages"
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
X-List-Received-Date: Mon, 28 Nov 2016 14:10:18 -0000
Content-Type: multipart/alternative; boundary=001a114c8f84f259e005425d07d8

--001a114c8f84f259e005425d07d8
Content-Type: text/plain; charset=UTF-8

On 28 November 2016 at 13:17, Patrick Ohly <patrick.ohly@intel.com> wrote:

> I recently ran into a third usage of "file-native": swupd-server links
> against libmagic from file and therefore has a DEPENDS = "file". But
> building swupd-server-native didn't actually build file because of
> ASSUME_PROVIDED and because I hadn't installed libmagic-dev on my build
> host, the build was failing.
>

For this case you can use file-replacement-native to get a full file-native
built.

Ross

--001a114c8f84f259e005425d07d8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 November 2016 at 13:17, Patrick Ohly <span dir=3D"ltr">&lt;<a href=3D=
"mailto:patrick.ohly@intel.com" target=3D"_blank">patrick.ohly@intel.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2xn" clas=
s=3D"a3s aXjCH m158ab2c7a2c2b5ad">I recently ran into a third usage of &quo=
t;file-native&quot;: swupd-server links<br>
against libmagic from file and therefore has a DEPENDS =3D &quot;file&quot;=
. But<br>
building swupd-server-native didn&#39;t actually build file because of<br>
ASSUME_PROVIDED and because I hadn&#39;t installed libmagic-dev on my build=
<br>
host, the build was failing.<br></div></blockquote></div><br>For this case =
you can use file-replacement-native to get a full file-native built.</div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></=
div>

--001a114c8f84f259e005425d07d8--
