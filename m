Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id D2B1471993
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 20:08:40 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id w20so175756590qtb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 12:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hpyU5yFytWwawS1CozPB7W6weXEbkZRXt6TBDLo4sJI=;
	b=mmdFa1AHOp0IrpGDWxU5ZdUZEfAqr17pDIbRKrylWCXR1/fEoQFvAWGup+OTD0DYgM
	pb0d0NM2aIIHHoEEZY+WeYrOwciOPFh4PwVSnEeskPIeM+wELNr2+el8qKAKFbi95jrm
	aI0bCJJkWqWMk7YN7SFHHxZzf/OelKfuI/ru5tyZTsvlEAeRskoK3yOxAdANv+h6e6Up
	M+sabLGQ3yr8GRYJJ1Nix5S3ULEGgGBikWYuOi18aE7gq6dWLSs7RAx5DQGutBd2FkdN
	geYs3/J8K9GqkJWRubx12XC9wyyLx7UhkOwtcSL4Po4elKzjs1bqfz+K2KdcX8vMD6Jn
	l5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hpyU5yFytWwawS1CozPB7W6weXEbkZRXt6TBDLo4sJI=;
	b=bnITR+r+xiRJd3cmZYPiekDCYpIChBUZnEoDS2MLLZRYqfttbBYxfmlB5BgEAvTA5x
	iJ4Ykp7L/hgekG/vwur8be0wj/cNJLA/Dru07D/g3QDmdX/tniAYbZgG45U2gmJV2dxR
	i03yIgk+Zyk9o00uCW31GUGoHlAaGbHRvJ8LZn2t5+c/fMBOY8dCS37FFbMkmyrVK/yq
	QhA0dASbJzmJFCNZ2lFPNfIRxci1nNgXjOQecyCeJ9UPwk3iO3vbJIBdDyDrnEYGBmaF
	s8X/Wv5U+P+uu3O/let0lDiHUI6+HZN2NXgoIA+W6xYRw447tCTzw9zxfIDY4CD3YnOW
	iFVw==
X-Gm-Message-State: AIkVDXJd350yoMFngL3IVdvfmFNTvFlTPzud/BYOMCmzasL3otu/L8q+Y/DH9VMfMXiOwT5jhsTPsXNhgXyHSzKl
X-Received: by 10.237.54.1 with SMTP id e1mr26103268qtb.68.1485893320883; Tue,
	31 Jan 2017 12:08:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Tue, 31 Jan 2017 12:08:20 -0800 (PST)
In-Reply-To: <20170131171049.GA3273@jama>
References: <20170131171049.GA3273@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 31 Jan 2017 20:08:20 +0000
Message-ID: <CAJTo0LYxg6dt6bmDg_x2_X4L9GTK5dBzBic7K41=seDNUFts3Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2017-01-31
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
X-List-Received-Date: Tue, 31 Jan 2017 20:08:42 -0000
Content-Type: multipart/alternative; boundary=001a1142dcf090d5970547697fe3

--001a1142dcf090d5970547697fe3
Content-Type: text/plain; charset=UTF-8

On 31 January 2017 at 17:10, Martin Jansa <martin.jansa@gmail.com> wrote:

> There is a lot more failures this time (mostly because of RSS), but
> I wanted to share it anyway, to be clear about the current state of
> other layers.
>

I presume you'll be changing this script as the minimal/maximal build runs
are redundant now that recipe-specific-sysroots has landed?

Ross

--001a1142dcf090d5970547697fe3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 31 January 2017 at 17:10, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"=
mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":50u" class=
=3D"a3s aXjCH m159f582b3a791b09">There is a lot more failures this time (mo=
stly because of RSS), but<br>
I wanted to share it anyway, to be clear about the current state of<br>
other layers.</div></blockquote></div><br>I presume you&#39;ll be changing =
this script as the minimal/maximal build runs are redundant now that recipe=
-specific-sysroots has landed?</div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra">Ross</div></div>

--001a1142dcf090d5970547697fe3--
