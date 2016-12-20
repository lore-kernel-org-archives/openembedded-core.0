Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0BD66772E0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 10:24:10 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id u25so32869767qki.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 02:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wTQ7XY1h+UFrQ/t0S9Mb+dR70xprB5fILL+Gahn+zMc=;
	b=GWKw01mSravGmMoe6op2PsRxCovBcFTt+17qu0fUNzPxBEaGvi50anZ9NjJ3sbqZc0
	3zYCO8n72cX50oJYMnwkP191i9fabHqIajDoL+qdpJIhwFO0xh6iWo8ZXpt3QGh4gqnS
	bgCIWhtRZnIxUUdps2NPgaa1A3943/pQmqa7gE45pIdnI8hCwn/RaIYqp6B+Ch+VixE/
	l5MWBkq6Jhh+00J8ZNCTQDzw7uhtquhbG+Zf/z7r5kJ/sfb40+2IKxMnyj1d58xvoABf
	z9IMwH8ZmKGicFdFxG7TzizgrSy4uo46AUK/zpKafZq1vXHGCsjs6ro9Nf5BYgXI3tFF
	Gd9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wTQ7XY1h+UFrQ/t0S9Mb+dR70xprB5fILL+Gahn+zMc=;
	b=LF7OqWyFQRGbhMHIwRisc4sDLIN9hgGWRBgjFmT7BmOGf+7REkeiiSL9GcCIPBJLk1
	22sb7aVSbolzQAHap/FawvUve/0zY0d9mC+jCdlbC7QpMrM4JzWOGRcOBjirRm/HkfzH
	l0TwTGVzdYQXxGF60eil3g75z/sqCUt/gxA7YQlqa9k78qgoroLlV3bCSGTPyedC7LfV
	6V1qAkTd+xzxrSiRYbMMSsgGSZOuzAZi4Yj8uUsrVWy8UK9uRQJ40Xd+e+kgPUTOIq56
	zfHLBWdv7s7wUHTnAnUPBgU7vxfhQyyf07AdsFobqdnWbF1uzyf1F58WWtN92ETT8dga
	ZHSg==
X-Gm-Message-State: AIkVDXKG0E7XMF60mVIqjO80geuCjlu7YSwKHdcvAMWBfz9jUFG+SM/fT4UTSvgz1a+xhIvfT4um4Wa33XUomGQF
X-Received: by 10.55.106.134 with SMTP id f128mr5244560qkc.121.1482229451614; 
	Tue, 20 Dec 2016 02:24:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 20 Dec 2016 02:23:51 -0800 (PST)
In-Reply-To: <1482080556-4642-1-git-send-email-armccurdy@gmail.com>
References: <1482080556-4642-1-git-send-email-armccurdy@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Dec 2016 10:23:51 +0000
Message-ID: <CAJTo0LanT+4BoWYAoVCrwM5_y0pU1bw_xY8ZGKYHTwiSJ3jH8g@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glew: build for EGL in non-X11 distros
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
X-List-Received-Date: Tue, 20 Dec 2016 10:24:11 -0000
Content-Type: multipart/alternative; boundary=001a114fddf6f087dc0544146fd7

--001a114fddf6f087dc0544146fd7
Content-Type: text/plain; charset=UTF-8

On 18 December 2016 at 17:02, Andre McCurdy <armccurdy@gmail.com> wrote:

> The glew 2.0.0 release added support for building for EGL:
>
>   http://glew.sourceforge.net/log.html
>
> Add PACKAGECONFIG options for 'opengl' (ie the previous default, with
> dependencies on opengl and X11) and 'egl', which depends on EGL only
> and allows glew to be built for non-X11 distros.
>

This failed on the nightly-no-x11 build on the AB:

tmp/linux-egl/default/shared/visualinfo.o: In function `main':
/usr/src/debug/glew/2.0.0-r0/glew-2.0.0/src/visualinfo.c:177: undefined
reference to `glGetString'
/usr/src/debug/glew/2.0.0-r0/glew-2.0.0/src/visualinfo.c:178: undefined
reference to `glGetString'
/usr/src/debug/glew/2.0.0-r0/glew-2.0.0/src/visualinfo.c:179: undefined
reference to `glGetString'
/usr/src/debug/glew/2.0.0-r0/glew-2.0.0/src/visualinfo.c:181: undefined
reference to `glGetString'
collect2: error: ld returned 1 exit status

(which is DISTRO=poky, DISTRO_FEATURES_remove=x11)

Ross

--001a114fddf6f087dc0544146fd7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 December 2016 at 17:02, Andre McCurdy <span dir=3D"ltr">&lt;<a href=
=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);borde=
r-left-style:solid;padding-left:1ex"><div id=3D"gmail-:3ks" class=3D"gmail-=
a3s gmail-aXjCH gmail-m15912e3c58cb7f14">The <span class=3D"gmail-il">glew<=
/span> 2.0.0 release added support for building for EGL:<br>
<br>
=C2=A0 <a href=3D"http://glew.sourceforge.net/log.html" rel=3D"noreferrer" =
target=3D"_blank">http://<span class=3D"gmail-il">glew</span>.sourceforge.n=
et/<wbr>log.html</a><br>
<br>
Add PACKAGECONFIG options for &#39;opengl&#39; (ie the previous default, wi=
th<br>
dependencies on opengl and X11) and &#39;egl&#39;, which depends on EGL onl=
y<br>
and allows <span class=3D"gmail-il">glew</span> to be built for non-X11 dis=
tros.</div></blockquote></div><div class=3D"gmail_extra"><br></div>This fai=
led on the nightly-no-x11 build on the AB:</div><div class=3D"gmail_extra">=
<br>tmp/linux-egl/default/shared/visualinfo.o: In function `main&#39;:<br>/=
usr/src/debug/glew/2.0.0-r0/glew-2.0.0/src/visualinfo.c:177: undefined refe=
rence to `glGetString&#39;<br>/usr/src/debug/glew/2.0.0-r0/glew-2.0.0/src/v=
isualinfo.c:178: undefined reference to `glGetString&#39;<br>/usr/src/debug=
/glew/2.0.0-r0/glew-2.0.0/src/visualinfo.c:179: undefined reference to `glG=
etString&#39;<br>/usr/src/debug/glew/2.0.0-r0/glew-2.0.0/src/visualinfo.c:1=
81: undefined reference to `glGetString&#39;<br>collect2: error: ld returne=
d 1 exit status</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">(which is DISTRO=3Dpoky, DISTRO_FEATURES_remove=3Dx11)</div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114fddf6f087dc0544146fd7--
