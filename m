Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5165E73D46
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 23:38:11 +0000 (UTC)
Received: by iofh3 with SMTP id h3so1776588iof.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 15:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=HvXu1+7g4EGXlbjucFmE17WQGpja5TlW9RuH4wcYke4=;
	b=QCFIf2NkwaE70b2AAFaXLoyeWt038jEMB4hL8wWnpghyo6xfOe/P6XfxeRDsg02SSW
	GOe5l327OlGdPicw6KhGcJYr7Yg/f4vuIT+yBllrKMsNNIQxPqPBCapiWom+JNKE9rWu
	KMm7mR/6pJp0n6ER1UpU0SK7fYSRMuLsX+lYUcqj2WpjoYycj2/djXEOMMZFf8FTr/zO
	thw6mzgsvfKH9hhI+Gg00a0S6rWUlY6CQ0gNpAwuYmYShrGblDYWMjG6N/hWx0OW+JH6
	zUvB8qgbtqajU8jVyK8v7/ARWPC/9FMuxN9ghsmWWCdgVKqy3tb58bmauERzEoPKBAZZ
	EH+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=HvXu1+7g4EGXlbjucFmE17WQGpja5TlW9RuH4wcYke4=;
	b=An1GmIAJIv5rcdTEdpFi5R2DTsLJB+b+CMenZk4XLm+fFPI7UgItWZfQLIl1LQn5kB
	JLyzLC83rI0tqQ5JS9xC0bV868e9KnGNGyQFi1RUnS394I5s3Lec4Dx0aT+htHlbpYH4
	O5DyW0eE6pxcPaXnwB/+5J5Son/pQwP9cYUQba++BeUAJt+rld84KgMvhXvSIXnJckwA
	W/6JdslKP//oABkXLVYFyBBMVfvQuzfHhY8bnrHYV2XD+UVlbtozr4UbNlFRFBYflc9n
	YbSmKGAVLIlN7TKwUqdnOlaevlg0JZWYXtlRgFREi7m6CvjiwwEfeTigTFSAS+uCZQNK
	MTSQ==
X-Gm-Message-State: ALoCoQk8DP/iIeId13ISDHv94c+W3O7QvydwJT/BG5PRJbGWEOfipxcCIIx86xtRrs+5mIt80u47
X-Received: by 10.107.3.144 with SMTP id e16mr30587767ioi.99.1447717092095;
	Mon, 16 Nov 2015 15:38:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Mon, 16 Nov 2015 15:37:52 -0800 (PST)
In-Reply-To: <32fd71f16d65e21a1d662ac381784ad59fb9fc6a.1447072488.git.jussi.kukkonen@intel.com>
References: <cover.1447072488.git.jussi.kukkonen@intel.com>
	<32fd71f16d65e21a1d662ac381784ad59fb9fc6a.1447072488.git.jussi.kukkonen@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Nov 2015 23:37:52 +0000
Message-ID: <CAJTo0LYK6tfA5wY=zr0mrRaLF+B2impQGkKgjvf0N5+RFUOQNg@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 3/8] glib-2.0: Enable more tests while cross-compiling
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
X-List-Received-Date: Mon, 16 Nov 2015 23:38:13 -0000
Content-Type: multipart/alternative; boundary=001a113ecf400293840524b0e71d

--001a113ecf400293840524b0e71d
Content-Type: text/plain; charset=UTF-8

On 9 November 2015 at 12:44, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

> +Upstream disables a few tests while cross-compiling because their build
> +requires running other built binaries. This usually makes sense but we
> +have a native glib already built: enable these tests.
>

This broke in glib-2.0-native builds on hosts which didn't have
glib-compile-resources installed so I pulled on a thread and after
improving this patch, disabling the test suite on native builds, and fixing
ptest-gnome.bbclass I think I fixed the build failure three different
ways.  Belt and braces, as they say!

Ross

--001a113ecf400293840524b0e71d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 November 2015 at 12:44, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=
=3D"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2o=
6" class=3D"a3s" style=3D"overflow:hidden">+Upstream disables a few tests w=
hile cross-compiling because their build<br>
+requires running other built binaries. This usually makes sense but we<br>
+have a native <span class=3D"il">glib</span> already built: enable these t=
ests.</div></blockquote></div><br>This broke in glib-2.0-native builds on h=
osts which didn&#39;t have glib-compile-resources installed so I pulled on =
a thread and after improving this patch, disabling the test suite on native=
 builds, and fixing ptest-gnome.bbclass I think I fixed the build failure t=
hree different ways.=C2=A0 Belt and braces, as they say!</div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ecf400293840524b0e71d--
