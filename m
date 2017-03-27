Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 51D4F72F67
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 15:52:52 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id r142so13324563qke.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 08:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sD26wGH61l1wEP5puzkpmJ5KmYBgg7Qu3pkNR+CtvnY=;
	b=YhLo0pm7yxCEMUbufHVkH8P0NkWLPZjZHtmqVZLNeLXVP0VQoS2NyRm9hDCfAj0qQk
	61J/n6/6MPBZfN49psdWKnBMaX1XrIgkZyXJl+reHLm73DrIoPxzuVPqMDJAjpKwHdOZ
	Ytpt/Edjeb6aMz5FkakKmKRTnuGSLp2Kqm+r7eRm06oXCRRy1nn9zgMXUM5txRF8CD/g
	CAOW0YLvEVqSEwS+/gP2KZn7dRVhVGNjwbhUAIsufoacZZPdyjLzxI8RDA7BMmRb6jiL
	P2EOhTi5Z3sgiHqRVfUt2JU20ZSMttffdDpQoZOQwnLtk9br1UygXCD4cUNwpM2hMx7k
	ftoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sD26wGH61l1wEP5puzkpmJ5KmYBgg7Qu3pkNR+CtvnY=;
	b=Jv7lyL78/y12X7hZnKFtyP+uYvbuHLLTBzGRvDNpayYmP4uMslgqsaVEMl/lxIkK20
	xQlDkULPlLKyjXDrAEOQb9atj2aOsFgBgT4eJ3nNqcvBI/v504yzXmThYFvP9jxLHdsN
	S9JdcoeP5Un5bJLKZuo9P1LXjHOuTBdqMwXDd6e/kZO58EyrllRGVjRiFhdckMM/mkG0
	GwJS4M0AjzMYg+ZNG9jdVzcotyL7LYxIWi//HWBZ0E+ufUkdJcI/ysFPu4BBwMvgLXPU
	xT7/AOdQCRM5y9A40Lz1RBqxJL+OBZEJRKJCwQM1Elq81BrXWmS+xoltkcI4hgHjaBBY
	CX8Q==
X-Gm-Message-State: AFeK/H0vlDtA+Pt9JP5YwJ91qTsjlKw1iipq1nhH2aXIFo5tqM3dsqrCIAjoFBPZ1bTQ0UKXc/BLl1a3AszGNKne
X-Received: by 10.55.47.4 with SMTP id v4mr20593461qkh.77.1490629974346; Mon,
	27 Mar 2017 08:52:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 27 Mar 2017 08:52:33 -0700 (PDT)
In-Reply-To: <20170327154757.GJ15664@denix.org>
References: <20170326200813.23705-1-otavio@ossystems.com.br>
	<20170326211438.GI15664@denix.org>
	<CAJTo0LZ_V3p43c55r5cjhxp8K5ABf-001Dx=S-V0GtASPp2-tQ@mail.gmail.com>
	<20170327154757.GJ15664@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 27 Mar 2017 16:52:33 +0100
Message-ID: <CAJTo0LbE22GrO99s8WY++sFXc_DgEHxmdVJYZ1pkKP_nUV4Hcg@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Update to 2017.03 release
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
X-List-Received-Date: Mon, 27 Mar 2017 15:52:54 -0000
Content-Type: multipart/alternative; boundary=001a114f41081d13eb054bb85652

--001a114f41081d13eb054bb85652
Content-Type: text/plain; charset=UTF-8

On 27 March 2017 at 16:47, Denys Dmytriyenko <denis@denix.org> wrote:

> I haven't personally tested 2017.03 yet, as we are staying on 2017.01 for a
> bit longer...
>

It that just because you've stabilised, or is there something in .03 that
you're concerned about?

Ross

--001a114f41081d13eb054bb85652
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 March 2017 at 16:47, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=
=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":3zx" class=3D"a3s aX=
jCH m15b10744d6869999">I haven&#39;t personally tested 2017.03 yet, as we a=
re staying on 2017.01 for a<br>
bit longer...</div></blockquote></div><br>It that just because you&#39;ve s=
tabilised, or is there something in .03 that you&#39;re concerned about?</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</di=
v></div>

--001a114f41081d13eb054bb85652--
