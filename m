Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5ED706FF97
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 22:30:00 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id to4so87079548igc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 14:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=5rsvcoSQPJ5PjMKS2PebXQDutOyrSjX07HSkVAPanrQ=;
	b=YOUjkPx6Oc7p8FHJAw2NcFu/or9Y3ercjX0rbU8FOYvh3CRHdGsv1lA6BenCXQrZ8i
	rrK2/E+H6YZJYiKNP3/u8xp29mudjwGteDU2zBsq4znNBqq4F/cCZkCeDT1x72f1XKPg
	OBi2bpZp4RSHlfgZSILjq8bcLTVntvo3eh8njBTDYe60INXRL7Cxv/t7X+ZXX8X45TwE
	bbe0p/2FeA5fa6xaDFy0DGa5mSFHF2riiw4exZSEQZWjs12D0818YS14nNm394IGEiEg
	LrPGSYbS2zUNBjXkmEBqqCPK50T2M2Zy/+3JbnehoYMljwKobMGFQAcYWFg6hD3KEpWv
	F/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5rsvcoSQPJ5PjMKS2PebXQDutOyrSjX07HSkVAPanrQ=;
	b=JiHDUC9fTHqV3JxQuydJ+EGDyUl5CjmDG4eNwNx00MW8HGDfgIwr2svtwj97wGxEnY
	6mnIfUjK978xYC9RRuTmxuHt+WmBp4fPPxpT3xtZ+w389g+okANOeDqLcbTXdc4KSGhv
	GdJInOI+Ikf6o/tmtHPnt3DIM2IvoZOURmoWAoJGL0wCe3LVA3LPD30wTRhSFrEOATSF
	knQ9mOOUpGWDENCmqkUaeSLDRIN5J5kh6x5lZQSkBy+uMaZLoe8gI+zGP1NjUAwxF5pU
	3Fhy0NnorBYe7UQNDYTmWEDd+jFv8hxh6OrfReAXkyp9uDEka5bmz6JFDMk3+A+SnNHw
	HwDg==
X-Gm-Message-State: ALoCoQmNHY1xzkfO7+tpkcyFGGZfY0mBMkU2+WxB2M2lmwfTzlexUxDBjDG3qUB/BCshyFwm8L7LRY+ll8Cko832WCZ6/erX6vCCewl1SWT81ZCmz0Vujv8=
X-Received: by 10.107.155.209 with SMTP id d200mr11132064ioe.133.1450305001667;
	Wed, 16 Dec 2015 14:30:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Wed, 16 Dec 2015 14:29:42 -0800 (PST)
In-Reply-To: <1446445418-31492-1-git-send-email-jian.liu@windriver.com>
References: <1446445418-31492-1-git-send-email-jian.liu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 16 Dec 2015 22:29:42 +0000
Message-ID: <CAJTo0LYTKAg_oiwxyOzDYPZvRBYs7MEd9qzvPK1fW-jUc4wT_Q@mail.gmail.com>
To: Jian Liu <jian.liu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] archiver.bbclass: do checkout for kernel
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
X-List-Received-Date: Wed, 16 Dec 2015 22:30:01 -0000
Content-Type: multipart/alternative; boundary=001a1140340270d50a05270b72cb

--001a1140340270d50a05270b72cb
Content-Type: text/plain; charset=UTF-8

On 2 November 2015 at 06:23, Jian Liu <jian.liu@windriver.com> wrote:

> The repo of kernel is bare git repository and we need to checkout to get
> the source code.
>

A recent patch to archiver ("fix previous issue regarding work-shared for
linux-yocto") claims to fix this, can you confirm if that fixes this
problem or if this fixes more edge cases regarding the kernel.

Cheers,
Ross

--001a1140340270d50a05270b72cb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 November 2015 at 06:23, Jian Liu <span dir=3D"ltr">&lt;<a href=3D"mail=
to:jian.liu@windriver.com" target=3D"_blank">jian.liu@windriver.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":v3" class=3D"a=
3s" style=3D"overflow:hidden">The repo of kernel is bare git repository and=
 we need to checkout to get<br>
the source code.<br></div></blockquote></div><br>A recent patch to archiver=
 (&quot;fix previous issue regarding work-shared for linux-yocto&quot;) cla=
ims to fix this, can you confirm if that fixes this problem or if this fixe=
s more edge cases regarding the kernel.</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">Cheers,</div><div class=3D"gmail_extra">R=
oss</div></div>

--001a1140340270d50a05270b72cb--
