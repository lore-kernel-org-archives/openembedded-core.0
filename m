Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yb0-f182.google.com (mail-yb0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 62F7065C90
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 14:17:12 +0000 (UTC)
Received: by mail-yb0-f182.google.com with SMTP id c125so15362051ybf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 06:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2NquLLr53Q90e7LeAP+JpTb8ARWOuP8Gz0OfTrht/pE=;
	b=FZd4ThUQ1oEb9s0laZS1+I4icSsqUL/ikGYfmyV7QKeK3qwY/JLkaFp4uow6WcdSBC
	bY1ac/rQyYP4bU4LQRCiFa1fBZY447FV1jNVWzVnBeS5YZg0eo0/K4L3gCcqPld32FdB
	LneBSTdy4Djz6l3EKAURBTp49vy9v5WRb+VsPvcUAlJEYTJw0IcrIOWfnhtvpVVIelzX
	gGlUXmoPrQ+hb6ZNp2G7u4UwNuAhRCKm1lTR1SdrYx4BYMYoBXSzQfHo8CtpG398DMX/
	ELLRvC2r8CVVA7UJv+P8iALPibgxA3Mxv3v5mf+CMlMbIcILdY8YwlCufrtcKyNZCQKF
	L7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2NquLLr53Q90e7LeAP+JpTb8ARWOuP8Gz0OfTrht/pE=;
	b=FmP+e/tOS+1g+tqJ1QjS26hi9SIJixxbIxp7V/FERL3GsyATQyfTvgmM6GRHa/XbjW
	nTvKD+RUh2zCNOtujlI/90028r0yP5DeatVMsBhaLG/xjcZzLvraWmDvwLgXbD+5/vLo
	p1vGc0NoyW/2OfMj+bdbWpVSwhT1Nf3LoT2aXFpFxBCHcE9sxc+tF5y62DPFQ+fqNxuU
	RK+SsdbiHP2uVCUX47bkOYYzBY1rivR3dpDHUdAugQ06fuQH2ebUAfeZFAG4pTf0lj98
	E5PPZj+ltJ2LrpCMrSqknEYGVI74Ubsg81FeuPBm2EY5ejZufXnoGBmn+53ecBaJyKli
	UW2Q==
X-Gm-Message-State: AIkVDXJa9Y0QUTX+/QF5+XTOWN5060/K7hp/8KipA0ynlbERJL8TMk6ZDU8dYtwcq/sJFB57YLWuzI3gdTp+DCOe
X-Received: by 10.37.25.10 with SMTP id 10mr12727054ybz.103.1484317032808;
	Fri, 13 Jan 2017 06:17:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.13.234.11 with HTTP; Fri, 13 Jan 2017 06:16:42 -0800 (PST)
In-Reply-To: <CADkTA4NpPn78=SB+b2zO=Vd8z2SG+BtBLQi1ciKjXyEruoQ1rQ@mail.gmail.com>
References: <cover.1484312322.git.ross.burton@intel.com>
	<CADkTA4NpPn78=SB+b2zO=Vd8z2SG+BtBLQi1ciKjXyEruoQ1rQ@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 13 Jan 2017 16:16:42 +0200
Message-ID: <CAHiDW_Fs4B1B2qzqsJqVdVuEZa40boKH8zGnON04W7L8=bfgSA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/80] Consolidated pull
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
X-List-Received-Date: Fri, 13 Jan 2017 14:17:14 -0000
Content-Type: multipart/alternative; boundary=001a113ed35c79cfdd0545fa7de4

--001a113ed35c79cfdd0545fa7de4
Content-Type: text/plain; charset=UTF-8

On 13 January 2017 at 15:39, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:
>
>
>
> On Fri, Jan 13, 2017 at 8:00 AM, Ross Burton <ross.burton@intel.com>
wrote:
>>
>> Hi,
>>
>> Another consolidated pull.  Last run on the AB was mostly green:
>> - byacc on beaglebone-lsb failed (upgrade removed)
>> - checkuri failed (transient, works now)
>> - selftest failed (fixed in branch, tests work locally now)
>
>
>
> Should I re-send my kernel queue ? It is now about 13 patches long, and
I'm stacking
> a few more on every couple of days.
>
> I assume there are still some outstanding issues with the 4.9 kernel, or
more specifically
> the 4.9 kernel headers ?
>
> If there's a pointer to the list of issues, that would be great, so I can
help prod things
> along (assuming I can sort out the build issues .. c libraries give me
headaches ;)


There's at least the connman build issue on musl with 4.9 headers:
http://errors.yoctoproject.org/Errors/Details/116506/

Musl defines IFF_LOWER_UP which breaks compilation with linux/if.h.
kernel has uapi/linux/libc-compat.h for similar issues with glibc but at
least currently it does not check for musl...

See other discussion "musl: Upgrade to 1.1.16+ on master".

 - Jussi

--001a113ed35c79cfdd0545fa7de4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 13 January 2017 at 15:39, Bruce Ashfield &lt;<a href=3D=
"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote:<b=
r>&gt;<br>&gt;<br>&gt;<br>&gt; On Fri, Jan 13, 2017 at 8:00 AM, Ross Burton=
 &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt;=
 wrote:<br>&gt;&gt;<br>&gt;&gt; Hi,<br>&gt;&gt;<br>&gt;&gt; Another consoli=
dated pull.=C2=A0 Last run on the AB was mostly green:<br>&gt;&gt; - byacc =
on beaglebone-lsb failed (upgrade removed)<br>&gt;&gt; - checkuri failed (t=
ransient, works now)<br>&gt;&gt; - selftest failed (fixed in branch, tests =
work locally now)<br>&gt;<br>&gt;<br>&gt;<br>&gt; Should I re-send my kerne=
l queue ? It is now about 13 patches long, and I&#39;m stacking<br>&gt; a f=
ew more on every couple of days.<br>&gt;<br>&gt; I assume there are still s=
ome outstanding issues with the 4.9 kernel, or more specifically<br>&gt; th=
e 4.9 kernel headers ?<br>&gt;<br>&gt; If there&#39;s a pointer to the list=
 of issues, that would be great, so I can help prod things<br>&gt; along (a=
ssuming I can sort out the build issues .. c libraries give me headaches ;)=
<br><br><br>There&#39;s at least the connman build issue on musl with 4.9 h=
eaders:<br><a href=3D"http://errors.yoctoproject.org/Errors/Details/116506/=
">http://errors.yoctoproject.org/Errors/Details/116506/</a><br><br>Musl def=
ines IFF_LOWER_UP which breaks compilation with linux/if.h.<div>kernel has =
uapi/linux/libc-compat.h for similar issues with glibc but at least current=
ly it does not check for musl...<br><div><br></div><div>See other discussio=
n &quot;musl: Upgrade to 1.1.16+ on master&quot;.<br><br>=C2=A0- Jussi<br><=
br><br></div></div></div>

--001a113ed35c79cfdd0545fa7de4--
