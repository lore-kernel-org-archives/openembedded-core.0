Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9D93A605FF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 14:02:51 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id n190so131961497iof.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Mar 2016 06:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xoBRq4mLOoweEmZOfegm01Tv5UIqNZENl+wHfmO7QHI=;
	b=my0m/WXE+4uw/FUgi2rTl2jHgFUCLyqONXPmeSAmAHedQifxvCKjJb98mW4jpbwh4V
	g5Q6ltAUFPn0wY3UWx3R38Le2gxU0Fav65fblTBGVoDTGtO3QOP3TbtS587I4nK+eWBj
	SyGx3UjVn2kfdUsQJzkXZRh4mUm6/a3Lt+97mRD6z3SDjMdl1DiiNVOje0cqiUIA5H3M
	fNE4b3K+F73Fm39ViLA6R1lXvShFmyCszQ9Vr8P5OYJmL7iEynhnSBkFM0uv5PjZYzmD
	VOxPlr/nDXVeKgLIesH0lIIVyKtqLlutSIbJF2yoDVQnxssIPDJOWKV5u5KlL4mbySYR
	pmWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xoBRq4mLOoweEmZOfegm01Tv5UIqNZENl+wHfmO7QHI=;
	b=dK5I52BbfVCUuidARpzhbEyom4rI3f78zViaQNKwBZAJulLyYCx5kbr1d1GG3U/TWY
	yo7tE9eWLrFWxLac3AIYScfbJ7VNoUB9bJwl7gzQvB0WTzpixrUWoRVolPmUyaSyYtkE
	hRJrambgFaVV8eA2J911ilKQ61RofDas5QcHVXYcm9R77w/4ocY8qUQrCWNRvw1uShXC
	xn7DAf/2Z/Hw7ah2CRUFROLZAglQclfulrNgMF9Hes63caB9sZFrEX4ZgpBigS1KUmzP
	u70hiHAamU53k0DDnWxYtbxbQFoqPD8juI/1hXL+igrVruY2Ef5WYfZtgJgQ/1dbfi4u
	DrIA==
X-Gm-Message-State: AD7BkJID5RnOKhencto8j8bCxZwR10RdygfOAhIbsH1Ny6VwdaQ3notgogT2eNzYhpuauvBqe2xlaZYDDHSB1J0v
X-Received: by 10.107.16.19 with SMTP id y19mr7414033ioi.148.1457359371967;
	Mon, 07 Mar 2016 06:02:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 7 Mar 2016 06:02:32 -0800 (PST)
In-Reply-To: <1456863137-7388-1-git-send-email-johannes.pointner@gmail.com>
References: <1456863137-7388-1-git-send-email-johannes.pointner@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Mar 2016 14:02:32 +0000
Message-ID: <CAJTo0LZ_rMH3zn+uox0D0tBw+T74xbkNzdvCoR3CCwpo1SnZpg@mail.gmail.com>
To: Johannes Pointner <h4nn35.work@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Patch][jethro] xf86-video-modesetting: Require sufficiently new libdrm
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
X-List-Received-Date: Mon, 07 Mar 2016 14:02:51 -0000
Content-Type: multipart/alternative; boundary=001a113fd1eaad2cf8052d75eb83

--001a113fd1eaad2cf8052d75eb83
Content-Type: text/plain; charset=UTF-8

On 1 March 2016 at 20:12, Johannes Pointner <h4nn35.work@gmail.com> wrote:

> This fixes the check of the libdrm version in the configure script.
>

For patches to stable branches please explain why this isn't also required
to be applied to master.

Ross

--001a113fd1eaad2cf8052d75eb83
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 March 2016 at 20:12, Johannes Pointner <span dir=3D"ltr">&lt;<a href=
=3D"mailto:h4nn35.work@gmail.com" target=3D"_blank">h4nn35.work@gmail.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1ns" cla=
ss=3D"a3s" style=3D"overflow:hidden">This fixes the check of the libdrm ver=
sion in the configure script.<br></div></blockquote></div><br>For patches t=
o stable branches please explain why this isn&#39;t also required to be app=
lied to master. =C2=A0</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a113fd1eaad2cf8052d75eb83--
