Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id 184797F921
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2019 15:53:24 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id m5so13063692vsj.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2019 07:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1d3jj/CUS3lZPEUHo55FiyZfkPHy0JMu9/X9XRPINL0=;
	b=Omy48ElK7fqN0/ltTHuYnRn7Gb3nuNcMtmj7GPTBLwLDZGrTcYBmIJIDxYB4t+7Jt7
	GGRWfrmMY+hzlHRT3GnrIvDGM38qjz0b7Uu6osu9I+i+VM1mJLch9bcYWAh+877c2pTe
	TBuQVJHReBSiL2ka8GSjAAorP3caakxkpfkRfxKYcsCN3uiXfFCdh9FXfEx/kvIxYegf
	4Z3JS9BUsLEPTrLc7WAYuozOM+B8nBcKsyBVjBz7R7uOWrYBclVRYWrNuIC23Hv77sH8
	NY/mXl6pWIeLu4cX8qAgqOcPnSPXoVMRjTnOAHWj+7LB9swypTtVvMugdilNC6U9apSH
	EDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1d3jj/CUS3lZPEUHo55FiyZfkPHy0JMu9/X9XRPINL0=;
	b=JkHrbmjp+DMiBGi73zwqwkOhW7oAW8Q9aImA+tGP+IcQd20Gfu8nvbEgYtbwx0CyoU
	WrSw1dNiTNTQ79l4e3LER45adgttr4TtVn5vnzVxL1eAKa7mSTUTLHtl99aKBo8sGSAQ
	8Emqu677HL/XtohVo/VhU3jA79AqNB3PmRT0hO6GayVdOo+NQRR0Wc052EF2NHnUr7kx
	+mhUjROLGt5GA2TS9qyDeSl36DZEzqYtRHrqMUgSleB9EyIB3DnbAr9EYtHRy32znsNx
	BNp0pf52tcBJR5a3m3R7zab+ZGEQgkRoW83lhng+kXQjO96dwVVq7bZXGC3yUROQQY2x
	cUGw==
X-Gm-Message-State: APjAAAXebcZ/9Ab5AMTBWLV4sA8gEXOZ1vuAO+MGm7X/dLEF6iQhL67e
	T6+UHSQ0vU58/hI/NNzhR1xEWJmpkpHzHzELTNg=
X-Google-Smtp-Source: APXvYqxjjqPOMHNMKLQpY792osgZGvIIYfRILKq+U/VEC0woBfKo1raIdQbyhyNhDIITIroNTf2l9PWBCiKDVMrjyp8=
X-Received: by 2002:a67:efd2:: with SMTP id s18mr29217102vsp.94.1574956405872; 
	Thu, 28 Nov 2019 07:53:25 -0800 (PST)
MIME-Version: 1.0
References: <20191127164003.115980-1-alex.kanavin@gmail.com>
	<20191127164003.115980-13-alex.kanavin@gmail.com>
	<99022154-a793-98d3-69a0-6b446fe56b92@gmail.com>
	<CAMKF1spivuUbg=6x9iwaniCgqLHkTzm67u-HEkhfrAw6oZ9GQA@mail.gmail.com>
In-Reply-To: <CAMKF1spivuUbg=6x9iwaniCgqLHkTzm67u-HEkhfrAw6oZ9GQA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 28 Nov 2019 16:53:14 +0100
Message-ID: <CANNYZj8MSvYJ815JhvMhYUjTqizTqWbiQ7ry6gyjGuU-Jfqm=Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/14] flex: update to 2.6.4
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
X-List-Received-Date: Thu, 28 Nov 2019 15:53:25 -0000
Content-Type: multipart/alternative; boundary="0000000000001bde6505986a1d29"

--0000000000001bde6505986a1d29
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Nov 2019 at 16:27, Khem Raj <raj.khem@gmail.com> wrote:

> mostly due to configure time confusion of detecting reallocarray since
> the host is debian9 which
> should be running glibc 2.24 which is older than when reallocarray was
> introduced but actually
> nativesdk package would use nativesdk-glibc that OE builds, one option
> to explore is can be disable
> use of this function. what do we lose if we do
>

It's slightly trickier, target flex builds a native binary (for the purpose
of running it during build), and that's where reallocarray detection breaks
down, because it was detected with a target compiler!

flex remains fully functional if it's disabled, so that's what I'll do.

Alex

--0000000000001bde6505986a1d29
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 28 Nov 2019 at 16:27, Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<b=
r></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">mostly due to configure time confusion of detecting reallocarray=
 since<br>
the host is debian9 which<br>
should be running glibc 2.24 which is older than when reallocarray was<br>
introduced but actually<br>
nativesdk package would use nativesdk-glibc that OE builds, one option<br>
to explore is can be disable<br>
use of this function. what do we lose if we do<br></blockquote><div><br></d=
iv><div>It&#39;s slightly trickier, target flex builds a native binary (for=
 the purpose of running it during build), and that&#39;s where reallocarray=
 detection breaks down, because it was detected with a target compiler! <br=
></div><div><br></div><div>flex remains fully functional if it&#39;s disabl=
ed, so that&#39;s what I&#39;ll do.</div><div><br></div><div>Alex<br></div>=
</div></div>

--0000000000001bde6505986a1d29--
