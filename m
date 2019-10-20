Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id F064E79C7C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2019 15:53:31 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id t18so8814516iog.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2019 08:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=RMxd1wOWEnOO6og66+vidO3flM21BJxmZbmCZfuphIA=;
	b=IPTGwUyg7KqOknyVntvO+6hEs/UCxVA6j1QaGtBIbVMA/08f3/5clZb3TdyzXPXuok
	RwiYT2+jgJJ5hHRIzVTqVb79onCx7Myvl1zpvAeNUBxgrNpimQfAbSgU4oNp2dvH2SpO
	76jJFZnjpQwt4feN35ZXEBv0BhtmFdfYg2nMXb3aOGtYEILzEJDYHVwWbKJRorSnu/TY
	zOWPgl8a95ZLMb7MVJt9gx5tog537IaWbJ+5nW0bawjqMG1orPt6yYV1+DR7NVgg4OjL
	IHbMymILAcEsvhHXunca+OimrEnGVxW7DoGhISLnMwUFJdljBawo/sIXFBZI2Y82vUUy
	Mm5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=RMxd1wOWEnOO6og66+vidO3flM21BJxmZbmCZfuphIA=;
	b=EnIqr8BVi6DxgV0zA4TIkd9EufOiDUjsaZOF3ilrZ0tQe73AULDALZFZnpBO+ZYfkU
	mG3Wx8UVXmY2ArEC31SJyyZP9eaq5BhmTPA6CWVdXh0Hde8R1GZzx/REefBXttqzXk2/
	nUR2Ganj/5zI19htQyneyp5kWMAOJ78oRLdN8cNTVRrDvRwzWJD9lcyiZqkgm/tnJHAG
	fseQkzUmPr+shhcLvSsnVpOyXGSaTbBiJbsz7rGN5hmasP+3KDwFbbdTqIQwRnnrw6xq
	i7yzmhalsgCwPZdiRsWkwSgm2dzESkVI9RKAgwU15+9vvFMppYijguecY/A4ClTZqkFb
	aeFQ==
X-Gm-Message-State: APjAAAXh2CCuuT4kZrq4mk2qCV+1dbHFhhT7aNYW9XxW/JM7HBHBIBrZ
	BWie58GspD338J7MMbYYJlLsHTxMKPBp5JTApOU=
X-Google-Smtp-Source: APXvYqyuj1HcBmUL7XcfDa/FOmZhv4AjHWdx+euQ0Rh1s0F7qcS0jHFHsPPstsB96qITKEDEo8vgR8neOxwC03273Gw=
X-Received: by 2002:a02:704b:: with SMTP id f72mr7434941jac.125.1571586812908; 
	Sun, 20 Oct 2019 08:53:32 -0700 (PDT)
MIME-Version: 1.0
References: <20191011114754.91740-1-alex.kanavin@gmail.com>
	<20191011114754.91740-16-alex.kanavin@gmail.com>
	<dbf128cd95ea3d8017274ea57dda52a72ad727cb.camel@gmail.com>
	<CAMKF1srnabEcWqWYa80uoCe1H=iw-wDPNut4hu4eRwuSQ1HaoQ@mail.gmail.com>
	<CANNYZj8J-wr1V1+aNfbRGyQ+Lk+sofRX4rT1xudaCm67gVev3Q@mail.gmail.com>
	<da2fa30bb8fed7f991ef14a4955a67ec15bc94a6.camel@linuxfoundation.org>
	<CAMKF1sr8xy+bW_UL_=B-nt7MG58bJj=WmB9VVZf5hxBqpXwPiQ@mail.gmail.com>
	<311c58c4bbfdd575f4b0c3123d8f833482f580d1.camel@linuxfoundation.org>
	<CALbNGRR7rL5TcRGiDgjW4-v8UrL7j3tcT86jio8_qTmZ2fBL-Q@mail.gmail.com>
In-Reply-To: <CALbNGRR7rL5TcRGiDgjW4-v8UrL7j3tcT86jio8_qTmZ2fBL-Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sun, 20 Oct 2019 17:53:21 +0200
Message-ID: <CALbNGRQFKf8CEqHpsfLMie=SZ4KBpsZ1kEL+R9kB6kAcE4C_+w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 16/19] meson: update to 0.52.0
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
X-List-Received-Date: Sun, 20 Oct 2019 15:53:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 20, 2019 at 5:08 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Sun, Oct 20, 2019 at 2:32 PM <richard.purdie@linuxfoundation.org> wrot=
e:
> >
> > Feeling suitably responsible for this breakage, I looked into it. The
> > following two patches, one for meson in OE-Core and the other for dconf
> > in meta-oe seem to address the problem. I'm not entirely sure they're
> > correct but they don't actually change the library binary so its
> > probably fine whilst upstream sorts it out.
> >
> > If they look ok to you I'll submit them "properly".
> >
> > Cheers,
> >
> > Richard
> >
> Had exactly the same idea for dconf: in the discussion they did
> link_whole->link_with for libdconf_common which is wrong and was just
> meant as example.
>
> As soon as I finished bisecting do_rootfs issue (reported) I will try
>
> * dconf-patch
> * dconf+meson patch
>
> and report.
>
> Thanks for taking care
>
Had to adjust the dconf-patch:

* Here (and in master-next) we moved dconf 0.32 -> 0.34
* The SRC_URI has to go below inherit gnomebase otherwise it does not
cause effect.

But very important result: dconf-patch only fixes dconf build!

Will send out reworked version to meta-oe list

Andreas

