Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2293E763BE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 19:06:03 +0000 (UTC)
Received: by qkfj126 with SMTP id j126so18710392qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 12:06:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=eGFI1vXnM3Z92HuLUiYuDs4VtKCqAHFANER4Rh5t7Dc=;
	b=BWmwPwK8mY42AjC8plAU7cZ9hbRO/2EyQQOzyKxVnn58kNROZENzWdSlqB32K/K+SG
	KSjlquCowLUFbwR3C0dxzcs3NQPL4Kz1ijIGLY3+Y11EIB9RlsviNycs94eI/8/buoLr
	G9dzyv0Gs4AObpEhOpCahqF8ZXtclYUXeACsHHIwkEwjBkLzhSPdWNsbo/a52BvHWDOO
	N7jxYnV+coDFCuARpk6hU/wrgaOGljf8UcdE8+q84hgkYQME7CAxQ9oqAWEY771oMFMo
	+pEfFCJyLYlij19VZYg7ebYpCdKm8W0AAIMJc9vBuo4B9tTZyzVqC0LGIrVswBajlSK9
	sEfg==
X-Gm-Message-State: ALoCoQkGTdI/08lWO7dsAPDqVX6uyY9Lp84t1qAZPQrO3GytN3bMK/Q4eQMSDfGU6/9ARek/KnBZ
X-Received: by 10.55.20.207 with SMTP id 76mr42833183qku.67.1439492763385;
	Thu, 13 Aug 2015 12:06:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Thu, 13 Aug 2015 12:05:44 -0700 (PDT)
In-Reply-To: <757e0230b801d19350e30523d62ac9b963c542bf.1439456090.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1439456090.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<757e0230b801d19350e30523d62ac9b963c542bf.1439456090.git.leonardo.sandoval.gonzalez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Aug 2015 20:05:44 +0100
Message-ID: <CAJTo0LbpYSNWZ39Vik4U8eT-+B+tg4-RpY+0nsDphLA5a-wOQA@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] package_deb.bbclass: Handle exception when encoding non-ASCII characters
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
X-List-Received-Date: Thu, 13 Aug 2015 19:06:05 -0000
Content-Type: multipart/alternative; boundary=001a11400532d19e60051d3606de

--001a11400532d19e60051d3606de
Content-Type: text/plain; charset=UTF-8

On 13 August 2015 at 09:58, <leonardo.sandoval.gonzalez@linux.intel.com>
wrote:

> On package creation, handle exception when encoding non-ASCII characteres.
>

Debian control files are defined to be UTF-8, so the use of an ASCII
encoding method is wrong (
https://www.debian.org/doc/debian-policy/ch-controlfields.html).

(RPM appears to assume UTF-8 too)

Ross

--001a11400532d19e60051d3606de
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 August 2015 at 09:58,  <span dir=3D"ltr">&lt;<a href=3D"mailto:leonar=
do.sandoval.gonzalez@linux.intel.com" target=3D"_blank">leonardo.sandoval.g=
onzalez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div id=3D":ti" class=3D"a3s" style=3D"overflow:hidden">On package cre=
ation, handle exception when encoding non-ASCII characteres.<br></div></blo=
ckquote></div><br>Debian control files are defined to be UTF-8, so the use =
of an ASCII encoding method is wrong (<a href=3D"https://www.debian.org/doc=
/debian-policy/ch-controlfields.html">https://www.debian.org/doc/debian-pol=
icy/ch-controlfields.html</a>).</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">(RPM appears to assume UTF-8 too)</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11400532d19e60051d3606de--
