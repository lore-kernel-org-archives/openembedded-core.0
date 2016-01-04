Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9B585731C0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 16:50:30 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id o67so439964421iof.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jan 2016 08:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=DB/jFLJktEI8S+dKhcqvVeyGR6fm8zXwZFVs5o5j04o=;
	b=H830ut19bCavlkRfMK+PKdNLaL3dUzPcovpnP02wfD10dkxrRpYl8ObwAdcKzAYNo2
	hymGZHKNdlTBKUoR64s4vUguQReW4TClxrNcf2Ea+A+VGiwUMaBn6q3BcAK8pHi8A36B
	k0zFepXRWI9mus2RW0kcTFs362F2mGrKV1zrrdMnBKjgZkNH6ibkoBM7PfSSl81u5vi7
	yFZGBr1jvC0TBbB+KtO2DMhUZCuddIitRkLk/tsd1L9xY9ayMTHCgyRmldawJqPl8iWK
	xGKQgEgmzybd4E7eHtZtEFnyf7L4W1YI3CiTJ5/FBFXqMLHSVZ2QHkb6ZYDRmmv32qZP
	x6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=DB/jFLJktEI8S+dKhcqvVeyGR6fm8zXwZFVs5o5j04o=;
	b=ZuL8fyi1WxazlymjJSNb6IDpGmNap/lpwajTq0WRMM8e+ANkhL53kAYDJ8jj+h/MnP
	dYwlUrpc1KYmk2eUyMSvWzEzQW+b2OPD/DbafDgOzeOtFU+2MME0hcE/25xIZsoqc0uA
	AOj0rlfGd1ImPtrkfneF7G5HU4y6kdxEetGJ/VoES18K7eZQNcKt5R/7e53WQj9bI6BQ
	pH/YkkliYykmdLsrnHpzwB4HpS7GTZLwWI94yY+EdnogsfAhQMEoFB9hobisDAs69RNy
	HxehDf7MdV1A3x7rsoHFv2qfOWnyBWk9A447dipm5qkmOHYZRA7PCKAQk5T3TFVQtqpo
	en1Q==
X-Gm-Message-State: ALoCoQlWFckEUp37CFNsWITbPbdhsguuV9ET6E+UI7h3hZxRZgsrF9WHDqfeLOQuY8QKrUr8kqn7KhgFEAKXMiVFJ2rwE5T7+/2hgCV3ZV7xtYz3l7R5u54=
X-Received: by 10.107.135.104 with SMTP id j101mr51758277iod.133.1451926231070;
	Mon, 04 Jan 2016 08:50:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 4 Jan 2016 08:50:11 -0800 (PST)
In-Reply-To: <20160104084826.GA4807@ulm-bmuc496424.bmw-carit.de>
References: <CAJTo0LayEjj9moB9xgup=vB+C9Sn2-WX+s97UWRt9tg=HYFnag@mail.gmail.com>
	<20160104084826.GA4807@ulm-bmuc496424.bmw-carit.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 4 Jan 2016 16:50:11 +0000
Message-ID: <CAJTo0LbM6p7BxOXf5bfOVMwRdLDWdYVqJCc5h79euMqfQeoo5g@mail.gmail.com>
To: Clemens Lang <clemens.lang@bmw-carit.de>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Delete all .la files?
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
X-List-Received-Date: Mon, 04 Jan 2016 16:50:30 -0000
Content-Type: multipart/alternative; boundary=001a113ebe923e71b6052884eb97

--001a113ebe923e71b6052884eb97
Content-Type: text/plain; charset=UTF-8

On 4 January 2016 at 08:48, Clemens Lang <clemens.lang@bmw-carit.de> wrote:

> Note that any software using libltdl will still require the .la files
> and must thus opt-out of .la file deletion. ImageMagick is probably the
> most common occurrence of this.
>

The use of modules in imagemagick is disabled by default, so this only
impacts people who change that default (and the wiper will optional).

Ross

--001a113ebe923e71b6052884eb97
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 January 2016 at 08:48, Clemens Lang <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:clemens.lang@bmw-carit.de" target=3D"_blank">clemens.lang@bmw-carit.d=
e</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":87" c=
lass=3D"a3s" style=3D"overflow:hidden">Note that any software using libltdl=
 will still require the .la files<br>
and must thus opt-out of .la file deletion. ImageMagick is probably the<br>
most common occurrence of this.</div></blockquote></div><br>The use of modu=
les in imagemagick is disabled by default, so this only impacts people who =
change that default (and the wiper will optional).</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ebe923e71b6052884eb97--
