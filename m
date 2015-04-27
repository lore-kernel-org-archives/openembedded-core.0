Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4C79973D53
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 15:00:06 +0000 (UTC)
Received: by qcbii10 with SMTP id ii10so56228791qcb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 08:00:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=8jDt4tdlp3npbZsaMzNNDJT5+nqqMwGXMb2ACfe+sns=;
	b=kxgMPR0Rqt0fiFDDxVB9p1+ZHHyW4GiJRf4DTSAvAhfFnlmHikmTTMDmigMvBFp2oe
	tBsVSPPnDOCI77YHoqUY0KHrHQKjk6kK/Ke0KeVjD6tF3oAUTZOcunpM38Y3oobXp/Wa
	0Dyi58h+w2l01Rl2sVB1nFicZydENyoIqyAFh7mZhpBaEJ7qyc5p2iBKarurN+w74EoJ
	JQY3vQgr5DrI6aDG0YVKv0KFeFoC3ALYW+pbvDuGDUPQHfnJgA6AHBe45sdDHlAxJfvR
	bGfw9Xuf62sd+EpQkCDDjjCogoEPpa010nq96Tp+HdEzcS8udVhbJYl9i+FlJp0rurcm
	AXQQ==
X-Gm-Message-State: ALoCoQlL9Keo908/btXDnVM6kAdcb5T+g31rV2MDkL+mFxftzFfp2fy6t3DVYxF8ZgIgkE7B81E3
X-Received: by 10.55.50.20 with SMTP id y20mr12174372qky.58.1430146807997;
	Mon, 27 Apr 2015 08:00:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 27 Apr 2015 07:59:47 -0700 (PDT)
In-Reply-To: <CAJTo0LbC+Jt5N1VANt71jpuJU7KHE5YC1hkd2amLe02Zm1p+YQ@mail.gmail.com>
References: <cover.1429846255.git.raj.khem@gmail.com>
	<77a5f2f42f3ca50a912306b1771e08286b4e8648.1429846255.git.raj.khem@gmail.com>
	<CAJTo0LbC+Jt5N1VANt71jpuJU7KHE5YC1hkd2amLe02Zm1p+YQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 27 Apr 2015 15:59:47 +0100
Message-ID: <CAJTo0LbWOFRj0HAzjcbtQGwS9rmOFmp4zT_T-sHWkaU4V-sdfQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 03/14] xserver-xorg: Fix build with gcc-5
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
X-List-Received-Date: Mon, 27 Apr 2015 15:00:07 -0000
Content-Type: multipart/alternative; boundary=001a1147139277b96a0514b60075

--001a1147139277b96a0514b60075
Content-Type: text/plain; charset=UTF-8

Oh, and upstream has merged a different fix:

http://cgit.freedesktop.org/xorg/xserver/commit/hw/xfree86/sdksyms.sh?id=21b896939c5bb242f3aacc37baf12379e43254b6

Ross

On 27 April 2015 at 15:58, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 24 April 2015 at 04:35, Khem Raj <raj.khem@gmail.com> wrote:
>
>> +Upstream-Status: Pending
>>
>
> Patches should also have *your* signed-off-by in, so we know who
> originally proposed the patch.
>
> Ross
>

--001a1147139277b96a0514b60075
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Oh, and upstream has merged a different fix:<div><br></div=
><div><a href=3D"http://cgit.freedesktop.org/xorg/xserver/commit/hw/xfree86=
/sdksyms.sh?id=3D21b896939c5bb242f3aacc37baf12379e43254b6">http://cgit.free=
desktop.org/xorg/xserver/commit/hw/xfree86/sdksyms.sh?id=3D21b896939c5bb242=
f3aacc37baf12379e43254b6</a><div><br></div><div>Ross</div></div></div><div =
class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 27 April 2015 at 15=
:58, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel=
.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><br>=
<div class=3D"gmail_quote">On 24 April 2015 at 04:35, Khem Raj <span dir=3D=
"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@=
gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div sty=
le=3D"overflow:hidden">+Upstream-Status: Pending<br></div></blockquote></di=
v><br>Patches should also have *your* signed-off-by in, so we know who orig=
inally proposed the patch.</div><span class=3D"HOEnZb"><font color=3D"#8888=
88"><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</d=
iv></font></span></div>
</blockquote></div><br></div>

--001a1147139277b96a0514b60075--
