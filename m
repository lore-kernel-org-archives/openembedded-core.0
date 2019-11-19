Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
	[209.85.221.196])
	by mail.openembedded.org (Postfix) with ESMTP id B69687DE5A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 16:46:19 +0000 (UTC)
Received: by mail-vk1-f196.google.com with SMTP id s4so3076096vkk.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 08:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VZ3XK1zHqu0JuMHT/2gQjDKCIo2idatE6x9GSdUhSjw=;
	b=ptrnaXwmwrukHjuaSRqkyRnztKmgiizbY5JrgRwAQtNH9VYf50ni5ioy2qXuYzMHNt
	x/YJ5sJPCEUis3u1jRHPOJMgPLGkn+8xlOWxdG4Z6i9N4FKW8bJ6NDlq9/HC+u7fLtgI
	83PGhziesBnFDqZSS82zfE9z82Gzz6c72T5C+0hdtuAmU43JVHDeLd4rI0lt4JBljR0T
	KzmVUnuprdkSliikGNf979ktexwMoVEsIHz4EULcwW2zTqIogbyxN6f5Eoq1lx8tbpjA
	QqO48ZGb/IVQHw+cX5LFgIWleHIaBWlpLTZiXb6eACgV9JiQgNLFluo7XdzXXECA1OIq
	h/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VZ3XK1zHqu0JuMHT/2gQjDKCIo2idatE6x9GSdUhSjw=;
	b=qXiH0urvUkahs0el8mPW+y/sV4OtFtMU4p3ZxG3r5U9CneLzOD2ozQn4oLDszBkbg9
	oUtkdY3KC5TGdd+tO6FHDuG7oYpA3VvSajZQNtPS0zeFggD58vaZcVW2gSRJ/SZZcqom
	rA8LGy7Ogx8qrxc7Nd46AM2bch/YLBelrY6yjBI3OF4CVLxuBBOfCz/G89S9nsZxOXmd
	l6+dCH8CGv9nmF91wKyETjK6y6sMnjPUCKOMwseommG4mhz90fnvFNu78phbc5rU084g
	gfT1DESgbwpBNJLJ+Kw8fFVT3zGS8uhDO/GepXeLP8y3eALayRiv7Zc5RgdRdBQypA+r
	Vw+g==
X-Gm-Message-State: APjAAAV38zOKT+hLvl/wG3X1zfRusybsgjdlv14bLx0Rxhtgu28zGC1L
	nS4DD2UO+M0F3God8BIybkSqLORXsteEWBeZKLw=
X-Google-Smtp-Source: APXvYqynbSeM97I3GIy8bbiy6THzIgIsXHbE1REbEMwmFrFcRt9q3pPjr5cf3RiYEPuhJGgHvgXeiV3zmg7BzH8yxm8=
X-Received: by 2002:a05:6122:119c:: with SMTP id
	x28mr20999828vkn.9.1574181980372; 
	Tue, 19 Nov 2019 08:46:20 -0800 (PST)
MIME-Version: 1.0
References: <20191118142852.22981-1-alex.kanavin@gmail.com>
	<20191118142852.22981-13-alex.kanavin@gmail.com>
	<CAMKF1srtYneT81UKC0Lcn4U_DgWiWb3Xm11mXL+2i3+yvCE5qg@mail.gmail.com>
	<CANNYZj9rV_qvPV0j7oPwAUw7MCEeVj1NOYXSVGfj_k9w_yEPdQ@mail.gmail.com>
	<CAMKF1spKz9eE6DjDmqHUC_ak0joX4jwrzAVFwDdmKdUtyBVaWA@mail.gmail.com>
	<CANNYZj8A3DhhjHWvL0yQf8JyhSBWmECgJetB1+QeqFPR-4=ZZw@mail.gmail.com>
	<CAMKF1spOt5nU0_VmHpz5FqF3f50x-KrpvkL+wduM1H+CJhGzjQ@mail.gmail.com>
In-Reply-To: <CAMKF1spOt5nU0_VmHpz5FqF3f50x-KrpvkL+wduM1H+CJhGzjQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 19 Nov 2019 17:46:09 +0100
Message-ID: <CANNYZj-g4E=bRw7=m+RG0vZQywD5KdiaLCr=8JDjaBAgjJ5wrw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/13] man-pages: correct the SRC_URI
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
X-List-Received-Date: Tue, 19 Nov 2019 16:46:19 -0000
Content-Type: multipart/alternative; boundary="000000000000c0859f0597b5cdc1"

--000000000000c0859f0597b5cdc1
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Nov 2019 at 17:38, Khem Raj <raj.khem@gmail.com> wrote:

>
> If I was asking you to store the tarball some place in arctic then I would
> understand your concern but in this case I am not able to. can you describe
> why using archive location is not suitable here perhaps that will help me
>

The archive location is missing several latest releases of man-pages, which
are only available from the main location. Which means that we always ship
an out of date version of manpages, and aren't aware (via version check
tooling) that later versions exist.

Alex

--000000000000c0859f0597b5cdc1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 19 Nov 2019 at 17:38, Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div><div class=3D"gmail_quote"><br><div d=
ir=3D"auto">If I was asking you to store the tarball some place in arctic t=
hen I would understand your concern but in this case I am not able to. can =
you describe why using archive location is not suitable here perhaps that w=
ill help me <br></div></div></div></blockquote><div><br></div><div>The arch=
ive location is missing several latest releases of man-pages, which are onl=
y available from the main location. Which means that we always ship an out =
of date version of manpages, and aren&#39;t aware (via version check toolin=
g) that later versions exist.</div><div><br></div><div>Alex<br></div></div>=
</div>

--000000000000c0859f0597b5cdc1--
