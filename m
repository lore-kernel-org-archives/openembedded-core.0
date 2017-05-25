Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id A38F372F42
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 10:57:33 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id y201so173978554qka.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 03:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zoKFj2oaAc3Z8vgS4BueQD+NgokfPbhiVPQVWCjLo3c=;
	b=FUJajAfpthIMl7nyKc9VfkJy3UplyLtzhRdFN3tO1cfI7/ugdU9D+y7WR0S+5n6FVI
	J2E7JJ0C8utOMc4qrr7QpcAqC/QReg/KJbH/RLuPwRi+gub01mZwZ/BAvDZPzwakOmVM
	tlNcPELoeKW4y2+MgolOf383b5RjDX2BweKjFsNod8PR38daxcBR7/Fbxbene8wSxDZ9
	Xjbzy8rKKBTVcbFNPfsbcqj77JofvAOObCk9+/r95cNBZuhtez2KTnb2t0OXn9Pm6xPz
	wiQaM6wqA7jSiYBz7kXkg+PWfI677pPv3nf6ic3ARtxLSFERssb1AR0GdVRtW9PU3bI4
	WzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zoKFj2oaAc3Z8vgS4BueQD+NgokfPbhiVPQVWCjLo3c=;
	b=TtRaIme4grHM8jDr1c7I0bFwyKGqKCqScAYett0U3rTsTEQgDUu2kfjz5NdL4tA5Qs
	akm5kuvle0+JUezUmD9c3kXfNiJHXvkn83/9KbMF9+OjCtFbcOMeUkXnKemmZ9kzbjVY
	maks1owjEIE7l4iUIFwH7Z3+9/zCkUukT62R3VARvc2hdOCb/xgDnHjaN8wNIR9wk5T4
	zxRSIR6GKfKoEVdIR+qYkUp0Wp9jLhRCjQFK8WxtZ3JrhTfb3Cys2jt9bp+mh+Aot2CL
	vEkR9f6TIWx07PC8PJJvAB4XpAf5xSRzypoIxoEEq1ZxOmopS45k92SC/2a4+WdBNU22
	jMoA==
X-Gm-Message-State: AODbwcBCItqVfwAgUll5vA8YflPLffYtkhwx9QVu9XttUDlhwQLHeGwU
	zHO74rTHQ/1MtmpGjrBipi4P5yjhClNW
X-Received: by 10.55.103.82 with SMTP id b79mr34287516qkc.46.1495709854628;
	Thu, 25 May 2017 03:57:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Thu, 25 May 2017 03:57:14 -0700 (PDT)
In-Reply-To: <6a4c8e56-1a13-2710-13db-72c84d04cbaf@windriver.com>
References: <1495704204-228972-1-git-send-email-wenlin.kang@windriver.com>
	<CAJTo0Lb2eEw+mSuVgsJEoqN0L7tBJo9Df2gA4ao6q_BSdenaLw@mail.gmail.com>
	<6a4c8e56-1a13-2710-13db-72c84d04cbaf@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 May 2017 11:57:14 +0100
Message-ID: <CAJTo0LbtZBiPc8DTAQqRaxEcqNM+hEc=ipq4hjCqVd5==Rkpqw@mail.gmail.com>
To: Wenlin Kang <wenlin.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] freetype: Fix some CVE
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
X-List-Received-Date: Thu, 25 May 2017 10:57:34 -0000
Content-Type: multipart/alternative; boundary="94eb2c0555b8929c0e055057166b"

--94eb2c0555b8929c0e055057166b
Content-Type: text/plain; charset="UTF-8"

On 25 May 2017 at 11:08, Wenlin Kang <wenlin.kang@windriver.com> wrote:

> These all have been fixed in the 2.8 release.
>

Please submit an upgrade instead then.

Ross

--94eb2c0555b8929c0e055057166b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 May 2017 at 11:08, Wenlin Kang <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:wenlin.kang@windriver.com" target=3D"_blank">wenlin.kang@windriver.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div text=3D"#000000"=
 bgcolor=3D"#FFFFFF">These all have been fixed in the 2.8 release.<br></div=
></blockquote></div><br>Please submit an upgrade instead then.</div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c0555b8929c0e055057166b--
