Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 77EDB607A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 20:29:00 +0000 (UTC)
Received: by qgy5 with SMTP id 5so38324885qgy.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 13:29:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=RmIaFyVjvB8YptpkVOom0GJpi2ql1XDV5Is2rRauxMQ=;
	b=ab1sQwSAleDN5c1tIuAJU2MtjEt2QkGZinJQ/DWQYnt7sBL9eNwBFrSjHtFHd+eQjf
	FI7YxHDPQM4kfmB7DYEq8dM1PtzrpuGC6R5VU1/vQlzDv3M30O5plyZWPtbnOi96SHPr
	Lh4sLWCUSx89vVCETm5iFBhXufM3AAbqkQYQkLPGcBzAPHEOmmUAqDSWsObXkpIL39z0
	l7x68HWujbRdh5TI2SInNDYTKeG3L9f+RiBLbeQw1pg7fBg0m777Jof7LoEPJ0wpEECQ
	Wmq/gkrK8mMj+byD6gmeqWJ7ZD/KT020z4iLCnpm8i+YjdGJJ3Bm7/wMrBtUXsF5HsK9
	6fbg==
X-Gm-Message-State: ALoCoQnAzgNdkx0lbUYqulhyDXcJvmSnNb388kYqe7E6Xw/1HEgG9idHZ6LIoDm4Vo9g4becW7/F
X-Received: by 10.140.20.115 with SMTP id 106mr20100981qgi.87.1437078540751;
	Thu, 16 Jul 2015 13:29:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 16 Jul 2015 13:28:41 -0700 (PDT)
In-Reply-To: <1437009464-31315-1-git-send-email-rongqing.li@windriver.com>
References: <1437009464-31315-1-git-send-email-rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 16 Jul 2015 21:28:41 +0100
Message-ID: <CAJTo0LakEKNqWhot2UKD6+wxECjMzTaLqOGPQD1E43v1NkOvqw@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] weston: fix two building issue
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
X-List-Received-Date: Thu, 16 Jul 2015 20:29:02 -0000
Content-Type: multipart/alternative; boundary=001a11c128b4efae35051b03ebfd

--001a11c128b4efae35051b03ebfd
Content-Type: text/plain; charset=UTF-8

On 16 July 2015 at 02:17, <rongqing.li@windriver.com> wrote:

> 2. create tests dir and ivi-shell to fix the building rule dependency
> issue.
>    sed "..." ivi-shell/weston.ini.in > ivi-shell/weston.ini
>    ivi-shell/weston.ini: No such file or directory
>

I was watching another build happen so quickly fixed this too.   Does
http://lists.freedesktop.org/archives/wayland-devel/2015-July/023468.html
look right?

Ross

--001a11c128b4efae35051b03ebfd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 July 2015 at 02:17,  <span dir=3D"ltr">&lt;<a href=3D"mailto:rongqing=
.li@windriver.com" target=3D"_blank">rongqing.li@windriver.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-=
style:solid;padding-left:1ex"><div id=3D":pq" class=3D"" style=3D"overflow:=
hidden">2. create tests dir and ivi-shell to fix the building rule dependen=
cy issue.<br>
=C2=A0 =C2=A0sed &quot;...&quot; ivi-shell/<a href=3D"http://weston.ini.in"=
 rel=3D"noreferrer" target=3D"_blank"><span class=3D"">weston</span>.ini.in=
</a> &gt; ivi-shell/<span class=3D"">weston</span>.ini<br>
=C2=A0 =C2=A0ivi-shell/<span class=3D"">weston</span>.ini: No such file or =
directory<br></div></blockquote></div><br>I was watching another build happ=
en so quickly fixed this too. =C2=A0 Does=C2=A0<a href=3D"http://lists.free=
desktop.org/archives/wayland-devel/2015-July/023468.html">http://lists.free=
desktop.org/archives/wayland-devel/2015-July/023468.html</a> look right?</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</di=
v></div>

--001a11c128b4efae35051b03ebfd--
