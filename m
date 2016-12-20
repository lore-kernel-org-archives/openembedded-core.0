Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8E15D77375
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 15:05:39 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id w33so178893243qtc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 07:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zV4X3l7/96PdSeyUcy4+zT1LQnuauYiA4WG+PaptwPA=;
	b=r/h+Z/7uGcJXiI/7jSL3SceTl7a5JVojSH3stZYO03w9B28CbszXDXilDsbZXFxOjs
	JfBl2bvMpX5y94u+VQBAMkfte4R0yMZuPL2HnlaTFAeaTNYgVKm413dyIt01O5RW5MMC
	xSy4hg6c1UP9cPw4z+BxJwcu1NIFZrKMTxcGxqcFpo96ycJ4KsClUGihQw/bbKLXe9aO
	It0RGzV9854wKdi0mpXYiZ+Dzt70PLS4quQaJxQM2PLaXvooxn0L2EQrKmDMRBJ8GysR
	glQQ6iRGeiS7QZtiIiTHIuHPBb2pWdZw6GQyhoDJy+22n6tpjKvAGGjC/gLHYoknRvl+
	TdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zV4X3l7/96PdSeyUcy4+zT1LQnuauYiA4WG+PaptwPA=;
	b=LDf61RiyT//0+ZC+qxUpfszR+/qgNxLi6U8XdW42Ug+fDH0QN7ecLSwKALz/p3YDNw
	l/xdZKmP1ZVyQI+SjiOhlJKYaN7EIgRDfSC6BJ06A3BXV+o7+YAnXyeWnDqI0obUer5g
	4FV2Uq9u2fXX027kifY9by3SmMqmV59gPCW1+DHp2/7xuVnrr/nH7zjdBTQPHkSiB0XF
	tA26izgETZlWUgKrKgl+k/DAPwHOksAX03tR4M5zygogxNcesEyBAIaDY7XMxRTVvOns
	apzP9sqZzkpQVwJmesjHGpcFCq/ZwTx3BVlbgHobReW+FZGdqaUzfaajuFVtJ4lmb3U5
	fqDA==
X-Gm-Message-State: AIkVDXLYYzK1b5pViBNHyDxtcaROCxZEMWwayZl8w7lqa/VX5JnupYWlNBEJlET4ryFkooW+lVYIh36O55DurLwj
X-Received: by 10.237.36.154 with SMTP id t26mr4626175qtc.188.1482246340401;
	Tue, 20 Dec 2016 07:05:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 20 Dec 2016 07:05:20 -0800 (PST)
In-Reply-To: <CAJTo0LajFQ85DckLMqS7Tbza4NJNNc4A6QMuACa4XDb6PiHJnQ@mail.gmail.com>
References: <1481599839-114211-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<20161219152324.GA1056@openSUSE-i7.site>
	<CAJTo0LYV2qMTBVpm8ASDb7BdwwezWfysAn6fJbM7Xwh6FXCcyg@mail.gmail.com>
	<20161219214258.GA16333@openSUSE-i7.site>
	<CAJTo0La1zRwQspKAgPvRxaTryEZSjSSwXf+O0XLadAe5p0VnDA@mail.gmail.com>
	<CAJTo0LYuH==F4jbo3chSbaJHkCu8VWmOS+PxT3A6qwTzJoxwXA@mail.gmail.com>
	<CAHUNapSAEd4zuvQCna+QOMxaGDFck5OQbjvsVe6hr9voN7o1=w@mail.gmail.com>
	<CAMKF1sq7fePZCEaZdcN1P_VmZ3Sb8UNmAcCyUDALaRy0p7yfeg@mail.gmail.com>
	<CAJTo0LbZYcPK-9E=+pw9ZB-H9Yb7gNxeQMxLQsoRsZ1CWU4pgQ@mail.gmail.com>
	<20161220145554.GA11748@openSUSE-i7.site>
	<CAJTo0LajFQ85DckLMqS7Tbza4NJNNc4A6QMuACa4XDb6PiHJnQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Dec 2016 15:05:20 +0000
Message-ID: <CAJTo0LYzEZpgspkijcDOUUwPSRBaiWsYbts02NkBy4FJW28jOg@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux: 2.28.1 -> 2.29
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
X-List-Received-Date: Tue, 20 Dec 2016 15:05:39 -0000
Content-Type: multipart/alternative; boundary=001a1141058e97625a0544185ebc

--001a1141058e97625a0544185ebc
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 20 December 2016 at 15:00, Burton, Ross <ross.burton@intel.com> wrote:

> This would be the autoconf macro UL_NCURSES_CHECK in m4/ul.m4, which call=
s
> ncurses6-config.  I thought the sysroot was ahead of the host so it shoul=
d
> find our broken script before the hosts...
>

$ bitbake -e util-linux-native -e
...
export
PATH=3D"/home/ross/Yocto/poky/scripts/native-intercept:/data/poky-master/tm=
p-glibc/sysroots-uninative/x86_64-linux/usr/bin:/home/ross/Yocto/poky/scrip=
ts:/data/poky-master/tmp-glibc/sysroots/x86_64-linux/usr/bin/x86_64-linux:/=
data/poky-master/tmp-glibc/sysroots/x86_64-linux/usr/bin:/data/poky-master/=
tmp-glibc/sysroots/x86_64-linux/usr/sbin:/data/poky-master/tmp-glibc/sysroo=
ts/x86_64-linux/usr/bin:/data/poky-master/tmp-glibc/sysroots/x86_64-linux/s=
bin:/data/poky-master/tmp-glibc/sysroots/x86_64-linux/bin:/home/ross/Yocto/=
poky/scripts:/home/ross/Yocto/poky/bitbake/bin:/home/ross/BUILD/bin:/home/r=
oss/bin:/home/ross/Yocto/bb/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/gam=
es:/usr/games"

Definitely the sysroot before the host.

Ross

--001a1141058e97625a0544185ebc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 December 2016 at 15:00, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D=
"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bord=
er-left-style:solid;padding-left:1ex"><div class=3D"gmail_extra">This would=
 be the autoconf macro UL_NCURSES_CHECK=C2=A0in m4/ul.m4, which calls ncurs=
es6-config.=C2=A0 I thought the sysroot was ahead of the host so it should =
find our broken script before the hosts...</div><div class=3D"gmail-yj6qo g=
mail-ajU"><div id=3D"gmail-:2xh" class=3D"gmail-ajR" tabindex=3D"0"></div><=
/div></blockquote></div><div class=3D"gmail_extra"><br></div>$ bitbake -e u=
til-linux-native -e</div><div class=3D"gmail_extra">...<br>export PATH=3D&q=
uot;/home/ross/Yocto/poky/scripts/native-intercept:/data/poky-master/tmp-gl=
ibc/sysroots-uninative/x86_64-linux/usr/bin:/home/ross/Yocto/poky/scripts:/=
data/poky-master/tmp-glibc/sysroots/x86_64-linux/usr/bin/x86_64-linux:/data=
/poky-master/tmp-glibc/sysroots/x86_64-linux/usr/bin:/data/poky-master/tmp-=
glibc/sysroots/x86_64-linux/usr/sbin:/data/poky-master/tmp-glibc/sysroots/x=
86_64-linux/usr/bin:/data/poky-master/tmp-glibc/sysroots/x86_64-linux/sbin:=
/data/poky-master/tmp-glibc/sysroots/x86_64-linux/bin:/home/ross/Yocto/poky=
/scripts:/home/ross/Yocto/poky/bitbake/bin:/home/ross/BUILD/bin:/home/ross/=
bin:/home/ross/Yocto/bb/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/=
usr/games&quot;</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">Definitely the sysroot before the host.</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1141058e97625a0544185ebc--
