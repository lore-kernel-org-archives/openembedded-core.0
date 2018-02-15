Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 1B59960053
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Feb 2018 12:53:00 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id v186so341828itc.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Feb 2018 04:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+z4SOQAxqA4X2uiG8VHP5qw8xjjAIZeMhn1FbUoynu0=;
	b=vAgGJ78FCQWXbC6qW+nN8uWtLznQ4Xuq/vjJZ+dhM9XrCFqm/Jj++w/vJDk1rgmFor
	0/6odY7iAO+RixS+srNMhNDsFBZGHfCGGdqweqs1LFKA+mfXyWaBfL1tSxBZ73hAtakK
	ByRdWebNiLg/p4cKSKqqdN5BiGP+zA1e9TY0GP2531wBqs5122xnNq2Zqh6pqUN8K0yM
	mToNUKNVQqFJdEYT0b7pALFS0e4sTnr3WR2c1vywn+rX/SSsxyLojUPqJFONEo0Llids
	X2eZiydRCSiVDCJt7B5QIs8ZyO3qLmxEsgF5AWmGqBMmBb119hvblrapzfFXujJuQmdL
	L12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+z4SOQAxqA4X2uiG8VHP5qw8xjjAIZeMhn1FbUoynu0=;
	b=MIUo7kHYadqH42/hTe9HBAdA9hg6Jt9vIdNhWvxywmMk5f0FPtI02/Iv1Fy0mW7wMP
	+auD3M/JZh8hpAxglr71mLBkxanfqybF+Zo0iLDGhWeMSqdPfkravs8K06EzgXxgwN3C
	vYU6M0Drr8/a/5dZKm7yhJHzSgEjmaFkDnRFHPKbbv6hg16vebmDDZ18vxEQmMa2+Zi9
	2F/Rm+JmhWtYYRvktoO1CnYM1wp0j0oOngQGc2L7m0M9KYL7usLveATx8/BIceamT2cT
	Cg0qsqyvzeqnqGQ/emghonbxLa/GSikzE9dkTTg6w/6REiUl/d+FteAgwCvVCp6q9Dfl
	pWSg==
X-Gm-Message-State: APf1xPB9Zt96bfSA2yH6CE+FDFQq7DSAIxOGdTqIS41I8UWa+mkVyBpL
	+dalIf+AfUV6bZYvcugldCoVBiRnt/rUZKFdCkAp5A==
X-Google-Smtp-Source: AH8x224IIxHBYINm6Y+s9P72tFF3AKRgYeiz18aUcKynaoOQ9x7WsOx3s+CJ8iPnP5HxXsKFrkIklaOL9+pW+sdRTFA=
X-Received: by 10.36.17.195 with SMTP id 186mr3099193itf.85.1518699182364;
	Thu, 15 Feb 2018 04:53:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Thu, 15 Feb 2018 04:52:42 -0800 (PST)
In-Reply-To: <1518400842-17896-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1518400842-17896-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Feb 2018 12:52:42 +0000
Message-ID: <CAJTo0LY4PQhR+nA+zUr7L4efuF7puNGTkhYyfyf87mtBnBm4AA@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux: 2.31 -> 2.31.1
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
X-List-Received-Date: Thu, 15 Feb 2018 12:53:01 -0000
Content-Type: multipart/alternative; boundary="001a1143ea484960e605653fb593"

--001a1143ea484960e605653fb593
Content-Type: text/plain; charset="UTF-8"

On 12 February 2018 at 02:00, Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
wrote:

> 1.Upgrade util-linux from 2.31 to 2.31.1.
> 2.Modify ALTERNATIVE_TARGET, since rfkill has been moved to /usr/sbin.
>

packages/corei7-64-poky-linux/util-linux/util-linux-rfkill: PKGSIZE changed
from 47144 to 0 (-100%)

This move is breaking the packaging.

Ross

--001a1143ea484960e605653fb593
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 12 February 2018 at 02:00, Huang Qiyu <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:huangqy.fnst@cn.fujitsu.com" target=3D"_blank">huang=
qy.fnst@cn.fujitsu.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra">=
<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-le=
ft-color:rgb(204,204,204);padding-left:1ex">1.Upgrade util-linux from 2.31 =
to 2.31.1.<br>
2.Modify ALTERNATIVE_TARGET, since rfkill has been moved to /usr/sbin.<br><=
/blockquote><div><br></div><div>packages/corei7-64-poky-linux/util-linux/ut=
il-linux-rfkill: PKGSIZE changed from 47144 to 0 (-100%)</div><div><br></di=
v><div>This move is breaking the packaging.</div><div><br></div><div>Ross=
=C2=A0</div></div></div></div>

--001a1143ea484960e605653fb593--
