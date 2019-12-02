Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
	[209.85.217.48])
	by mail.openembedded.org (Postfix) with ESMTP id AD72F6D4B6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2019 11:43:54 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id y13so11611187vsd.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Dec 2019 03:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EeH7aRzYSoNaxY6ly9OMJ5bL2ptrSmx0EX5Q+p7M0TM=;
	b=KTUKg9WNpJiB0HWfNOrXKXI2PAqc9Md2vQjht0gSRQgbGuw2k+PLsoRmgzclXoFGEu
	joMQJMqgOLhY90YdDFIVktiRPvd9YXD/ezEpRJaeWgynvctAOzsEiWTiW78qb0IB8io4
	4kmtGcJUd2SiKgM9yc08u0lIZb/RJ6o+F/LvQJZc8Hq0W9fVoBs2zs2FKpcldQC9GF/X
	xuES0aBwTU3QZQo20TgQn+DeybObByZaIohMwhygtFBiC6TbIK8xl4b/6v3FeXZvVvuu
	4LKSvHg+Ik0/FeBKQnFypB13QG2ndlLpp1bE7P/rd3YrOXTPNUrae1IWhyMwrvW/oXGQ
	MHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EeH7aRzYSoNaxY6ly9OMJ5bL2ptrSmx0EX5Q+p7M0TM=;
	b=cziTX7JAS9MuYwJ714fZ8Lkc94DpLWUwrHA0+wYSbkvPWy8hqdFVDOk4ZthPCXY56O
	55c2Ov+lvSjFDKGw1MBYjuvgrQkhAdP5OSwWZT1jxBgmdIbEn8/ZvaJhmcDD+bLHblfh
	wERZ3QCkK72K71LzcAtG55AfltABL7i3RzYCgZRt2drEMrMwe6tOwWXuK4mFqoatOX3Z
	V/XqUEhs/UNCWxPbYuq8tqhAqRuexg/3TRx6C2RAJs9HLBkkF4gBiU12vv3MUhOY7XsA
	m3NK2yY3IHFr+Wsy7iXhHtLd6cxR5AGM9nslRW4t0TNNGYAefmMsJtulATJQerLFYZuH
	/ypw==
X-Gm-Message-State: APjAAAWbJEuQuRgyj6ozVhVt+K7l2roEt3f463mANDmNWQiWRRXPScHX
	wGGE6Xo62xOX8nh4QRF6YGWrzXwcVTVz3Sgf/3E=
X-Google-Smtp-Source: APXvYqxIqCSKpN+04Oq7xyoiRxnfVemVvF6u2QvrWKspmL+tWt6ZZ3rZcYygzrvSztn3pmTYVlxjoH70dGIH5QcRCc8=
X-Received: by 2002:a05:6102:21d8:: with SMTP id
	r24mr15440083vsg.83.1575287035464; 
	Mon, 02 Dec 2019 03:43:55 -0800 (PST)
MIME-Version: 1.0
References: <20191129131152.128311-1-alex.kanavin@gmail.com>
	<20191129131152.128311-15-alex.kanavin@gmail.com>
	<54364ceb-4a85-8912-134b-8880eecccabb@intel.com>
	<ce46910c-b481-f7a8-9f41-b8a4a745644f@intel.com>
	<82467efe-623f-4442-586e-d054d86b96db@intel.com>
In-Reply-To: <82467efe-623f-4442-586e-d054d86b96db@intel.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 2 Dec 2019 12:43:44 +0100
Message-ID: <CANNYZj-OY0TOBy5fKS5AyaS=3HGLATjprR-V7q2wq4cgfoFwxQ@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 15/15] python3: update to 3.8.0
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
X-List-Received-Date: Mon, 02 Dec 2019 11:43:55 -0000
Content-Type: multipart/alternative; boundary="0000000000002b10000598b71825"

--0000000000002b10000598b71825
Content-Type: text/plain; charset="UTF-8"

On Fri, 29 Nov 2019 at 23:56, Ross Burton <ross.burton@intel.com> wrote:

> Ah,
>
> packages/corei7-64-poky-linux/python3/libpython3: PKG changed from
> libpython3.7m1.0 to libpython3.8-1.0
>
> Maybe remove the m from python3dir.bbclass?
>

Yes, I've done this in the newer version of the patch.

Alex

--0000000000002b10000598b71825
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Fri, 29 Nov 2019 at 23:56, Ross Burton &lt;<a href=3D"mailto:ross=
.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">Ah,<br>
<br>
packages/corei7-64-poky-linux/python3/libpython3: PKG changed from <br>
libpython3.7m1.0 to libpython3.8-1.0<br>
<br>
Maybe remove the m from python3dir.bbclass?<br></blockquote><div><br></div>=
<div>Yes, I&#39;ve done this in the newer version of the patch.</div><div><=
br></div><div>Alex<br></div></div></div>

--0000000000002b10000598b71825--
