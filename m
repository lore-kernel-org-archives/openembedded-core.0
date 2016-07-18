Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9D3F96FFED
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 10:46:30 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id j124so27961732ith.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 03:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7EwVfTjK3FoTz9ajfmvJxtOUe7KzwNz2NNrCJLLq9jY=;
	b=WAs3ECwGTe2zLW8xHdJkm+e5DwbqVMxMAZVCeLNf2M1Y9oQL+XrBVVfUZFAR9DqciI
	NvErsdLSYXhrY3T9geauUbodwJ3xYWGYVAejd3FX4YuSpBFCcWOVFZwoJ60dTijuVToN
	W8xBJvzWsuvviXROj5XSZgsdLYe3CepJU956jKOzMKfh4ONJhvG1ledii3HaeqSh+ELl
	qEHjEU6wwEukYwkSZHEfvd2VSsi61XFWBc19aPMtOqoIfrABnL5hoVJ63L+IL/6KNi+f
	R5RdHlvot6+c8Dc0Ma+3Sbl37fkW0RZX8JT74arW/aXJlEBlt/DlIf/4+TtYQ4so83/Z
	fFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7EwVfTjK3FoTz9ajfmvJxtOUe7KzwNz2NNrCJLLq9jY=;
	b=kbEDPiGn5wnw+1dqWwNBQz3fmTnWH3MUO4AtfHOYqJhWjhufCF+VmOWBM/oPLAdBYe
	PlBejt8T1Aq5NwfiDCTzuWW6PDYJ/InxKvFdKo2BwzsJ4v9mngyqSyPEHkwqzNpL9ZT1
	wzm09q1kCdlSjlQQQFNru+2sNo7J+C0Evz2MbO81rUzq8lHKyrjY6foZZtoXJYWmpw4E
	uDM1jAejBqDf+EVz7Q4AI2UorxjDkhzzBGQnyiLVt+LqW7LmePew82qKN9bnsUsJuigo
	iNMXVJNBdGcblzZgB4Ugmz3J9MhucHO3A5QssFHMR3iXY9VGMMwQhQA7Svo4hKMjJ72N
	zmtw==
X-Gm-Message-State: ALyK8tLCPb7c4Z7tIXARzoX/cGbuxx5ZqAPm369M4QVfugNWeWTIJ3X7l0WuKBdqXZLDrvc6mPkAVqZJfmaUG4gf
X-Received: by 10.36.19.75 with SMTP id 72mr3391091itz.83.1468838790802; Mon,
	18 Jul 2016 03:46:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 18 Jul 2016 03:46:11 -0700 (PDT)
In-Reply-To: <1460758958-6882-1-git-send-email-william.c.randle@intel.com>
References: <1460758958-6882-1-git-send-email-william.c.randle@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Jul 2016 11:46:11 +0100
Message-ID: <CAJTo0LbAU0OLpPAJnJy7r4pn4fM+bQn6mTys9QcgBabf8z_ABw@mail.gmail.com>
To: Bill Randle <william.c.randle@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: use OE core paths under /var/volatile for /var/tmp and /var/log
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
X-List-Received-Date: Mon, 18 Jul 2016 10:46:30 -0000
Content-Type: multipart/alternative; boundary=001a1145180a5c26350537e6aef7

--001a1145180a5c26350537e6aef7
Content-Type: text/plain; charset=UTF-8

On 15 April 2016 at 23:22, Bill Randle <william.c.randle@intel.com> wrote:

> +-d /var/log 0755 - - -
> ++# OE Core uses /var/volatile/log rather than /var/log
> ++#d /var/log 0755 - - -
> ++L /var/log - - - - /var/volatile/log


I'm not sure this is right - in the default configuration /var/log and
/var/tmp are symlinks into /var/volatile which is a tmpfs, but that's
basically an implementation detail which a distro is free to change (if
they'd like persistent logs, for example).

Ross

--001a1145180a5c26350537e6aef7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 April 2016 at 23:22, Bill Randle <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:william.c.randle@intel.com" target=3D"_blank">william.c.randle@intel.co=
m</a>&gt;</span> wrote:</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,2=
04);border-left-style:solid;padding-left:1ex"><span style=3D"font-size:13px=
">+-d /var/log 0755 - - -<br></span><span style=3D"font-size:13px">++# OE C=
ore uses /var/</span><span class=3D"" style=3D"font-size:13px">volatile</sp=
an><span style=3D"font-size:13px">/log rather than /var/log<br></span><span=
 style=3D"font-size:13px">++#d /var/log 0755 - - -<br></span><span style=3D=
"font-size:13px">++L /var/log - - - - /var/</span><span class=3D"" style=3D=
"font-size:13px">volatile</span><span style=3D"font-size:13px">/log</span><=
/blockquote><div class=3D"gmail_quote"><span style=3D"font-size:13px"><br><=
/span></div>I&#39;m not sure this is right - in the default configuration /=
var/log and /var/tmp are symlinks into /var/volatile which is a tmpfs, but =
that&#39;s basically an implementation detail which a distro is free to cha=
nge (if they&#39;d like persistent logs, for example).</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1145180a5c26350537e6aef7--
