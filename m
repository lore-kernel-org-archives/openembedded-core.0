Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6920E771A6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 16:26:16 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id q83so363041751iod.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 09:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gW98qrE1ijNOoBufqjU07BGsfhxpiqvKC9y9tjneR0g=;
	b=NzL1yhdHQvBviFe7aXvIqEfR5ksOdT7QhbDVUBpz5N5tEThkLtWBOlXyPoLZ82Mt+8
	GV4USjhzbYapvo1/voVlBBTuFy7uHHzzU+oP39xpfIRYPZl6mILEMP8uOcIu+sSIWslT
	2SzQvlbVtpB0+pF49txMYlV2QM2voAmqiGMpZUL5o1uNZ9qA8/qMtbcyU7b1QpJj/MU1
	uxFLksGXhmAVtM/tHhFZoFqrMHDXA24QQnRcY+e9M0YHIbEQx1pYDnHYC0Lu/hcGY/mb
	NjJ2UCdf2JxO7RsZtuFrja7vZnixgFGnJRuZcmvHtfsG/6NpnJ/PSiMeT+U2RXyBEC7w
	FuHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gW98qrE1ijNOoBufqjU07BGsfhxpiqvKC9y9tjneR0g=;
	b=bFL91a624z0JvgXUg3mYM9ZDSb2DLK18Soo0WYYdWbAJRE5ibtC4jenu/xlXtkT4CB
	5FciWzIYZZYcWZ6geI5Y4jC4FzIEwa6GN0QlnITkB5DhD+M7ue+hTD/sEWswEAFvMsYA
	t8iGoS1y7OzGrzzhFiievo6TkY8hnlaIMd1xYycSCBCvu8kfg17MCUljL755EWI7o21n
	Ew5eKmvymhWCjoHRhEIaOKgvbvjkwAn7Ol5C62Ys0zlc5ImjgzlFkmPY8jlny4TxZRte
	r1Q7amEi55OXBLu4vrePHqVUHJkst7m0/8OXoTe4KSyvtSld9ow9l+kUcz1ZKmW63e4y
	r+Sw==
X-Gm-Message-State: AEkoouvM7/MnMl5YEGAqWfQc8MiRFFWyAKGAwOUd9zZG8tijfWRlRL3xvLa7ckC6tgfCa1Xavdx77OlqrD0egKe8
X-Received: by 10.107.154.196 with SMTP id c187mr90451818ioe.99.1470673576872; 
	Mon, 08 Aug 2016 09:26:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 8 Aug 2016 09:25:56 -0700 (PDT)
In-Reply-To: <1470634944-24686-1-git-send-email-mingli.yu@windriver.com>
References: <1470634944-24686-1-git-send-email-mingli.yu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Aug 2016 17:25:56 +0100
Message-ID: <CAJTo0LYsBuuR88vtos5wJv2-rrO-HvDa5c_PcTQ_Oz+Eqg-JVg@mail.gmail.com>
To: Mingli Yu <mingli.yu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tmpfiles.d: don't create the symbol link
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
X-List-Received-Date: Mon, 08 Aug 2016 16:26:16 -0000
Content-Type: multipart/alternative; boundary=001a1140e81e218498053991e052

--001a1140e81e218498053991e052
Content-Type: text/plain; charset=UTF-8

On 8 August 2016 at 06:42, Mingli Yu <mingli.yu@windriver.com> wrote:

> Don't create symbol link for existing file
> /etc/os-release and /etc/localtime exist in our
> system, so remove below two lines in /usr/lib/tmpfiles.d/etc.conf
> L /etc/os-release - - - - ../usr/lib/os-release
> L /etc/localtime - - - - ../usr/share/zoneinfo/UTC
>

What is this solving?  Does systemd error or emit some warnings if the
files already exist?

Ross

--001a1140e81e218498053991e052
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 August 2016 at 06:42, Mingli Yu <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:mingli.yu@windriver.com" target=3D"_blank">mingli.yu@windriver.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":25" class=3D"=
a3s aXjCH m15668ad8aba19e42">Don&#39;t create symbol link for existing file=
<br>
/etc/os-release and /etc/localtime exist in our<br>
system, so remove below two lines in /usr/lib/tmpfiles.d/etc.conf<br>
L /etc/os-release - - - - ../usr/lib/os-release<br>
L /etc/localtime - - - - ../usr/share/zoneinfo/UTC</div></blockquote></div>=
<br>What is this solving?=C2=A0 Does systemd error or emit some warnings if=
 the files already exist?</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">Ross</div></div>

--001a1140e81e218498053991e052--
