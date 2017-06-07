Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4477A72F2A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 12:12:19 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id u12so5964447qth.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jun 2017 05:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9G//jMkY7VWD0eB8eO+JDw682FATfENSD8vI2SjUZyg=;
	b=ZYvldTRx+Hpjp9Xhl0r2VN/szzTicmo2aGkx6c93pY3Y6NdPLaYqr0ua4HajXgA2AS
	vYv8Dy0gGSIVNzjwfqBmgrRSisCV+5hr3UtcgF+vU+tj1agaKuHUtNJS4Shx3bf900t0
	57ch3ILErhQ9AyRyFruaHvOJHbj7RdFgYlPqufwH/LrrbIeCyuxM1ii3H5gZxWyMpxKj
	TpL4LYBQ4EGCsgSm+Cs3RJ+s08G1GKwUKJezHChfAeYYkXg7Mbf+dzxEjJxC62OyCEv1
	C8UsMK60sWHJaD2FT3CGZBoGOrwukA7Mr4puK3oE3vutVdFRUYO1Cs+W5GJbq7vZvko3
	tVfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9G//jMkY7VWD0eB8eO+JDw682FATfENSD8vI2SjUZyg=;
	b=cneqySp5/0esOf+9wTmFI2oePvG0LQrPspBzF+OyBcq51AsJXjx3bZvS6r83fMyi+D
	zr36EM8sXY2DnyyEiO4edbxOGn9zq1Zvl6MLVAAZXfG1kkXmR0NvxCjo2+ClUe+iHoYS
	CPczF6jC2Dp23cvPVc56B+kzmhNBk6pKap9lqF5aTWRF6QsuNB0mqifrNKo8EfLN9EQR
	1GgqFMDk6E+/Ir/PHsypGO/DcYOST3QkHQegZ2SA5YUOj26eyqU5syQE/ToMEx8leCmx
	MKUA4MACch+KjjwJ8h4WkpGUaCNXAkTwJ9GIM/KxApjW2yKnKj/64u4zWlhjHiFWxQpZ
	zFtA==
X-Gm-Message-State: AODbwcDPkIDFuJl5grspyg38c3PvfS12bWD2Xrzsup7UiwYa72+7SdGH
	wuWFnKJg3IkAB4HVF47FZ4/IyK1jFtTd
X-Received: by 10.200.62.25 with SMTP id z25mr25104232qtf.139.1496837541156;
	Wed, 07 Jun 2017 05:12:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Wed, 7 Jun 2017 05:12:00 -0700 (PDT)
In-Reply-To: <1496837136-24209-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1496837136-24209-1-git-send-email-ed.bartosh@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 7 Jun 2017 13:12:00 +0100
Message-ID: <CAJTo0LYUEgJgU03xxhi2ke3SspsEs0_JPcX4yiBaVbF6p-saUQ@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: enable dhcp for MPC8315 board
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
X-List-Received-Date: Wed, 07 Jun 2017 12:12:20 -0000
Content-Type: multipart/alternative; boundary="f403045ee67eed71c605515da568"

--f403045ee67eed71c605515da568
Content-Type: text/plain; charset="UTF-8"

On 7 June 2017 at 13:05, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:

> +    file://MPC8315ERDB-enable-DHCP.patch \
>

This file isn't in the patch.

Ross

--f403045ee67eed71c605515da568
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 June 2017 at 13:05, Ed Bartosh <span dir=3D"ltr">&lt;<a href=3D"mailto=
:ed.bartosh@linux.intel.com" target=3D"_blank">ed.bartosh@linux.intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":43z" cla=
ss=3D"a3s aXjCH m15c827381b9651d9">+=C2=A0 =C2=A0 file://MPC8315ERDB-enable=
-<wbr>DHCP.patch \<br></div></blockquote></div><br>This file isn&#39;t in t=
he patch.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">Ross</div></div>

--f403045ee67eed71c605515da568--
