Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 9E0386AC12
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 12:20:50 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id z60so6875948qgd.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Feb 2015 04:20:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=aiGgCVqERbOZPJcHpw8ItqzxOEB8nBXUYL6Qjn/H1f4=;
	b=SdIfrp7nP8kLJ2/Al6Y+z5z7/gfC28XdJLIy7nvfSpp/iLiwjRE9b0vdhhRRdx9txw
	v6LzZ8hHWS/BlvNwt22db7TcZse3fr/zD0s57hPSmVbAbHz4njctbSLjqs5cz6pPKj8v
	GXWlAXHdAhu8zFOTn8+vYkZEsPb75Ep143zxu3hQKbf+pBBJUCxuzivAtxxMeCSs9+tP
	FxRNJW0I/GhoJ3EAgejJd+ZqaWJi5X2+yxST/EY6GoNGNwtsQzY+bjQy39BGF7Xlp9lG
	/xSz+C1i47+bvou7F+uL7ME21mMlz/S0Uj8jB8m5UgpJQBZJ+jpzMAwnc1WLWIGIKp2x
	LHfQ==
X-Gm-Message-State: ALoCoQkdnZ9H5kzIbJozeYu+Mk6Rc6k0LSWlZH3Qc7hf8SyGhpqc2nousgfZ7yY8w2UkpPLHSaD2
X-Received: by 10.229.51.201 with SMTP id e9mr7616781qcg.4.1423225251260; Fri,
	06 Feb 2015 04:20:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Fri, 6 Feb 2015 04:20:31 -0800 (PST)
In-Reply-To: <1422850757-1371-2-git-send-email-raj.khem@gmail.com>
References: <1422850757-1371-1-git-send-email-raj.khem@gmail.com>
	<1422850757-1371-2-git-send-email-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 6 Feb 2015 12:20:31 +0000
Message-ID: <CAJTo0Lb6YR8Sv+EYTJKhFeR5XhRq3b=rhuTyfbUfvg4mj7EmHA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] systemd: Upgrade 216 -> 218
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
X-List-Received-Date: Fri, 06 Feb 2015 12:20:51 -0000
Content-Type: multipart/alternative; boundary=089e0168133e89819c050e6a7342

--089e0168133e89819c050e6a7342
Content-Type: text/plain; charset=UTF-8

On 2 February 2015 at 04:19, Khem Raj <raj.khem@gmail.com> wrote:

> -                 ac_cv_path_KILL=${base_bindir}/kill \
>

The configure script still looks for kill, so why did you delete this
assignment?

Ross

--089e0168133e89819c050e6a7342
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 February 2015 at 04:19, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":6f5" class=3D"a3s" sty=
le=3D"overflow:hidden">-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0ac_cv_path_KILL=3D${base_bindir}/kill \<br></div></blockquote>=
</div><br>The configure script still looks for kill, so why did you delete =
this assignment?</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">Ross</div></div>

--089e0168133e89819c050e6a7342--
