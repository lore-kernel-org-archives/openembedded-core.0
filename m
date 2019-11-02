Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
	[209.85.222.45])
	by mail.openembedded.org (Postfix) with ESMTP id 35CA97F9A2
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Nov 2019 12:07:33 +0000 (UTC)
Received: by mail-ua1-f45.google.com with SMTP id v2so3675187uam.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Nov 2019 05:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bawpLIMLBh60FCn9vFNIamjaAbm0QCzTCGu3cL5+L5k=;
	b=Bz0Sbb+f9vW/lvA24vqRR53xdT/8ZsPy878rImS1jgP8R3ckq0J36m7pfOTg1fvh8L
	Vdat6D3tUKZw7MAOBvlxSvh9t7rIXwM2BzE//eAKSIhlhnVqfZxv5iwXQcEyTjwebSTv
	DuXN4E3XYT5oJ60L2vNJR7rToi3eNCusPnbFDFgomChQSWbEucD7VInZlLRWMKOTRswr
	79zmyNdzk3UR7/YH3/yk6YdTj9WWnIWoWz5ZuNNVZoqlSqHKhPJM8APQpqGTUQIHLuM1
	zf/AsjswX1UM8Lzsad4VJv+s+R27c+VykSnmwYclwuexZsWTPIAK00OJRBiuvq6MbYt9
	YH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bawpLIMLBh60FCn9vFNIamjaAbm0QCzTCGu3cL5+L5k=;
	b=muw+CJH/ksHC9/JHeFhG1pHso2oc+Ow/Lkr7BJ4l7Cj11mm/GB+y7dRnafaKsRkyf5
	WoL2nspUFJpPPtg8GU3vj3VUelLyxrVpSjuq0Y2HER+S88rh/WhY+PFyDcVaxdOCBZS4
	5ZQRQg8l7Xh6WT4mzoeIyYrzbtrgbZk38K1OnjXeFdqXEgYlCdMO+9YZHl2uk+238lEa
	S+Hi4JC770s7YlbyUUrXD9YTfCIcpFxrU5RB+25t5+KGiD0DKQ3zr13Ca1C0Y3kKf8jv
	FNyUiL8QP9me5BxTHSO437opcBhZc2xtJ4RByXAvGJvxUV4AtBRZXBLAaE0GJjXptxxM
	v7mA==
X-Gm-Message-State: APjAAAWYP3NU9Jj63hw7qGP1V3mD2IlZ9GoiKRtpd/W+y97xzjQtqZ3W
	ZCYNs45uEH8sC0znjDYIqO6YBA3ze94lesdDOV8=
X-Google-Smtp-Source: APXvYqziSj6xXRH5s1pCzVZqxBe1VBURQXP+oBWyNxaa7RllDfEtxdpmTr9Uu3Q/xxCdCB5lWauCqCevE8YLRcYCctg=
X-Received: by 2002:ab0:3112:: with SMTP id e18mr7593155ual.22.1572696454036; 
	Sat, 02 Nov 2019 05:07:34 -0700 (PDT)
MIME-Version: 1.0
References: <20191031093655.14852-1-alex.kanavin@gmail.com>
	<20191031093655.14852-3-alex.kanavin@gmail.com>
	<dc6caf95-a1e0-0eb7-f721-8dd3d1e2aa93@intel.com>
In-Reply-To: <dc6caf95-a1e0-0eb7-f721-8dd3d1e2aa93@intel.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 2 Nov 2019 13:07:22 +0100
Message-ID: <CANNYZj9i0mvP_X3WFapfda49YdVvuY9Tr1KY7mFcsnqRr5J-HA@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] oe-selftest: extend virgl gtk test to also check the SDL option
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
X-List-Received-Date: Sat, 02 Nov 2019 12:07:34 -0000
Content-Type: multipart/alternative; boundary="0000000000007b83c005965bed1c"

--0000000000007b83c005965bed1c
Content-Type: text/plain; charset="UTF-8"

On Fri, 1 Nov 2019 at 18:46, Ross Burton <ross.burton@intel.com> wrote:

> Same failures on the Debian 10 worker:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/778
>

runqemu - ERROR - Failed to run qemu: Xlib:  extension "RANDR" missing on
display ":1".
qemu-system-x86_64: ../libepoxy-1.5.3/src/dispatch_common.c:863:
epoxy_get_proc_address: Assertion `0 && "Couldn't find current GLX or EGL
context.\n"' failed.

Thanks - the Gtk part is passing fine, so it's something SDL does that
upsets the X/GL stack on the Debian 10 host.
I am reluctant to disable the SDL part of the virgl tests on Debian 10, as
it is a new distro (unlike centos 7).

I'll try to see if I can run Debian 10 in a VM here and try to reproduce.
Or is it possible to debug directly on a Debian 10 worker?

Alex

--0000000000007b83c005965bed1c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Fri, 1 Nov 2019 at 18:46, Ross Burton &lt;<a href=3D"mailto:ross.=
burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">Same failures on t=
he Debian 10 worker:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/56/build=
s/778" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoprojec=
t.org/typhoon/#/builders/56/builds/778</a><br></blockquote><div><br></div><=
div><div dir=3D"ltr"><div>runqemu - ERROR - Failed to run qemu: Xlib: =C2=
=A0extension &quot;RANDR&quot; missing on display &quot;:1&quot;.<br>qemu-s=
ystem-x86_64: ../libepoxy-1.5.3/src/dispatch_common.c:863: epoxy_get_proc_a=
ddress: Assertion `0 &amp;&amp; &quot;Couldn&#39;t find current GLX or EGL =
context.\n&quot;&#39; failed.<br></div><div><br></div><div>Thanks - the Gtk=
 part is passing fine, so it&#39;s something SDL does that upsets the X/GL =
stack on the Debian 10 host.</div><div>I am reluctant to disable the SDL pa=
rt of the virgl tests on Debian 10, as it is a new distro (unlike centos 7)=
.<br></div><div><br></div><div>I&#39;ll try to see if I can run Debian 10 i=
n a VM here and try to reproduce. Or is it possible to debug directly on a =
Debian 10 worker?<br></div><div><br></div><div>Alex<br></div></div>=C2=A0</=
div></div>
</div>

--0000000000007b83c005965bed1c--
