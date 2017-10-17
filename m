Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8AFB978299
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 12:33:19 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id p186so2042563ioe.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 05:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WNL1I1nZzVb1PJ1WnMs5/d0Oj1QMewPmclIVXGCc6SQ=;
	b=hxAmVit3EveH/9oOKGMxr7HeldiCH/uieksMQBM+9iKxIt9PXDN39nZFuhJYbxYSyd
	fZB1kBJ/OQBcx1LrgJFp6fFWQU0ckvfWqrxU5w0pUj+HLHBarYjY71kiSwOLBIgiUZEw
	+iCfDtrchX7Lsq9ptW0zJThD4QCKn3maZFZwTAXd4uJMeJtWYY3+8FIjv7Du5ugfMPnF
	XUdAhfdRON7v7gykZ0FGHU5l+2jBvGnTKCqbjrqHOk0Yxxbc6UgFLartpZRATZY0A4TM
	jcAjDKxQ85wQxjatjfPSy76vsDkU3jrKLXFybZ7+Ng/SIhKtMyNjhlKLmg7kJN3EFRUi
	SbMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WNL1I1nZzVb1PJ1WnMs5/d0Oj1QMewPmclIVXGCc6SQ=;
	b=iZ6VAY3NcX6eJXU5bJeG17yzEuIkJdpb/Era+q9NUz9FjiAhOpmInO+uKhcQrm3CMv
	/NZRXsQ67UkfXXGciuuP4BOtgdyA2Ap8I3UyTEOpXeruWLWd25pWmMohuSb6PnIgZc7h
	KDtgxzlhRvK2i27ltVTQZLbX0E4y6fE+s56xoknMCpd1tEEKAOjvUY5n4IlL93dlEzpE
	8df1rW0D028S8WEc57ppDUu3qZQkH+Dz2nNGzCwd8BzhCsGTg0++VJT+IMgis/f6gJcj
	C5zLrBk9t/aau1uHRbqwZxYYvUKDf4MD0iFkcBGE3SqMdlU9wQXTrDKC7d8CUk+iRTL1
	xsDA==
X-Gm-Message-State: AMCzsaVY9FpUQB73cOfni/jh9N88r8kitaBZfMIuLqD0Sz//1CWQiIfn
	dQMUkSxt1JxpgEqRgVgl2gHA+Qh97qu6draBppX4Jg==
X-Google-Smtp-Source: AOwi7QAB5FlHqcuH3zOFU9+JYP+bng851Ii5V65BXGpPoAA8l7U/Vdc/2S9GP0DXfpkh3Pv22oyQl7sReoAFUQ3AkHY=
X-Received: by 10.107.189.129 with SMTP id n123mr17367780iof.48.1508243600656; 
	Tue, 17 Oct 2017 05:33:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.176.10 with HTTP; Tue, 17 Oct 2017 05:33:00 -0700 (PDT)
In-Reply-To: <20171014154858.35123-5-raj.khem@gmail.com>
References: <20171014154858.35123-1-raj.khem@gmail.com>
	<20171014154858.35123-5-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Oct 2017 13:33:00 +0100
Message-ID: <CAJTo0LZYB+FTUBLWaFEeyAz3wYMCnr+gSbySYvz0K4d3RwsvpA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/7] libcheck: Upgrade to 0.11.0+
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
X-List-Received-Date: Tue, 17 Oct 2017 12:33:19 -0000
Content-Type: multipart/alternative; boundary="94eb2c0761c80d735f055bbd5454"

--94eb2c0761c80d735f055bbd5454
Content-Type: text/plain; charset="UTF-8"

On 14 October 2017 at 16:48, Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../libcheck/{libcheck_0.10.0.bb => libcheck_git.bb}          | 11
> ++++++-----
>

Why not 0.11.0?

Ross

--94eb2c0761c80d735f055bbd5454
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 14 October 2017 at 16:48, Khem Raj <span dir=3D"ltr">&l=
t;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.co=
m</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">Signed-off-by: Khem Raj &lt;<a href=3D=
"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../libcheck/{<a href=3D"http://libcheck_0.10.0.bb" rel=3D"noreferrer=
" target=3D"_blank">libcheck_0.10.0.<wbr>bb</a> =3D&gt; <a href=3D"http://l=
ibcheck_git.bb" rel=3D"noreferrer" target=3D"_blank">libcheck_git.bb</a>}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11 ++++++-----<br></blockquote><div><b=
r></div><div>Why not 0.11.0?</div><div><br></div><div>Ross=C2=A0</div></div=
></div></div>

--94eb2c0761c80d735f055bbd5454--
