Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id A24BB77E2D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 09:03:55 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id u12so3647632qth.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Jun 2017 02:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CR0ZlM9hySCGBHRX2maWrwaoOxRpuD8Xg6zEN5BrDP4=;
	b=yutd4QfvqSM1AmJ0fM2WNcbm4QCoJZoFvoa2F5hOtO41dLJr/fZAMrpp+w9U+KtNN5
	vSnEAAyJwPHbdn7UjIoZC4D1MalgQLNr25Ts0GNVrceSu7aZqkwdPj99vB+/pR4gyGou
	c8/gmjSqg3+UnaaI8qlX0od+8VSG+M51qm0dksnh6EcWf0hrZ/W8cTf3vw2iVugHrtZe
	BE+aHphIRQ9gBXATcjH6yHD013Y5/9qNys9zmWCQFJUYVo8IjIwv7ymeG+D/eVA3xNAQ
	sx7VKux5vNdTTH1xGVdEjWYYhM9zCR5EUheymJZVedHwien2R73Beta7DRh+7uvyWCkI
	sj2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CR0ZlM9hySCGBHRX2maWrwaoOxRpuD8Xg6zEN5BrDP4=;
	b=beQMGRoky4x8p2N5h0fx6WHVsbD8+h4LotWXJHobXTit6Qf9uaSXwpDxjQQ2onOtv8
	q6o8NtOC1LDiFB3jigV95IWTLaV3cQ48drGhpc9r71+zMmEUWXmQ9gi0aPYYImlrVeW8
	Guh+ieyRahwbQ3xtao2RVOcbF17s/RXmoMpUKzKO9IIWJBQwYwcYmSvXSg+L7m7wnqwV
	4YJJ2L2frjSLe+JK7cAZfhfFpdmsoZciK70W0bQJrCxiJLe/cJN8aWF87OT7PMgt+g+d
	mGTe9Gk33wTyvOijL73MA13OUPD6bfhbiBJEH4UUiRaYXqGRxpcEX0i3eQDHvkSp69zz
	leqg==
X-Gm-Message-State: AODbwcB3ybbrqJozgZI0kxURFu2LNAZ4Ll1a5B/1blP244/NISyI2S/X
	LaCx8gGmXtOkLWdXZIqJCFHYrN/tnRiK
X-Received: by 10.200.45.157 with SMTP id p29mr6669529qta.139.1496394236915;
	Fri, 02 Jun 2017 02:03:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Fri, 2 Jun 2017 02:03:36 -0700 (PDT)
In-Reply-To: <1496385007-18661-1-git-send-email-fan.xin@jp.fujitsu.com>
References: <1496385007-18661-1-git-send-email-fan.xin@jp.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 2 Jun 2017 10:03:36 +0100
Message-ID: <CAJTo0LaqW-TrXA2qD9e8ysgEBWb_VeNvb48cOZ2vXbDXMi5Sfg@mail.gmail.com>
To: Fan Xin <fan.xin@jp.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cairo: Upgrade 1.14.8 -> 1.15.4
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
X-List-Received-Date: Fri, 02 Jun 2017 09:03:59 -0000
Content-Type: multipart/alternative; boundary="001a1145c1a0efc90f0550f66e9c"

--001a1145c1a0efc90f0550f66e9c
Content-Type: text/plain; charset="UTF-8"

On 2 June 2017 at 07:30, Fan Xin <fan.xin@jp.fujitsu.com> wrote:

> 1. Upgrade cairo from 1.14.8 to 1.15.4
>

"Subject: cairo snapshot 1.15.4 now available"

The recipe inherits upstream-version-is-even because odd minor versions are
development snapshots.

Ross

--001a1145c1a0efc90f0550f66e9c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 June 2017 at 07:30, Fan Xin <span dir=3D"ltr">&lt;<a href=3D"mailto:fa=
n.xin@jp.fujitsu.com" target=3D"_blank">fan.xin@jp.fujitsu.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(2=
04,204,204);padding-left:1ex"><div id=3D"gmail-:30k" class=3D"gmail-a3s gma=
il-aXjCH gmail-m15c677e99491c214">1. Upgrade cairo from 1.14.8 to 1.15.4<br=
></div></blockquote></div></div><div><br></div>&quot;Subject: cairo snapsho=
t 1.15.4 now available&quot;<div><br></div><div>The recipe inherits upstrea=
m-version-is-even because odd minor versions are development snapshots.</di=
v><div><br></div><div>Ross</div></div>

--001a1145c1a0efc90f0550f66e9c--
