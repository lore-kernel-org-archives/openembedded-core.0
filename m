Return-Path: <ross.burton@intel.com>
Received: from mail-ua0-f174.google.com (mail-ua0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 83137605BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 17:40:35 +0000 (UTC)
Received: by mail-ua0-f174.google.com with SMTP id 96so41103542uaq.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 09:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VUHNPLd4sKAK2ZE51ekDpj01fUsmnQMml1N8ErkP69M=;
	b=xnETAb4yd8akUN3nibR2R3UfQs+Vbtt8Xc4yoIZY7BRwfEhevTnzs01TBaLMXrH31l
	s/OuGDlLLI2gdRlnmerAmJ82p5V5Hek4CsaNevCDyn1a7DXIogN/AmL5oTxcB+bnuqnk
	3DNXIdSbyGEiAqy52XN36KxUoZQExrfsPsOrxhYylB/5BL3toJWwoVhmv86NcuoXQOSk
	TFrPtZU9FY8EbNOxJr/BAPWLTIxp1Tu0YPuN/KYouui+/EJ7giWTdYG1XYCuT9RzN1mg
	NIHQ8odGkEHzEPSm0qSGWh+0tG7Kezw3I+mWmqaJFOnKmOFjc+PV58E0QmrBBEpXI0Hf
	SOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VUHNPLd4sKAK2ZE51ekDpj01fUsmnQMml1N8ErkP69M=;
	b=sgLHi7M6jLD00jITmycrcN0q46D9tmBKe1DcR9wJ6WVawpRqsRRZwrBAID+lPXeHKh
	ZdOGepKOoCNdXM6s7eRH0B20REtD6L7T3JWO9YKKvmTpHkcZIC05g2KDLk6c3lmeq/pu
	k8U7KYwSUyLfBYiOPH0uyedRKRrQgqiPl8q/YR8/dOWhESWtDEscJLZzWg9+3TN6omfw
	HIH92cA+J8KhrPItaIOSlQgoEHTb3SiVAZTm3WGj8ASdKc7CmmaFelcaZyP2uDN5dHxg
	4mqYDw7zZqlZ4JmQyVSU4kcXC8k2Lm7cgzv4smiheSghZrWVEOncBG2YsUpaZDEo2+xq
	wYtg==
X-Gm-Message-State: AIkVDXLmj1dr8G91GN3DuAuZUttrgzk3PfbnR0MRlZmpOjw6t0elzL93RfaNvQhdU7yROkNPvRTasbvwa5IBIzft
X-Received: by 10.200.39.212 with SMTP id x20mr8465229qtx.109.1484847636108;
	Thu, 19 Jan 2017 09:40:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Thu, 19 Jan 2017 09:40:15 -0800 (PST)
In-Reply-To: <20170119173700.GX15833@denix.org>
References: <20170119165803.22583-1-raltherr@google.com>
	<20170119173700.GX15833@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 19 Jan 2017 17:40:15 +0000
Message-ID: <CAJTo0LY8Nr_3qpqn6W6NKGcau80KP1JYGH0N60MS42t5eLPVZw@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-fitimage: Let U-Boot select ramdisk load/entry address
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
X-List-Received-Date: Thu, 19 Jan 2017 17:40:36 -0000
Content-Type: multipart/alternative; boundary=001a1135b542e5709505467607a7

--001a1135b542e5709505467607a7
Content-Type: text/plain; charset=UTF-8

On 19 January 2017 at 17:37, Denys Dmytriyenko <denis@denix.org> wrote:

> Sometimes it's useful to load ramdisk in a specific location. Your patch
> unconditionally removes this support, which is not a desired change. I have
> a patch queued up to do it conditionally, which I'll try to submit shortly.
>

Would that be the same as Nathan's "kernel-fitimage.bbclass: Allow unset
load/entry addresses for ramdisks"?

Ross

--001a1135b542e5709505467607a7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 January 2017 at 17:37, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-=
style:solid;padding-left:1ex"><div id=3D"gmail-:1tg" class=3D"gmail-a3s gma=
il-aXjCH gmail-m159b7cfb5b346700">Sometimes it&#39;s useful to load ramdisk=
 in a specific location. Your patch<br>
unconditionally removes this support, which is not a desired change. I have=
<br>
a patch queued up to do it conditionally, which I&#39;ll try to submit shor=
tly.<br></div></blockquote><div><br></div><div>Would that be the same as Na=
than&#39;s &quot;kernel-fitimage.bbclass: Allow unset load/entry addresses =
for ramdisks&quot;?</div><div><br></div><div>Ross=C2=A0</div></div><br></di=
v></div>

--001a1135b542e5709505467607a7--
