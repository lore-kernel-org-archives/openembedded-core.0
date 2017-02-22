Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4EF2971D7F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 10:01:22 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id b16so4546508qte.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 02:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gV+uQZPaBBHPT4EnufGnxxWqmu4aYM6TTDLt5wzn3ic=;
	b=I2ie94swYSkmIs1GWofwZNMzvprY4WXhcAG1Lls/V476dAjkNhZ8S4Ft/Pin/v8Kmp
	80ymdlSQ6v5RdQr8sbrNkUBOqSyuWtdH0CbpNAVkVcT9qablEQMMigJ++sogm50DvAin
	sAR3iLH+jq0Jn8SKt/b6Lu0QdCynBiCLIrHa4BxTgTmAFdtm/IAbtgrPVdXAOywldqcl
	98uVKFfiLsLQ94viKSNLCzoExkO5viWr5nb25mXgV4bTHfYs8kUmO/qFOjzU2bUgZ6Tg
	1VctrTVQArFbjA9LXw4fbnZF+laApkDMycSrPPKJ15mgHODQBT5/sh/Mxyg4mEImNrnj
	WW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gV+uQZPaBBHPT4EnufGnxxWqmu4aYM6TTDLt5wzn3ic=;
	b=TulIb4/8Oqasm2hnyUIeMRJsc10aTROyUBymjvQiRLgjgPmQI4evJdMiS5oXT4sPhW
	9zAOImfnzqqYJm2jBEZvwfHoZKof8SiG3Sb7sNtkDqmvgPFKDDEhF2fG44j+gUgN9uWo
	UKJgUswrX3HyUmTLMEmu/orDj9KqwtpgbLLMmZIpDD1mZ1GiFQm9FH1b17OOgnCdCLrd
	385KMz6mPQMh+pcAIPf4p0AYubEz5naNt7uvmH6w4jf80V/wY4IHJZv5x+z6/9JD+bPS
	e+JqeMcgfZjtdoFukh9LSy/TLA7hZFcjvn1U3ZDOC+xRciHb1Wn+S0fWcfJZ+2GCIXjO
	vpDQ==
X-Gm-Message-State: AMke39mXwmqYdHZ4cGAkeaU/I1KiW5XN+j/GKuXsXDdqpYijnpkz9NynAbTGiYcBkq4cdGrlhPyzpe4l/bmKBoEp
X-Received: by 10.237.54.1 with SMTP id e1mr27792652qtb.68.1487757683872; Wed,
	22 Feb 2017 02:01:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Wed, 22 Feb 2017 02:01:03 -0800 (PST)
In-Reply-To: <CALbNGRQCTBqEUiByii0LFY7=Kw07KbBNn1fy+64zuF24+g-y-A@mail.gmail.com>
References: <CALbNGRQCTBqEUiByii0LFY7=Kw07KbBNn1fy+64zuF24+g-y-A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Feb 2017 10:01:03 +0000
Message-ID: <CAJTo0LZ8aGGuo1nz-U9gXJ+_BFvgohvfgVw3g53DFUtV=FE5Tw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Task sequence question
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
X-List-Received-Date: Wed, 22 Feb 2017 10:01:23 -0000
Content-Type: multipart/alternative; boundary=001a1142dcf0427e4605491b9423

--001a1142dcf0427e4605491b9423
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 21 February 2017 at 23:20, Andreas M=C3=BCller <schnitzeltony@googlemail=
.com>
wrote:

> after some fixing in meta-oe it seems I am able to build some
> xfce-image again. Watching the tasks go by I noticed that do_rootfs is
> running already while many recipes still do their do_package_qa. This
> looks a bit odd to me. Not that I am happy about an early do_rootfs
> but what would happen if do_package_qa fails? Isn't that a kind of
> prerequisite for an image that do_package_qa passes for all packages
> within this image?
>

If there are any failures in do_package_qa then the build will fail, so
this is basically optimistically running the rootfs whilst doing QA in
parallel.

Ross

--001a1142dcf0427e4605491b9423
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 February 2017 at 23:20, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a =
href=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzelton=
y@googlemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv id=3D":6t7" class=3D"a3s aXjCH m15a62fa6d84681fb">after some fixing in m=
eta-oe it seems I am able to build some<br>
xfce-image again. Watching the tasks go by I noticed that do_rootfs is<br>
running already while many recipes still do their do_package_qa. This<br>
looks a bit odd to me. Not that I am happy about an early do_rootfs<br>
but what would happen if do_package_qa fails? Isn&#39;t that a kind of<br>
prerequisite for an image that do_package_qa passes for all packages<br>
within this image?</div></blockquote></div><br>If there are any failures in=
 do_package_qa then the build will fail, so this is basically optimisticall=
y running the rootfs whilst doing QA in parallel.</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1142dcf0427e4605491b9423--
