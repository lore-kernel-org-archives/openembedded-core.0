Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 5D9BE6093B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 15:46:14 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id 188so37913305iti.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2016 08:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rX6Nm9J+n0yQ+DDkW5tluJcosoy2OKXQJ0TZkZ5I3pU=;
	b=fEwcuntJGlxFU+VqLZmP0WkVUq9TMR9rc6IUab6yC0U8SdI0ikc5LESRsPkpCuzdgl
	Dabj9SKej6zt7qII0q2/smuy0s//kV2hVd17ilOc6OGvT8tyE70gthZv/IeBgK1ynpB3
	spCnnu/TZrIZ5KnH19mIKTyma74+66W+tb9VXquzmy3bCPlh3jIY6qhD1lawHfjH/xDS
	RB/6N/k9A58t5R969eR/vp3f1s63A3dYFOARyuGnGoyArqZeA7NiKnHue/DQrrUtJZZi
	kB6ZWurPMVKcrYUiNMirQPvrO8po6QRA8aGpK9LaGkjpCOULmH/G823MYo9C9ZfBcUYq
	eENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rX6Nm9J+n0yQ+DDkW5tluJcosoy2OKXQJ0TZkZ5I3pU=;
	b=hWsScoTSz51QsxNEJhrLsvpjlKDfsRlKR/l5S/eAQFL59VJPZWb96kd+sb+qaal0Xi
	7W7l6J8z/vLMw35F/2KY7elZxO0l82utbZE7xkhuyjDJgigEJaYDjWTFoqGniJs2jTnF
	zRNha2FSGz+uLK2AbnxwH+8/voGI7RWwd8iREBVy+6tZ2OYhhZ31nBdIWaMEls2KIoey
	0pHvbGne1Blekh8I2c93ESj0fVhjz7JsYi4hSWcTC3W4xsvh7KKs3WA2gCUOE9PTpPxf
	WOOEoz3HZMMF9qwXmlwrZfyItVr8GL1+GbGMdzTvYWUn69EjtnbeLksGVO1JB5i4lR/q
	POMQ==
X-Gm-Message-State: AA6/9RlfUuuLmVyGLtsZdAjhezAc9SVF1M5GoluINY1VhwDaK3gbWD6xeyACi4Ldv3BQ59b7jUdcHMOQM37jx9pm
X-Received: by 10.36.133.65 with SMTP id r62mr16667219itd.29.1475509576393;
	Mon, 03 Oct 2016 08:46:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Mon, 3 Oct 2016 08:45:56 -0700 (PDT)
In-Reply-To: <cover.1475473494.git.bruce.ashfield@windriver.com>
References: <cover.1475473494.git.bruce.ashfield@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 3 Oct 2016 16:45:56 +0100
Message-ID: <CAJTo0LacaDPQawfsK45GTwOVPohsxQN+e2FtZjEYvT91Ruxb5g@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/7] linux-yocto: consolidated (and hopefully final) pull request
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
X-List-Received-Date: Mon, 03 Oct 2016 15:46:15 -0000
Content-Type: multipart/alternative; boundary=94eb2c05b74629fd5f053df7d846

--94eb2c05b74629fd5f053df7d846
Content-Type: text/plain; charset=UTF-8

On 3 October 2016 at 06:54, Bruce Ashfield <bruce.ashfield@windriver.com>
wrote:

> The big thing to note about this update .. is that the libc-headers bump
> to the 4.8 final tarball picked up some uapi headers that broke the build
> of ppp. I never would have thought it was possible, but it happened.
>

| In file included from
/data/poky-master/tmp-glibc/sysroots/intel-corei7-64/usr/include/linux/if_tunnel.h:6:0,
|                  from iptunnel.c:39:
|
/data/poky-master/tmp-glibc/sysroots/intel-corei7-64/usr/include/linux/ip.h:85:8:
error: redefinition of 'struct iphdr'
|  struct iphdr {
|         ^~~~~
| In file included from iptunnel.c:29:0:
|
/data/poky-master/tmp-glibc/sysroots/intel-corei7-64/usr/include/netinet/ip.h:44:8:
note: originally defined here
|  struct iphdr
|         ^~~~~
| <builtin>: recipe for target 'iptunnel.o' failed
| make: *** [iptunnel.o] Error 1
| ERROR: Function failed: do_compile (log file is located at
/data/poky-master/tmp-glibc/work/corei7-64-poky-linux/net-tools/1.60-26-r0/temp/log.do_compile.27643)

Looks like net-tools is broken by something else too.

Ross

--94eb2c05b74629fd5f053df7d846
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 October 2016 at 06:54, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D=
"mailto:bruce.ashfield@windriver.com" target=3D"_blank">bruce.ashfield@wind=
river.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex"><div id=3D"gmail-:17l"=
 class=3D"gmail-a3s gmail-aXjCH gmail-m157891bf3dff8cd4">The big thing to n=
ote about this update .. is that the libc-headers bump<br>
to the 4.8 final tarball picked up some uapi headers that broke the build<b=
r>
of ppp. I never would have thought it was possible, but it happened.</div><=
/blockquote></div><br><div class=3D"gmail_extra">| In file included from /d=
ata/poky-master/tmp-glibc/sysroots/intel-corei7-64/usr/include/linux/if_tun=
nel.h:6:0,</div><div class=3D"gmail_extra">| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from iptunnel.c:39:</div><div class=3D"gm=
ail_extra">| /data/poky-master/tmp-glibc/sysroots/intel-corei7-64/usr/inclu=
de/linux/ip.h:85:8: error: redefinition of &#39;struct iphdr&#39;</div><div=
 class=3D"gmail_extra">| =C2=A0struct iphdr {</div><div class=3D"gmail_extr=
a">| =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~</div><div class=3D"gmail_extra">| In=
 file included from iptunnel.c:29:0:</div><div class=3D"gmail_extra">| /dat=
a/poky-master/tmp-glibc/sysroots/intel-corei7-64/usr/include/netinet/ip.h:4=
4:8: note: originally defined here</div><div class=3D"gmail_extra">| =C2=A0=
struct iphdr</div><div class=3D"gmail_extra">| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
^~~~~</div><div class=3D"gmail_extra">| &lt;builtin&gt;: recipe for target =
&#39;iptunnel.o&#39; failed</div><div class=3D"gmail_extra">| make: *** [ip=
tunnel.o] Error 1</div><div class=3D"gmail_extra">| ERROR: Function failed:=
 do_compile (log file is located at /data/poky-master/tmp-glibc/work/corei7=
-64-poky-linux/net-tools/1.60-26-r0/temp/log.do_compile.27643)</div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Looks like net-too=
ls is broken by something else too.</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Ross</div></div></div>

--94eb2c05b74629fd5f053df7d846--
