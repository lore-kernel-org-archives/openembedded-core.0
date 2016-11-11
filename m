Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 31A7171A8E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 17:33:52 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id n21so27395350qka.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 09:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=b4hmBp5bvoPRuxG+q9ngUF+LotZ5QljCKDLeGQwBOkg=;
	b=xAhko0K7KoIk1WFoT99uM9nNb8H/Jv4HZuXVW7e0hl2vqC25WNRWH8Jmin3Qb3pPYF
	0YEVOQuHch2xOIO9syPOvI6ZC0DFkUl07XH0NI8yz+AVq2JMO2J37Q9arCYkJLtZPaoZ
	AbO2T8OirKwDIEJO5dLAzSAKUUJDnY1VqT6lV9oBNxBDJJCZQLrUf61Zt9OYzDsQi24S
	EJUQeH2ftMTwlZiwtYnIPXJA/upt/8vTdX7qtcRETn+hNQj8jajdbRrDayX5tewx9go8
	IdqEMxFYm/uiuTgBRNtVpLLrWaXsgkIPVA2OBDAv7G7uUe3b/+IUsE36w4YBCvVHFvYX
	u7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=b4hmBp5bvoPRuxG+q9ngUF+LotZ5QljCKDLeGQwBOkg=;
	b=eOa5zGnMstzeI29fBMLLkGXSfGlucwqAPipYBpZFucBRYispP/Bqdp8vUOB6vcNvd+
	cecXjaC4Hcanq3QjDZNGYFFVtVyVnA6GhhtGWza6hyhvM87CCdI5Sbh89AWLQppebXFV
	PshcutB/HNOhD3JwPU9ev9Y3HNZvLAaPce3HTEuPerw7n78uBTMIubxjWNpzTPDxw1Ya
	Iwf1t8lZaDQxkChhLVzAqym0pA3A86ltvHpaYSpPR2BeK8mevzRXq5tVWSQEMLOk9qLd
	uHk8diHDU6VkTHqZKc66sbfxxAyU0tNhaio2+sgJKlNlvnJtd0seEOSHqGLwZVzFRH21
	OYmQ==
X-Gm-Message-State: ABUngveiYDRb+JgswUl1Mz3RW/QmS2Sh7WoZkRnTdY22iIf1xvQ536y+gMwiywox6C7a3MOkKJSYS3teNdphaI3n
X-Received: by 10.55.207.78 with SMTP id e75mr5160111qkj.36.1478885633620;
	Fri, 11 Nov 2016 09:33:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Fri, 11 Nov 2016 09:33:33 -0800 (PST)
In-Reply-To: <be2d8fe9-686b-b174-48a3-f609f36f0969@embed.me.uk>
References: <0e379627-328b-cd37-0310-67a14156d90e@embed.me.uk>
	<CAJTo0LaY5K8gY97hXbLgGkaRNbKGv-DwvLU0H1jt8oSkXg+rug@mail.gmail.com>
	<be2d8fe9-686b-b174-48a3-f609f36f0969@embed.me.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 Nov 2016 17:33:33 +0000
Message-ID: <CAJTo0LZoieB7vWei+fM=3vWzm1j4wgGmvyxE_5X0H-ZYdsZmaw@mail.gmail.com>
To: Jack Mitchell <ml@embed.me.uk>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: libtool --with-libtool-sysroot
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
X-List-Received-Date: Fri, 11 Nov 2016 17:33:53 -0000
Content-Type: multipart/alternative; boundary=001a1145b7b8db3478054109e499

--001a1145b7b8db3478054109e499
Content-Type: text/plain; charset=UTF-8

On 11 November 2016 at 17:31, Jack Mitchell <ml@embed.me.uk> wrote:

> How would one check which libtool was being used, or influence which one
> autotools chooses?
>

One common problem is a makefile or configure using "libtool" directly
instead of $(LIBTOOL).

Grep the generated Makefiles for "libtool", the only instance where it is
executed should be in an assignment to LIBTOOL.  For example, glib:

LIBTOOL = $(top_builddir)/x86_64-poky-linux-libtool

Ross


Ross

--001a1145b7b8db3478054109e499
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 November 2016 at 17:31, Jack Mitchell <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ml@embed.me.uk" target=3D"_blank">ml@embed.me.uk</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-sty=
le:solid;padding-left:1ex"><div id=3D"gmail-:gy" class=3D"gmail-a3s gmail-a=
XjCH gmail-m15854713196c30ba">How would one check which libtool was being u=
sed, or influence which one autotools chooses?<br></div></blockquote></div>=
<br>One common problem is a makefile or configure using &quot;libtool&quot;=
 directly instead of $(LIBTOOL).</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra">Grep the generated Makefiles for &quot;libtool&q=
uot;, the only instance where it is executed should be in an assignment to =
LIBTOOL.=C2=A0 For example, glib:</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">LIBTOOL =3D $(top_builddir)/x86_64-poky-linux-l=
ibtool<br></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra">Ross</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1145b7b8db3478054109e499--
