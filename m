Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1802C6AC4B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 14:07:53 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id x190so96331245qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 06:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8UcfyIrPwOYKE7i/auIO12tFGXeLYy/LbYZfKD1MjoU=;
	b=iHABUVkOYLEDt6w9x256kd2dfqUGt9ifODApmgP274nneW7Wca46VbkNTYpjwi71sD
	2fswBxv5lsTGoKYHAVU4Sb2KF3mDlHEbLmDys0c3t7shWod5I7i92epp0fIatKnZznrH
	z3QTpBnCONvVAN+2CzzK76Ym3KH4NSbcK/ENlet1rkB9rV/gqLD8+ErVAbJFBr57/mUd
	6PnNbDgCQJlROXknzZ6/V48/X33eN94Vexwx6kORryppg6wGqieCmdfeN85y8GC/caZf
	3B/c3/KYQBlZy0s6Op50byc0TVCwOWqL1HoJ+mn7uxmeygOdWgowwXpXr1M2q2MKr6jt
	lvvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8UcfyIrPwOYKE7i/auIO12tFGXeLYy/LbYZfKD1MjoU=;
	b=hfyYEtA3ntz/DR0mvyQxcVJcRSrw6d9AV5BXd+SRkbDjevUMcx7sFKh/0/fgE3NhJW
	KqvY0c5NNynVvFDuO577+vi5KdTFhAJE40vI2uTeZ6vo5Kyzt4yuPGXsyvx2Xsnwl0l2
	HYudcj/dBoqBzLlMuu9HkTc6fv4296h8VvPh4QEdDmuBHZZFmVtMydvqDqodTdLsQe9Y
	AJKP/oQo9GG+QOQNVyPA7qGOP4DO2YrfX9TzB5antcFuxBAW7a6zI3oIQ+do0jAGXeLj
	tN+4zolMHLIQSBDq9gylvGNod2WXe0UZ1F3gYK3Y+1CDe8fa+sz9H/ytxYcjQsExGD44
	be0w==
X-Gm-Message-State: ABUngvcm+6UskwnJkH+uVofZqZCyEoMxJldvtnspw9OS/HSfLJAfKejiX4LTzBgSlwSaAO0r4YVh19dkVNRU1gcu
X-Received: by 10.55.39.88 with SMTP id n85mr16039459qkn.244.1479132475099;
	Mon, 14 Nov 2016 06:07:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Mon, 14 Nov 2016 06:07:34 -0800 (PST)
In-Reply-To: <CAD4b0_KC108KpwO3kvWqt7LCoqAQZ88_R0b_BXmmuSFAv_xVfQ@mail.gmail.com>
References: <cover.1478779674.git.maciej.borzecki@rndity.com>
	<CAJTo0LZiXenXy8WC28z+5a4+ibJekaqeD+0_O84aejyi9XNH4w@mail.gmail.com>
	<CAD4b0_J6hKetcbiXvUS3wAeo19QSGF=5DCFZnLK-0Lz904-6DA@mail.gmail.com>
	<CAJTo0LaLwE+VOJwa3vad2XOc0FmwPpcGOxUvev=7RbnatnOKRg@mail.gmail.com>
	<CAD4b0_LBO_WbaGdaYne7U8KT0QiBb=P5_Th0MjzR24F6px-vXA@mail.gmail.com>
	<CAJTo0LZ+JpE8G-qvLOQburPb+vFCJ-GB6HnGpKZD80tnLpv86A@mail.gmail.com>
	<CAD4b0_KC108KpwO3kvWqt7LCoqAQZ88_R0b_BXmmuSFAv_xVfQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 Nov 2016 14:07:34 +0000
Message-ID: <CAJTo0Lby4RLXxxe8cG_Kr8Uq-srb8nv2tZCTCuQxBYD8hY5YyA@mail.gmail.com>
To: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 00/10] wic: bugfixes & --fixed-size support, tests, selftest: minor fixes
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
X-List-Received-Date: Mon, 14 Nov 2016 14:07:54 -0000
Content-Type: multipart/alternative; boundary=94eb2c094b16c123090541435db3

--94eb2c094b16c123090541435db3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 14 November 2016 at 14:03, Maciej Borz=C4=99cki <maciej.borzecki@rndity.=
com>
wrote:

> TARGET_ARCH is in fact not exported as you have indicated, there's this
> piece in meta/conf/bitbake.conf:
>

Ah yes there's a bit of bad interaction between unexport variables, the
hack that is -e, and the even greater hack that is get_bb_var.

I actually have a patch to change the -e output, I've just noticed that it
will break selftest as that makes assumptions about -e output, but it does
solve the problem that you can't reliably use get_bb_var() on unexport.

Ross

--94eb2c094b16c123090541435db3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 November 2016 at 14:03, Maciej Borz=C4=99cki <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:maciej.borzecki@rndity.com" target=3D"_blank">maciej.borzec=
ki@rndity.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
id=3D":2r9" class=3D"a3s aXjCH m15863274009bffa0">TARGET_ARCH is in fact no=
t exported as you have indicated, there&#39;s this<br>
piece in meta/conf/bitbake.conf:<br></div></blockquote></div><br>Ah yes the=
re&#39;s a bit of bad interaction between unexport variables, the hack that=
 is -e, and the even greater hack that is get_bb_var.</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">I actually have a patch to =
change the -e output, I&#39;ve just noticed that it will break selftest as =
that makes assumptions about -e output, but it does solve the problem that =
you can&#39;t reliably use get_bb_var() on unexport.</div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c094b16c123090541435db3--
