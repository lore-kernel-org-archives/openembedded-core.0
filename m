Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1D76A65CBF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 20:58:06 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id n186so40968066qkb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 12:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PZWLDtbuaWCRP+l1iF/d3dvYOJpOa8afEkutPHWX8O8=;
	b=L0TpHBlAyP22XA/ZTvP4atG97HpFeRKuuUc2MDRN/AmOb45oy5mz0JEZIJDgFJAima
	NQocMK1owYxv5/tcV7MW46kx59KKdbyUBTiyNlKs0FnFVX3Rr6ATCPA7bldUR3cnT3wE
	vXTWuSX+hIDTnM1+6/BFd10Bb1w9Ue2miL4/ULPi+lniqgoIzD/NEOI+BIUDCrEr65WN
	Tn1760og6rBeym38b5Mejg7vFruFZpa4InONsuXrukL1/1bJxhzYXfjMAJIjsHMHAwmp
	pt88/DBrW/KhOvl9w4bM2EvErEvGXY5gR9AlZyl2rgy+iIJhs2IZPcQJ2wUdnSXKnzhy
	Xj7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PZWLDtbuaWCRP+l1iF/d3dvYOJpOa8afEkutPHWX8O8=;
	b=NLZCiSPoImkNYPe7WVIoVjRC+5EQPySOu57ebZmZmAk7rItdvJ6qryb6ees8IEbJQ1
	Rpmto7Whfy1/cWvmnnVVyGW0UKae7zCaKMa+e0+dq6c9XvkB5mup37wqPfu79scNWtlB
	Qavi8vgE8GWoz1m+WUcFbbTfHhGLLlU37CwnKzgPAZA1S4IWvUTn2PeTouc6jFLPMLZw
	CQs6ygELWlsi60X0Iywpq6XOPUlbsHE8Jt9rzqfDks1kL+JNlyCDkrsfTd4ByrUtsjpH
	az+6Z5aai9xkEojIEbqHpbDOgA7w+1rl3uY1NC4oz+D/VE1TA9CkzX3PDDdBgcGlI3nB
	R2yw==
X-Gm-Message-State: AMke39kCz+OgKLAvJBV2PqvNG+0Pr0TDFDrgGqS4jlvKGDLqtqRiWawfiM7yNEjDpQW93rhcSsXQBHsRCLQvU+Ko
X-Received: by 10.200.2.150 with SMTP id p22mr14427786qtg.197.1488229087718;
	Mon, 27 Feb 2017 12:58:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Mon, 27 Feb 2017 12:57:47 -0800 (PST)
In-Reply-To: <dd7a26db70cf0ed10bd0c83d69acdf0c7d2e3c66.1488125460.git.jussi.kukkonen@intel.com>
References: <cover.1488125460.git.jussi.kukkonen@intel.com>
	<dd7a26db70cf0ed10bd0c83d69acdf0c7d2e3c66.1488125460.git.jussi.kukkonen@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 27 Feb 2017 20:57:47 +0000
Message-ID: <CAJTo0Lb6BKZ+dRvrWfZAWTKjW_sezj6_4StU_koyqxN5od9TUA@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] weston: Upgrade 1.11.1 -> 2.0.0, separate libweston
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
X-List-Received-Date: Mon, 27 Feb 2017 20:58:08 -0000
Content-Type: multipart/alternative; boundary=f4030435c2341e99de0549895615

--f4030435c2341e99de0549895615
Content-Type: text/plain; charset=UTF-8

On 26 February 2017 at 16:50, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:
>
> * Drop two patches that are upstream. Rebase other patches.
> * Separate libweston into its own package, modify the recipe
>   as needed because files have changed location.
> * Remove "--disable-rpi-compositor": the backend does not exist
>   anymore.
>
> Libweston is already at version 2 and is likely to have new major
> versions. The versions should be parallel installable (but weston
> itself will not be).
>
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>


Breaks the no-x11 builds:

ERROR: Nothing RPROVIDES 'xserver-xorg-xwayland' (but
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-no-x11/build/meta/recipes-graphics/wayland/
weston_2.0.0.bb RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'xserver-xorg-xwayland' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['xserver-xorg-xwayland']
NOTE: Runtime target 'weston-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['weston-dev',
'xserver-xorg-xwayland']
NOTE: Runtime target 'weston' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['weston',
'xserver-xorg-xwayland']
ERROR: Nothing RPROVIDES 'weston-init' (but
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-no-x11/build/meta/recipes-graphics/images/
core-image-weston.bb,
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-no-x11/build/meta/recipes-graphics/wayland/
weston-init.bb RDEPENDS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'weston-init'
NOTE: Runtime target 'weston-init' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['weston-init']
ERROR: Nothing RPROVIDES 'weston-examples' (but
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-no-x11/build/meta/recipes-graphics/images/
core-image-weston.bb RDEPENDS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'weston-examples'
NOTE: Runtime target 'weston-examples' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['weston-examples']
ERROR: Nothing RPROVIDES 'core-image-weston'
ERROR: No eligible RPROVIDERs exist for 'core-image-weston'
NOTE: Runtime target 'core-image-weston' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['core-image-weston']
ERROR: Nothing RPROVIDES 'weston-init-dev' (but
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-no-x11/build/meta/recipes-graphics/wayland/
weston-init.bb RDEPENDS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'weston-init-dev'
NOTE: Runtime target 'weston-init-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['weston-init-dev']

Ross

--f4030435c2341e99de0549895615
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>On 26 February 2017 at 16:50, Jussi Kukkonen &lt;<a hr=
ef=3D"mailto:jussi.kukkonen@intel.com">jussi.kukkonen@intel.com</a>&gt; wro=
te:<br>&gt;<br>&gt; * Drop two patches that are upstream. Rebase other patc=
hes.<br>&gt; * Separate libweston into its own package, modify the recipe<b=
r>&gt; =C2=A0 as needed because files have changed location.<br>&gt; * Remo=
ve &quot;--disable-rpi-compositor&quot;: the backend does not exist<br>&gt;=
 =C2=A0 anymore.<br>&gt;<br>&gt; Libweston is already at version 2 and is l=
ikely to have new major<br>&gt; versions. The versions should be parallel i=
nstallable (but weston<br>&gt; itself will not be).<br>&gt;<br>&gt; Signed-=
off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.com">juss=
i.kukkonen@intel.com</a>&gt;<br><br><br>Breaks the no-x11 builds:<br><br>ER=
ROR: Nothing RPROVIDES &#39;xserver-xorg-xwayland&#39; (but /home/pokybuild=
/yocto-autobuilder/yocto-worker/nightly-no-x11/build/meta/recipes-graphics/=
wayland/<a href=3D"http://weston_2.0.0.bb">weston_2.0.0.bb</a> RDEPENDS on =
or otherwise requires it)<br>NOTE: Runtime target &#39;xserver-xorg-xwaylan=
d&#39; is unbuildable, removing...<br>Missing or unbuildable dependency cha=
in was: [&#39;xserver-xorg-xwayland&#39;]<br>NOTE: Runtime target &#39;west=
on-dev&#39; is unbuildable, removing...<br>Missing or unbuildable dependenc=
y chain was: [&#39;weston-dev&#39;, &#39;xserver-xorg-xwayland&#39;]<br>NOT=
E: Runtime target &#39;weston&#39; is unbuildable, removing...<br>Missing o=
r unbuildable dependency chain was: [&#39;weston&#39;, &#39;xserver-xorg-xw=
ayland&#39;]<br>ERROR: Nothing RPROVIDES &#39;weston-init&#39; (but /home/p=
okybuild/yocto-autobuilder/yocto-worker/nightly-no-x11/build/meta/recipes-g=
raphics/images/<a href=3D"http://core-image-weston.bb">core-image-weston.bb=
</a>, /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-no-x11/build/m=
eta/recipes-graphics/wayland/<a href=3D"http://weston-init.bb">weston-init.=
bb</a> RDEPENDS on or otherwise requires it)<br>ERROR: No eligible RPROVIDE=
Rs exist for &#39;weston-init&#39;<br>NOTE: Runtime target &#39;weston-init=
&#39; is unbuildable, removing...<br>Missing or unbuildable dependency chai=
n was: [&#39;weston-init&#39;]<br>ERROR: Nothing RPROVIDES &#39;weston-exam=
ples&#39; (but /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-no-x1=
1/build/meta/recipes-graphics/images/<a href=3D"http://core-image-weston.bb=
">core-image-weston.bb</a> RDEPENDS on or otherwise requires it)<br>ERROR: =
No eligible RPROVIDERs exist for &#39;weston-examples&#39;<br>NOTE: Runtime=
 target &#39;weston-examples&#39; is unbuildable, removing...<br>Missing or=
 unbuildable dependency chain was: [&#39;weston-examples&#39;]<br>ERROR: No=
thing RPROVIDES &#39;core-image-weston&#39;<br>ERROR: No eligible RPROVIDER=
s exist for &#39;core-image-weston&#39;<br>NOTE: Runtime target &#39;core-i=
mage-weston&#39; is unbuildable, removing...<br>Missing or unbuildable depe=
ndency chain was: [&#39;core-image-weston&#39;]<br>ERROR: Nothing RPROVIDES=
 &#39;weston-init-dev&#39; (but /home/pokybuild/yocto-autobuilder/yocto-wor=
ker/nightly-no-x11/build/meta/recipes-graphics/wayland/<a href=3D"http://we=
ston-init.bb">weston-init.bb</a> RDEPENDS on or otherwise requires it)<br>E=
RROR: No eligible RPROVIDERs exist for &#39;weston-init-dev&#39;<br>NOTE: R=
untime target &#39;weston-init-dev&#39; is unbuildable, removing...<br>Miss=
ing or unbuildable dependency chain was: [&#39;weston-init-dev&#39;]<br><br=
><div>Ross</div></div>

--f4030435c2341e99de0549895615--
