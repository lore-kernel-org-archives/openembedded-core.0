Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 2824D73D5A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 13:06:00 +0000 (UTC)
Received: by qkx62 with SMTP id 62so179262498qkx.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 06:06:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=IsI0Hxc1bFgsH/UGMlbMLdadb9c9l/UmGXpo5D8J6aU=;
	b=JSa1p/9lr50ldUcJPGJ5p1/3RT+RiY1rWCfPeHyuHcaujcFQWrJgW+ed0xCwjSB7B2
	2g4HHb6wKP2lXbwSxu4y5OTTe5+0oS3QOWBXyTTUbOHYT+sN0KBXtfolOsQgaVzpwGZJ
	GJz8u1l3TJas4ymbtIDlvKs0z3iMHcumWBdYumOcbwLjoqqO/EBzw2ghYS+Cshct/QF7
	ZG0fFkQP13NA6dtN/1usvydNO5To2K4hwCyng7IfKvAilL+LAr0bZpk9n+Jv4I5Oqvg2
	aFxS8i8oV110nLXn6lg4BnkeOUgPL9dZc7QVxQXVHr1cDu7PxSA2ozoQwAXCtXPGEH1e
	gAEA==
X-Gm-Message-State: ALoCoQnNAeMrwaX+cDh2Ax/hMbgO9MyqaramNulGmaGQkNgnoHeZRcCPPLtAShHgJuSsG06QxjXL
X-Received: by 10.55.50.20 with SMTP id y20mr29250658qky.58.1428930361691;
	Mon, 13 Apr 2015 06:06:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 13 Apr 2015 06:05:41 -0700 (PDT)
In-Reply-To: <D71B7CC5-A19B-44C6-B20C-63D2BEFFA751@dominion.thruhere.net>
References: <d3d9f4037e97ba885958f3d527ab8bea2f2261dd.1428577515.git.jussi.kukkonen@intel.com>
	<cover.1428577515.git.jussi.kukkonen@intel.com>
	<6cb3f4e0e51908d8c57b74330f0fa6bcbf2cbb03.1428577515.git.jussi.kukkonen@intel.com>
	<D71B7CC5-A19B-44C6-B20C-63D2BEFFA751@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 Apr 2015 14:05:41 +0100
Message-ID: <CAJTo0LbCFeE-=p9D500RTpnZqqidVQZ9M1RKOUCPM4tomuCtaA@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/7] libepoxy: Add as GTK+ 3.16 requirement
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
X-List-Received-Date: Mon, 13 Apr 2015 13:06:03 -0000
Content-Type: multipart/alternative; boundary=001a114713929e253f05139ac6c1

--001a114713929e253f05139ac6c1
Content-Type: text/plain; charset=UTF-8

On 10 April 2015 at 09:28, Koen Kooi <koen@dominion.thruhere.net> wrote:

> Slightly related to libepoxy: what is your opinion on a patch like this:
> https://github.com/Angstrom-distribution/meta-angstrom/commit/b6b079e790441b3d926e9dff931b4be59b79b987
> ?
> I needed it for xf86-video-ati, but it does good things for most GL
> drivers, the exception being xf86-video-intel.
>

Adding the option for glamor is a no-brainer.  Does enabling it do bad
things for -intel or just have no impact?

Ross

--001a114713929e253f05139ac6c1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
0 April 2015 at 09:28, Koen Kooi <span dir=3D"ltr">&lt;<a href=3D"mailto:ko=
en@dominion.thruhere.net" target=3D"_blank">koen@dominion.thruhere.net</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":8u" class=
=3D"a3s" style=3D"overflow:hidden">Slightly related to libepoxy: what is yo=
ur opinion on a patch like this: <a href=3D"https://github.com/Angstrom-dis=
tribution/meta-angstrom/commit/b6b079e790441b3d926e9dff931b4be59b79b987" ta=
rget=3D"_blank">https://github.com/Angstrom-distribution/meta-angstrom/comm=
it/b6b079e790441b3d926e9dff931b4be59b79b987</a> ?<br>
I needed it for xf86-video-ati, but it does good things for most GL drivers=
, the exception being xf86-video-intel.<br></div></blockquote><div><br></di=
v><div>Adding the option for glamor is a no-brainer.=C2=A0 Does enabling it=
 do bad things for -intel or just have no impact?</div><div><br></div><div>=
Ross</div></div></div></div>

--001a114713929e253f05139ac6c1--
