Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id E2FFD71C90
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 10:08:57 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id w33so171978355qtc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 02:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5H7FqE204wjHHDB1B9yePYUoAJ1ZJTFFvKbgoOzfQp0=;
	b=Auc6uukkAhGIfUKBfbwPnD5BxWiLxIBeacpX0ZAFWtgXH8ncrA52wmoQMKRfiq6Kxl
	YBGSa/vUqWec/JTicH9XbIvmh+JwMNY/CJ2l23O7c0jVklMisZ17DS+83zbEPAq45ZiP
	8l03QiJvrnDv2TvOSmmuGUwQfKcUJMgpTxMu/utE9Kzvzug2HTGz6B+URQ9Zy5zdx7x0
	kKoEHpF4BvnoscBEwWtRN2iYvpNOiGnuovTMtJMy/4JBXzZg6tpS+e2kUJf1vrvT20lL
	VeYvQEnQ2c9a8qxf4Gl+JMqAhqFZ1IPb4kmfuJYeRKnWAULyo7fTSMILwqxvaFLmbEsv
	4o4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5H7FqE204wjHHDB1B9yePYUoAJ1ZJTFFvKbgoOzfQp0=;
	b=BnJ0n1ACUb6LbJ1M2FZ/gSa1EV0o0x90R1R5K2Z80a+SAGgcEMcOU8wKXcHEFnPYxu
	eW+UW8vJscD4Bwvz13wSDAUJxg2dZT301+dnpFBjiZlpbM8jFOutMq5VW7UoRwxNRhDI
	MclhvIqi4Uvp8LA60p0VxLNIV4pd9dcg0haCOHBfPtxPnPg6Oggqnu+WwbOsjU1HPIVv
	+kDch9Sc3mlU5c0UH1Hml2zbXgPjDPjzKB4JqZrMww5aJnPV//7U5kAxS8KluVufD13J
	rmQ6n6PdcugpIDkWJ69lQ09GDLXAucy5XGItCNNEhCyba5PA/RByYNEoxChn+CdLCMqA
	Ti+Q==
X-Gm-Message-State: AIkVDXLlG4g+cRyP7ZOhRTiTqJxbnE7xQMQBPstX1xqRdlZA1JVZ0rSD3PalcNYLThEGAIe+n7Ej+0bLlr/ncV2D
X-Received: by 10.237.61.42 with SMTP id g39mr21310525qtf.65.1482228538859;
	Tue, 20 Dec 2016 02:08:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 20 Dec 2016 02:08:38 -0800 (PST)
In-Reply-To: <224071e0-f86e-e4dd-f83c-593c5a22a3b4@windriver.com>
References: <cover.1482125840.git.dengke.du@windriver.com>
	<b462c405d5967bc06c0cb6e7b984c95852739480.1482125840.git.dengke.du@windriver.com>
	<CAJTo0LaPw5z2W5-rx3DJrNj0w1APeTCsAhwGq8GEGC6_zAW4fg@mail.gmail.com>
	<224071e0-f86e-e4dd-f83c-593c5a22a3b4@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Dec 2016 10:08:38 +0000
Message-ID: <CAJTo0LarSg6dtLe41kyyAYOm2idXQchud5Dea_p5Ks1PReo-YA@mail.gmail.com>
To: Dengke Du <dengke.du@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 2/2] apr: fix off_t size can't match when configure and in target glibc
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
X-List-Received-Date: Tue, 20 Dec 2016 10:08:58 -0000
Content-Type: multipart/alternative; boundary=001a1142a3ea88fc260544143917

--001a1142a3ea88fc260544143917
Content-Type: text/plain; charset=UTF-8

On 20 December 2016 at 02:03, Dengke Du <dengke.du@windriver.com> wrote:

> Thank you for reminding, the following types were hardcoded in apr source
> code when cross compiling:
>
>     pid_t     8
>
>     ssize_t  8
>
>     size_t    8
>
>     off_t      8
>
> I will send V3.
>

(facepalms at apr)

Thanks!

Ross

--001a1142a3ea88fc260544143917
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 December 2016 at 02:03, Dengke Du <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:dengke.du@windriver.com" target=3D"_blank">dengke.du@windriver.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><p>Thank you for remin=
ding, the following types were hardcoded in
      apr source code when cross compiling:</p>
    <p>=C2=A0=C2=A0=C2=A0 pid_t=C2=A0=C2=A0=C2=A0=C2=A0 8</p>
    <p>=C2=A0=C2=A0=C2=A0 ssize_t=C2=A0 8</p>
    <p>=C2=A0=C2=A0=C2=A0 size_t=C2=A0=C2=A0=C2=A0 8</p>
    <p>=C2=A0=C2=A0=C2=A0 off_t=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8</p>
    <p>I will send V3.</p></blockquote></div><br>(facepalms at apr)</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Thanks!</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div><=
/div>

--001a1142a3ea88fc260544143917--
