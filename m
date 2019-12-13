Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
	[209.85.217.51])
	by mail.openembedded.org (Postfix) with ESMTP id AF5AE7F2A2
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2019 11:33:36 +0000 (UTC)
Received: by mail-vs1-f51.google.com with SMTP id g23so1260942vsr.7
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2019 03:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=b1Tq5Yhtzd1LKGO7fRzKHlXVbxodP7nmziOeAJT50sw=;
	b=K9h7uNGCf26wJvjem9xs9Taa30WOm+lMxbX/8pNFGDknojAXYyBPNjZy+NUM8ow3SO
	WUDLGmRnbHLmUqQ2PGDViZVxNpkbo3CBPi7LF+D+LnwByeZWI4+h6aIptmCoKNlhA9HX
	Z1429wHBv44x8yoRZgJZ27qsezXkblUlgk+5NpPS/zgL8Iz/SweMMFjgV3/RkhErdETi
	byMFqbsXpYIZN1UaU0Tnhh2XayR/Nx/ya3orU+sSvfnUdQIO97oCmpCh0DntTZio56b7
	epiwLnv2wMmSPS6UuN76fljwgm+TaiB04kVZNsCjTiok1f/SnZmE5WQ/z6A2B62BrFA0
	Q/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=b1Tq5Yhtzd1LKGO7fRzKHlXVbxodP7nmziOeAJT50sw=;
	b=ZstCGRD8DHUDcEW+DckHYSzGm095D8JAii/1CJATDx2yNO1CPbIOkW/Vd1zFptuxv4
	uSFK0Drur8PPgCHpEVH5nQZpMy+B2CqJIuQnTD0X5ymrVRcCdNFVwzX7cklZTtdhZA79
	EBVBRw3On65TxL7Zfv0wnBrtr+jhYfflqw+bqtUjxtQQrjZpOKGftzR/OFreGJi+Lain
	+22hVhfq237pm4XAxgoQwkqrttejV55f51eE1E9Q9r6TxuEkZnF73Qkb0XsjijhdmCh9
	2X3gHsTrATb+2O0H67WkzzxXM7N2o0emndhTXSg/iyTg5YmXj88UNahCbvfS5aCNMG1T
	6Ovw==
X-Gm-Message-State: APjAAAX8i8ICS3tmwzzodO0B96m7ulnFlMHVOV9Qmetko85wLHAxLlm5
	Ywsa/v8uqXdiwGtmfQnacw0WJgBS8GdMnGrGPBs=
X-Google-Smtp-Source: APXvYqzsOEfDXciadhedOr8earYnPDXlooI0QNMjJODFe0yT3hUNBtY88H4idwCY1u3BKFBO+Rw3zsrv8x1ZUcsRNqI=
X-Received: by 2002:a05:6102:21d8:: with SMTP id
	r24mr11440810vsg.83.1576236817684; 
	Fri, 13 Dec 2019 03:33:37 -0800 (PST)
MIME-Version: 1.0
References: <fdc2e1e6-364f-ec9e-dcb7-f983dc514743@mailbox.org>
In-Reply-To: <fdc2e1e6-364f-ec9e-dcb7-f983dc514743@mailbox.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 13 Dec 2019 12:33:26 +0100
Message-ID: <CANNYZj9FUjACa-8uhLVYn94BSQ7v7xdYyXXwKr6BG5h5bLRSCw@mail.gmail.com>
To: Carlos Rafael Giani <crg7475@mailbox.org>
Cc: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Transitioning GStreamer 1.0 recipes to meson
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
X-List-Received-Date: Fri, 13 Dec 2019 11:33:38 -0000
Content-Type: multipart/alternative; boundary="000000000000999db90599943b90"

--000000000000999db90599943b90
Content-Type: text/plain; charset="UTF-8"

Are your patches in good shape? Please send them here if so, now is a good
time to get them merged.
So that we don't have to later deal with 1.18.0 upgrade and meson
transition at the same time.

Alex

On Tue, 29 Oct 2019 at 22:21, Carlos Rafael Giani <crg7475@mailbox.org>
wrote:

> Hello all,
>
> I have managed to transition most GStreamer recipes to meson. The
> patches can be found here:
> https://github.com/OSSystems/meta-gstreamer1.0/tree/transition-to-meson
>
> The only recipe that still uses autotools is gst-validate, and that's
> because the tarball does not contain meson scripts. This is a known
> issue. https://gitlab.freedesktop.org/gstreamer/gst-devtools/issues/28
>
> Overall, this worked well in my test builds, both on an i.MX6 machine
> and in a qemux86-64 VM.
>
>
> Please note that this requires the 1.16.0 -> 1.16.1 changes I posted to
> the mailing list a few days ago.
>
>
> Noteworthy changes:
>
> - A lot of autotools/M4 related patches are just gone. Well, obviously
> :) But it is surprising just how much fewer patches there are now.
>
> - gstreamer1.0-libav no longer builds its own FFmpeg copy. This was done
> in the past because there were no stable versioned FFmpeg releases. They
> do exist now, so in meson based builds, gst-libav just builds the actual
> plugin code, meaning that the build time is much shorter, most of the
> recipe code (and all of the patches) are gone (because they were FFmpeg
> specific), and the libgstlibav.so binary in /usr/lib/gstreamer-1.0/ is
> much smaller. This also means that FFmpeg specials do not have to be
> added both to the FFmpeg and to the gstreamer1.0-libav recipe anymore.
>
> - gstreamer1.0-plugins.inc was replaced by
> gstreamer1.0-plugins-common.inc, and gst-plugins-package.inc by
> gstreamer1.0-plugins-packaging.inc . These names are clearer.
> gst-plugins-package.inc in particular was named that way because it used
> to be shared between GStreamer 0.10 and 1.0 recipes. Since the former
> are gone by now, there's no point in keeping that name.
>
> - gstreamer1.0 ptest is now done differently. Originally, make was
> installed on the target and the Makefile was run by the run-ptest
> script. Now, gstreamer is patched to allow for installable tests that
> are accompanied by individual shell scripts that set up the necessary
> environment variables, along with .test files so that the
> gnome-desktop-testing test runner can be used in run-ptest to run the
> unit tests. This also makes it possible to inherit from ptest-gnome in
> the gstreamer1.0 recipe. The patch against gstreamer is necessary
> because by default, one runs the test by executing "meson test". I don't
> think installing meson along with all of the necessary meson.build
> scripts is a practical approach.
>
> - OpenGL packageconfigs now work quite differently in
> gstreamer1.0-plugins-base, since the meson options distinguish between
> OpenGL APIs, platforms, and windowing systems.
>
> - zlib in gstreamer1.0-plugins-base and -good is now required. I don't
> think this is a big deal, since it is also a dependency of GLib itself,
> so zlib has to be present on the rootfs anyway.
>
>
> There are some TODOs left that I want to bring up here for discussion:
>
> - The aforementioned PTest approach needs some review. Also, initially,
> I thought I'd have to add PTest support to several GStreamer recipes,
> which is why I isolated the ptest code in gstreamer1.0-ptest.inc . But
> it turned out that only the gstreamer1.0 recipe needs it. I am unsure if
> I should just merge that .inc into that recipe, since there's no reason
> why the tests from other recipes shouldn't be "ptest-ified" in the
> future. And then that .inc would be useful to have. (Tests from the
> plugin sets may be partially tough to run, since some of them create X11
> windows etc.)
>
> - The code in gstreamer1.0-ptest.inc sets up run-ptest in a rather
> uncommon way, since that file has to be autogenerated.
>
> - gstreamer1.0_1.16.1.bb and gstreamer1.0-plugins-common.inc both
> contain a "gettext_oemeson" function to set up meson NLS options.
> Ideally, this functionality would be part of the gettext bbclass itself.
> However, my bitbake/OE knowledge does not suffice to do that, since with
> meson, you want to be able to configure what the enable/disable flags
> should be ("enabled"/"disabled", "true"/"false" etc.); that's why for
> example the gtk-doc bbclass defines GTKDOC_MESON_OPTION,
> GTKDOC_MESON_ENABLE_FLAG, GTKDOC_MESON_DISABLE_FLAG. I am not sure how
> to combine such variables with this kind of custom python code, and
> still allow for customized values in other recipes. In other words, if I
> first get a "NLS_MESON_DISABLE_FLAG" value with getValue() in a modified
> gettext_oemeson function, then I might not get the value I expect, since
> it will get the initial value (the one set with ?=), not necessarily the
> one that is redefined by a recipe.
>
> - The OpenGL packageconfigs are handled by a get_opengl_cmdline_list
> function in gstreamer1.0-plugins-base_1.16.1.bb . I did this so that a
> comma-separated list can be generated out of the packageconfigs that are
> (a) part of PACKAGECONFIG and (b) part of the newly added
> OPENGL_APIS/OPENGL_PLATFORMS/OPENGL_WINSYS lists. I do not know if
> there's a better approach for this. The intent is that other layers
> (most notably BSP layers) can add custom packageconfig names to these
> lists. One example would be OPENGL_WINSYS += "viv-fb" in meta-freescale.
> Another would be OPENGL_WINSYS += "dispmanx" in meta-raspberrypi.
>
> - gstreamer1.0-python_1.16.1.bb currently has a problem in that the
> gst-python code tries to load /usr/lib/libpython3.7m.so. But, in a
> regular installation, only /usr/lib/libpython3.7m.so.1.0 would be
> availale. It is possible to adjust the libpython path & name during the
> build. But - what would it be adjusted to? How would the recipe know
> that "/usr/lib/libpython3.7m.so.1.0" is the correct choice? Or perhaps
> would it make sense to add the /usr/lib/libpython3.7m.so symlink to the
> regular (as in: non-dev) Python package?
>
>
> cheers,
>
>    Carlos
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000999db90599943b90
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Are your patches in good shape? Please send them here=
 if so, now is a good time to get them merged.</div><div>So that we don&#39=
;t have to later deal with 1.18.0 upgrade and meson transition at the same =
time.</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 29 Oct 2019 at 22:21, =
Carlos Rafael Giani &lt;<a href=3D"mailto:crg7475@mailbox.org">crg7475@mail=
box.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Hello all,<br>
<br>
I have managed to transition most GStreamer recipes to meson. The <br>
patches can be found here: <br>
<a href=3D"https://github.com/OSSystems/meta-gstreamer1.0/tree/transition-t=
o-meson" rel=3D"noreferrer" target=3D"_blank">https://github.com/OSSystems/=
meta-gstreamer1.0/tree/transition-to-meson</a><br>
<br>
The only recipe that still uses autotools is gst-validate, and that&#39;s <=
br>
because the tarball does not contain meson scripts. This is a known <br>
issue. <a href=3D"https://gitlab.freedesktop.org/gstreamer/gst-devtools/iss=
ues/28" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org=
/gstreamer/gst-devtools/issues/28</a><br>
<br>
Overall, this worked well in my test builds, both on an i.MX6 machine <br>
and in a qemux86-64 VM.<br>
<br>
<br>
Please note that this requires the 1.16.0 -&gt; 1.16.1 changes I posted to =
<br>
the mailing list a few days ago.<br>
<br>
<br>
Noteworthy changes:<br>
<br>
- A lot of autotools/M4 related patches are just gone. Well, obviously <br>
:) But it is surprising just how much fewer patches there are now.<br>
<br>
- gstreamer1.0-libav no longer builds its own FFmpeg copy. This was done <b=
r>
in the past because there were no stable versioned FFmpeg releases. They <b=
r>
do exist now, so in meson based builds, gst-libav just builds the actual <b=
r>
plugin code, meaning that the build time is much shorter, most of the <br>
recipe code (and all of the patches) are gone (because they were FFmpeg <br=
>
specific), and the libgstlibav.so binary in /usr/lib/gstreamer-1.0/ is <br>
much smaller. This also means that FFmpeg specials do not have to be <br>
added both to the FFmpeg and to the gstreamer1.0-libav recipe anymore.<br>
<br>
- gstreamer1.0-plugins.inc was replaced by <br>
gstreamer1.0-plugins-common.inc, and gst-plugins-package.inc by <br>
gstreamer1.0-plugins-packaging.inc . These names are clearer. <br>
gst-plugins-package.inc in particular was named that way because it used <b=
r>
to be shared between GStreamer 0.10 and 1.0 recipes. Since the former <br>
are gone by now, there&#39;s no point in keeping that name.<br>
<br>
- gstreamer1.0 ptest is now done differently. Originally, make was <br>
installed on the target and the Makefile was run by the run-ptest <br>
script. Now, gstreamer is patched to allow for installable tests that <br>
are accompanied by individual shell scripts that set up the necessary <br>
environment variables, along with .test files so that the <br>
gnome-desktop-testing test runner can be used in run-ptest to run the <br>
unit tests. This also makes it possible to inherit from ptest-gnome in <br>
the gstreamer1.0 recipe. The patch against gstreamer is necessary <br>
because by default, one runs the test by executing &quot;meson test&quot;. =
I don&#39;t <br>
think installing meson along with all of the necessary meson.build <br>
scripts is a practical approach.<br>
<br>
- OpenGL packageconfigs now work quite differently in <br>
gstreamer1.0-plugins-base, since the meson options distinguish between <br>
OpenGL APIs, platforms, and windowing systems.<br>
<br>
- zlib in gstreamer1.0-plugins-base and -good is now required. I don&#39;t =
<br>
think this is a big deal, since it is also a dependency of GLib itself, <br=
>
so zlib has to be present on the rootfs anyway.<br>
<br>
<br>
There are some TODOs left that I want to bring up here for discussion:<br>
<br>
- The aforementioned PTest approach needs some review. Also, initially, <br=
>
I thought I&#39;d have to add PTest support to several GStreamer recipes, <=
br>
which is why I isolated the ptest code in gstreamer1.0-ptest.inc . But <br>
it turned out that only the gstreamer1.0 recipe needs it. I am unsure if <b=
r>
I should just merge that .inc into that recipe, since there&#39;s no reason=
 <br>
why the tests from other recipes shouldn&#39;t be &quot;ptest-ified&quot; i=
n the <br>
future. And then that .inc would be useful to have. (Tests from the <br>
plugin sets may be partially tough to run, since some of them create X11 <b=
r>
windows etc.)<br>
<br>
- The code in gstreamer1.0-ptest.inc sets up run-ptest in a rather <br>
uncommon way, since that file has to be autogenerated.<br>
<br>
- <a href=3D"http://gstreamer1.0_1.16.1.bb" rel=3D"noreferrer" target=3D"_b=
lank">gstreamer1.0_1.16.1.bb</a> and gstreamer1.0-plugins-common.inc both <=
br>
contain a &quot;gettext_oemeson&quot; function to set up meson NLS options.=
 <br>
Ideally, this functionality would be part of the gettext bbclass itself. <b=
r>
However, my bitbake/OE knowledge does not suffice to do that, since with <b=
r>
meson, you want to be able to configure what the enable/disable flags <br>
should be (&quot;enabled&quot;/&quot;disabled&quot;, &quot;true&quot;/&quot=
;false&quot; etc.); that&#39;s why for <br>
example the gtk-doc bbclass defines GTKDOC_MESON_OPTION, <br>
GTKDOC_MESON_ENABLE_FLAG, GTKDOC_MESON_DISABLE_FLAG. I am not sure how <br>
to combine such variables with this kind of custom python code, and <br>
still allow for customized values in other recipes. In other words, if I <b=
r>
first get a &quot;NLS_MESON_DISABLE_FLAG&quot; value with getValue() in a m=
odified <br>
gettext_oemeson function, then I might not get the value I expect, since <b=
r>
it will get the initial value (the one set with ?=3D), not necessarily the =
<br>
one that is redefined by a recipe.<br>
<br>
- The OpenGL packageconfigs are handled by a get_opengl_cmdline_list <br>
function in <a href=3D"http://gstreamer1.0-plugins-base_1.16.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">gstreamer1.0-plugins-base_1.16.1.bb</a> . I di=
d this so that a <br>
comma-separated list can be generated out of the packageconfigs that are <b=
r>
(a) part of PACKAGECONFIG and (b) part of the newly added <br>
OPENGL_APIS/OPENGL_PLATFORMS/OPENGL_WINSYS lists. I do not know if <br>
there&#39;s a better approach for this. The intent is that other layers <br=
>
(most notably BSP layers) can add custom packageconfig names to these <br>
lists. One example would be OPENGL_WINSYS +=3D &quot;viv-fb&quot; in meta-f=
reescale. <br>
Another would be OPENGL_WINSYS +=3D &quot;dispmanx&quot; in meta-raspberryp=
i.<br>
<br>
- <a href=3D"http://gstreamer1.0-python_1.16.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">gstreamer1.0-python_1.16.1.bb</a> currently has a problem in t=
hat the <br>
gst-python code tries to load /usr/lib/<a href=3D"http://libpython3.7m.so" =
rel=3D"noreferrer" target=3D"_blank">libpython3.7m.so</a>. But, in a <br>
regular installation, only /usr/lib/libpython3.7m.so.1.0 would be <br>
availale. It is possible to adjust the libpython path &amp; name during the=
 <br>
build. But - what would it be adjusted to? How would the recipe know <br>
that &quot;/usr/lib/libpython3.7m.so.1.0&quot; is the correct choice? Or pe=
rhaps <br>
would it make sense to add the /usr/lib/<a href=3D"http://libpython3.7m.so"=
 rel=3D"noreferrer" target=3D"_blank">libpython3.7m.so</a> symlink to the <=
br>
regular (as in: non-dev) Python package?<br>
<br>
<br>
cheers,<br>
<br>
=C2=A0=C2=A0 Carlos<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000999db90599943b90--
