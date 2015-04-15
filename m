Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 513666AC1E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 16:00:48 +0000 (UTC)
Received: by qkhg7 with SMTP id g7so90343564qkh.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 09:00:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=pvRP5Yv5qDP8vBAxaExtEJvvrmypK36Wh7lpFZreJ4E=;
	b=PZ4H4yDCEgQXVSawIIMAdbEhM6Mgid5IR4Fg6fycU6YXdLaYr5vXWCbxXPQkQvdXau
	iaaLcABBDK5xjxLzWyazB6r+t0w0aB4bp0i6nDSXhZ4US8z1d9ageAD6UQV/uvtoPmYn
	hgOpurT9FsQ2pZRVB6fmhnYdNqYX46gkaJ+WQkA1pD/lIHc8FJN2+wUDst5x4rU0VPzy
	En4SgUTuJtnJ6rtReoZD2a+vyRFSWpUt3pSTQJNT8ZbyiUMjCQHA8unjqzup83BEZFy8
	ZGvZXLQqBqW8U6xeAQrVJIKIqJ5f4LCWbtSh0Fv7QmVzkgnYtG8KRllFVpnbDAleWRDd
	w0bA==
X-Gm-Message-State: ALoCoQnbyFMsdCyyqP7GqT2XLbddVRsflAVjIqBRK9HtYAN8QMz3Y10NOGxJ9SxDtxS+vMhtLUDQ
X-Received: by 10.140.216.5 with SMTP id m5mr15437334qhb.52.1429113628550;
	Wed, 15 Apr 2015 09:00:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 15 Apr 2015 09:00:08 -0700 (PDT)
In-Reply-To: <552E3BA5.2080608@windriver.com>
References: <cover.1429002519.git.liezhi.yang@windriver.com>
	<9862abd5653d0ccddc5e1a7e805c176877231a77.1429002519.git.liezhi.yang@windriver.com>
	<CALbNGRQJNw3YvjDYVGd2kecM9nAMsamu9yRRfCSjgg+LvkdH=w@mail.gmail.com>
	<CAJTo0LaU5AK6RyN+q6w5B49nqy-9Ox=+ioKtxcF7yh7U6+E-Qg@mail.gmail.com>
	<552DC27E.3060804@windriver.com>
	<CAJTo0LYB+2tqXJj5KbpCSvW8TyPHeoZo78f9UrK0S6Z9X9MfKA@mail.gmail.com>
	<552E2FBF.9030701@windriver.com>
	<CAJTo0LY=ZiJUSD+gTJqqvok8+RyskJKR0BjvJb0pjR97ZSfrcw@mail.gmail.com>
	<552E3BA5.2080608@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 15 Apr 2015 17:00:08 +0100
Message-ID: <CAJTo0Lb4UUm5NQhCOjiRuibkSVLZAsY5m7r3yk3OeY9Eb-=ugA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] libepoxy: DEPENDS on virtual/mesa
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
X-List-Received-Date: Wed, 15 Apr 2015 16:00:49 -0000
Content-Type: multipart/alternative; boundary=001a11354e682c81a90513c57231

--001a11354e682c81a90513c57231
Content-Type: text/plain; charset=UTF-8

On 15 April 2015 at 11:21, Robert Yang <liezhi.yang@windriver.com> wrote:

> AFAIK, libx11 is a must for libepoxy when building on linux host.
>

Which is a problem, so we should fix it.  The code appears to be modular
enough, we just need to add an option to configure.ac so that GLX can be
disabled on Linux hosts.

Ross

--001a11354e682c81a90513c57231
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 April 2015 at 11:21, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4wn" cl=
ass=3D"a3s" style=3D"overflow:hidden">AFAIK, libx11 is a must for libepoxy =
when building on linux host.<br></div></blockquote><div><br></div><div>Whic=
h is a problem, so we should fix it.=C2=A0 The code appears to be modular e=
nough, we just need to add an option to <a href=3D"http://configure.ac">con=
figure.ac</a> so that GLX can be disabled on Linux hosts.</div><div><br></d=
iv><div>Ross=C2=A0</div></div></div></div>

--001a11354e682c81a90513c57231--
