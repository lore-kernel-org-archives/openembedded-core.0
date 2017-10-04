Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id D896277E9C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Oct 2017 15:46:24 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id c195so16197644itb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Oct 2017 08:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gL6OgWXXsUyn5sQGsdch1t3Dd+4ApJJU3sIf9wTE3+s=;
	b=l2Sl/j/cFrfkmzNDEAo71UqUsFu9kPH734m38DbZNSUX0eu1bwrdtYFFtHL66AeizF
	Vu5WkdPPk4jjX7ks4XiAcXrlFC6EG0kBk/zxknKnMRLovdx71cC9vthR7UchrQHQjuXT
	Qh+5J0UZ+/riSCc8isGhtYYFZzObffug99u+g1CfV2BrZrra4vyOCeZRbClsVhPA47TM
	dIQwSoe8csaZOmI9Co2TEKi5hMut60aDr6D7IwjoGbFpzuAwl3FfAgUYacL4stSGI/VQ
	mLrRInqCX6iYhsMMuVk5R0pajLv0MhfqJmyzkePppK7Q0PEStRsboju9ve89DiNPj+Zs
	Ck7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gL6OgWXXsUyn5sQGsdch1t3Dd+4ApJJU3sIf9wTE3+s=;
	b=ulZQQ3BT1cSB7eGM8e7YsQ+CckcANkseOnWD0T02/NZiy1AUXESJwvRad5vWLB4XUn
	RhEWEWcWDuvK9ddasYm3fJlFQLabIl+QP+780IcGYpWOkxPng9fElVka6lUFyFwjMBHR
	yZtxSMSq9S/UNXv1LHV9D779Ot49PnbcCshqTvDfxzRaLoMYLcgDbqVGh46H89G+37E7
	m5/G5+5pkxOz2ygVnj/h1NaqLqE3iibrV4/Ka8HYR6GF8bkyW/ZxfcP2eY9OHfO/Gw8y
	z6EY0x7F//c+s9ptBRIMGws2hz4IkDY2LpzAOCHICs6DIpFuU9Uii8kSR+YMIV0luYq7
	TDgQ==
X-Gm-Message-State: AHPjjUiGCmsKQIAjB4CJNThy9f9IMWpbHGeVrnyo1J6TtClZ8FTc+cuE
	o8ny/qp+cQYdirPT14fCHnvwfnGSLrRJmwNeOeBmdg==
X-Google-Smtp-Source: AOwi7QCkmNuN8ckQrXyGTUQAh1M6vvnGO451QhEJcAsnH4m9DouWqxNNO7E1aCkvyhDm4n1rYLVPgefV4gy7E0vXfrs=
X-Received: by 10.36.178.1 with SMTP id u1mr31637185ite.120.1507131985814;
	Wed, 04 Oct 2017 08:46:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.164.134 with HTTP; Wed, 4 Oct 2017 08:46:05 -0700 (PDT)
In-Reply-To: <1504750598-591-1-git-send-email-yi.zhao@windriver.com>
References: <1504750598-591-1-git-send-email-yi.zhao@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 4 Oct 2017 16:46:05 +0100
Message-ID: <CAJTo0Lbpaf_jJzvbWfKiGbYwbQw-czvjfysUMWeckb0CGEtzag@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dhcp: make dhclient to get configuration for other programs
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
X-List-Received-Date: Wed, 04 Oct 2017 15:46:25 -0000
Content-Type: multipart/alternative; boundary="f403045d9c0ea50a62055aba8265"

--f403045d9c0ea50a62055aba8265
Content-Type: text/plain; charset="UTF-8"

On 7 September 2017 at 03:16, Yi Zhao <yi.zhao@windriver.com> wrote:

> +Upstream-Status: Backport [redhat]
>

Unless Redhat is upstream, this is not a backport.

Ross

--f403045d9c0ea50a62055aba8265
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 7 September 2017 at 03:16, Yi Zhao <span dir=3D"ltr">&l=
t;<a href=3D"mailto:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windri=
ver.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"g=
mail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">+Upstream-Status: Backport [redh=
at]<br></blockquote><div><br></div><div>Unless Redhat is upstream, this is =
not a backport.</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--f403045d9c0ea50a62055aba8265--
