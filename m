Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0E72173D26
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Oct 2015 16:12:40 +0000 (UTC)
Received: by qgez77 with SMTP id z77so179194257qge.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Oct 2015 09:12:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=rUnAfXncGjYj6QJs51XAsieiHpuAxAukrk5+xnBWHM8=;
	b=HEPFbNJxDjYshKVPrRILic53ZopwnPwpNYGh9CcPIdtWvqudT+WbvA3Ba4dJTTmTnO
	9SUchEafbC2ubBctnwv8d0CgodqRnlEu+U2OO2Fr7GFRYYy0UXMNb8sfnh+uTW44d+vC
	D0j30VJUASgFCrZoSx1A0KWk1FiiIe+LPo6GiTP4ebEWoz5ozS4mJ43mentHJmPXLRoP
	W/hrFwr6nRJuY/40kHGRFbU6oqxgjX57tMQi2c3j4poU9tnNCvv6X1z2WQdVlWSaJVX+
	KUZMlSaWeM9d+nN2ewA1fejLQubLkkRMesZE2oYfDwc2OXZdyLtYdhrChUd1xnxE0sRQ
	+E/g==
X-Gm-Message-State: ALoCoQng0mn/eJM52TJjv/GkbZDsSvAn9JAFKEBysqnVuMRGAo/N6fnQZleUiFDFShsuSoH23EmW
X-Received: by 10.140.235.147 with SMTP id g141mr47905321qhc.22.1444147960465; 
	Tue, 06 Oct 2015 09:12:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Tue, 6 Oct 2015 09:12:21 -0700 (PDT)
In-Reply-To: <1444143620-7764-1-git-send-email-clopez@igalia.com>
References: <1444143620-7764-1-git-send-email-clopez@igalia.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Oct 2015 17:12:21 +0100
Message-ID: <CAJTo0LZ9gmfcoOCBLWoBejQ_q6+66UXgPcHv3c=AUE8qOGPWyw@mail.gmail.com>
To: Carlos Alberto Lopez Perez <clopez@igalia.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] machine/qemu: Fix OpenGL/GLX support with xserver-xorg.
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
X-List-Received-Date: Tue, 06 Oct 2015 16:12:41 -0000
Content-Type: multipart/alternative; boundary=001a11376e6e2fe684052171e6c5

--001a11376e6e2fe684052171e6c5
Content-Type: text/plain; charset=UTF-8

On 6 October 2015 at 16:00, Carlos Alberto Lopez Perez <clopez@igalia.com>
wrote:

>       root@qemux86:~# glxinfo | grep " render"
>       direct rendering: Yes
>       OpenGL renderer string: Software Rasterizer
>

"Works" being a relative term for the old non-LLVM software renderer ;)

Ross

--001a11376e6e2fe684052171e6c5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 October 2015 at 16:00, Carlos Alberto Lopez Perez <span dir=3D"ltr">&l=
t;<a href=3D"mailto:clopez@igalia.com" target=3D"_blank">clopez@igalia.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":230" cl=
ass=3D"a3s" style=3D"overflow:hidden">=C2=A0 =C2=A0 =C2=A0 root@qemux86:~# =
glxinfo | grep &quot; render&quot;<br>
=C2=A0 =C2=A0 =C2=A0 direct rendering: Yes<br>
=C2=A0 =C2=A0 =C2=A0 OpenGL renderer string: Software Rasterizer<br></div><=
/blockquote></div><br>&quot;Works&quot; being a relative term for the old n=
on-LLVM software renderer ;)</div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra">Ross</div></div>

--001a11376e6e2fe684052171e6c5--
