Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 59A306AC1E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 08:33:29 +0000 (UTC)
Received: by qku63 with SMTP id 63so70238018qku.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 01:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=YPkOj/3roVE8MkrTZdH2Do54+MY+FZPNCxOnvc9ziGs=;
	b=H5S+stp8w73GfDDXj3KFtf8Xt0DHroT6C5h9j1thPC7LVqXrjrTapWNOC/jUANRV91
	J4whJEnPL/+yQIF1ihI2Gs8YyYy+HtDDftDRkCHMCsxBw7GuuZdSUUbS+eNtTewQKQU3
	4dkf0dmSdZQh3JH632axPpJ5j/VTPJ7gWtG9LPkFz51EZfZOsbbo279gzyTr3pgHd+gg
	znrDZd2Y7EQHsCU4/g6E699ERKTDvf3kJVZVnk+SAAwldhvdjSt3544eqCuBWFwWsB7n
	LfR4a0n/IToz+8TMqZyujiGTnuUbJ3bq+0sPu8bUZRWuONtGUsvX+nliT+dNZsVpIVRw
	aA+Q==
X-Gm-Message-State: ALoCoQkEyqfwyafeU7Uo5oHp0OnUsBl5dB5jaUKSTielOlnw/cZm70W9KeigC0bTG9Zt8BCbWrOA
X-Received: by 10.140.149.147 with SMTP id 141mr14567915qhv.17.1429086782989; 
	Wed, 15 Apr 2015 01:33:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 15 Apr 2015 01:32:42 -0700 (PDT)
In-Reply-To: <552DC27E.3060804@windriver.com>
References: <cover.1429002519.git.liezhi.yang@windriver.com>
	<9862abd5653d0ccddc5e1a7e805c176877231a77.1429002519.git.liezhi.yang@windriver.com>
	<CALbNGRQJNw3YvjDYVGd2kecM9nAMsamu9yRRfCSjgg+LvkdH=w@mail.gmail.com>
	<CAJTo0LaU5AK6RyN+q6w5B49nqy-9Ox=+ioKtxcF7yh7U6+E-Qg@mail.gmail.com>
	<552DC27E.3060804@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 15 Apr 2015 09:32:42 +0100
Message-ID: <CAJTo0LYB+2tqXJj5KbpCSvW8TyPHeoZo78f9UrK0S6Z9X9MfKA@mail.gmail.com>
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
X-List-Received-Date: Wed, 15 Apr 2015 08:33:32 -0000
Content-Type: multipart/alternative; boundary=001a113768160dd9670513bf3289

--001a113768160dd9670513bf3289
Content-Type: text/plain; charset=UTF-8

On 15 April 2015 at 02:44, Robert Yang <liezhi.yang@windriver.com> wrote:

> virtual/mesa or virtual/egl depends on virtual/libx11, so I didn't add
> virtual/libx11, I updated virtual/mesa -> virtual/egl in the repo.
>

That's not strictly true.  Mesa depends on libx11 if it's enabled, but EGL
doesn't.  This should be an explicit dependency, and we need to be able to
control X11 enabled/disabled as otherwise we've lost the ability to ship
GTK+ without X11.

Ross

--001a113768160dd9670513bf3289
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 April 2015 at 02:44, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":454" cl=
ass=3D"a3s" style=3D"overflow:hidden">virtual/mesa or virtual/egl depends o=
n virtual/libx11, so I didn&#39;t add<br>
virtual/libx11, I updated virtual/mesa -&gt; virtual/egl in the repo.<br></=
div></blockquote></div><br>That&#39;s not strictly true.=C2=A0 Mesa depends=
 on libx11 if it&#39;s enabled, but EGL doesn&#39;t.=C2=A0 This should be a=
n explicit dependency, and we need to be able to control X11 enabled/disabl=
ed as otherwise we&#39;ve lost the ability to ship GTK+ without X11.</div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></=
div>

--001a113768160dd9670513bf3289--
