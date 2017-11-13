Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id BE75F781F7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 10:17:24 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id v186so5149292wma.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 02:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BLFq5bfQf9IoLmUlfi+IOnok7thhGyeTcjKlxLSE/so=;
	b=LCYHNSGWjk6OASrbNnlp+k6oplvoyAr8U8p4VjcKSVO+2n7EAzvN2EtvM+NH9npEPc
	x/lvhprgreXmAfZl3NeJL1zHAGEgDtbkZ6BkijuCLoOkZactO+tbkSKZWNZur6hlokuq
	Dsb2SbdmHZK3+Av0s1L4sDNqLbnIDrB0sLuLQSrdBj42wjesnzzel+HY+b1m0mFg0H2A
	96/vkVO1j2VQj+dIBZNsU/RP+jsQkbj6rNLKmQW7Nl1Ml4gA6WGuOEphitlhFkKjUdKc
	qhvr6X8PN3JlXG/EhRHYlJAP/qCJPZxOpUMC6P2tp5gl5njKbPeF2tdzkXV/axvTPfdL
	ZWQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BLFq5bfQf9IoLmUlfi+IOnok7thhGyeTcjKlxLSE/so=;
	b=rsXzAVzqfcY/qPh2M9Df1wdxMUalXb22qXcyHX4wk53gBgrX2WSfL6KRzguYwxdpXI
	oZblwiciZS1RaNRdgQ8JVfKrhuUpRK7fzpPaB3a1g9doBBj82YPjoHGWspC6asWKoWeD
	ppH1DMrFL2Sxfrd9RorOz2ScwJfZfkp6j9nJiTzEUvBrtQ3vROMLGupDHoBgRK5G6Ubo
	pU22GDIUtdjqUr2RdLUG0vxRbuKofbsgTlM/o8TBTrueNp4XbOd8ebRpnnr12lc51tyM
	7cPvafc3XXEcdC1k8976KnimnQiGnyboFnKQ53yf2c4W7mWkJ9/GSDWFoUuk0jzw9ONc
	JNzA==
X-Gm-Message-State: AJaThX5GPgkYt2VW2r8G7ANdcBYTN1/oEQTKeRBPK0vR++tEOztBF0ke
	mXlSJcApy8jZCgU2N65P7ilxxaJq05JZ71JrGC4=
X-Google-Smtp-Source: AGs4zMaBvUILOIS82z0StgMk5Im+1+189x57992kM78zt4/zPigHhV/EEtG017dDc4MjLux/KrtjDcT2xdNxazb9RsM=
X-Received: by 10.28.218.132 with SMTP id r126mr2011319wmg.59.1510568245545;
	Mon, 13 Nov 2017 02:17:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.173.139 with HTTP; Mon, 13 Nov 2017 02:17:24 -0800 (PST)
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF732EEA151C@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <33D4DBCAC5F2D74E96B07F6E7632BF732EEA151C@G08CNEXMBPEKD01.g08.fujitsu.local>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 13 Nov 2017 11:17:24 +0100
Message-ID: <CA+chaQeoO1_=VWiVuA6XLdYXC9ND6CLM=zf8tQTiEyDKnWo_zQ@mail.gmail.com>
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: do_configure problem about freerdp
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
X-List-Received-Date: Mon, 13 Nov 2017 10:17:25 -0000
Content-Type: multipart/alternative; boundary="001a1145b66aaf4f3d055dda9315"

--001a1145b66aaf4f3d055dda9315
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It was building ok few days ago (check world status e-mails).

I recommend to bisect older metadata to find out which commit broke it and
go from there.

On Mon, Nov 13, 2017 at 3:22 AM, Zheng, Ruoqin <zhengrq.fnst@cn.fujitsu.com=
>
wrote:

> Hi All=EF=BC=9A
>
>
>
>    When I bitbake the freerdp, I met the depends problem about gstreame i=
n
> do_configure=EF=BC=8C do anyone know the reason=EF=BC=9F
>
>
>
>    Here is the log=EF=BC=9A
>
> | -- Checking for module 'gstreamer-app-1.0 >=3D '
>
> | --   Comparison operator but no version after package name
> 'gstreamer-app-1.0' in file '(command line arguments)'
>
> | -- Checking for module 'gstreamer-audio-1.0 >=3D '
>
> | --   Comparison operator but no version after package name
> 'gstreamer-audio-1.0' in file '(command line arguments)'
>
> | -- Checking for module 'gstreamer-fft-1.0 >=3D '
>
> | --   Comparison operator but no version after package name
> 'gstreamer-fft-1.0' in file '(command line arguments)'
>
> | -- Checking for module 'gstreamer-pbutils-1.0 >=3D '
>
> | --   Comparison operator but no version after package name
> 'gstreamer-pbutils-1.0' in file '(command line arguments)'
>
> | -- Checking for module 'gstreamer-video-1.0 >=3D '
>
> | --   Comparison operator but no version after package name
> 'gstreamer-video-1.0' in file '(command line arguments)'
>
> | -- Could NOT find GSTREAMER_1_0 (missing: GSTREAMER_1_0_INCLUDE_DIRS)
>
> | CMake Warning at cmake/FindFeature.cmake:46 (message):
>
> |       feature GStreamer_1_0 was requested but could not be found! ON /
> FALSE
>
> | Call Stack (most recent call first):
>
> |   CMakeLists.txt:625 (find_feature)
>
> |
>
> |
>
> | -- Skipping optional feature JPEG for codec (use JPEG library)
>
> | --     Enable feature JPEG using "-DWITH_JPEG=3DON"
>
> | -- Skipping optional feature x264 for codec (use x264 library)
>
> | --     Enable feature x264 using "-DWITH_X264=3DON"
>
> | -- Skipping optional feature OpenH264 for codec (use OpenH264 library)
>
> | --     Enable feature OpenH264 using "-DWITH_OPENH264=3DON"
>
> | -- Skipping optional feature GSM for codec (GSM audio codec library)
>
> | --     Enable feature GSM using "-DWITH_GSM=3DON"
>
> | -- FreeRDP GIT
>
> | -- Finding recommended feature XKBFile for X11 keyboard (X11 keyboard
> file extension)
>
> | --     Disable feature XKBFile using "-DWITH_XKBFILE=3DOFF"
>
> | -- Found XKBFile: /yocto/work001/fnst/zrq/community/build_master/tmp/
> work/i586-poky-linux/freerdp/1.2.5+gitrAUTOINC+62da9d28c6-
> r0/recipe-sysroot/usr/lib/libxkbfile.so
>
> | -- FreeRDP GIT
>
> | -- Adding dynamic channel client server "audin": Audio Input Redirectio=
n
> Virtual Channel Extension
>
> | -- Adding static channel client server "cliprdr": Clipboard Virtual
> Channel Extension
>
> | -- Adding dynamic channel client "disp": Display Update Virtual Channel
> Extension
>
> | -- Adding static channel client server "drdynvc": Dynamic Virtual
> Channel Extension
>
> | -- Adding device channel client "drive": Drive Redirection Virtual
> Channel Extension
>
> | -- Adding dynamic channel client server "echo": Echo Virtual Channel
> Extension
>
> | -- Adding static channel client server "encomsp": Multiparty Virtual
> Channel Extension
>
> | -- Adding device channel client "parallel": Parallel Port Virtual
> Channel Extension
>
> | -- Adding device channel client "printer": Print Virtual Channel
> Extension
>
> | -- Adding static channel client "rail": Remote Programs Virtual Channel
> Extension
>
> | -- Adding static channel client server "rdpdr": Device Redirection
> Virtual Channel Extension
>
> | -- Adding dynamic channel client "rdpei": Input Virtual Channel Extensi=
on
>
> | -- Adding dynamic channel client "rdpgfx": Graphics Pipeline Extension
>
> | -- Adding static channel client server "rdpsnd": Audio Output Virtual
> Channel Extension
>
> | -- Adding static channel client server "remdesk": Remote Assistance
> Virtual Channel Extension
>
> | -- Adding device channel client "serial": Serial Port Virtual Channel
> Extension
>
> | -- Adding device channel client "smartcard": Smart Card Virtual Channel
> Extension
>
> | -- Adding dynamic channel client "tsmf": Video Redirection Virtual
> Channel Extension
>
> | -- Finding required feature XRandR for X11 randr (X11 randr extension)
>
> | -- Found XRANDR: /yocto/work001/fnst/zrq/community/build_master/tmp/
> work/i586-poky-linux/freerdp/1.2.5+gitrAUTOINC+62da9d28c6-
> r0/recipe-sysroot/usr/lib/libXrandr.so
>
> | CMake Error at channels/tsmf/client/gstreamer/CMakeLists.txt:21
> (message):
>
> |   GStreamer library not found, but required for TSMF module.
>
> |
>
> |
>
> | -- Configuring incomplete, errors occurred!
>
> | See also "/yocto/work001/fnst/zrq/community/build_master/tmp/
> work/i586-poky-linux/freerdp/1.2.5+gitrAUTOINC+62da9d28c6-
> r0/build/CMakeFiles/CMakeOutput.log".
>
> | See also "/yocto/work001/fnst/zrq/community/build_master/tmp/
> work/i586-poky-linux/freerdp/1.2.5+gitrAUTOINC+62da9d28c6-
> r0/build/CMakeFiles/CMakeError.log".
>
> | WARNING: exit code 1 from a shell command.
>
> | ERROR: Function failed: do_configure (log file is located at
> /yocto/work001/fnst/zrq/community/build_master/tmp/
> work/i586-poky-linux/freerdp/1.2.5+gitrAUTOINC+62da9d28c6-
> r0/temp/log.do_configure.28012)
>
> ERROR: Task (/yocto/work001/fnst/zrq/community/yocto/meta-
> openembedded/meta-oe/recipes-support/freerdp/freerdp_git.bb:do_configure)
> failed with exit code '1'
>
>
>
> Second Keyboard Interrupt, stopping...
>
>
>
>
>
> --------------------------------------------------
>
> Zheng Ruoqin
>
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST)
>
> ADDR.: No.6 Wenzhu Road, Software Avenue,
>
>        Nanjing, 210012, China
>
> MAIL : zhengrq.fnst@cn.fujistu.com
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a1145b66aaf4f3d055dda9315
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It was building ok few days ago (check world status e-mail=
s).<div><br></div><div>I recommend to bisect older metadata to find out whi=
ch commit broke it and go from there.</div></div><div class=3D"gmail_extra"=
><br><div class=3D"gmail_quote">On Mon, Nov 13, 2017 at 3:22 AM, Zheng, Ruo=
qin <span dir=3D"ltr">&lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.com" ta=
rget=3D"_blank">zhengrq.fnst@cn.fujitsu.com</a>&gt;</span> wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">





<div lang=3D"ZH-CN" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"m_4102973037033044779WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi All</span><span style=3D"fon=
t-family:=E5=AE=8B=E4=BD=93">=EF=BC=9A</span><span lang=3D"EN-US"><u></u><u=
></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0 When I bitbake the=
 freerdp, I met the depends problem about gstreame in do_configure</span><s=
pan style=3D"font-family:=E5=AE=8B=E4=BD=93">=EF=BC=8C</span>
<span lang=3D"EN-US">do anyone know the reason</span><span style=3D"font-fa=
mily:=E5=AE=8B=E4=BD=93">=EF=BC=9F</span><span lang=3D"EN-US"><u></u><u></u=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0 Here is the log</s=
pan><span style=3D"font-family:=E5=AE=8B=E4=BD=93">=EF=BC=9A</span><span la=
ng=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
-- Checking for module &#39;gstreamer-app-1.0 &gt;=3D &#39;<u></u><u></u></=
span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
--=C2=A0=C2=A0 Comparison operator but no version after package name &#39;g=
streamer-app-1.0&#39; in file &#39;(command line arguments)&#39;<u></u><u><=
/u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
-- Checking for module &#39;gstreamer-audio-1.0 &gt;=3D &#39;<u></u><u></u>=
</span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
--=C2=A0=C2=A0 Comparison operator but no version after package name &#39;g=
streamer-audio-1.0&#39; in file &#39;(command line arguments)&#39;<u></u><u=
></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
-- Checking for module &#39;gstreamer-fft-1.0 &gt;=3D &#39;<u></u><u></u></=
span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
--=C2=A0=C2=A0 Comparison operator but no version after package name &#39;g=
streamer-fft-1.0&#39; in file &#39;(command line arguments)&#39;<u></u><u><=
/u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
-- Checking for module &#39;gstreamer-pbutils-1.0 &gt;=3D &#39;<u></u><u></=
u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
--=C2=A0=C2=A0 Comparison operator but no version after package name &#39;g=
streamer-pbutils-1.0&#39; in file &#39;(command line arguments)&#39;<u></u>=
<u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
-- Checking for module &#39;gstreamer-video-1.0 &gt;=3D &#39;<u></u><u></u>=
</span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
--=C2=A0=C2=A0 Comparison operator but no version after package name &#39;g=
streamer-video-1.0&#39; in file &#39;(command line arguments)&#39;<u></u><u=
></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
-- Could NOT find GSTREAMER_1_0 (missing: GSTREAMER_1_0_INCLUDE_DIRS)<u></u=
><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
CMake Warning at cmake/FindFeature.cmake:46 (message):<u></u><u></u></span>=
</p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">|=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 feature GStreamer_1_0 was requested bu=
t could not be found! ON / FALSE<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
Call Stack (most recent call first):<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">|=
=C2=A0=C2=A0 CMakeLists.txt:625 (find_feature)<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">|<=
u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">|<=
u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
-- Skipping optional feature JPEG for codec (use JPEG library)<u></u><u></u=
></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
--=C2=A0=C2=A0=C2=A0=C2=A0 Enable feature JPEG using &quot;-DWITH_JPEG=3DON=
&quot;<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
-- Skipping optional feature x264 for codec (use x264 library)<u></u><u></u=
></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
--=C2=A0=C2=A0=C2=A0=C2=A0 Enable feature x264 using &quot;-DWITH_X264=3DON=
&quot;<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
-- Skipping optional feature OpenH264 for codec (use OpenH264 library)<u></=
u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
--=C2=A0=C2=A0=C2=A0=C2=A0 Enable feature OpenH264 using &quot;-DWITH_OPENH=
264=3DON&quot;<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
-- Skipping optional feature GSM for codec (GSM audio codec library)<u></u>=
<u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
--=C2=A0=C2=A0=C2=A0=C2=A0 Enable feature GSM using &quot;-DWITH_GSM=3DON&q=
uot;<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
-- FreeRDP GIT<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
-- Finding recommended feature XKBFile for X11 keyboard (X11 keyboard file =
extension)<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
--=C2=A0=C2=A0=C2=A0=C2=A0 Disable feature XKBFile using &quot;-DWITH_XKBFI=
LE=3DOFF&quot;<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
-- Found XKBFile: /yocto/work001/fnst/zrq/<wbr>community/build_master/tmp/<=
wbr>work/i586-poky-linux/freerdp/<wbr>1.2.5+gitrAUTOINC+62da9d28c6-<wbr>r0/=
recipe-sysroot/usr/lib/<wbr>libxkbfile.so<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
-- FreeRDP GIT<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
-- Adding dynamic channel client server &quot;audin&quot;: Audio Input Redi=
rection Virtual Channel Extension<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
-- Adding static channel client server &quot;cliprdr&quot;: Clipboard Virtu=
al Channel Extension<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
-- Adding dynamic channel client &quot;disp&quot;: Display Update Virtual C=
hannel Extension<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
-- Adding static channel client server &quot;drdynvc&quot;: Dynamic Virtual=
 Channel Extension<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
-- Adding device channel client &quot;drive&quot;: Drive Redirection Virtua=
l Channel Extension<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
-- Adding dynamic channel client server &quot;echo&quot;: Echo Virtual Chan=
nel Extension<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
-- Adding static channel client server &quot;encomsp&quot;: Multiparty Virt=
ual Channel Extension<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
-- Adding device channel client &quot;parallel&quot;: Parallel Port Virtual=
 Channel Extension<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
-- Adding device channel client &quot;printer&quot;: Print Virtual Channel =
Extension<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
-- Adding static channel client &quot;rail&quot;: Remote Programs Virtual C=
hannel Extension<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
-- Adding static channel client server &quot;rdpdr&quot;: Device Redirectio=
n Virtual Channel Extension<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
-- Adding dynamic channel client &quot;rdpei&quot;: Input Virtual Channel E=
xtension<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
-- Adding dynamic channel client &quot;rdpgfx&quot;: Graphics Pipeline Exte=
nsion<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
-- Adding static channel client server &quot;rdpsnd&quot;: Audio Output Vir=
tual Channel Extension<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
-- Adding static channel client server &quot;remdesk&quot;: Remote Assistan=
ce Virtual Channel Extension<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
-- Adding device channel client &quot;serial&quot;: Serial Port Virtual Cha=
nnel Extension<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
-- Adding device channel client &quot;smartcard&quot;: Smart Card Virtual C=
hannel Extension<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
-- Adding dynamic channel client &quot;tsmf&quot;: Video Redirection Virtua=
l Channel Extension<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
-- Finding required feature XRandR for X11 randr (X11 randr extension)<u></=
u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
-- Found XRANDR: /yocto/work001/fnst/zrq/<wbr>community/build_master/tmp/<w=
br>work/i586-poky-linux/freerdp/<wbr>1.2.5+gitrAUTOINC+62da9d28c6-<wbr>r0/r=
ecipe-sysroot/usr/lib/<wbr>libXrandr.so<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
CMake Error at channels/tsmf/client/<wbr>gstreamer/CMakeLists.txt:21 (messa=
ge):<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">|=
=C2=A0=C2=A0
<span style=3D"color:red">GStreamer library not found, but required for TSM=
F module.<u></u><u></u></span></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">|<=
u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">|<=
u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
-- Configuring incomplete, errors occurred!<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
See also &quot;/yocto/work001/fnst/zrq/<wbr>community/build_master/tmp/<wbr=
>work/i586-poky-linux/freerdp/<wbr>1.2.5+gitrAUTOINC+62da9d28c6-<wbr>r0/bui=
ld/CMakeFiles/<wbr>CMakeOutput.log&quot;.<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
See also &quot;/yocto/work001/fnst/zrq/<wbr>community/build_master/tmp/<wbr=
>work/i586-poky-linux/freerdp/<wbr>1.2.5+gitrAUTOINC+62da9d28c6-<wbr>r0/bui=
ld/CMakeFiles/<wbr>CMakeError.log&quot;.<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
WARNING: exit code 1 from a shell command.<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">| =
ERROR: Function failed: do_configure (log file is located at /yocto/work001=
/fnst/zrq/<wbr>community/build_master/tmp/<wbr>work/i586-poky-linux/freerdp=
/<wbr>1.2.5+gitrAUTOINC+62da9d28c6-<wbr>r0/temp/log.do_configure.<wbr>28012=
)<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">ER=
ROR: Task (/yocto/work001/fnst/zrq/<wbr>community/yocto/meta-<wbr>openembed=
ded/meta-oe/recipes-<wbr>support/freerdp/freerdp_git.<wbr>bb:do_configure) =
failed with exit code &#39;1&#39;<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US"><u=
></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt"><span lang=3D"EN-US">Se=
cond Keyboard Interrupt, stopping...<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US">------------------------------<wbr>--------------------<u></u><u=
></u></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US">Zheng Ruoqin<u></u><u></u></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US">Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST)<u></u><u></=
u></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US">ADDR.: No.6 Wenzhu Road, Software Avenue,<u></u><u></u></span></=
p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Nanjing, 210012, China<u></=
u><u></u></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US">MAIL : <a href=3D"mailto:zhengrq.fnst@cn.fujistu.com" target=3D"=
_blank">zhengrq.fnst@cn.fujistu.com</a><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
</div>

<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div>

--001a1145b66aaf4f3d055dda9315--
