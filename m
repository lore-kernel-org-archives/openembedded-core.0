Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9F823783DB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 09:20:47 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id b76so4077385itb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 02:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tM/2LwrrgXy9k6r18j+xXNtGbdXddKc5Txghjn7NeJw=;
	b=QWLp7zOw+Gb1Sqc/RLSQFPSLFCzzlQxaTljCl4lbfR887naZjfar4nC9Cy6cY6vZow
	9NHb8lAhfjYgNTMcSEkoCXEO/Op+n1Iqpnx4Ui3KcLbTxY50BdhJQWCLBv9UWLrV6kA0
	+MNl8bTBouBBIhS+m5tIwql20zsbXCYlv5ztfu26mXjJ/C+WKTYZ7OZfYZbmSEJhngaL
	PxJDqQJSfedXA2dDWghkOlXBrdIvtY4zvOMCDx+1wN/JsAl8dCE1heb0qevz/tTtMeyR
	klx/nWSnlBhTt5Whe+dbwZCtKT4EwtRr7rUL1i5TD/xrAq431jZrt9uT5M94z0WLQ1MT
	CzdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tM/2LwrrgXy9k6r18j+xXNtGbdXddKc5Txghjn7NeJw=;
	b=ePQU2RGBk4Ox8IL3dxLOKG0uir9OY3UTO5BbZt8h6W1PISAtKkvkQ7HtNNuxnUuYXr
	TgymDZayri2cqiq7CwdgrCSiBDSr/5soxlh2QlULAkCIM5wl9ILjgQ9hU15wMNoAz7pZ
	OVQvUAqG1kj0tFBx+diZ0alG9Fx45TLKhpuRV81zuVzniSm94qNIX55PCLqdkDphYzWu
	th/NLrbVt25+XaGnK0oN9mArbyH/Ynuc5tpVK3Qtqqyutxaceqe3Jfak2dkQYhC7qifk
	xFz8A1xqizXf12uRAis8hurjearA0YkuKAQXxwxaVPT7Se5sLsxTd1X7i/AdSyOwUaAq
	sn5g==
X-Gm-Message-State: AHYfb5hyKXPprjHOT+QntK8XdA52iUCpqPy9c9aWR69jQ64UyG69sBN3
	vGnyyxpVrxzrutG2CMNvbjMDFT/X1tny
X-Received: by 10.36.50.214 with SMTP id j205mr683280ita.41.1503652848742;
	Fri, 25 Aug 2017 02:20:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.200.71 with HTTP; Fri, 25 Aug 2017 02:20:18 -0700 (PDT)
In-Reply-To: <CAHiDW_EiK7Yzj9MAoMi_E=+hVdmiHej5c=8JtAd0Ksv8uho0Cw@mail.gmail.com>
References: <1503503416-47233-1-git-send-email-mark.hatle@windriver.com>
	<CAHiDW_EiK7Yzj9MAoMi_E=+hVdmiHej5c=8JtAd0Ksv8uho0Cw@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 25 Aug 2017 12:20:18 +0300
Message-ID: <CAHiDW_FeX8td9Yz2w5BUJPN2vDe9ocy-5QVfaM1_eyMJc2nS9Q@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] vulkan distro flag update
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
X-List-Received-Date: Fri, 25 Aug 2017 09:20:47 -0000
Content-Type: multipart/alternative; boundary="001a114aab8cea4a270557907555"

--001a114aab8cea4a270557907555
Content-Type: text/plain; charset="UTF-8"

On 24 August 2017 at 10:09, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> On 23 August 2017 at 18:50, Mark Hatle <mark.hatle@windriver.com> wrote:
> >
> > I'm not sure if this is right or not, but it resolves the failures I was
> > getting after updating oe this morning.
> >
> > I was attempting to run the yocto project compliant script, which runs
> > bitbake -S none world.  The results of this were an error that vulkan
> > needed 'mesa-vulkan-drivers'.  Looking at mesa, it was clear that these
> > are only built in the 'vulkan' distro flag is set.  (and mesa is only
> > built in the opengl flag is set.)
> >
> > So I've added these checks to the vulkan recipe, and resolved the check.
>
>
> Looks good to me, thanks.
>
> It's possible that mesa could be talked into building just vulkan drivers
> (and so could work without opengl feature) but the mesa recipe certainly
> doesn't support it right now. I'll have a look at that but for now the
> RRECOMMENDS tweak seems reasonable too.
>

For the record mesa can be built without any opengl bits (!) with just a
little build system fixing: I'll send a patch once I've made sure I'm not
breaking any reasonable feature distro combo...

Jussi

--001a114aab8cea4a270557907555
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
4 August 2017 at 10:09, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><spa=
n class=3D"">On 23 August 2017 at 18:50, Mark Hatle &lt;<a href=3D"mailto:m=
ark.hatle@windriver.com" target=3D"_blank">mark.hatle@windriver.com</a>&gt;=
 wrote:<br>&gt;<br>&gt; I&#39;m not sure if this is right or not, but it re=
solves the failures I was<br>&gt; getting after updating oe this morning.<b=
r>&gt;<br>&gt; I was attempting to run the yocto project compliant script, =
which runs<br>&gt; bitbake -S none world.=C2=A0 The results of this were an=
 error that vulkan<br>&gt; needed &#39;mesa-vulkan-drivers&#39;.=C2=A0 Look=
ing at mesa, it was clear that these<br>&gt; are only built in the &#39;vul=
kan&#39; distro flag is set. =C2=A0(and mesa is only<br>&gt; built in the o=
pengl flag is set.)<br>&gt;<br>&gt; So I&#39;ve added these checks to the v=
ulkan recipe, and resolved the check.<br><br><br></span>Looks good to me, t=
hanks.<br><br>It&#39;s possible that mesa could be talked into building jus=
t vulkan drivers (and so could work without opengl feature) but the mesa re=
cipe certainly doesn&#39;t support it right now. I&#39;ll have a look at th=
at but for now the RRECOMMENDS tweak seems reasonable too.</div></blockquot=
e><div><br></div><div>For the record mesa can be built without any opengl b=
its (!) with just a little build system fixing: I&#39;ll send a patch once =
I&#39;ve made sure I&#39;m not breaking any reasonable feature distro combo=
... =C2=A0</div><div><br></div><div>Jussi</div></div></div></div>

--001a114aab8cea4a270557907555--
