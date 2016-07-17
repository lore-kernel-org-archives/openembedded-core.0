Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id 367B7606D0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jul 2016 09:41:48 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id j185so211727961oih.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jul 2016 02:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dOPRcGDMQhJvkgqmcdOPnLO3AEKAt4P5HIhWnfJgcpc=;
	b=G6yryva6SNM7WLxvesZjhIGkhqURFtqNcZtllK1/82VbKQKmkamqjyu93kgcG0hd2Z
	51onKt7hdJ7aLL4j4llIsyFI/2ZmhkES3oW9vwEl23yTTHUyaqQXtamb58qEodHStM1S
	n1ES6J9mz/ep/eOyq4WLWkv+2PD5CvipQ4Np4LQ0ZuFzYlNHfJtzcRg0yzkiDIGKmhRB
	O0pVuVWecuNKL/97B2GkeCDseh78buHIJ3IDkHQ8Q0GV11NWNV7wkZVwWr9+DVF4LQhF
	pGYRMmnyhNHoEUzU8eBQH8GZ5ag97h3OipZEjbOMLvL+GtvK7/cpSBHpUBOV5s1DOUsU
	Frfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dOPRcGDMQhJvkgqmcdOPnLO3AEKAt4P5HIhWnfJgcpc=;
	b=bw2NtEHdM0Y8X2Uk1/OuulpcvvrgIXKvgbCzqj+cbd8hPStdV+gsmWpx8/xMUFFXF6
	EMS4OfgsV/bNFOX5fbV1qRbTQv++5nhVN5rGKuK4Pmcrao343+jlbVjxHxUcFRCuE0u/
	ZJqiI55omUdipO+5jwSaWuHwkSDF6PiYy0hW3rmOB6mP3U56tOkhQlLbvnifESbkMKWe
	UJxBG4u5FCctcz2hkLnZOGZ6Sn3/tu4jTUeryq716uS83V9ipXy/tZga7Q6wBierJS3x
	WhHG+XDJxc7hypUUBaCtJz869ouuHyUguQMcyBTcRI41n9F+HiBBpmwrfaQt7iW8g5qe
	Qxng==
X-Gm-Message-State: ALyK8tI7VQWs9otn9l0Xs4RDe/fulX6nkjHckHuPbuN6qH1SFvV0eWhX7eh+ExP+NgZCz3pPAYt39x4SVKjay67q
X-Received: by 10.202.117.1 with SMTP id q1mr8694698oic.63.1468748509039; Sun,
	17 Jul 2016 02:41:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.199.134 with HTTP; Sun, 17 Jul 2016 02:41:19 -0700 (PDT)
In-Reply-To: <CAJTo0LY+whG89qBDKHYmk8j1q1UJb2oH6Y+8d6=ffNCXHw9HRw@mail.gmail.com>
References: <cover.1468578590.git.jussi.kukkonen@intel.com>
	<8673f0535cc7b0698e4d900b79f06975dd8670c1.1468578590.git.jussi.kukkonen@intel.com>
	<CAJTo0LY+whG89qBDKHYmk8j1q1UJb2oH6Y+8d6=ffNCXHw9HRw@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Sun, 17 Jul 2016 12:41:19 +0300
Message-ID: <CAHiDW_EyU1Xc2ch6__EZRAZd8-9CBcy=-ibTuv95OcSAV8YYhw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/8] mesa: Upgrade 11.2.2 -> 12.0.1
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
X-List-Received-Date: Sun, 17 Jul 2016 09:41:49 -0000
Content-Type: multipart/alternative; boundary=001a11c17e0a2561e50537d1a963

--001a11c17e0a2561e50537d1a963
Content-Type: text/plain; charset=UTF-8

On 16 July 2016 at 22:47, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 15 July 2016 at 11:41, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
>
>> Massive mesa upgrade (OpenGL 4.3, GLVND support, vulkan driver
>> for intel etc), although many new things are disabled by default.
>>
>
> Looks like something changed - likely for the good - and mesa-demos in
> X11-free builds are now failing:
> http://errors.yoctoproject.org/Errors/Details/71162/
>
> Why that was looking for GL.h when X11 should have been disabled I don't
> know...
>

Based on a quick look:
* mesa-demos needs GL/gl.h but the recipe does not depend on virtual/libgl
* for some reason mesa 11.2.2 builds glx even when configured not to
  (--disable-glx used, configure log says "GLX: no", /GL/* headers end up
in sysroot)

So X11-free builds may have been not as X11-free as advertised?

Jussi



> Ross
>
> ---------------------------------------------------------------------
> Intel Corporation (UK) Limited
> Registered No. 1134945 (England)
> Registered Office: Pipers Way, Swindon SN3 1RJ
> VAT No: 860 2173 47
>
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
>

--001a11c17e0a2561e50537d1a963
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
6 July 2016 at 22:47, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:=
ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><=
span class=3D""><br><div class=3D"gmail_quote">On 15 July 2016 at 11:41, Ju=
ssi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"mailto:jussi.kukkonen@intel.c=
om" target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;</span> wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padd=
ing-left:1ex"><div>Massive <span>mesa</span> upgrade (OpenGL 4.3, GLVND sup=
port, vulkan driver<br>
for intel etc), although many new things are disabled by default.<br></div>=
</blockquote></div><br></span>Looks like something changed - likely for the=
 good - and mesa-demos in X11-free builds are now failing: <a href=3D"http:=
//errors.yoctoproject.org/Errors/Details/71162/" target=3D"_blank">http://e=
rrors.yoctoproject.org/Errors/Details/71162/</a></div><div class=3D"gmail_e=
xtra"><br></div><div class=3D"gmail_extra">Why that was looking for GL.h wh=
en X11 should have been disabled I don&#39;t know...</div></div></blockquot=
e><div><br></div><div>Based on a quick look:</div><div>* mesa-demos needs G=
L/gl.h but the recipe does not depend on virtual/libgl</div><div>* for some=
 reason mesa 11.2.2 builds glx even when configured not to</div><div>=C2=A0=
 (--disable-glx used, configure log says &quot;GLX: no&quot;, /GL/* headers=
 end up in sysroot)</div><div><br></div><div>So X11-free builds may have be=
en not as X11-free as advertised?<br></div><div><br></div><div>Jussi</div><=
div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;borde=
r-left-color:rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_extra">Ross</div></div>
<p>---------------------------------------------------------------------<br=
>
Intel Corporation (UK) Limited<br>
Registered No. 1134945 (England)<br>
Registered Office: Pipers Way, Swindon SN3 1RJ<br>
VAT No: 860 2173 47</p>

<p>This e-mail and any attachments may contain confidential material for<br=
>
the sole use of the intended recipient(s). Any review or distribution<br>
by others is strictly prohibited. If you are not the intended<br>
recipient, please contact the sender and delete all copies.</p></blockquote=
></div><br></div></div>

--001a11c17e0a2561e50537d1a963--
