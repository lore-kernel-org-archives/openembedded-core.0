Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193])
	by mail.openembedded.org (Postfix) with ESMTP id D8161747E7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 13:13:02 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id b4so1648644oif.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 05:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NUqTMyJasiI2Ucf0qOp++t8GwnpRI+0AZVXwF8/xwfM=;
	b=U/0iDdG8+eQz0xlG9i82/zOIygZLjTXtpdPLPfhLBo2JM8kBIJAjggxVQe6qhfSF6c
	PLroO4kNEs4TKOK91NTN1HP/8viW7JwWb8QO8rUi7AvayuUoCKBIy8qYTBfKWZOtDROc
	FeaJd5YsGDrzYZ96za6EkiRxxIkmq9Rnox23VTX2KYgVoEz8NqcEi2NyW27JU0HjJQjo
	bwC+LoVSlHQbN5PC9OQHXYZwM7HPQUYWgpkeOGvjywSlr1Gd2MMBetnAWK9chgoyaRmO
	HQZ5MDOMcPjxIKGN7u34lnGbkdmHY8yByzhDzL3Np5Cndjs0uIo6UfxTWUVyicfftdnz
	5xEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NUqTMyJasiI2Ucf0qOp++t8GwnpRI+0AZVXwF8/xwfM=;
	b=oeM1neVkHl7X7oLJI+WpL2T5da1ipPP+2ROXYHkkPf9dVin4lw7SlhPs77IvoqlQom
	zO9Xeg09AdoMk9axO9tfZru369tYsh9q2+wjUXssc+vurO2txyKF9KbjHB5GHMZDp3io
	YNyIQsLQXkr3Z6E17kughNha0daa6bpHzviMyMFZGlgW1wK4BEZzba5zekxbg5fww7+o
	JlUkGkFqd7/xvXbQP4pKJ9aJtaqYFsUcLs7zZS72hvbJqS9fAXv+r2z5z3SkhF5Wtp3U
	xja4toKtbOijPh5joUbuRLIkqk8NOhy3yPfr/UaUkpMLWcn0xYT3VvYuGl1FSWr53Ylv
	MuQQ==
X-Gm-Message-State: AHQUAub7XJxNP+O3sQSLTTXb+lDRfEmNMOhhWW9zdtq7jeMPDbibFIzx
	WEgziKC8Trq73ZjQtfvBiD6dyqL7LoaMLUk7D+8=
X-Google-Smtp-Source: AHgI3IaSnjLE3VjIjhPePHUk/G36r+sQooMv5Fuui1PpFyZQyQyXXzFmeSEH33Ik9iJFFpE3V/TmBMzLAZE4KJCV9rQ=
X-Received: by 2002:aca:c3cb:: with SMTP id t194mr2380553oif.70.1550841183712; 
	Fri, 22 Feb 2019 05:13:03 -0800 (PST)
MIME-Version: 1.0
References: <20190220201026.70803-1-alex.kanavin@gmail.com>
	<20190220201026.70803-3-alex.kanavin@gmail.com>
	<CAJTo0LYeVyh0tE+zuUCpzqNLYJG9A+7pQ-nZURxDnBAeLAMMmw@mail.gmail.com>
In-Reply-To: <CAJTo0LYeVyh0tE+zuUCpzqNLYJG9A+7pQ-nZURxDnBAeLAMMmw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 22 Feb 2019 14:12:52 +0100
Message-ID: <CANNYZj_W9Qf_BDOE24+xKWZE0zbQ-aHe8oAie93wC-fXWDQoXw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] gdk-pixbuf: convert from autotools to meson
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
X-List-Received-Date: Fri, 22 Feb 2019 13:13:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 22 Feb 2019 at 11:18, Burton, Ross <ross.burton@intel.com> wrote:
>
> On Wed, 20 Feb 2019 at 20:11, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> > -PACKAGECONFIG[x11] = "--with-x11,--without-x11,virtual/libx11"
> > +PACKAGECONFIG[x11] = ",,virtual/libx11"
>
> https://gitlab.gnome.org/GNOME/gdk-pixbuf/commit/204082e6a7a404ec7372d78ef7a7890ada595154
> is in 2.36.12.
>
> > +       # Do not install ptests if ptest is not enabled; gdk-pixbuf has no configuration option for this
> > +       if [ "${PTEST_ENABLED}" != "1" ]; then
> > +               rm -rf ${D}${datadir}/installed-tests
> > +       fi
>
> https://gitlab.gnome.org/GNOME/gdk-pixbuf/commit/4c76635e1f19c6d1919d4ea94f6b00f97b996665
> is in 2.38.0.
>
> Last minute upgrade or cherry-pick those?

I've done the upgrade, will send it as a separate patch. It wasn't trivial:
http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=akanavin/package-version-updates&id=447725a8d54dc21643c04d798a47fc45d54b5afb

Alex

