Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 4CD18719A8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2016 21:22:09 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id c47so327788556qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2016 13:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=db5YfxquE67DWFn27EpG+GCrNf7ffuD68L4tjaWQfx8=;
	b=1C7TO1ZjYHniQLd3gXlDxv2dLcz+WHbUMfrK+wjg2g1V2Qb/Y48UXoPys3sT+EgTRb
	xwUayxoyxRlNvIy5OH8akX4GDCu1d4Ge9ib04mvgSYJ9ORUiJHnI0f2c/P8IkgCsg76j
	la7Q5eK4Viy7tN0I8I1dafsFlpEFl1W2dfvIWCGqsg5s+kX9ytaSDSEI4xcJ0Xgs2Ru4
	BDn1emcZ6OKAHnsnANhKndvA5Vy6Z2PaQ49piuhRYveovOi95VAsQXyRkjK6hSURSxkG
	BocWHvTLN2eRQZgC1e+LX09ivSQZWEGzsGccWkWKKAh2DMnwzsFl1waOTZ2XpfARjToc
	FxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=db5YfxquE67DWFn27EpG+GCrNf7ffuD68L4tjaWQfx8=;
	b=ia3H1K2wDgGZlfNQluqUjW1Vj4kPfnGl3aCWWh732g/7XCijQeafoe3wa6xF5htahb
	rvQVTOF7IHSExU+RryGqoRFEDliJ0gCiLcJ9PJSzhLD8+h5NPK8eAv5JiUV3peZmRHzh
	amDzv6dMi6j34QwYPhg54ZSPfOd8UsfcW6N+9kT25bGLNXKfs/W0B6xBf3A8MYyzGd1P
	fc6s1wS9uXvKpD5zhQPgt0OYnRt0fEEz3nXsZQ0KXrt2aPSTBzxrtQubWY8XPh0Dfp5D
	dht8KXUCgmGUfkYDNh6tn9z05L3+qyw+lenPXPoyFH/OuHop3rk+4muw1pdN15VyAOlq
	2sAA==
X-Gm-Message-State: AKaTC00FCwwuXhokTQIZsrICIn/uXStd82qXKrTAIIRSkcUiaBol3AdHxyRvpb1pMnL8eZaL4nHMssoXpfer0HWS
X-Received: by 10.237.61.42 with SMTP id g39mr57260697qtf.65.1480972931166;
	Mon, 05 Dec 2016 13:22:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Mon, 5 Dec 2016 13:21:50 -0800 (PST)
In-Reply-To: <20161205163827.21941-1-george.mccollister@gmail.com>
References: <20161205163827.21941-1-george.mccollister@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Dec 2016 21:21:50 +0000
Message-ID: <CAJTo0La_rfxyJRgJgjdknqXAACkqxRB3dgqdyiOv7VCa+z8rFA@mail.gmail.com>
To: George McCollister <george.mccollister@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdb-cross-canadian: Depend on nativesdk-python3-misc
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
X-List-Received-Date: Mon, 05 Dec 2016 21:22:10 -0000
Content-Type: multipart/alternative; boundary=001a1142a3ea7c0b320542efe1b0

--001a1142a3ea7c0b320542efe1b0
Content-Type: text/plain; charset=UTF-8

On 5 December 2016 at 16:38, George McCollister <
george.mccollister@gmail.com> wrote:

> Add missing dependency on nativesdk-python3-misc so the imp Python
> module is installed.
>

So imp is the Python-facing API for 'import', and python-misc is a grab-bag
of random stuff.  Should imp be moved to be in python3-importlib (where its
replacement already lives) or moved into python3-core?

Ross

--001a1142a3ea7c0b320542efe1b0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 December 2016 at 16:38, George McCollister <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:george.mccollister@gmail.com" target=3D"_blank">george.mccolli=
ster@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 id=3D":2rp" class=3D"a3s aXjCH m158cfdae4f2a5c1a">Add missing dependency o=
n nativesdk-python3-misc so the imp Python<br>
module is installed.<br></div></blockquote></div><br>So imp is the Python-f=
acing API for &#39;import&#39;, and python-misc is a grab-bag of random stu=
ff.=C2=A0 Should imp be moved to be in python3-importlib (where its replace=
ment already lives) or moved into python3-core?</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1142a3ea7c0b320542efe1b0--
