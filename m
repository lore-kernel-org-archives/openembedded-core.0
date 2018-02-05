Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6DAB97828D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 21:54:03 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id t22so295265ioa.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Feb 2018 13:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ETYnSK43l8TbBxON5UfMd3BkHzVq0A+m7ybb46f+xsM=;
	b=uchAiM83KFK+EUpEj8rxAh2H6SrdHpIdrxklioni/eAGL0Q4t3IVHg1R+hJxeLK318
	qHx++mSYFTYnzQbk2H2V6eEYzk9vcg0EoUBdFFuKvchhlagTVYz8WXcr98MeayHK/MEB
	OthgE8xUoshsCpttcg0wMI7v+pxg9n5VwNR6Nb3B/Kv9puk9VMXl2sLAnEBk9jowNybP
	8dicOmL7bug9tu/lCatbdkbBFAkQl+kUOZCoJ9Le+OB50arpD2pif83frc1XMe5roPga
	W2GBaCILcxgUvI4iH+hS4vih0/90L01r+nK4i6BrI2YaXVGXIOqvG2hjOJpJbSD/whxV
	FhBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ETYnSK43l8TbBxON5UfMd3BkHzVq0A+m7ybb46f+xsM=;
	b=rhOdhADCQtnxv91gluO2dm4p+3cKtcMhxgJyTp4cX8LVhXwwMns97h9ASBRMgu6qvz
	ZY8ATucgrZH1MaIVXZ5sHHNGNp6H1hgwJ7cgPRSfy73X7v238AnC5wJBa39VQ6g/NdLp
	HVTDAtXs/wZtconkT6y3MzGQSc8g6M9D8BQYMtmiPzRpmBkzl2wjabAanZ55XKw1wvhj
	86lRwtv76L0KRnFjx3JuCqjcAnW4JihCdS/InhQFKa3n/LzZjNx3ILGzv/+oJSytezDP
	Gvu2Q44lV2dxEs1cGcgfXFgiA4uot/0IGEeUs8lIpQsWZ+4gcV9hMSXunJXtcCrBrFwt
	LBZQ==
X-Gm-Message-State: APf1xPA3A3ru48IEXBq9eSX+MaBwmkxB9IYFb1aczXgHuY7FMoW9NDQ6
	CamQlgtTZdDGBWrx43MegMSIp6Gs3hZJ6iiIwDAQVe81
X-Google-Smtp-Source: AH8x224x01wPW/lPrMpSyNiM0vQ1E7O8WZe5IWa3zxaJNvtXSAu3oQodGKLxyZoR8gtshjyDgXbJnmrZVjilBh2Nk9U=
X-Received: by 10.107.133.75 with SMTP id h72mr320102iod.227.1517867645371;
	Mon, 05 Feb 2018 13:54:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Mon, 5 Feb 2018 13:53:44 -0800 (PST)
In-Reply-To: <20180205182112.GF2786@denix.org>
References: <20180205182112.GF2786@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Feb 2018 21:53:44 +0000
Message-ID: <CAJTo0LYBFGxrHiDUK1FaJW3YB6hNZf4jiVTBgd7C2ONC9sq9XQ@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: WARNING: Variable key %s (%s) replaces original key %s (%s).
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
X-List-Received-Date: Mon, 05 Feb 2018 21:54:04 -0000
Content-Type: multipart/alternative; boundary="001a113ec5e4d1d5d205647e1938"

--001a113ec5e4d1d5d205647e1938
Content-Type: text/plain; charset="UTF-8"

On 5 February 2018 at 18:21, Denys Dmytriyenko <denis@denix.org> wrote:

> Am I supposed to see bunch of these warnings (3 during parsing and 20 more
> during build):
>
> WARNING: Variable key RDEPENDS_${KERNEL_PACKAGE_NAME}-base
> (${KERNEL_PACKAGE_NAME}-image) replaces original key RDEPENDS_kernel-base
> (kernel-devicetree).
>
>
> From kernel.bbclass:
>
> # Allow machines to override this dependency if kernel image files are
> # not wanted in images as standard
> RDEPENDS_${KERNEL_PACKAGE_NAME}-base ?= "${KERNEL_PACKAGE_NAME}-image"
>

That's your kernel recipe not liking the new multiple-name kernel classes,
and if your problem is the same as oe-core's qemu* machines then this is
the fix:

-RDEPENDS_kernel-base = ""
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base = ""

(oe-core a408236b6302273a5a45bcfe5eb3a8f2713ec3fa)

Ross

--001a113ec5e4d1d5d205647e1938
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 5 February 2018 at 18:21, Denys Dmytriyenko <span dir=
=3D"ltr">&lt;<a href=3D"mailto:denis@denix.org" target=3D"_blank">denis@den=
ix.org</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gm=
ail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204=
,204,204);padding-left:1ex">Am I supposed to see bunch of these warnings (3=
 during parsing and 20 more<br>
during build):<br>
<br>
WARNING: Variable key RDEPENDS_${KERNEL_PACKAGE_<wbr>NAME}-base (${KERNEL_P=
ACKAGE_NAME}-image) replaces original key RDEPENDS_kernel-base (kernel-devi=
cetree).<br>
<br>
<br>
From kernel.bbclass:<br>
<br>
# Allow machines to override this dependency if kernel image files are<br>
# not wanted in images as standard<br>
RDEPENDS_${KERNEL_PACKAGE_<wbr>NAME}-base ?=3D &quot;${KERNEL_PACKAGE_NAME}=
-image&quot;<br></blockquote><div><br></div><div>That&#39;s your kernel rec=
ipe not liking the new multiple-name kernel classes, and if your problem is=
 the same as oe-core&#39;s qemu* machines then this is the fix:</div><div><=
br></div><div>-RDEPENDS_kernel-base =3D &quot;&quot;</div><div>+RDEPENDS_${=
KERNEL_PACKAGE_NAME}-base =3D &quot;&quot;</div><div><br></div><div>(oe-cor=
e=C2=A0a408236b6302273a5a45bcfe5eb3a8f2713ec3fa)</div><div><br></div><div>R=
oss=C2=A0</div></div></div></div>

--001a113ec5e4d1d5d205647e1938--
