Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1EEF965C75
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 11:31:14 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id z107so16862953qgd.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Jan 2015 03:31:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Gc7XyDJ1RT+++Mxe3xhBUePx1/Slp7k+anlbyY/FlYQ=;
	b=bFpDXkyUMS4RLoRzxMh2w6GP4A1BCL62kJuUcoDlUqdnviChnzZOE8w69BJuvcRDqq
	/NIp2PjSeCZ1e2GAl6/2mBRNthHNO5ccsoVM/OYrVqdEKknu8sEPmlQnkfo/HDUrh8JH
	ngrkrBulVHbH6YqB9+GI+sQyb3mYIffu945Mc8K4CE5OnW7fhmyWkIoyvjwSsrNXTEyL
	8iYsW4pVrB5pMKCdcdnsSV1HTn5isMfnPbLPY7iUXIbOvSbX0p7M5Qw7LiJX66l+lBr0
	Ysm8vrJuTMjmPcWRIsv5tO+Aezmubxb2ITDyGlkTXTNN8SBeQ0S0KkNYJtTz1fcp3g8r
	GWNg==
X-Gm-Message-State: ALoCoQnKz5+KaWugvC0HpKMp0Q/Ste1HLp+2QUn4Nr8bN8w7jT79IRzJSg5V4oi9SHPVqBqWAiG7
X-Received: by 10.224.61.6 with SMTP id r6mr71584229qah.22.1420543874601; Tue,
	06 Jan 2015 03:31:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Tue, 6 Jan 2015 03:30:54 -0800 (PST)
In-Reply-To: <1420541668-16699-1-git-send-email-sujith.h@gmail.com>
References: <1420541668-16699-1-git-send-email-sujith.h@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Jan 2015 11:30:54 +0000
Message-ID: <CAJTo0LYHY_MtYU7WPgdoaZwaLOtcZ9uo-209aZwnd4Uv0kLjeg@mail.gmail.com>
To: Sujith H <sujith.h@gmail.com>
Cc: Sujith H <Sujith_Haridasan@mentor.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xserver-xf86-config: Loading glx module
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
X-List-Received-Date: Tue, 06 Jan 2015 11:31:19 -0000
Content-Type: multipart/alternative; boundary=001a11c3e62008a8ec050bfa2590

--001a11c3e62008a8ec050bfa2590
Content-Type: text/plain; charset=UTF-8

On 6 January 2015 at 10:54, Sujith H <sujith.h@gmail.com> wrote:

> +        if
> ${@bb.utils.contains('DISTRO_FEATURES','x11','true','false',d)}; then
>

Why would a X11-specific recipe need an X11 feature check?


> +                cat >> ${D}/${sysconfdir}/X11/xorg.conf << EOF
> +Section "Module"
> +    Load           "glx"
> +EndSection
>

But GLX is automatically loaded by the xserver,  My test machine doesn't
have a xorg.conf and GLX loads on startup.  Does your machine configuration
ship a xorg.conf?

Ross

--001a11c3e62008a8ec050bfa2590
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 January 2015 at 10:54, Sujith H <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:sujith.h@gmail.com" target=3D"_blank">sujith.h@gmail.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div class=3D"">+=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;,&#39;x11&#39;,=
&#39;true&#39;,&#39;false&#39;,d)}; then<br></div></blockquote><div><br></d=
iv><div>Why would a X11-specific recipe need an X11 feature check?</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div class=3D"">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cat &gt;&gt; ${D}/=
${sysconfdir}/X11/xorg.conf &lt;&lt; EOF<br>
+Section &quot;Module&quot;<br>
+=C2=A0 =C2=A0 Load=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;glx&quot;=
<br>
+EndSection</div></blockquote><div><br></div><div>But GLX is automatically =
loaded by the xserver, =C2=A0My test machine doesn&#39;t have a xorg.conf a=
nd GLX loads on startup.=C2=A0 Does your machine configuration ship a xorg.=
conf?</div><div><br></div><div>Ross</div></div></div></div>

--001a11c3e62008a8ec050bfa2590--
