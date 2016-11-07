Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id ADC226FFD7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2016 20:22:08 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id x190so189905859qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2016 12:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FRv0wUrOjnfMYplNUhGM/cF5MF3CXoWfA52R7lZScXw=;
	b=Uog5MtOmoU42NKy7aSs7uRaseb2GnNYHIJ3Q8FcM0slWiNDz3Y1CD5N/BwTb5Ucu48
	VagGmNzK39alFk9JdsmlbX65XGaUvNNZ9f+ybO9aBtDsc43W8LoWZubR4nEOTD2T7Ix8
	o0Jw9WfBgv6SX6D5bs5p/kfOyMkdyMtwurv0tfPpRTaJOtskMkSyQuo7rpjqTyAmniWi
	KEPHq4Q4cB1XgDJDJM9HLGEVokhurxOoyraFagV0DQmUJ3xMUwBOE9xLR89C+0jzPHce
	xyVHgmzhGTzGzDJQXK4RUATSm3204LSNQlYGB0p0LE0rLe9LPhyFOv1ywj3RuPKRn01Q
	4XMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FRv0wUrOjnfMYplNUhGM/cF5MF3CXoWfA52R7lZScXw=;
	b=lmZEzzs165i0Ukq+fsBabBHpPTrK3W+7xhgABvfuZKDd06e+hkoci7FU/xLmPf7ZKw
	2Ij5Xg1X0Us1x3JwUbKQenFVJse6dw6Z+guOxV/FdOJsGBgR7OGgN7a5znD4Lq2x+rav
	7w9+T1WP/qt/KNfC+q2G391qioOvtfHKcYjk5Jp8wCAOcPfbUWNUqLV565uKxHE0OfcN
	ygz5OaIv6kkXizd+vp+rtBTi1eOdlVxrBxD1ynRTEuDQsEvQrvT2ysP3EHAHt1BHbihO
	O5xFIVfHkCPEL9+SMp08MZosoW2Bh+ykb+/y6qSqUzCikKCiADkgprDTo7BAncCJvUDR
	yf2Q==
X-Gm-Message-State: ABUngvf2ty1ez1EGrD4ohidw5Fe7S9SSNyA+ms8Uu6KoKSl731gEe38t43UxHNcPORkonfiQ3pep3w+/MVEShIsP
X-Received: by 10.55.5.145 with SMTP id 139mr8383771qkf.77.1478550127289; Mon,
	07 Nov 2016 12:22:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Mon, 7 Nov 2016 12:21:46 -0800 (PST)
In-Reply-To: <CAJTo0LYgvyAriBj2Wf839f6E6Vv04+MLh++gBOEdqSQS+zizwg@mail.gmail.com>
References: <20161107182006.4207-1-marex@denx.de>
	<CAJTo0LYgvyAriBj2Wf839f6E6Vv04+MLh++gBOEdqSQS+zizwg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Nov 2016 20:21:46 +0000
Message-ID: <CAJTo0LYV3L=i9Nq94uYHck9cGHrqvHrVtJsqOv0do+A4j-eBhg@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: mkimage: Fix build of u-boot-mkimage
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
X-List-Received-Date: Mon, 07 Nov 2016 20:22:10 -0000
Content-Type: multipart/alternative; boundary=001a114c8f841ebdcd0540bbc76f

--001a114c8f841ebdcd0540bbc76f
Content-Type: text/plain; charset=UTF-8

On 7 November 2016 at 20:15, Burton, Ross <ross.burton@intel.com> wrote:

> Looking at the makefile this isn't the case - it's part of hostprogs so if
> anyone of the host-built tools work, they all should.
>

Just verified that the HOSTCC changes in this patch make it work for me
even after removing the sed.  Can you send a revision?

Also the u-boot series went through a number of revisions, can you verify
that the patches in poky-contrib:ross/mut match what you expect to see?

Thanks,
Ross

--001a114c8f841ebdcd0540bbc76f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 November 2016 at 20:15, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"=
mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extr=
a">Looking at the makefile this isn&#39;t the case - it&#39;s part of hostp=
rogs so if anyone of the host-built tools work, they all should.</div><div =
class=3D"yj6qo ajU"><div id=3D":3sc" class=3D"ajR" tabindex=3D"0"></div></d=
iv></blockquote></div><br>Just verified that the HOSTCC changes in this pat=
ch make it work for me even after removing the sed.=C2=A0 Can you send a re=
vision?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">Also the u-boot series went through a number of revisions, can you verify=
 that the patches in poky-contrib:ross/mut match what you expect to see?</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Thanks,<=
/div><div class=3D"gmail_extra">Ross</div></div>

--001a114c8f841ebdcd0540bbc76f--
