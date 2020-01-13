Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0F7147FCBC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 18:01:56 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id k188so6433979vsc.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 10:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XORQ+lHpJnsx7DlezneFX748UFtV+Uj9ZdxgbH5S3hc=;
	b=rvBa0nd0ZEW9xp0IcaMibAFXHk8c0hnACb0rlW+FkwBv7bsI0uoZNQLinVbf54qvuQ
	4uv/qEIAcRjDEDzfriVZwlpIRldvCCp030WO8gWH4+RrMhg5XK4kqgFfKoadi1bWqtg0
	sUYAE+SOBHIMBi2zXXm+XI1NkZ4aZkclrbpLg0wo+LYZ9HTJRy8r0I8vqoxb+k0fKt09
	gl1C0yuASib3dSAe8MCYYenHUWXWdvHAfbOgmKqxsTcOYImeiRrFpyzyMjIp5UHyKqcQ
	EzfA5lmu0zLb5lhVVToNwhzKZv1pR+BMghIa4QjCPiO5NQOAh688Uz34f0tCZnmGxb4N
	C4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XORQ+lHpJnsx7DlezneFX748UFtV+Uj9ZdxgbH5S3hc=;
	b=NpygrG6QPcKEln/UGXK04Bc8CuJ8bxQGMml7hoVZi6dtF2viHftdBuj0Ux0tVwvQjZ
	3HUHpSy2WREJytP+8gb85v08lcuDT6LdhzT1dht1z+vXEireuawgZuqfz+eGq1QKN4nR
	CB8iqRU1rg3rVrDVhfJn0r4bxMuky8PLbGaFrNiXp6IT7Tifow9iOLPxAnFVvlR6Xvla
	75C5zcu8/o06QKywMMnpOs0iWuWDgM7ectwquDCq2kfS6ungAEylITOSY+U+mpiH6wTr
	/jYC2w9YcJYr9WwFH9vKnrqZZlRu3QdHYZlaKiDLN49NN+y34PZ/cRcoC3jbOAE7MuJA
	1lZQ==
X-Gm-Message-State: APjAAAXHTM2IxeDI3JOnbUP05SUKO9i18l2Jj3Jo/j5bCGf77epPnhyV
	G5iGzhacyAH/sH2oU/LW8zyyKfzQ0Vei7+ljGA0=
X-Google-Smtp-Source: APXvYqxmUtBmjhabcqTwP7gdB5dZjMidTDkz5x0mrJCf+VIeG4O38AUafFZ0qx1QTkMOWj0SchVZLOpA+z9DUDHi7Iw=
X-Received: by 2002:a05:6102:3213:: with SMTP id
	r19mr7313549vsf.83.1578938517852; 
	Mon, 13 Jan 2020 10:01:57 -0800 (PST)
MIME-Version: 1.0
References: <20200112135954.23868-1-crg7475@mailbox.org>
	<725d92f91a56183e4166e633c0443fad44f6c5ba.camel@linuxfoundation.org>
	<a7a27af5-86c6-de19-d426-d8e62f2e8497@mailbox.org>
	<10f99a93a316115216d4e63d2b34a84dfc9e6925.camel@linuxfoundation.org>
	<a2b0cd22-c849-2bc4-9032-485ad4d51108@mailbox.org>
In-Reply-To: <a2b0cd22-c849-2bc4-9032-485ad4d51108@mailbox.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 Jan 2020 19:01:46 +0100
Message-ID: <CANNYZj9teCJ8-B_Zq51zKzCC+mHK5f0CseRm4LDymT9Ci5JBwQ@mail.gmail.com>
To: Carlos Rafael Giani <crg7475@mailbox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/12] gstreamer: Add common .inc files for meson based recipes
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
X-List-Received-Date: Mon, 13 Jan 2020 18:01:57 -0000
Content-Type: multipart/alternative; boundary="0000000000007a9b24059c094515"

--0000000000007a9b24059c094515
Content-Type: text/plain; charset="UTF-8"

I have reproduced this just now. You need to set up a special 'nodistro'
configuration like this:

bblayers.conf:
BBLAYERS ?= " \
  /home/alexander/development/poky/meta \
"
(and no other layers)

local.conf:

MACHINE ??= "qemuarm"
DISTRO ?= "nodistro"
INHERIT += 'uninative'
require conf/distro/include/yocto-uninative.inc
... (dl_dir, sstate etc)

and build gstreamer1.0-plugins-base.

Alex


On Mon, 13 Jan 2020 at 16:38, Carlos Rafael Giani <crg7475@mailbox.org>
wrote:

> Except that there is no such package. Also, even if I build GStreamer
> from scratch with all optional packageconfigs disabled, I do not get
> this error, nor do I get any warnings about potentially missing
> dependencies. So, I don't know what is going on here..
>
> On 13.01.20 13:59, Richard Purdie wrote:
> > On Mon, 2020-01-13 at 13:55 +0100, Carlos Rafael Giani wrote:
> >> Nope. This is an odd one. Are you sure there isn't a problem with
> >> the
> >> setup itself? In step2c, I see:
> >>
> >>   > ERROR: core-image-sato-1.0-r0 do_testsdk: The toolchain
> >> /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-
> >> glibc/deploy/sdk/oecore-i686-armv7vet2hf-neon-toolchain-
> >> nodistro.0.sh
> >> is not built. Build it before running the tests: 'bitbake <image> -c
> >> populate_sdk' .
> > 2c fails as earlier stepd didn't build. I think the real issue is
> > step1b which says:
> >
> > | Compiler for C supports arguments -Wdeclaration-after-statement: YES
> > | Found pkg-config:
> /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.0-plugins-base/1.16.1-r0/recipe-sysroot-native/usr/bin/pkg-config
> (0.29.2)
> > | Run-time dependency x11 found: YES 1.6.9
> > | Run-time dependency glib-2.0 found: YES 2.62.4
> > | Run-time dependency gobject-2.0 found: YES 2.62.4
> > | Run-time dependency gio-2.0 found: YES 2.62.4
> > | Run-time dependency gio-unix-2.0 found: YES 2.62.4
> > | Run-time dependency gmodule-no-export-2.0 found: YES 2.62.4
> > | Dependency gdk-pixbuf-2.0 skipped: feature examples disabled
> > | Dependency gtk+-3.0 skipped: feature examples disabled
> > | Dependency gtk+-x11-3.0 skipped: feature examples disabled
> > | Run-time dependency gstreamer-1.0 found: YES 1.16.1
> > | Run-time dependency gstreamer-base-1.0 found: YES 1.16.1
> > | Run-time dependency gstreamer-net-1.0 found: YES 1.16.1
> > | Found CMake: NO
> > | Run-time dependency gstreamer-check-1.0 found: NO (tried pkgconfig and
> cmake)
> > | Looking for a fallback subproject for the dependency
> gstreamer-check-1.0
> > | Subproject directory not found and gstreamer.wrap file not found
> > | Subproject  subprojects/gstreamer is buildable: NO (disabling)
> > | Dependency gstreamer-check-1.0 from subproject subprojects/gstreamer
> found: NO
> > |
> > | meson.build:309:0: ERROR: Could not find dependency gst_controller_dep
> in subproject gstreamer
> > |
> > | A full log can be found at
> /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.0-plugins-base/1.16.1-r0/build/meson-logs/meson-log.txt
> > | WARNING:
> /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.0-plugins-base/1.16.1-r0/temp/run.do_configure.46093:1
> exit 1 from 'exit 1'
> > |
> > NOTE: recipe gstreamer1.0-plugins-base-1.16.1-r0: task do_configure:
> Failed
> >
> > | Compiler for C supports arguments -Wdeclaration-after-statement: YES
> > | Found pkg-config:
> /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.0-plugins-base/1.16.1-r0/recipe-sysroot-native/usr/bin/pkg-config
> (0.29.2)
> > | Run-time dependency x11 found: YES 1.6.9
> > | Run-time dependency glib-2.0 found: YES 2.62.4
> > | Run-time dependency gobject-2.0 found: YES 2.62.4
> > | Run-time dependency gio-2.0 found: YES 2.62.4
> > | Run-time dependency gio-unix-2.0 found: YES 2.62.4
> > | Run-time dependency gmodule-no-export-2.0 found: YES 2.62.4
> > | Dependency gdk-pixbuf-2.0 skipped: feature examples disabled
> > | Dependency gtk+-3.0 skipped: feature examples disabled
> > | Dependency gtk+-x11-3.0 skipped: feature examples disabled
> > | Run-time dependency gstreamer-1.0 found: YES 1.16.1
> > | Run-time dependency gstreamer-base-1.0 found: YES 1.16.1
> > | Run-time dependency gstreamer-net-1.0 found: YES 1.16.1
> > | Found CMake: NO
> > | Run-time dependency gstreamer-check-1.0 found: NO (tried pkgconfig and
> cmake)
> > | Looking for a fallback subproject for the dependency
> gstreamer-check-1.0
> > | Subproject directory not found and gstreamer.wrap file not found
> > | Subproject  subprojects/gstreamer is buildable: NO (disabling)
> > | Dependency gstreamer-check-1.0 from subproject subprojects/gstreamer
> found: NO
> > |
> > | meson.build:309:0: ERROR: Could not find dependency gst_controller_dep
> in subproject gstreamer
> > |
> > | A full log can be found at
> /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.0-plugins-base/1.16.1-r0/build/meson-logs/meson-log.txt
> > | WARNING:
> /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.0-plugins-base/1.16.1-r0/temp/run.do_configure.46093:1
> exit 1 from 'exit 1'
> > |
> > NOTE: recipe gstreamer1.0-plugins-base-1.16.1-r0: task do_configure:
> Failed
> >
> > missing a check dependency?
> >
> > Cheers,
> >
> > Richard
> >
> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000007a9b24059c094515
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I have reproduced this just now. You need to set up a=
 special &#39;nodistro&#39; configuration like this:</div><div><br></div><d=
iv>bblayers.conf:</div><div>BBLAYERS ?=3D &quot; \<br>=C2=A0 /home/alexande=
r/development/poky/meta \<br></div><div>&quot;</div><div>(and no other laye=
rs)</div><div><br></div><div>local.conf:</div><div><br></div><div>MACHINE ?=
?=3D &quot;qemuarm&quot;<br>DISTRO ?=3D &quot;nodistro&quot;<br></div><div>=
INHERIT +=3D &#39;uninative&#39;<br>require conf/distro/include/yocto-unina=
tive.inc</div><div>... (dl_dir, sstate etc)<br></div><div><br></div><div>an=
d build gstreamer1.0-plugins-base.</div><div><br></div><div>Alex<br></div><=
div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, 13 Jan 2020 at 16:38, Carlos Rafael Giani &lt;<a hr=
ef=3D"mailto:crg7475@mailbox.org">crg7475@mailbox.org</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">Except that there is n=
o such package. Also, even if I build GStreamer <br>
from scratch with all optional packageconfigs disabled, I do not get <br>
this error, nor do I get any warnings about potentially missing <br>
dependencies. So, I don&#39;t know what is going on here..<br>
<br>
On 13.01.20 13:59, Richard Purdie wrote:<br>
&gt; On Mon, 2020-01-13 at 13:55 +0100, Carlos Rafael Giani wrote:<br>
&gt;&gt; Nope. This is an odd one. Are you sure there isn&#39;t a problem w=
ith<br>
&gt;&gt; the<br>
&gt;&gt; setup itself? In step2c, I see:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0&gt; ERROR: core-image-sato-1.0-r0 do_testsdk: The too=
lchain<br>
&gt;&gt; /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-<br>
&gt;&gt; glibc/deploy/sdk/oecore-i686-armv7vet2hf-neon-toolchain-<br>
&gt;&gt; <a href=3D"http://nodistro.0.sh" rel=3D"noreferrer" target=3D"_bla=
nk">nodistro.0.sh</a><br>
&gt;&gt; is not built. Build it before running the tests: &#39;bitbake &lt;=
image&gt; -c<br>
&gt;&gt; populate_sdk&#39; .<br>
&gt; 2c fails as earlier stepd didn&#39;t build. I think the real issue is<=
br>
&gt; step1b which says:<br>
&gt;<br>
&gt; | Compiler for C supports arguments -Wdeclaration-after-statement: YES=
<br>
&gt; | Found pkg-config: /home/pokybuild/yocto-worker/qemuarm-oecore/build/=
build/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.0-plugins=
-base/1.16.1-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)<br>
&gt; | Run-time dependency x11 found: YES 1.6.9<br>
&gt; | Run-time dependency glib-2.0 found: YES 2.62.4<br>
&gt; | Run-time dependency gobject-2.0 found: YES 2.62.4<br>
&gt; | Run-time dependency gio-2.0 found: YES 2.62.4<br>
&gt; | Run-time dependency gio-unix-2.0 found: YES 2.62.4<br>
&gt; | Run-time dependency gmodule-no-export-2.0 found: YES 2.62.4<br>
&gt; | Dependency gdk-pixbuf-2.0 skipped: feature examples disabled<br>
&gt; | Dependency gtk+-3.0 skipped: feature examples disabled<br>
&gt; | Dependency gtk+-x11-3.0 skipped: feature examples disabled<br>
&gt; | Run-time dependency gstreamer-1.0 found: YES 1.16.1<br>
&gt; | Run-time dependency gstreamer-base-1.0 found: YES 1.16.1<br>
&gt; | Run-time dependency gstreamer-net-1.0 found: YES 1.16.1<br>
&gt; | Found CMake: NO<br>
&gt; | Run-time dependency gstreamer-check-1.0 found: NO (tried pkgconfig a=
nd cmake)<br>
&gt; | Looking for a fallback subproject for the dependency gstreamer-check=
-1.0<br>
&gt; | Subproject directory not found and gstreamer.wrap file not found<br>
&gt; | Subproject=C2=A0 subprojects/gstreamer is buildable: NO (disabling)<=
br>
&gt; | Dependency gstreamer-check-1.0 from subproject subprojects/gstreamer=
 found: NO<br>
&gt; |<br>
&gt; | meson.build:309:0: ERROR: Could not find dependency gst_controller_d=
ep in subproject gstreamer<br>
&gt; |<br>
&gt; | A full log can be found at /home/pokybuild/yocto-worker/qemuarm-oeco=
re/build/build/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.=
0-plugins-base/1.16.1-r0/build/meson-logs/meson-log.txt<br>
&gt; | WARNING: /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp=
-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.0-plugins-base/1.1=
6.1-r0/temp/run.do_configure.46093:1 exit 1 from &#39;exit 1&#39;<br>
&gt; |<br>
&gt; NOTE: recipe gstreamer1.0-plugins-base-1.16.1-r0: task do_configure: F=
ailed<br>
&gt;<br>
&gt; | Compiler for C supports arguments -Wdeclaration-after-statement: YES=
<br>
&gt; | Found pkg-config: /home/pokybuild/yocto-worker/qemuarm-oecore/build/=
build/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.0-plugins=
-base/1.16.1-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)<br>
&gt; | Run-time dependency x11 found: YES 1.6.9<br>
&gt; | Run-time dependency glib-2.0 found: YES 2.62.4<br>
&gt; | Run-time dependency gobject-2.0 found: YES 2.62.4<br>
&gt; | Run-time dependency gio-2.0 found: YES 2.62.4<br>
&gt; | Run-time dependency gio-unix-2.0 found: YES 2.62.4<br>
&gt; | Run-time dependency gmodule-no-export-2.0 found: YES 2.62.4<br>
&gt; | Dependency gdk-pixbuf-2.0 skipped: feature examples disabled<br>
&gt; | Dependency gtk+-3.0 skipped: feature examples disabled<br>
&gt; | Dependency gtk+-x11-3.0 skipped: feature examples disabled<br>
&gt; | Run-time dependency gstreamer-1.0 found: YES 1.16.1<br>
&gt; | Run-time dependency gstreamer-base-1.0 found: YES 1.16.1<br>
&gt; | Run-time dependency gstreamer-net-1.0 found: YES 1.16.1<br>
&gt; | Found CMake: NO<br>
&gt; | Run-time dependency gstreamer-check-1.0 found: NO (tried pkgconfig a=
nd cmake)<br>
&gt; | Looking for a fallback subproject for the dependency gstreamer-check=
-1.0<br>
&gt; | Subproject directory not found and gstreamer.wrap file not found<br>
&gt; | Subproject=C2=A0 subprojects/gstreamer is buildable: NO (disabling)<=
br>
&gt; | Dependency gstreamer-check-1.0 from subproject subprojects/gstreamer=
 found: NO<br>
&gt; |<br>
&gt; | meson.build:309:0: ERROR: Could not find dependency gst_controller_d=
ep in subproject gstreamer<br>
&gt; |<br>
&gt; | A full log can be found at /home/pokybuild/yocto-worker/qemuarm-oeco=
re/build/build/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.=
0-plugins-base/1.16.1-r0/build/meson-logs/meson-log.txt<br>
&gt; | WARNING: /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp=
-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.0-plugins-base/1.1=
6.1-r0/temp/run.do_configure.46093:1 exit 1 from &#39;exit 1&#39;<br>
&gt; |<br>
&gt; NOTE: recipe gstreamer1.0-plugins-base-1.16.1-r0: task do_configure: F=
ailed<br>
&gt;<br>
&gt; missing a check dependency?<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
&gt;<br>
&gt;<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000007a9b24059c094515--
