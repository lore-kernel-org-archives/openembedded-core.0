Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id AF4B86011F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 15:40:06 +0000 (UTC)
Received: by ioc74 with SMTP id 74so13087377ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Dec 2015 07:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=v1Fq6uHX3iIiAseV+HUdBeVbMtLU1xB6UlaEmcgNHHM=;
	b=GCoa/b3cru2NXmX0QE8sy3GkUQThoFecu8aUUM+9mphiQyJjI+pvqu62PziX9KAb7H
	Q2ODbAxS7tQ+F6tXu2UawPUr7nuQC7PmlQkx296V6BoYtKW9tXpO2nMIMPMlIwEFoEML
	07+cCm9453P7xX59N8XsHwQp6DhHHQgV1cbw8yurA9DVo4/j+7+65o4+nbm6EDN2b9tR
	0hCMDzzPWZCrTjyhA2Xx5tH1Zu8swK1/vNGiM7KW0FTaerqSEl33N5DF7Va4pTcgd8ZI
	bLQV/782tJAyKjT9NwjA47Y7Ly2YbvFYSHP/jv+xz3dK5GdiXR7IClA8Duh3w/jrb9dC
	gNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=v1Fq6uHX3iIiAseV+HUdBeVbMtLU1xB6UlaEmcgNHHM=;
	b=BEjVWwdSNAWn6ayUeB86m44K5X86tI93RHopOipsXLZ8m2a0TRsPnovWrG23kgJPS4
	/RkRe7kN4WCnyVeOTpJMe4TwGSljt8Cwf8f+xW/vl1S6wFzgQIVz0sVlGXE+mM6cKNjg
	KBZTUY5lpRx7jh5O1z/6ELarIW2mSNRWQWMrznkDkmp1QQ2nrzOeWl7pJQ59vfYrrKA6
	+Q1bUzfxZ3WmskTER0LheJ/Uc1hmUvJfQIsYN5p9RvEh+hBHBVCsvoBIa7irDclAv5JW
	onspPX5UfE5mioltbnn0h5Jvi4BfKdHihD5VpGMAB0W5LN7IKuFPIWYpcKkrsnzuBEwU
	W7WA==
X-Gm-Message-State: ALoCoQl+zQeZKilV+8g41EdW3Nh5WSTkumNn7PafbjsmSJnx2zOccAXNtxkrpyldUrgyZ7pAP/ru
X-Received: by 10.107.3.144 with SMTP id e16mr59415064ioi.99.1448984406856;
	Tue, 01 Dec 2015 07:40:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Tue, 1 Dec 2015 07:39:47 -0800 (PST)
In-Reply-To: <1448983859-6096-1-git-send-email-marex@denx.de>
References: <1448983859-6096-1-git-send-email-marex@denx.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 1 Dec 2015 15:39:47 +0000
Message-ID: <CAJTo0LZR6VgXVi848c=RZVw=+u1GyetHWkwTXuwEyxTocsa2sA@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libbsd: Upgrade to 0.8.0
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
X-List-Received-Date: Tue, 01 Dec 2015 15:40:06 -0000
Content-Type: multipart/alternative; boundary=001a113ecf40db4f7a0525d7f833

--001a113ecf40db4f7a0525d7f833
Content-Type: text/plain; charset=UTF-8

Hi Marek,

On 1 December 2015 at 15:30, Marek Vasut <marex@denx.de> wrote:

> Upgrade the library version to recently released 0.8.0 .
>

Fails to build from a clean sysroot:

| In file included from
/data/poky-master/tmp/work/corei7-64-poky-linux/libbsd/0.8.0-r0/libbsd-0.8.0/src/getentropy.c:28:0:
|
/data/poky-master/tmp/work/corei7-64-poky-linux/libbsd/0.8.0-r0/libbsd-0.8.0/src/getentropy_linux.c:50:25:
fatal error: openssl/sha.h: No such file or directory
| compilation terminated.

Ross

--001a113ecf40db4f7a0525d7f833
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Marek,</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_quote">=
On 1 December 2015 at 15:30, Marek Vasut <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:marex@denx.de" target=3D"_blank">marex@denx.de</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:soli=
d;padding-left:1ex"><div id=3D":3xx" class=3D"" style=3D"overflow:hidden">U=
pgrade the library version to recently released 0.8.0 .<br></div></blockquo=
te></div><br>Fails to build from a clean sysroot:</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">| In=
 file included from /data/poky-master/tmp/work/corei7-64-poky-linux/libbsd/=
0.8.0-r0/libbsd-0.8.0/src/getentropy.c:28:0:</div><div class=3D"gmail_extra=
">| /data/poky-master/tmp/work/corei7-64-poky-linux/libbsd/0.8.0-r0/libbsd-=
0.8.0/src/getentropy_linux.c:50:25: fatal error: openssl/sha.h: No such fil=
e or directory</div><div class=3D"gmail_extra">| compilation terminated.</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</di=
v></div></div>

--001a113ecf40db4f7a0525d7f833--
