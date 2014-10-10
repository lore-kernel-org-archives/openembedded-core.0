Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f170.google.com (mail-vc0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 06F3D6AC7B;
	Fri, 10 Oct 2014 10:50:43 +0000 (UTC)
Received: by mail-vc0-f170.google.com with SMTP id hy10so2449229vcb.1
	for <multiple recipients>; Fri, 10 Oct 2014 03:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=xFN6pKNQjkHNTX58pMqUJo73hpyYVOHrfJkcjOYRq7s=;
	b=Qi19cRVi54S6H+j3zUf+o84+5rQNsVQDSmN43brDhXywn4k2iWYgCmWhbtGrQpsU/X
	6ZdrXzjSKJW9Wq+bR4aJJcXZUELJpYAgRSrI84qxr8Fk/i+91YwYbfbUIUYF6SWGUllF
	Du2l8EMLvyVaklEgxet0HaLn97nfn4fxERsCAh+esV7giC9HbCh5uLVbAljQE6SNMcEz
	LtlHSPcZAix0FhDBhoxc+T1IxnezptlEQv+Pasxhp3ViID3BhKW/2HCYTSWxX18IAdfR
	apunBKWCUklJVO1ZjpAhkWDlSeQ2Dciv1aKvMY3JYK/oXj0xUz5QF3CkLi+z836VFd6+
	sYJw==
MIME-Version: 1.0
X-Received: by 10.220.167.9 with SMTP id o9mr3737281vcy.22.1412938245069; Fri,
	10 Oct 2014 03:50:45 -0700 (PDT)
Received: by 10.52.171.233 with HTTP; Fri, 10 Oct 2014 03:50:44 -0700 (PDT)
In-Reply-To: <20141010103438.GI12322@jama>
References: <20141010103438.GI12322@jama>
Date: Fri, 10 Oct 2014 12:50:44 +0200
Message-ID: <CALbNGRQ3LiR5wFH2waQmDQ5ppd2JXZeAiGbhBZN=fNiKAzuGbQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2014-10-10, QA issues
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
X-List-Received-Date: Fri, 10 Oct 2014 10:50:50 -0000
Content-Type: multipart/alternative; boundary=089e015366882fdeaf05050f52f3

--089e015366882fdeaf05050f52f3
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 10, 2014 at 12:34 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Both issues are caused by pending reviews (vlc is
> broken by opencv upgrade). So this is the first "clean"
> report (except that couple fixes are still only in
> jansa/master branches and on MLs, but not yet merged).
>
> Next goal: clean QA log, see bellow.
>
> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> == Failed tasks 2014-10-10 ==
>
> === common (2) ===
>     * meta-openembedded/meta-multimedia/recipes-multimedia/vlc/
> vlc_2.1.4.bb, do_compile
>     * meta-openembedded/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb,
> do_configure
>
> === common-x86 (0) ===
>
> === qemuarm (0) ===
>
> === qemux86 (0) ===
>
> === qemux86_64 (0) ===
>
> === Number of failed tasks ===
> {| class=wikitable
> |-
> ||qemuarm       ||2     ||
> http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20141009_050706.log/||http://errors.yoctoproject.org:80/Errors/Search/1/2906/
> |-
> ||qemux86       ||2     ||
> http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20141009_060811.log/||http://errors.yoctoproject.org:80/Errors/Search/1/2907/
> |-
> ||qemux86_64    ||2     ||
> http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20141009_071120.log/||http://errors.yoctoproject.org:80/Errors/Search/1/2908/
> |}
>
> QA issues (per issue type, because of spam from new file-deps check)
>
> $ logs="log.world.2014100*"; for t in already-stripped libdir textrel
> build-deps file-rdeps version-going-backwards; do count=`cat $logs/qa.log |
> sort -u | grep "\[$t\]" | wc -l`; echo "$count   $t:"; done; for t in
> already-stripped libdir textrel build-deps file-rdeps
> version-going-backwards; do count=`cat $logs/qa.log | sort -u | grep
> "\[$t\]" | wc -l`; echo "$count $t:"; cat $logs/qa.log | sort -u | grep
> "\[$t\]" | sed 's#/home/jenkins/oe/world/shr-core/tmp-glibc/#/tmp/#g';
> echo; echo; done
>
> 3       already-stripped:
> 2       libdir:
> 18      textrel:
> 18      build-deps:
> 361     file-rdeps:
> 36      version-going-backwards:
>
> 3       already-stripped:
> qwt-6.0.1: File '/usr/lib/libqwt.so.6.0.1' from qwt was already stripped,
> this will prevent future debugging! [already-stripped]
> qwt-6.0.1: File '/usr/lib/libqwtmathml.so.6.0.1' from qwt was already
> stripped, this will prevent future debugging! [already-stripped]
> qwt-6.0.1: File '/usr/lib/qt4/plugins/designer/libqwt_designer_plugin.so'
> from qwt was already stripped, this will prevent future debugging!
> [already-stripped]
>
>
> 2       libdir:
> chromium-37.0.2062.94: chromium: found library in wrong location:
> /usr/bin/chrome/libffmpegsumo.so [libdir]
> chromium-dbg: found library in wrong location:
> /usr/bin/chrome/.debug/libffmpegsumo.so [libdir]
>
>
> 18      textrel:
> chromium-37.0.2062.94: ELF binary
> '/tmp/work/i586-oe-linux/chromium/37.0.2062.94-r0/packages-split/chromium/usr/bin/chrome/libffmpegsumo.so'
> has relocations in .text [textrel]
> gstreamer1.0-libav-1.4.1: ELF binary
> '/tmp/work/armv5te-oe-linux-gnueabi/gstreamer1.0-libav/1.4.1-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libgstlibav.so'
> has relocations in .text [textrel]
> gstreamer1.0-libav-1.4.1: ELF binary
> '/tmp/work/i586-oe-linux/gstreamer1.0-libav/1.4.1-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libgstlibav.so'
> has relocations in .text [textrel]
> libav-9.16: ELF binary
> '/tmp/work/armv5te-oe-linux-gnueabi/libav/9.16-r0/packages-split/libavcodec/usr/lib/libavcodec.so.54.35.0'
> has relocations in .text [textrel]
> libav-9.16: ELF binary
> '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libavcodec/usr/lib/libavcodec.so.54.35.0'
> has relocations in .text [textrel]
> libav-9.16: ELF binary
> '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libavdevice/usr/lib/libavdevice.so.53.2.0'
> has relocations in .text [textrel]
> libav-9.16: ELF binary
> '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libavfilter/usr/lib/libavfilter.so.3.3.0'
> has relocations in .text [textrel]
> libav-9.16: ELF binary
> '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libavformat/usr/lib/libavformat.so.54.20.4'
> has relocations in .text [textrel]
> libav-9.16: ELF binary
> '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libavresample/usr/lib/libavresample.so.1.0.1'
> has relocations in .text [textrel]
> libav-9.16: ELF binary
> '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libavutil/usr/lib/libavutil.so.52.3.0'
> has relocations in .text [textrel]
> libav-9.16: ELF binary
> '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libswscale/usr/lib/libswscale.so.2.1.1'
> has relocations in .text [textrel]
> libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary
> '/tmp/work/armv5te-oe-linux-gnueabi/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/libpostproc/usr/lib/libpostproc.so.52.3.0'
> has relocations in .text [textrel]
> libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary
> '/tmp/work/i586-oe-linux/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/libpostproc/usr/lib/libpostproc.so.52.3.0'
> has relocations in .text [textrel]
> mpg123-1.19.0: ELF binary
> '/tmp/work/i586-oe-linux/mpg123/1.19.0-r0/packages-split/mpg123/usr/lib/libmpg123.so.0.40.1'
> has relocations in .text [textrel]
> qtwebengine-5.3.2: ELF binary
> '/tmp/work/armv5te-oe-linux-gnueabi/qtwebengine/5.3.2-r0/packages-split/qtwebengine/usr/lib/libQt0WebEngineCore.so.0.9.0'
> has relocations in .text [textrel]
> qtwebkit-5.3.2: ELF binary
> '/tmp/work/i586-oe-linux/qtwebkit/5.3.2-r0/packages-split/qtwebkit/usr/lib/libQt5WebKit.so.5.3.2'
> has relocations in .text [textrel]
> webkit-efl-1.11.0: ELF binary
> '/tmp/work/i586-oe-linux/webkit-efl/1_1.11.0-r0/packages-split/webkit-efl/usr/lib/libjavascriptcore_efl.so.1.11.0'
> has relocations in .text [textrel]
> webkit-gtk-1.8.3: ELF binary
> '/tmp/work/i586-oe-linux/webkit-gtk/1.8.3-r1/packages-split/libjavascriptcore/usr/lib/libjavascriptcoregtk-1.0.so.0.13.4'
> has relocations in .text [textrel]
>
>
> 18      build-deps:
> exquisite-0.0.1+svnr82070: exquisite rdepends on initscripts-functions,
> but it isn't a build dependency? [build-deps]
> gpm-1.99.7: gpm rdepends on initscripts-functions, but it isn't a build
> dependency? [build-deps]
> irda-utils-0.9.18: irda-utils rdepends on initscripts-functions, but it
> isn't a build dependency? [build-deps]
> libwebp-0.4.0: libwebp-bin rdepends on libgl-mesa, but it isn't a build
> dependency? [build-deps]
> libwebp-0.4.0: libwebp-bin rdepends on mesa-glut, but it isn't a build
> dependency? [build-deps]
> opencv-2.99+3.0.0-alpha+gitAUTOINC+fb9a143429: libopencv-highgui rdepends
> on gtk+3, but it isn't a build dependency? [build-deps]
> opencv-2.99+3.0.0-alpha+gitAUTOINC+fb9a143429: libopencv-videoio rdepends
> on gstreamer1.0, but it isn't a build dependency? [build-deps]
> opencv-2.99+3.0.0-alpha+gitAUTOINC+fb9a143429: libopencv-videoio rdepends
> on libgstapp-1.0, but it isn't a build dependency? [build-deps]
> opencv-2.99+3.0.0-alpha+gitAUTOINC+fb9a143429: libopencv-videoio rdepends
> on libgstpbutils-1.0, but it isn't a build dependency? [build-deps]
> opencv-2.99+3.0.0-alpha+gitAUTOINC+fb9a143429: libopencv-videoio rdepends
> on libgstriff-1.0, but it isn't a build dependency? [build-deps]
> proftpd-1.3.4b: proftpd rdepends on initscripts-functions, but it isn't a
> build dependency? [build-deps]
> sysklogd-1.5: sysklogd rdepends on initscripts-functions, but it isn't a
> build dependency? [build-deps]
> tracker-0.14.2: tracker rdepends on libnmglib, but it isn't a build
> dependency? [build-deps]
> tracker-0.14.2: tracker rdepends on libnmutil, but it isn't a build
> dependency? [build-deps]
> tracker-0.14.2: tracker rdepends on nss, but it isn't a build dependency?
> [build-deps]
> tumbler-0.1.30: tumbler rdepends on gstreamer1.0, but it isn't a build
> dependency? [build-deps]
> tumbler-0.1.30: tumbler rdepends on libgsttag-1.0, but it isn't a build
> dependency? [build-deps]
> xinetd-2.3.15: xinetd rdepends on initscripts-functions, but it isn't a
> build dependency? [build-deps]
>
>
> 361     file-rdeps:
> chkconfig-1.3.58: chkconfig requires libnewt.so()(64bit), but no providers
> in its RDEPENDS [file-rdeps]
> chkconfig-1.3.58: chkconfig requires libnewt.so, but no providers in its
> RDEPENDS [file-rdeps]
> cloud9-0.6: cloud9 requires /bin/bash, but no providers in its RDEPENDS
> [file-rdeps]
> cpu-0.0.1+svnr82070: cpu requires libpulsecommon-5.0.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> cpu-0.0.1+svnr82070: cpu requires libpulsecommon-5.0.so, but no providers
> in its RDEPENDS [file-rdeps]
> diskio-0.0.1+svnr82070: diskio requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> diskio-0.0.1+svnr82070: diskio requires libpulsecommon-5.0.so, but no
> providers in its RDEPENDS [file-rdeps]
> docbook-xsl-stylesheets-1.78.1: docbook-xsl-stylesheets requires
> /usr/bin/perl, /bin/bash, but no providers in its RDEPENDS [file-rdeps]
> dpkg-1.17.4: dpkg requires /usr/bin/perl, but no providers in its RDEPENDS
> [file-rdeps]
> dvb-apps-1.1.1: dvb-apps requires libucsi.so()(64bit),
> libdvbapi.so()(64bit), libdvbcfg.so()(64bit), libdvben50221.so()(64bit),
> libdvbsec.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvb-apps requires libucsi.so, libdvben50221.so,
> libdvbsec.so, libdvbcfg.so, libdvbapi.so, but no providers in its RDEPENDS
> [file-rdeps]
> dvb-apps-1.1.1: dvb-femon requires libdvbapi.so()(64bit), but no providers
> in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvb-femon requires libdvbapi.so, but no providers in its
> RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvb-scan requires libdvbsec.so()(64bit),
> libdvbapi.so()(64bit), libdvbcfg.so()(64bit), but no providers in its
> RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvb-scan requires libdvbsec.so, libdvbcfg.so,
> libdvbapi.so, but no providers in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvbdate requires libucsi.so()(64bit),
> libdvbapi.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvbdate requires libucsi.so, libdvbapi.so, but no
> providers in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvbnet requires libdvbapi.so()(64bit), but no providers in
> its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvbnet requires libdvbapi.so, but no providers in its
> RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvbtraffic requires libdvbapi.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvbtraffic requires libdvbapi.so, but no providers in its
> RDEPENDS [file-rdeps]
> e-wm-0.18.8: e-wm requires libpulsecommon-5.0.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> e-wm-0.18.8: e-wm requires libpulsecommon-5.0.so, but no providers in its
> RDEPENDS [file-rdeps]
> efl-1.11.2: ecore-audio requires libpulsecommon-5.0.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> efl-1.11.2: ecore-audio requires libpulsecommon-5.0.so, but no providers
> in its RDEPENDS [file-rdeps]
> efl-1.11.2: edje requires libpulsecommon-5.0.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> efl-1.11.2: edje requires libpulsecommon-5.0.so, but no providers in its
> RDEPENDS [file-rdeps]
> efl-1.11.2: ethumb requires libpulsecommon-5.0.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> efl-1.11.2: ethumb requires libpulsecommon-5.0.so, but no providers in
> its RDEPENDS [file-rdeps]
> elementary-1.11.2: elementary requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> elementary-1.11.2: elementary requires libpulsecommon-5.0.so, but no
> providers in its RDEPENDS [file-rdeps]
> elementary-1.11.2: elementary-accessibility requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> elementary-1.11.2: elementary-accessibility requires libpulsecommon-5.0.so,
> but no providers in its RDEPENDS [file-rdeps]
> elementary-1.11.2: elementary-tests requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> elementary-1.11.2: elementary-tests requires libpulsecommon-5.0.so, but
> no providers in its RDEPENDS [file-rdeps]
> elfe-0.0.1+gitrAUTOINC+1ec0e7713c: elfe requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> elfe-0.0.1+gitrAUTOINC+1ec0e7713c: elfe requires libpulsecommon-5.0.so,
> but no providers in its RDEPENDS [file-rdeps]
> estardict-0.7: estardict requires libpulsecommon-5.0.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> estardict-0.7: estardict requires libpulsecommon-5.0.so, but no providers
> in its RDEPENDS [file-rdeps]
> exalt-client-0.0.1+svnr82070: exalt-client requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> exalt-client-0.0.1+svnr82070: exalt-client requires libpulsecommon-5.0.so,
> but no providers in its RDEPENDS [file-rdeps]
> exquisite-0.0.1+svnr82070: exquisite requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> exquisite-0.0.1+svnr82070: exquisite requires libpulsecommon-5.0.so, but
> no providers in its RDEPENDS [file-rdeps]
> fakeroot-1.18.4: fakeroot requires /bin/bash, but no providers in its
> RDEPENDS [file-rdeps]
> fbida-2.09+gitAUTOINC+6aa5563cb3: fbida requires /bin/bash, but no
> providers in its RDEPENDS [file-rdeps]
> flame-0.0.3+svnr82070: flame requires libpulsecommon-5.0.so()(64bit), but
> no providers in its RDEPENDS [file-rdeps]
> flame-0.0.3+svnr82070: flame requires libpulsecommon-5.0.so, but no
> providers in its RDEPENDS [file-rdeps]
> fluidsynth-1.1.6: fluidsynth requires libpulsecommon-5.0.so()(64bit), but
> no providers in its RDEPENDS [file-rdeps]
> fluidsynth-1.1.6: fluidsynth requires libpulsecommon-5.0.so, but no
> providers in its RDEPENDS [file-rdeps]
> forecasts-0.2.0+svnr82070: forecasts requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> forecasts-0.2.0+svnr82070: forecasts requires libpulsecommon-5.0.so, but
> no providers in its RDEPENDS [file-rdeps]
> foxtrotgps-1.1.1: foxtrotgps requires /usr/bin/python, /usr/bin/perl, but
> no providers in its RDEPENDS [file-rdeps]
> fsodeviced-0.12.0: fsodeviced-module-accelerometer-kxsd9 requires
> libfsodevice.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> fsodeviced-0.12.0: fsodeviced-module-accelerometer-kxsd9 requires
> libfsodevice.so, but no providers in its RDEPENDS [file-rdeps]
> fsodeviced-0.12.0: fsodeviced-module-accelerometer-lis302 requires
> libfsodevice.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> fsodeviced-0.12.0: fsodeviced-module-accelerometer-lis302 requires
> libfsodevice.so, but no providers in its RDEPENDS [file-rdeps]
> fsodeviced-0.12.0: fsodeviced-module-backlight-omappanel requires
> libfsodevice.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> fsodeviced-0.12.0: fsodeviced-module-backlight-omappanel requires
> libfsodevice.so, but no providers in its RDEPENDS [file-rdeps]
> fsodeviced-0.12.0: fsodeviced-module-n900-quirks requires
> libfsodevice.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> fsodeviced-0.12.0: fsodeviced-module-n900-quirks requires libfsodevice.so,
> but no providers in its RDEPENDS [file-rdeps]
> fsodeviced-0.12.0: fsodeviced-module-openmoko-powercontrol requires
> libfsodevice.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> fsodeviced-0.12.0: fsodeviced-module-openmoko-powercontrol requires
> libfsodevice.so, but no providers in its RDEPENDS [file-rdeps]
> fsodeviced-0.12.0: fsodeviced-module-vibrator-omapvibe requires
> libfsodevice.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> fsodeviced-0.12.0: fsodeviced-module-vibrator-omapvibe requires
> libfsodevice.so, but no providers in its RDEPENDS [file-rdeps]
> fsodeviced-0.12.0: fsodeviced-module-vibrator-timedoutputclass requires
> libfsodevice.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> fsodeviced-0.12.0: fsodeviced-module-vibrator-timedoutputclass requires
> libfsodevice.so, but no providers in its RDEPENDS [file-rdeps]
> fsogsmd-0.12.99+gitrAUTOINC+12843f053c:
> fsogsmd-module-lowlevel-motorola-ezx requires libfsogsm.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> fsogsmd-0.12.99+gitrAUTOINC+12843f053c:
> fsogsmd-module-lowlevel-motorola-ezx requires libfsogsm.so, but no
> providers in its RDEPENDS [file-rdeps]
> fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-lowlevel-openmoko
> requires libfsogsm.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-lowlevel-openmoko
> requires libfsogsm.so, but no providers in its RDEPENDS [file-rdeps]
> fsogsmd-0.12.99+gitrAUTOINC+12843f053c:
> fsogsmd-module-lowlevel-samsung-crespo requires libfsogsm.so()(64bit), but
> no providers in its RDEPENDS [file-rdeps]
> fsogsmd-0.12.99+gitrAUTOINC+12843f053c:
> fsogsmd-module-lowlevel-samsung-crespo requires libfsogsm.so, but no
> providers in its RDEPENDS [file-rdeps]
> fsogsmd-0.12.99+gitrAUTOINC+12843f053c:
> fsogsmd-module-modem-freescale-neptune requires libfsogsm.so()(64bit), but
> no providers in its RDEPENDS [file-rdeps]
> fsogsmd-0.12.99+gitrAUTOINC+12843f053c:
> fsogsmd-module-modem-freescale-neptune requires libfsogsm.so, but no
> providers in its RDEPENDS [file-rdeps]
> fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-nokia-isi
> requires libfsogsm.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-nokia-isi
> requires libfsogsm.so, but no providers in its RDEPENDS [file-rdeps]
> fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-option-gtm601
> requires libfsogsm.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-option-gtm601
> requires libfsogsm.so, but no providers in its RDEPENDS [file-rdeps]
> fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-qualcomm-htc
> requires libfsogsm.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-qualcomm-htc
> requires libfsogsm.so, but no providers in its RDEPENDS [file-rdeps]
> fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-samsung
> requires libfsogsm.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-samsung
> requires libfsogsm.so, but no providers in its RDEPENDS [file-rdeps]
> fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-ti-calypso
> requires libfsogsm.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-ti-calypso
> requires libfsogsm.so, but no providers in its RDEPENDS [file-rdeps]
> gammu-1.32.0: gammu requires /bin/bash, but no providers in its RDEPENDS
> [file-rdeps]
> gammu-1.32.0: gammu-dev requires /bin/bash, but no providers in its
> RDEPENDS [file-rdeps]
> gateone-1.2: gateone requires /usr/bin/perl, /bin/bash, but no providers
> in its RDEPENDS [file-rdeps]
> giflib-4.1.6: giflib-utils requires /usr/bin/perl, but no providers in its
> RDEPENDS [file-rdeps]
> glibmm-2.36.2: glibmm-dev requires /usr/bin/perl, but no providers in its
> RDEPENDS [file-rdeps]
> gmtk-1.0.5: gmtk requires libpulsecommon-5.0.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> gmtk-1.0.5: gmtk requires libpulsecommon-5.0.so, but no providers in its
> RDEPENDS [file-rdeps]
> gnome-desktop-2.32.1: gnome-desktop requires /usr/bin/python, but no
> providers in its RDEPENDS [file-rdeps]
> gnome-panel-2.32.1: gnome-panel requires /usr/bin/python, but no providers
> in its RDEPENDS [file-rdeps]
> groff-1.22.2: groff requires /bin/sed, but no providers in its RDEPENDS
> [file-rdeps]
> gst-plugins-good-0.10.31: gst-plugins-good-pulse requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> gst-plugins-good-0.10.31: gst-plugins-good-pulse requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> gstreamer1.0-plugins-good-1.4.1: gstreamer1.0-plugins-good-pulse requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> gstreamer1.0-plugins-good-1.4.1: gstreamer1.0-plugins-good-pulse requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> gupnp-0.20.12: gupnp-dev requires /usr/bin/python, but no providers in its
> RDEPENDS [file-rdeps]
> hplip-3.12.6: hplip-filter requires /usr/bin/perl, but no providers in its
> RDEPENDS [file-rdeps]
> libbonobo-2.32.1: libbonobo requires /usr/bin/perl, but no providers in
> its RDEPENDS [file-rdeps]
> libcanberra-0.29: libcanberra-pulse requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> libcanberra-0.29: libcanberra-pulse requires libpulsecommon-5.0.so, but
> no providers in its RDEPENDS [file-rdeps]
> libeflvala-2011.01.13.1+svnr82070: libeflvala requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> libeflvala-2011.01.13.1+svnr82070: libeflvala requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> libeweather-0.0.0+svnr82070: libeweather requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> libeweather-0.0.0+svnr82070: libeweather requires libpulsecommon-5.0.so,
> but no providers in its RDEPENDS [file-rdeps]
> libeweather-0.0.0+svnr82070: libeweather-plugins requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> libeweather-0.0.0+svnr82070: libeweather-plugins requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> libgphoto2-2.4.11: libgphoto2 requires /bin/bash, but no providers in its
> RDEPENDS [file-rdeps]
> libhugetlbfs-2.18: libhugetlbfs requires /bin/bash, /usr/bin/perl, but no
> providers in its RDEPENDS [file-rdeps]
> libhugetlbfs-2.18: libhugetlbfs-tests requires /bin/bash, but no providers
> in its RDEPENDS [file-rdeps]
> libmikmod-3.3.6: libmikmod requires libpulsecommon-5.0.so()(64bit), but
> no providers in its RDEPENDS [file-rdeps]
> libmikmod-3.3.6: libmikmod requires libpulsecommon-5.0.so, but no
> providers in its RDEPENDS [file-rdeps]
> libnewt-0.52.17: whiptail requires libnewt.so()(64bit), but no providers
> in its RDEPENDS [file-rdeps]
> libnewt-0.52.17: whiptail requires libnewt.so, but no providers in its
> RDEPENDS [file-rdeps]
> libnewt-python-0.52.17: libnewt-python requires libnewt.so()(64bit), but
> no providers in its RDEPENDS [file-rdeps]
> libnewt-python-0.52.17: libnewt-python requires libnewt.so, but no
> providers in its RDEPENDS [file-rdeps]
> libphone-ui-shr-0.0.1+gitrAUTOINC+25e6160710: libphone-ui-shr requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> libphone-ui-shr-0.0.1+gitrAUTOINC+25e6160710: libphone-ui-shr requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> lio-utils-4.1+gitAUTOINC+28bd928655: lio-utils requires /bin/bash, but no
> providers in its RDEPENDS [file-rdeps]
> lmsensors-config-1.0: lmsensors-config-cgi requires /usr/bin/rrdcgi, but
> no providers in its RDEPENDS [file-rdeps]
> lxdm-0.5.0+gitAUTOINC+07fb151a99: lxdm requires /bin/bash, but no
> providers in its RDEPENDS [file-rdeps]
> mime-support-3.48: mime-support requires /usr/bin/perl, but no providers
> in its RDEPENDS [file-rdeps]
> mpg123-1.19.0: mpg123 requires libpulsecommon-5.0.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> mpg123-1.19.0: mpg123 requires libpulsecommon-5.0.so, but no providers in
> its RDEPENDS [file-rdeps]
> nodejs-0.8.18: nodejs requires /bin/bash, but no providers in its RDEPENDS
> [file-rdeps]
> numptyphysics-0.2+svnr109: numptyphysics requires /bin/bash,
> /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
> packagekit-0.5.6: packagekit requires /bin/bash, but no providers in its
> RDEPENDS [file-rdeps]
> pcsc-lite-1.8.6: pcsc-lite requires /usr/bin/python, but no providers in
> its RDEPENDS [file-rdeps]
> php-5.4.33: php requires
> /tmp/work/armv5te-oe-linux-gnueabi/php/5.4.33-r0/image/usr/bin/php, but no
> providers in its RDEPENDS [file-rdeps]
> php-5.4.33: php requires
> /tmp/work/core2-64-oe-linux/php/5.4.33-r0/image/usr/bin/php, but no
> providers in its RDEPENDS [file-rdeps]
> php-5.4.33: php requires
> /tmp/work/i586-oe-linux/php/5.4.33-r0/image/usr/bin/php, but no providers
> in its RDEPENDS [file-rdeps]
> pidgin-2.10.9: libpurple-protocol-aim requires liboscar.so.0()(64bit), but
> no providers in its RDEPENDS [file-rdeps]
> pidgin-2.10.9: libpurple-protocol-aim requires liboscar.so.0, but no
> providers in its RDEPENDS [file-rdeps]
> pidgin-2.10.9: libpurple-protocol-icq requires liboscar.so.0()(64bit), but
> no providers in its RDEPENDS [file-rdeps]
> pidgin-2.10.9: libpurple-protocol-icq requires liboscar.so.0, but no
> providers in its RDEPENDS [file-rdeps]
> pidgin-2.10.9: libpurple-protocol-xmpp requires libjabber.so.0()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pidgin-2.10.9: libpurple-protocol-xmpp requires libjabber.so.0, but no
> providers in its RDEPENDS [file-rdeps]
> pidgin-2.10.9: libpurple-protocol-yahoo requires libymsg.so.0()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pidgin-2.10.9: libpurple-protocol-yahoo requires libymsg.so.0, but no
> providers in its RDEPENDS [file-rdeps]
> pidgin-2.10.9: libpurple-protocol-yahoojp requires libymsg.so.0()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pidgin-2.10.9: libpurple-protocol-yahoojp requires libymsg.so.0, but no
> providers in its RDEPENDS [file-rdeps]
> places-0.1.0+svnr82070: places requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> places-0.1.0+svnr82070: places requires libpulsecommon-5.0.so, but no
> providers in its RDEPENDS [file-rdeps]
> pm-qa-0.4.14: pm-qa requires /bin/bash, but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: libpulse requires libpulsecommon-5.0.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: libpulse requires libpulsecommon-5.0.so, but no providers
> in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: libpulse-mainloop-glib requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: libpulse-mainloop-glib requires libpulsecommon-5.0.so,
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: libpulse-simple requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: libpulse-simple requires libpulsecommon-5.0.so, but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: libpulsecore requires libpulsecommon-5.0.so()(64bit), but
> no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: libpulsecore requires libpulsecommon-5.0.so, but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-alsa-util requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-alsa-util requires libpulsecommon-5.0.so,
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-avahi-wrap requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-avahi-wrap requires libpulsecommon-5.0.so,
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-bluez4-util requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-bluez4-util requires libpulsecommon-5.0.so,
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-cli requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-cli requires libpulsecommon-5.0.so, but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-oss-util requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-oss-util requires libpulsecommon-5.0.so,
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-protocol-cli requires libcli.so,
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-protocol-cli requires libpulsecommon-5.0.so()(64bit),
> libcli.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-protocol-esound requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-protocol-esound requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-protocol-http requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-protocol-http requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-protocol-native requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-protocol-native requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-protocol-simple requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-protocol-simple requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-rtp requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-rtp requires libpulsecommon-5.0.so, but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-misc requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-misc requires libpulsecommon-5.0.so, but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-alsa-card requires libpulsecommon-5.0.so()(64bit),
> libalsa-util.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-alsa-card requires libpulsecommon-5.0.so,
> libalsa-util.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-alsa-sink requires libpulsecommon-5.0.so()(64bit),
> libalsa-util.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-alsa-sink requires libpulsecommon-5.0.so,
> libalsa-util.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-alsa-source requires
> libpulsecommon-5.0.so()(64bit), libalsa-util.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-alsa-source requires
> libpulsecommon-5.0.so, libalsa-util.so, but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-always-sink requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-always-sink requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-augment-properties requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-augment-properties requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-bluetooth-discover requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-bluetooth-discover requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-bluetooth-policy requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-bluetooth-policy requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-bluez4-device requires
> libbluez4-util.so, libpulsecommon-5.0.so, but no providers in its
> RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-bluez4-device requires
> libpulsecommon-5.0.so()(64bit), libbluez4-util.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-bluez4-discover requires
> libbluez4-util.so, libpulsecommon-5.0.so, but no providers in its
> RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-bluez4-discover requires
> libpulsecommon-5.0.so()(64bit), libbluez4-util.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-card-restore requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-card-restore requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-cli requires libcli.so,
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-cli requires libpulsecommon-5.0.so()(64bit),
> libcli.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-cli-protocol-tcp requires
> libprotocol-cli.so, libcli.so, libpulsecommon-5.0.so, but no providers in
> its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-cli-protocol-tcp requires
> libpulsecommon-5.0.so()(64bit), libcli.so()(64bit),
> libprotocol-cli.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-cli-protocol-unix requires
> libprotocol-cli.so, libcli.so, libpulsecommon-5.0.so, but no providers in
> its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-cli-protocol-unix requires
> libpulsecommon-5.0.so()(64bit), libcli.so()(64bit),
> libprotocol-cli.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-combine requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-combine requires libpulsecommon-5.0.so,
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-combine-sink requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-combine-sink requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-console-kit requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-console-kit requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-dbus-protocol requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-dbus-protocol requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-default-device-restore requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-default-device-restore requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-detect requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-detect requires libpulsecommon-5.0.so,
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-device-manager requires
> libprotocol-native.so, libpulsecommon-5.0.so, but no providers in its
> RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-device-manager requires
> libpulsecommon-5.0.so()(64bit), libprotocol-native.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-device-restore requires
> libprotocol-native.so, libpulsecommon-5.0.so, but no providers in its
> RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-device-restore requires
> libpulsecommon-5.0.so()(64bit), libprotocol-native.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-echo-cancel requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-echo-cancel requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-esound-compat-spawnfd requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-esound-compat-spawnfd requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-esound-compat-spawnpid requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-esound-compat-spawnpid requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-esound-protocol-tcp requires
> libprotocol-esound.so()(64bit), libpulsecommon-5.0.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-esound-protocol-tcp requires
> libprotocol-esound.so, libpulsecommon-5.0.so, but no providers in its
> RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-esound-protocol-tcp requires
> libpulsecommon-5.0.so, libprotocol-esound.so, but no providers in its
> RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-esound-protocol-unix requires
> libprotocol-esound.so, libpulsecommon-5.0.so, but no providers in its
> RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-esound-protocol-unix requires
> libpulsecommon-5.0.so()(64bit), libprotocol-esound.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-esound-sink requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-esound-sink requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-filter-apply requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-filter-apply requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-filter-heuristics requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-filter-heuristics requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-gconf requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-gconf requires libpulsecommon-5.0.so,
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-http-protocol-tcp requires
> libprotocol-http.so, libpulsecommon-5.0.so, but no providers in its
> RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-http-protocol-tcp requires
> libpulsecommon-5.0.so()(64bit), libprotocol-http.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-http-protocol-unix requires
> libprotocol-http.so, libpulsecommon-5.0.so, but no providers in its
> RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-http-protocol-unix requires
> libpulsecommon-5.0.so()(64bit), libprotocol-http.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-intended-roles requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-intended-roles requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-ladspa-sink requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-ladspa-sink requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-loopback requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-loopback requires libpulsecommon-5.0.so,
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-match requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-match requires libpulsecommon-5.0.so,
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-mmkbd-evdev requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-mmkbd-evdev requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-native-protocol-fd requires
> libprotocol-native.so, libpulsecommon-5.0.so, but no providers in its
> RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-native-protocol-fd requires
> libpulsecommon-5.0.so()(64bit), libprotocol-native.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-native-protocol-tcp requires
> libprotocol-native.so, libpulsecommon-5.0.so, but no providers in its
> RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-native-protocol-tcp requires
> libpulsecommon-5.0.so()(64bit), libprotocol-native.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-native-protocol-unix requires
> libprotocol-native.so, libpulsecommon-5.0.so, but no providers in its
> RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-native-protocol-unix requires
> libpulsecommon-5.0.so()(64bit), libprotocol-native.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-null-sink requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-null-sink requires libpulsecommon-5.0.so,
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-null-source requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-null-source requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-oss requires liboss-util.so,
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-oss requires libpulsecommon-5.0.so()(64bit),
> liboss-util.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-pipe-sink requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-pipe-sink requires libpulsecommon-5.0.so,
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-pipe-source requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-pipe-source requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-position-event-sounds requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-position-event-sounds requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-remap-sink requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-remap-sink requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-remap-source requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-remap-source requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-rescue-streams requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-rescue-streams requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-role-cork requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-role-cork requires libpulsecommon-5.0.so,
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-role-ducking requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-role-ducking requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-rtp-recv requires libpulsecommon-5.0.so()(64bit),
> librtp.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-rtp-recv requires librtp.so,
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-rtp-send requires libpulsecommon-5.0.so()(64bit),
> librtp.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-rtp-send requires librtp.so,
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-rygel-media-server requires
> libprotocol-http.so, libpulsecommon-5.0.so, but no providers in its
> RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-rygel-media-server requires
> libpulsecommon-5.0.so()(64bit), libprotocol-http.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-simple-protocol-tcp requires
> libprotocol-simple.so, libpulsecommon-5.0.so, but no providers in its
> RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-simple-protocol-tcp requires
> libpulsecommon-5.0.so()(64bit), libprotocol-simple.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-simple-protocol-unix requires
> libprotocol-simple.so, libpulsecommon-5.0.so, but no providers in its
> RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-simple-protocol-unix requires
> libpulsecommon-5.0.so()(64bit), libprotocol-simple.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-sine requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-sine requires libpulsecommon-5.0.so,
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-sine-source requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-sine-source requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-stream-restore requires
> libprotocol-native.so, libpulsecommon-5.0.so, but no providers in its
> RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-stream-restore requires
> libpulsecommon-5.0.so()(64bit), libprotocol-native.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-suspend-on-idle requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-suspend-on-idle requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-switch-on-connect requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-switch-on-connect requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-switch-on-port-available requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-switch-on-port-available requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-systemd-login requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-systemd-login requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-tunnel-sink requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-tunnel-sink requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-tunnel-sink-new requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-tunnel-sink-new requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-tunnel-source requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-tunnel-source requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-tunnel-source-new requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-tunnel-source-new requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-udev-detect requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-udev-detect requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-virtual-sink requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-virtual-sink requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-virtual-source requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-virtual-source requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-virtual-surround-sink requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-virtual-surround-sink requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-volume-restore requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-volume-restore requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-x11-bell requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-x11-bell requires libpulsecommon-5.0.so,
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-x11-cork-request requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-x11-cork-request requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-x11-publish requires
> libprotocol-native.so, libpulsecommon-5.0.so, but no providers in its
> RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-x11-publish requires
> libpulsecommon-5.0.so()(64bit), libprotocol-native.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-x11-xsmp requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-x11-xsmp requires libpulsecommon-5.0.so,
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-zeroconf-discover requires
> libavahi-wrap.so, libpulsecommon-5.0.so, but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-zeroconf-discover requires
> libpulsecommon-5.0.so()(64bit), libavahi-wrap.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-zeroconf-publish requires
> libavahi-wrap.so, libpulsecommon-5.0.so, libprotocol-native.so, but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-zeroconf-publish requires
> libprotocol-native.so()(64bit), libpulsecommon-5.0.so()(64bit),
> libavahi-wrap.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-zeroconf-publish requires
> libprotocol-native.so, libavahi-wrap.so, libpulsecommon-5.0.so, but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-server requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-server requires libpulsecommon-5.0.so, but no
> providers in its RDEPENDS [file-rdeps]
> qt-creator-2.8.1: qt-creator requires /usr/bin/perl, but no providers in
> its RDEPENDS [file-rdeps]
> qtbase-5.3.2: qtbase-mkspecs requires /bin/bash, but no providers in its
> RDEPENDS [file-rdeps]
> rain-0.0.3+svnr82070: rain requires libpulsecommon-5.0.so()(64bit), but
> no providers in its RDEPENDS [file-rdeps]
> rain-0.0.3+svnr82070: rain requires libpulsecommon-5.0.so, but no
> providers in its RDEPENDS [file-rdeps]
> shr-e-gadgets-0.0.0+gitrAUTOINC+42806ea24f: shr-e-gadgets requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> shr-e-gadgets-0.0.0+gitrAUTOINC+42806ea24f: shr-e-gadgets requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> shr-wizard-0.0.0+gitrAUTOINC+1dae79221f: shr-wizard requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> shr-wizard-0.0.0+gitrAUTOINC+1dae79221f: shr-wizard requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> sox-14.4.0: sox requires libpulsecommon-5.0.so()(64bit), but no providers
> in its RDEPENDS [file-rdeps]
> sox-14.4.0: sox requires libpulsecommon-5.0.so, but no providers in its
> RDEPENDS [file-rdeps]
> syslog-ng-3.5.4.1: syslog-ng requires /usr/bin/awk, but no providers in
> its RDEPENDS [file-rdeps]
> systemd-216+gitAUTOINC+5d0ae62c66: systemd-kernel-install requires
> /bin/bash, but no providers in its RDEPENDS [file-rdeps]
> tracker-0.14.2: tracker-nautilus-extension requires
> libnautilus-extension.so.1()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> tracker-0.14.2: tracker-nautilus-extension requires
> libnautilus-extension.so.1, but no providers in its RDEPENDS [file-rdeps]
> ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: ubx-utils requires /bin/bash, but
> no providers in its RDEPENDS [file-rdeps]
> unionfs-fuse-0.26: unionfs-fuse requires /bin/bash, but no providers in
> its RDEPENDS [file-rdeps]
> uptime-0.0.2+svnr82070: uptime requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> uptime-0.0.2+svnr82070: uptime requires libpulsecommon-5.0.so, but no
> providers in its RDEPENDS [file-rdeps]
> usbpath-0.0+svnr3172: usbpath requires /usr/bin/perl, but no providers in
> its RDEPENDS [file-rdeps]
> webmin-1.700: webmin-module-ajaxterm requires /sbin/runscript, but no
> providers in its RDEPENDS [file-rdeps]
> wvstreams-4.6.1: wvstreams requires /usr/bin/perl, but no providers in its
> RDEPENDS [file-rdeps]
> xfce4-dev-tools-4.11.0: xfce4-dev-tools requires /bin/bash, but no
> providers in its RDEPENDS [file-rdeps]
> xmlto-0.0.25: xmlto requires /bin/bash, but no providers in its RDEPENDS
> [file-rdeps]
>
> a bit off topic (but only a bit :)

I don't see these except file-rdeps. IIRC I did a setting to enable
file-rdeps but I cannot remember where it was. So to take care: Where can I
enable all the qa warnings?

Andreas

--089e015366882fdeaf05050f52f3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On F=
ri, Oct 10, 2014 at 12:34 PM, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D=
"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Bo=
th issues are caused by pending reviews (vlc is<br>
broken by opencv upgrade). So this is the first &quot;clean&quot;<br>
report (except that couple fixes are still only in<br>
jansa/master branches and on MLs, but not yet merged).<br>
<br>
Next goal: clean QA log, see bellow.<br>
<br>
<a href=3D"http://www.openembedded.org/wiki/Bitbake_World_Status" target=3D=
"_blank">http://www.openembedded.org/wiki/Bitbake_World_Status</a><br>
<br>
=3D=3D Failed tasks 2014-10-10 =3D=3D<br>
<br>
=3D=3D=3D common (2) =3D=3D=3D<br>
=C2=A0 =C2=A0 * meta-openembedded/meta-multimedia/recipes-multimedia/vlc/<a=
 href=3D"http://vlc_2.1.4.bb" target=3D"_blank">vlc_2.1.4.bb</a>, do_compil=
e<br>
=C2=A0 =C2=A0 * meta-openembedded/meta-oe/recipes-benchmark/iperf3/<a href=
=3D"http://iperf3_git.bb" target=3D"_blank">iperf3_git.bb</a>, do_configure=
<br>
<br>
=3D=3D=3D common-x86 (0) =3D=3D=3D<br>
<br>
=3D=3D=3D qemuarm (0) =3D=3D=3D<br>
<br>
=3D=3D=3D qemux86 (0) =3D=3D=3D<br>
<br>
=3D=3D=3D qemux86_64 (0) =3D=3D=3D<br>
<br>
=3D=3D=3D Number of failed tasks =3D=3D=3D<br>
{| class=3Dwikitable<br>
|-<br>
||qemuarm=C2=A0 =C2=A0 =C2=A0 =C2=A0||2=C2=A0 =C2=A0 =C2=A0||<a href=3D"htt=
p://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20141009_050706.log/=
||http://errors.yoctoproject.org:80/Errors/Search/1/2906/" target=3D"_blank=
">http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20141009_050706=
.log/||http://errors.yoctoproject.org:80/Errors/Search/1/2906/</a><br>
|-<br>
||qemux86=C2=A0 =C2=A0 =C2=A0 =C2=A0||2=C2=A0 =C2=A0 =C2=A0||<a href=3D"htt=
p://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20141009_060811.log/=
||http://errors.yoctoproject.org:80/Errors/Search/1/2907/" target=3D"_blank=
">http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20141009_060811=
.log/||http://errors.yoctoproject.org:80/Errors/Search/1/2907/</a><br>
|-<br>
||qemux86_64=C2=A0 =C2=A0 ||2=C2=A0 =C2=A0 =C2=A0||<a href=3D"http://logs.n=
slu2-linux.org/buildlogs/oe/world//log.world.20141009_071120.log/||http://e=
rrors.yoctoproject.org:80/Errors/Search/1/2908/" target=3D"_blank">http://l=
ogs.nslu2-linux.org/buildlogs/oe/world//log.world.20141009_071120.log/||htt=
p://errors.yoctoproject.org:80/Errors/Search/1/2908/</a><br>
|}<br>
<br>
QA issues (per issue type, because of spam from new file-deps check)<br>
<br>
$ logs=3D&quot;log.world.2014100*&quot;; for t in already-stripped libdir t=
extrel build-deps file-rdeps version-going-backwards; do count=3D`cat $logs=
/qa.log | sort -u | grep &quot;\[$t\]&quot; | wc -l`; echo &quot;$count=C2=
=A0 =C2=A0$t:&quot;; done; for t in already-stripped libdir textrel build-d=
eps file-rdeps version-going-backwards; do count=3D`cat $logs/qa.log | sort=
 -u | grep &quot;\[$t\]&quot; | wc -l`; echo &quot;$count $t:&quot;; cat $l=
ogs/qa.log | sort -u | grep &quot;\[$t\]&quot; | sed &#39;s#/home/jenkins/o=
e/world/shr-core/tmp-glibc/#/tmp/#g&#39;; echo; echo; done<br>
<br>
3=C2=A0 =C2=A0 =C2=A0 =C2=A0already-stripped:<br>
2=C2=A0 =C2=A0 =C2=A0 =C2=A0libdir:<br>
18=C2=A0 =C2=A0 =C2=A0 textrel:<br>
18=C2=A0 =C2=A0 =C2=A0 build-deps:<br>
361=C2=A0 =C2=A0 =C2=A0file-rdeps:<br>
36=C2=A0 =C2=A0 =C2=A0 version-going-backwards:<br>
<br>
3=C2=A0 =C2=A0 =C2=A0 =C2=A0already-stripped:<br>
qwt-6.0.1: File &#39;/usr/lib/libqwt.so.6.0.1&#39; from qwt was already str=
ipped, this will prevent future debugging! [already-stripped]<br>
qwt-6.0.1: File &#39;/usr/lib/libqwtmathml.so.6.0.1&#39; from qwt was alrea=
dy stripped, this will prevent future debugging! [already-stripped]<br>
qwt-6.0.1: File &#39;/usr/lib/qt4/plugins/designer/libqwt_designer_plugin.s=
o&#39; from qwt was already stripped, this will prevent future debugging! [=
already-stripped]<br>
<br>
<br>
2=C2=A0 =C2=A0 =C2=A0 =C2=A0libdir:<br>
chromium-37.0.2062.94: chromium: found library in wrong location: /usr/bin/=
chrome/libffmpegsumo.so [libdir]<br>
chromium-dbg: found library in wrong location: /usr/bin/chrome/.debug/libff=
mpegsumo.so [libdir]<br>
<br>
<br>
18=C2=A0 =C2=A0 =C2=A0 textrel:<br>
chromium-37.0.2062.94: ELF binary &#39;/tmp/work/i586-oe-linux/chromium/37.=
0.2062.94-r0/packages-split/chromium/usr/bin/chrome/libffmpegsumo.so&#39; h=
as relocations in .text [textrel]<br>
gstreamer1.0-libav-1.4.1: ELF binary &#39;/tmp/work/armv5te-oe-linux-gnueab=
i/gstreamer1.0-libav/1.4.1-r0/packages-split/gstreamer1.0-libav/usr/lib/gst=
reamer-1.0/libgstlibav.so&#39; has relocations in .text [textrel]<br>
gstreamer1.0-libav-1.4.1: ELF binary &#39;/tmp/work/i586-oe-linux/gstreamer=
1.0-libav/1.4.1-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/=
libgstlibav.so&#39; has relocations in .text [textrel]<br>
libav-9.16: ELF binary &#39;/tmp/work/armv5te-oe-linux-gnueabi/libav/9.16-r=
0/packages-split/libavcodec/usr/lib/libavcodec.so.54.35.0&#39; has relocati=
ons in .text [textrel]<br>
libav-9.16: ELF binary &#39;/tmp/work/i586-oe-linux/libav/9.16-r0/packages-=
split/libavcodec/usr/lib/libavcodec.so.54.35.0&#39; has relocations in .tex=
t [textrel]<br>
libav-9.16: ELF binary &#39;/tmp/work/i586-oe-linux/libav/9.16-r0/packages-=
split/libavdevice/usr/lib/libavdevice.so.53.2.0&#39; has relocations in .te=
xt [textrel]<br>
libav-9.16: ELF binary &#39;/tmp/work/i586-oe-linux/libav/9.16-r0/packages-=
split/libavfilter/usr/lib/libavfilter.so.3.3.0&#39; has relocations in .tex=
t [textrel]<br>
libav-9.16: ELF binary &#39;/tmp/work/i586-oe-linux/libav/9.16-r0/packages-=
split/libavformat/usr/lib/libavformat.so.54.20.4&#39; has relocations in .t=
ext [textrel]<br>
libav-9.16: ELF binary &#39;/tmp/work/i586-oe-linux/libav/9.16-r0/packages-=
split/libavresample/usr/lib/libavresample.so.1.0.1&#39; has relocations in =
.text [textrel]<br>
libav-9.16: ELF binary &#39;/tmp/work/i586-oe-linux/libav/9.16-r0/packages-=
split/libavutil/usr/lib/libavutil.so.52.3.0&#39; has relocations in .text [=
textrel]<br>
libav-9.16: ELF binary &#39;/tmp/work/i586-oe-linux/libav/9.16-r0/packages-=
split/libswscale/usr/lib/libswscale.so.2.1.1&#39; has relocations in .text =
[textrel]<br>
libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary &#39;/tmp/work/armv5te=
-oe-linux-gnueabi/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-spli=
t/libpostproc/usr/lib/libpostproc.so.52.3.0&#39; has relocations in .text [=
textrel]<br>
libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary &#39;/tmp/work/i586-oe=
-linux/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/libpostpr=
oc/usr/lib/libpostproc.so.52.3.0&#39; has relocations in .text [textrel]<br=
>
mpg123-1.19.0: ELF binary &#39;/tmp/work/i586-oe-linux/mpg123/1.19.0-r0/pac=
kages-split/mpg123/usr/lib/libmpg123.so.0.40.1&#39; has relocations in .tex=
t [textrel]<br>
qtwebengine-5.3.2: ELF binary &#39;/tmp/work/armv5te-oe-linux-gnueabi/qtweb=
engine/5.3.2-r0/packages-split/qtwebengine/usr/lib/libQt0WebEngineCore.so.0=
.9.0&#39; has relocations in .text [textrel]<br>
qtwebkit-5.3.2: ELF binary &#39;/tmp/work/i586-oe-linux/qtwebkit/5.3.2-r0/p=
ackages-split/qtwebkit/usr/lib/libQt5WebKit.so.5.3.2&#39; has relocations i=
n .text [textrel]<br>
webkit-efl-1.11.0: ELF binary &#39;/tmp/work/i586-oe-linux/webkit-efl/1_1.1=
1.0-r0/packages-split/webkit-efl/usr/lib/libjavascriptcore_efl.so.1.11.0&#3=
9; has relocations in .text [textrel]<br>
webkit-gtk-1.8.3: ELF binary &#39;/tmp/work/i586-oe-linux/webkit-gtk/1.8.3-=
r1/packages-split/libjavascriptcore/usr/lib/libjavascriptcoregtk-1.0.so.0.1=
3.4&#39; has relocations in .text [textrel]<br>
<br>
<br>
18=C2=A0 =C2=A0 =C2=A0 build-deps:<br>
exquisite-0.0.1+svnr82070: exquisite rdepends on initscripts-functions, but=
 it isn&#39;t a build dependency? [build-deps]<br>
gpm-1.99.7: gpm rdepends on initscripts-functions, but it isn&#39;t a build=
 dependency? [build-deps]<br>
irda-utils-0.9.18: irda-utils rdepends on initscripts-functions, but it isn=
&#39;t a build dependency? [build-deps]<br>
libwebp-0.4.0: libwebp-bin rdepends on libgl-mesa, but it isn&#39;t a build=
 dependency? [build-deps]<br>
libwebp-0.4.0: libwebp-bin rdepends on mesa-glut, but it isn&#39;t a build =
dependency? [build-deps]<br>
opencv-2.99+3.0.0-alpha+gitAUTOINC+fb9a143429: libopencv-highgui rdepends o=
n gtk+3, but it isn&#39;t a build dependency? [build-deps]<br>
opencv-2.99+3.0.0-alpha+gitAUTOINC+fb9a143429: libopencv-videoio rdepends o=
n gstreamer1.0, but it isn&#39;t a build dependency? [build-deps]<br>
opencv-2.99+3.0.0-alpha+gitAUTOINC+fb9a143429: libopencv-videoio rdepends o=
n libgstapp-1.0, but it isn&#39;t a build dependency? [build-deps]<br>
opencv-2.99+3.0.0-alpha+gitAUTOINC+fb9a143429: libopencv-videoio rdepends o=
n libgstpbutils-1.0, but it isn&#39;t a build dependency? [build-deps]<br>
opencv-2.99+3.0.0-alpha+gitAUTOINC+fb9a143429: libopencv-videoio rdepends o=
n libgstriff-1.0, but it isn&#39;t a build dependency? [build-deps]<br>
proftpd-1.3.4b: proftpd rdepends on initscripts-functions, but it isn&#39;t=
 a build dependency? [build-deps]<br>
sysklogd-1.5: sysklogd rdepends on initscripts-functions, but it isn&#39;t =
a build dependency? [build-deps]<br>
tracker-0.14.2: tracker rdepends on libnmglib, but it isn&#39;t a build dep=
endency? [build-deps]<br>
tracker-0.14.2: tracker rdepends on libnmutil, but it isn&#39;t a build dep=
endency? [build-deps]<br>
tracker-0.14.2: tracker rdepends on nss, but it isn&#39;t a build dependenc=
y? [build-deps]<br>
tumbler-0.1.30: tumbler rdepends on gstreamer1.0, but it isn&#39;t a build =
dependency? [build-deps]<br>
tumbler-0.1.30: tumbler rdepends on libgsttag-1.0, but it isn&#39;t a build=
 dependency? [build-deps]<br>
xinetd-2.3.15: xinetd rdepends on initscripts-functions, but it isn&#39;t a=
 build dependency? [build-deps]<br>
<br>
<br>
361=C2=A0 =C2=A0 =C2=A0file-rdeps:<br>
chkconfig-1.3.58: chkconfig requires libnewt.so()(64bit), but no providers =
in its RDEPENDS [file-rdeps]<br>
chkconfig-1.3.58: chkconfig requires libnewt.so, but no providers in its RD=
EPENDS [file-rdeps]<br>
cloud9-0.6: cloud9 requires /bin/bash, but no providers in its RDEPENDS [fi=
le-rdeps]<br>
cpu-0.0.1+svnr82070: cpu requires <a href=3D"http://libpulsecommon-5.0.so" =
target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but no providers in i=
ts RDEPENDS [file-rdeps]<br>
cpu-0.0.1+svnr82070: cpu requires <a href=3D"http://libpulsecommon-5.0.so" =
target=3D"_blank">libpulsecommon-5.0.so</a>, but no providers in its RDEPEN=
DS [file-rdeps]<br>
diskio-0.0.1+svnr82070: diskio requires <a href=3D"http://libpulsecommon-5.=
0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but no provider=
s in its RDEPENDS [file-rdeps]<br>
diskio-0.0.1+svnr82070: diskio requires <a href=3D"http://libpulsecommon-5.=
0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no providers in its =
RDEPENDS [file-rdeps]<br>
docbook-xsl-stylesheets-1.78.1: docbook-xsl-stylesheets requires /usr/bin/p=
erl, /bin/bash, but no providers in its RDEPENDS [file-rdeps]<br>
dpkg-1.17.4: dpkg requires /usr/bin/perl, but no providers in its RDEPENDS =
[file-rdeps]<br>
dvb-apps-1.1.1: dvb-apps requires libucsi.so()(64bit), libdvbapi.so()(64bit=
), libdvbcfg.so()(64bit), libdvben50221.so()(64bit), libdvbsec.so()(64bit),=
 but no providers in its RDEPENDS [file-rdeps]<br>
dvb-apps-1.1.1: dvb-apps requires libucsi.so, libdvben50221.so, libdvbsec.s=
o, libdvbcfg.so, libdvbapi.so, but no providers in its RDEPENDS [file-rdeps=
]<br>
dvb-apps-1.1.1: dvb-femon requires libdvbapi.so()(64bit), but no providers =
in its RDEPENDS [file-rdeps]<br>
dvb-apps-1.1.1: dvb-femon requires libdvbapi.so, but no providers in its RD=
EPENDS [file-rdeps]<br>
dvb-apps-1.1.1: dvb-scan requires libdvbsec.so()(64bit), libdvbapi.so()(64b=
it), libdvbcfg.so()(64bit), but no providers in its RDEPENDS [file-rdeps]<b=
r>
dvb-apps-1.1.1: dvb-scan requires libdvbsec.so, libdvbcfg.so, libdvbapi.so,=
 but no providers in its RDEPENDS [file-rdeps]<br>
dvb-apps-1.1.1: dvbdate requires libucsi.so()(64bit), libdvbapi.so()(64bit)=
, but no providers in its RDEPENDS [file-rdeps]<br>
dvb-apps-1.1.1: dvbdate requires libucsi.so, libdvbapi.so, but no providers=
 in its RDEPENDS [file-rdeps]<br>
dvb-apps-1.1.1: dvbnet requires libdvbapi.so()(64bit), but no providers in =
its RDEPENDS [file-rdeps]<br>
dvb-apps-1.1.1: dvbnet requires libdvbapi.so, but no providers in its RDEPE=
NDS [file-rdeps]<br>
dvb-apps-1.1.1: dvbtraffic requires libdvbapi.so()(64bit), but no providers=
 in its RDEPENDS [file-rdeps]<br>
dvb-apps-1.1.1: dvbtraffic requires libdvbapi.so, but no providers in its R=
DEPENDS [file-rdeps]<br>
e-wm-0.18.8: e-wm requires <a href=3D"http://libpulsecommon-5.0.so" target=
=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but no providers in its RDE=
PENDS [file-rdeps]<br>
e-wm-0.18.8: e-wm requires <a href=3D"http://libpulsecommon-5.0.so" target=
=3D"_blank">libpulsecommon-5.0.so</a>, but no providers in its RDEPENDS [fi=
le-rdeps]<br>
efl-1.11.2: ecore-audio requires <a href=3D"http://libpulsecommon-5.0.so" t=
arget=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but no providers in it=
s RDEPENDS [file-rdeps]<br>
efl-1.11.2: ecore-audio requires <a href=3D"http://libpulsecommon-5.0.so" t=
arget=3D"_blank">libpulsecommon-5.0.so</a>, but no providers in its RDEPEND=
S [file-rdeps]<br>
efl-1.11.2: edje requires <a href=3D"http://libpulsecommon-5.0.so" target=
=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but no providers in its RDE=
PENDS [file-rdeps]<br>
efl-1.11.2: edje requires <a href=3D"http://libpulsecommon-5.0.so" target=
=3D"_blank">libpulsecommon-5.0.so</a>, but no providers in its RDEPENDS [fi=
le-rdeps]<br>
efl-1.11.2: ethumb requires <a href=3D"http://libpulsecommon-5.0.so" target=
=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but no providers in its RDE=
PENDS [file-rdeps]<br>
efl-1.11.2: ethumb requires <a href=3D"http://libpulsecommon-5.0.so" target=
=3D"_blank">libpulsecommon-5.0.so</a>, but no providers in its RDEPENDS [fi=
le-rdeps]<br>
elementary-1.11.2: elementary requires <a href=3D"http://libpulsecommon-5.0=
.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but no providers=
 in its RDEPENDS [file-rdeps]<br>
elementary-1.11.2: elementary requires <a href=3D"http://libpulsecommon-5.0=
.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no providers in its R=
DEPENDS [file-rdeps]<br>
elementary-1.11.2: elementary-accessibility requires <a href=3D"http://libp=
ulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), bu=
t no providers in its RDEPENDS [file-rdeps]<br>
elementary-1.11.2: elementary-accessibility requires <a href=3D"http://libp=
ulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no prov=
iders in its RDEPENDS [file-rdeps]<br>
elementary-1.11.2: elementary-tests requires <a href=3D"http://libpulsecomm=
on-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but no pro=
viders in its RDEPENDS [file-rdeps]<br>
elementary-1.11.2: elementary-tests requires <a href=3D"http://libpulsecomm=
on-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no providers in=
 its RDEPENDS [file-rdeps]<br>
elfe-0.0.1+gitrAUTOINC+1ec0e7713c: elfe requires <a href=3D"http://libpulse=
common-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but no=
 providers in its RDEPENDS [file-rdeps]<br>
elfe-0.0.1+gitrAUTOINC+1ec0e7713c: elfe requires <a href=3D"http://libpulse=
common-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no provider=
s in its RDEPENDS [file-rdeps]<br>
estardict-0.7: estardict requires <a href=3D"http://libpulsecommon-5.0.so" =
target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but no providers in i=
ts RDEPENDS [file-rdeps]<br>
estardict-0.7: estardict requires <a href=3D"http://libpulsecommon-5.0.so" =
target=3D"_blank">libpulsecommon-5.0.so</a>, but no providers in its RDEPEN=
DS [file-rdeps]<br>
exalt-client-0.0.1+svnr82070: exalt-client requires <a href=3D"http://libpu=
lsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but=
 no providers in its RDEPENDS [file-rdeps]<br>
exalt-client-0.0.1+svnr82070: exalt-client requires <a href=3D"http://libpu=
lsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no provi=
ders in its RDEPENDS [file-rdeps]<br>
exquisite-0.0.1+svnr82070: exquisite requires <a href=3D"http://libpulsecom=
mon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but no pr=
oviders in its RDEPENDS [file-rdeps]<br>
exquisite-0.0.1+svnr82070: exquisite requires <a href=3D"http://libpulsecom=
mon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no providers i=
n its RDEPENDS [file-rdeps]<br>
fakeroot-1.18.4: fakeroot requires /bin/bash, but no providers in its RDEPE=
NDS [file-rdeps]<br>
fbida-2.09+gitAUTOINC+6aa5563cb3: fbida requires /bin/bash, but no provider=
s in its RDEPENDS [file-rdeps]<br>
flame-0.0.3+svnr82070: flame requires <a href=3D"http://libpulsecommon-5.0.=
so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but no providers =
in its RDEPENDS [file-rdeps]<br>
flame-0.0.3+svnr82070: flame requires <a href=3D"http://libpulsecommon-5.0.=
so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no providers in its RD=
EPENDS [file-rdeps]<br>
fluidsynth-1.1.6: fluidsynth requires <a href=3D"http://libpulsecommon-5.0.=
so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but no providers =
in its RDEPENDS [file-rdeps]<br>
fluidsynth-1.1.6: fluidsynth requires <a href=3D"http://libpulsecommon-5.0.=
so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no providers in its RD=
EPENDS [file-rdeps]<br>
forecasts-0.2.0+svnr82070: forecasts requires <a href=3D"http://libpulsecom=
mon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but no pr=
oviders in its RDEPENDS [file-rdeps]<br>
forecasts-0.2.0+svnr82070: forecasts requires <a href=3D"http://libpulsecom=
mon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no providers i=
n its RDEPENDS [file-rdeps]<br>
foxtrotgps-1.1.1: foxtrotgps requires /usr/bin/python, /usr/bin/perl, but n=
o providers in its RDEPENDS [file-rdeps]<br>
fsodeviced-0.12.0: fsodeviced-module-accelerometer-kxsd9 requires libfsodev=
ice.so()(64bit), but no providers in its RDEPENDS [file-rdeps]<br>
fsodeviced-0.12.0: fsodeviced-module-accelerometer-kxsd9 requires libfsodev=
ice.so, but no providers in its RDEPENDS [file-rdeps]<br>
fsodeviced-0.12.0: fsodeviced-module-accelerometer-lis302 requires libfsode=
vice.so()(64bit), but no providers in its RDEPENDS [file-rdeps]<br>
fsodeviced-0.12.0: fsodeviced-module-accelerometer-lis302 requires libfsode=
vice.so, but no providers in its RDEPENDS [file-rdeps]<br>
fsodeviced-0.12.0: fsodeviced-module-backlight-omappanel requires libfsodev=
ice.so()(64bit), but no providers in its RDEPENDS [file-rdeps]<br>
fsodeviced-0.12.0: fsodeviced-module-backlight-omappanel requires libfsodev=
ice.so, but no providers in its RDEPENDS [file-rdeps]<br>
fsodeviced-0.12.0: fsodeviced-module-n900-quirks requires libfsodevice.so()=
(64bit), but no providers in its RDEPENDS [file-rdeps]<br>
fsodeviced-0.12.0: fsodeviced-module-n900-quirks requires libfsodevice.so, =
but no providers in its RDEPENDS [file-rdeps]<br>
fsodeviced-0.12.0: fsodeviced-module-openmoko-powercontrol requires libfsod=
evice.so()(64bit), but no providers in its RDEPENDS [file-rdeps]<br>
fsodeviced-0.12.0: fsodeviced-module-openmoko-powercontrol requires libfsod=
evice.so, but no providers in its RDEPENDS [file-rdeps]<br>
fsodeviced-0.12.0: fsodeviced-module-vibrator-omapvibe requires libfsodevic=
e.so()(64bit), but no providers in its RDEPENDS [file-rdeps]<br>
fsodeviced-0.12.0: fsodeviced-module-vibrator-omapvibe requires libfsodevic=
e.so, but no providers in its RDEPENDS [file-rdeps]<br>
fsodeviced-0.12.0: fsodeviced-module-vibrator-timedoutputclass requires lib=
fsodevice.so()(64bit), but no providers in its RDEPENDS [file-rdeps]<br>
fsodeviced-0.12.0: fsodeviced-module-vibrator-timedoutputclass requires lib=
fsodevice.so, but no providers in its RDEPENDS [file-rdeps]<br>
fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-lowlevel-motorola-ez=
x requires libfsogsm.so()(64bit), but no providers in its RDEPENDS [file-rd=
eps]<br>
fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-lowlevel-motorola-ez=
x requires libfsogsm.so, but no providers in its RDEPENDS [file-rdeps]<br>
fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-lowlevel-openmoko re=
quires libfsogsm.so()(64bit), but no providers in its RDEPENDS [file-rdeps]=
<br>
fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-lowlevel-openmoko re=
quires libfsogsm.so, but no providers in its RDEPENDS [file-rdeps]<br>
fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-lowlevel-samsung-cre=
spo requires libfsogsm.so()(64bit), but no providers in its RDEPENDS [file-=
rdeps]<br>
fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-lowlevel-samsung-cre=
spo requires libfsogsm.so, but no providers in its RDEPENDS [file-rdeps]<br=
>
fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-freescale-nept=
une requires libfsogsm.so()(64bit), but no providers in its RDEPENDS [file-=
rdeps]<br>
fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-freescale-nept=
une requires libfsogsm.so, but no providers in its RDEPENDS [file-rdeps]<br=
>
fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-nokia-isi requ=
ires libfsogsm.so()(64bit), but no providers in its RDEPENDS [file-rdeps]<b=
r>
fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-nokia-isi requ=
ires libfsogsm.so, but no providers in its RDEPENDS [file-rdeps]<br>
fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-option-gtm601 =
requires libfsogsm.so()(64bit), but no providers in its RDEPENDS [file-rdep=
s]<br>
fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-option-gtm601 =
requires libfsogsm.so, but no providers in its RDEPENDS [file-rdeps]<br>
fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-qualcomm-htc r=
equires libfsogsm.so()(64bit), but no providers in its RDEPENDS [file-rdeps=
]<br>
fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-qualcomm-htc r=
equires libfsogsm.so, but no providers in its RDEPENDS [file-rdeps]<br>
fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-samsung requir=
es libfsogsm.so()(64bit), but no providers in its RDEPENDS [file-rdeps]<br>
fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-samsung requir=
es libfsogsm.so, but no providers in its RDEPENDS [file-rdeps]<br>
fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-ti-calypso req=
uires libfsogsm.so()(64bit), but no providers in its RDEPENDS [file-rdeps]<=
br>
fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-ti-calypso req=
uires libfsogsm.so, but no providers in its RDEPENDS [file-rdeps]<br>
gammu-1.32.0: gammu requires /bin/bash, but no providers in its RDEPENDS [f=
ile-rdeps]<br>
gammu-1.32.0: gammu-dev requires /bin/bash, but no providers in its RDEPEND=
S [file-rdeps]<br>
gateone-1.2: gateone requires /usr/bin/perl, /bin/bash, but no providers in=
 its RDEPENDS [file-rdeps]<br>
giflib-4.1.6: giflib-utils requires /usr/bin/perl, but no providers in its =
RDEPENDS [file-rdeps]<br>
glibmm-2.36.2: glibmm-dev requires /usr/bin/perl, but no providers in its R=
DEPENDS [file-rdeps]<br>
gmtk-1.0.5: gmtk requires <a href=3D"http://libpulsecommon-5.0.so" target=
=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but no providers in its RDE=
PENDS [file-rdeps]<br>
gmtk-1.0.5: gmtk requires <a href=3D"http://libpulsecommon-5.0.so" target=
=3D"_blank">libpulsecommon-5.0.so</a>, but no providers in its RDEPENDS [fi=
le-rdeps]<br>
gnome-desktop-2.32.1: gnome-desktop requires /usr/bin/python, but no provid=
ers in its RDEPENDS [file-rdeps]<br>
gnome-panel-2.32.1: gnome-panel requires /usr/bin/python, but no providers =
in its RDEPENDS [file-rdeps]<br>
groff-1.22.2: groff requires /bin/sed, but no providers in its RDEPENDS [fi=
le-rdeps]<br>
gst-plugins-good-0.10.31: gst-plugins-good-pulse requires <a href=3D"http:/=
/libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit=
), but no providers in its RDEPENDS [file-rdeps]<br>
gst-plugins-good-0.10.31: gst-plugins-good-pulse requires <a href=3D"http:/=
/libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no=
 providers in its RDEPENDS [file-rdeps]<br>
gstreamer1.0-plugins-good-1.4.1: gstreamer1.0-plugins-good-pulse requires <=
a href=3D"http://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.=
0.so</a>()(64bit), but no providers in its RDEPENDS [file-rdeps]<br>
gstreamer1.0-plugins-good-1.4.1: gstreamer1.0-plugins-good-pulse requires <=
a href=3D"http://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.=
0.so</a>, but no providers in its RDEPENDS [file-rdeps]<br>
gupnp-0.20.12: gupnp-dev requires /usr/bin/python, but no providers in its =
RDEPENDS [file-rdeps]<br>
hplip-3.12.6: hplip-filter requires /usr/bin/perl, but no providers in its =
RDEPENDS [file-rdeps]<br>
libbonobo-2.32.1: libbonobo requires /usr/bin/perl, but no providers in its=
 RDEPENDS [file-rdeps]<br>
libcanberra-0.29: libcanberra-pulse requires <a href=3D"http://libpulsecomm=
on-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but no pro=
viders in its RDEPENDS [file-rdeps]<br>
libcanberra-0.29: libcanberra-pulse requires <a href=3D"http://libpulsecomm=
on-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no providers in=
 its RDEPENDS [file-rdeps]<br>
libeflvala-2011.01.13.1+svnr82070: libeflvala requires <a href=3D"http://li=
bpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), =
but no providers in its RDEPENDS [file-rdeps]<br>
libeflvala-2011.01.13.1+svnr82070: libeflvala requires <a href=3D"http://li=
bpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no pr=
oviders in its RDEPENDS [file-rdeps]<br>
libeweather-0.0.0+svnr82070: libeweather requires <a href=3D"http://libpuls=
ecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but n=
o providers in its RDEPENDS [file-rdeps]<br>
libeweather-0.0.0+svnr82070: libeweather requires <a href=3D"http://libpuls=
ecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no provide=
rs in its RDEPENDS [file-rdeps]<br>
libeweather-0.0.0+svnr82070: libeweather-plugins requires <a href=3D"http:/=
/libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit=
), but no providers in its RDEPENDS [file-rdeps]<br>
libeweather-0.0.0+svnr82070: libeweather-plugins requires <a href=3D"http:/=
/libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no=
 providers in its RDEPENDS [file-rdeps]<br>
libgphoto2-2.4.11: libgphoto2 requires /bin/bash, but no providers in its R=
DEPENDS [file-rdeps]<br>
libhugetlbfs-2.18: libhugetlbfs requires /bin/bash, /usr/bin/perl, but no p=
roviders in its RDEPENDS [file-rdeps]<br>
libhugetlbfs-2.18: libhugetlbfs-tests requires /bin/bash, but no providers =
in its RDEPENDS [file-rdeps]<br>
libmikmod-3.3.6: libmikmod requires <a href=3D"http://libpulsecommon-5.0.so=
" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but no providers in=
 its RDEPENDS [file-rdeps]<br>
libmikmod-3.3.6: libmikmod requires <a href=3D"http://libpulsecommon-5.0.so=
" target=3D"_blank">libpulsecommon-5.0.so</a>, but no providers in its RDEP=
ENDS [file-rdeps]<br>
libnewt-0.52.17: whiptail requires libnewt.so()(64bit), but no providers in=
 its RDEPENDS [file-rdeps]<br>
libnewt-0.52.17: whiptail requires libnewt.so, but no providers in its RDEP=
ENDS [file-rdeps]<br>
libnewt-python-0.52.17: libnewt-python requires libnewt.so()(64bit), but no=
 providers in its RDEPENDS [file-rdeps]<br>
libnewt-python-0.52.17: libnewt-python requires libnewt.so, but no provider=
s in its RDEPENDS [file-rdeps]<br>
libphone-ui-shr-0.0.1+gitrAUTOINC+25e6160710: libphone-ui-shr requires <a h=
ref=3D"http://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.s=
o</a>()(64bit), but no providers in its RDEPENDS [file-rdeps]<br>
libphone-ui-shr-0.0.1+gitrAUTOINC+25e6160710: libphone-ui-shr requires <a h=
ref=3D"http://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.s=
o</a>, but no providers in its RDEPENDS [file-rdeps]<br>
lio-utils-4.1+gitAUTOINC+28bd928655: lio-utils requires /bin/bash, but no p=
roviders in its RDEPENDS [file-rdeps]<br>
lmsensors-config-1.0: lmsensors-config-cgi requires /usr/bin/rrdcgi, but no=
 providers in its RDEPENDS [file-rdeps]<br>
lxdm-0.5.0+gitAUTOINC+07fb151a99: lxdm requires /bin/bash, but no providers=
 in its RDEPENDS [file-rdeps]<br>
mime-support-3.48: mime-support requires /usr/bin/perl, but no providers in=
 its RDEPENDS [file-rdeps]<br>
mpg123-1.19.0: mpg123 requires <a href=3D"http://libpulsecommon-5.0.so" tar=
get=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but no providers in its =
RDEPENDS [file-rdeps]<br>
mpg123-1.19.0: mpg123 requires <a href=3D"http://libpulsecommon-5.0.so" tar=
get=3D"_blank">libpulsecommon-5.0.so</a>, but no providers in its RDEPENDS =
[file-rdeps]<br>
nodejs-0.8.18: nodejs requires /bin/bash, but no providers in its RDEPENDS =
[file-rdeps]<br>
numptyphysics-0.2+svnr109: numptyphysics requires /bin/bash, /usr/bin/perl,=
 but no providers in its RDEPENDS [file-rdeps]<br>
packagekit-0.5.6: packagekit requires /bin/bash, but no providers in its RD=
EPENDS [file-rdeps]<br>
pcsc-lite-1.8.6: pcsc-lite requires /usr/bin/python, but no providers in it=
s RDEPENDS [file-rdeps]<br>
php-5.4.33: php requires /tmp/work/armv5te-oe-linux-gnueabi/php/5.4.33-r0/i=
mage/usr/bin/php, but no providers in its RDEPENDS [file-rdeps]<br>
php-5.4.33: php requires /tmp/work/core2-64-oe-linux/php/5.4.33-r0/image/us=
r/bin/php, but no providers in its RDEPENDS [file-rdeps]<br>
php-5.4.33: php requires /tmp/work/i586-oe-linux/php/5.4.33-r0/image/usr/bi=
n/php, but no providers in its RDEPENDS [file-rdeps]<br>
pidgin-2.10.9: libpurple-protocol-aim requires liboscar.so.0()(64bit), but =
no providers in its RDEPENDS [file-rdeps]<br>
pidgin-2.10.9: libpurple-protocol-aim requires liboscar.so.0, but no provid=
ers in its RDEPENDS [file-rdeps]<br>
pidgin-2.10.9: libpurple-protocol-icq requires liboscar.so.0()(64bit), but =
no providers in its RDEPENDS [file-rdeps]<br>
pidgin-2.10.9: libpurple-protocol-icq requires liboscar.so.0, but no provid=
ers in its RDEPENDS [file-rdeps]<br>
pidgin-2.10.9: libpurple-protocol-xmpp requires libjabber.so.0()(64bit), bu=
t no providers in its RDEPENDS [file-rdeps]<br>
pidgin-2.10.9: libpurple-protocol-xmpp requires libjabber.so.0, but no prov=
iders in its RDEPENDS [file-rdeps]<br>
pidgin-2.10.9: libpurple-protocol-yahoo requires libymsg.so.0()(64bit), but=
 no providers in its RDEPENDS [file-rdeps]<br>
pidgin-2.10.9: libpurple-protocol-yahoo requires libymsg.so.0, but no provi=
ders in its RDEPENDS [file-rdeps]<br>
pidgin-2.10.9: libpurple-protocol-yahoojp requires libymsg.so.0()(64bit), b=
ut no providers in its RDEPENDS [file-rdeps]<br>
pidgin-2.10.9: libpurple-protocol-yahoojp requires libymsg.so.0, but no pro=
viders in its RDEPENDS [file-rdeps]<br>
places-0.1.0+svnr82070: places requires <a href=3D"http://libpulsecommon-5.=
0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but no provider=
s in its RDEPENDS [file-rdeps]<br>
places-0.1.0+svnr82070: places requires <a href=3D"http://libpulsecommon-5.=
0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no providers in its =
RDEPENDS [file-rdeps]<br>
pm-qa-0.4.14: pm-qa requires /bin/bash, but no providers in its RDEPENDS [f=
ile-rdeps]<br>
pulseaudio-5.0: libpulse requires <a href=3D"http://libpulsecommon-5.0.so" =
target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but no providers in i=
ts RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: libpulse requires <a href=3D"http://libpulsecommon-5.0.so" =
target=3D"_blank">libpulsecommon-5.0.so</a>, but no providers in its RDEPEN=
DS [file-rdeps]<br>
pulseaudio-5.0: libpulse-mainloop-glib requires <a href=3D"http://libpulsec=
ommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but no =
providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: libpulse-mainloop-glib requires <a href=3D"http://libpulsec=
ommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no providers=
 in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: libpulse-simple requires <a href=3D"http://libpulsecommon-5=
.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but no provide=
rs in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: libpulse-simple requires <a href=3D"http://libpulsecommon-5=
.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no providers in its=
 RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: libpulsecore requires <a href=3D"http://libpulsecommon-5.0.=
so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but no providers =
in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: libpulsecore requires <a href=3D"http://libpulsecommon-5.0.=
so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no providers in its RD=
EPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-lib-alsa-util requires <a href=3D"http://libpuls=
ecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but n=
o providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-lib-alsa-util requires <a href=3D"http://libpuls=
ecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no provide=
rs in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-lib-avahi-wrap requires <a href=3D"http://libpul=
secommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but =
no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-lib-avahi-wrap requires <a href=3D"http://libpul=
secommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no provid=
ers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-lib-bluez4-util requires <a href=3D"http://libpu=
lsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but=
 no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-lib-bluez4-util requires <a href=3D"http://libpu=
lsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no provi=
ders in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-lib-cli requires <a href=3D"http://libpulsecommo=
n-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but no prov=
iders in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-lib-cli requires <a href=3D"http://libpulsecommo=
n-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no providers in =
its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-lib-oss-util requires <a href=3D"http://libpulse=
common-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but no=
 providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-lib-oss-util requires <a href=3D"http://libpulse=
common-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no provider=
s in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-lib-protocol-cli requires libcli.so, <a href=3D"=
http://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, =
but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-lib-protocol-cli requires <a href=3D"http://libp=
ulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), li=
bcli.so()(64bit), but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-lib-protocol-esound requires <a href=3D"http://l=
ibpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit),=
 but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-lib-protocol-esound requires <a href=3D"http://l=
ibpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no p=
roviders in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-lib-protocol-http requires <a href=3D"http://lib=
pulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), b=
ut no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-lib-protocol-http requires <a href=3D"http://lib=
pulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no pro=
viders in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-lib-protocol-native requires <a href=3D"http://l=
ibpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit),=
 but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-lib-protocol-native requires <a href=3D"http://l=
ibpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no p=
roviders in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-lib-protocol-simple requires <a href=3D"http://l=
ibpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit),=
 but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-lib-protocol-simple requires <a href=3D"http://l=
ibpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no p=
roviders in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-lib-rtp requires <a href=3D"http://libpulsecommo=
n-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but no prov=
iders in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-lib-rtp requires <a href=3D"http://libpulsecommo=
n-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no providers in =
its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-misc requires <a href=3D"http://libpulsecommon-5=
.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but no provide=
rs in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-misc requires <a href=3D"http://libpulsecommon-5=
.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no providers in its=
 RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-alsa-card requires <a href=3D"http://libp=
ulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), li=
balsa-util.so()(64bit), but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-alsa-card requires <a href=3D"http://libp=
ulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, libalsa-uti=
l.so, but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-alsa-sink requires <a href=3D"http://libp=
ulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), li=
balsa-util.so()(64bit), but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-alsa-sink requires <a href=3D"http://libp=
ulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, libalsa-uti=
l.so, but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-alsa-source requires <a href=3D"http://li=
bpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), =
libalsa-util.so()(64bit), but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-alsa-source requires <a href=3D"http://li=
bpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, libalsa-u=
til.so, but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-always-sink requires <a href=3D"http://li=
bpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), =
but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-always-sink requires <a href=3D"http://li=
bpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no pr=
oviders in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-augment-properties requires <a href=3D"ht=
tp://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(6=
4bit), but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-augment-properties requires <a href=3D"ht=
tp://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, bu=
t no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-bluetooth-discover requires <a href=3D"ht=
tp://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(6=
4bit), but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-bluetooth-discover requires <a href=3D"ht=
tp://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, bu=
t no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-bluetooth-policy requires <a href=3D"http=
://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64b=
it), but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-bluetooth-policy requires <a href=3D"http=
://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but =
no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-bluez4-device requires libbluez4-util.so,=
 <a href=3D"http://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-=
5.0.so</a>, but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-bluez4-device requires <a href=3D"http://=
libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit)=
, libbluez4-util.so()(64bit), but no providers in its RDEPENDS [file-rdeps]=
<br>
pulseaudio-5.0: pulseaudio-module-bluez4-discover requires libbluez4-util.s=
o, <a href=3D"http://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommo=
n-5.0.so</a>, but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-bluez4-discover requires <a href=3D"http:=
//libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bi=
t), libbluez4-util.so()(64bit), but no providers in its RDEPENDS [file-rdep=
s]<br>
pulseaudio-5.0: pulseaudio-module-card-restore requires <a href=3D"http://l=
ibpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit),=
 but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-card-restore requires <a href=3D"http://l=
ibpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no p=
roviders in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-cli requires libcli.so, <a href=3D"http:/=
/libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no=
 providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-cli requires <a href=3D"http://libpulseco=
mmon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), libcli.s=
o()(64bit), but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-cli-protocol-tcp requires libprotocol-cli=
.so, libcli.so, <a href=3D"http://libpulsecommon-5.0.so" target=3D"_blank">=
libpulsecommon-5.0.so</a>, but no providers in its RDEPENDS [file-rdeps]<br=
>
pulseaudio-5.0: pulseaudio-module-cli-protocol-tcp requires <a href=3D"http=
://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64b=
it), libcli.so()(64bit), libprotocol-cli.so()(64bit), but no providers in i=
ts RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-cli-protocol-unix requires libprotocol-cl=
i.so, libcli.so, <a href=3D"http://libpulsecommon-5.0.so" target=3D"_blank"=
>libpulsecommon-5.0.so</a>, but no providers in its RDEPENDS [file-rdeps]<b=
r>
pulseaudio-5.0: pulseaudio-module-cli-protocol-unix requires <a href=3D"htt=
p://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64=
bit), libcli.so()(64bit), libprotocol-cli.so()(64bit), but no providers in =
its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-combine requires <a href=3D"http://libpul=
secommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but =
no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-combine requires <a href=3D"http://libpul=
secommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no provid=
ers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-combine-sink requires <a href=3D"http://l=
ibpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit),=
 but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-combine-sink requires <a href=3D"http://l=
ibpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no p=
roviders in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-console-kit requires <a href=3D"http://li=
bpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), =
but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-console-kit requires <a href=3D"http://li=
bpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no pr=
oviders in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-dbus-protocol requires <a href=3D"http://=
libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit)=
, but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-dbus-protocol requires <a href=3D"http://=
libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no =
providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-default-device-restore requires <a href=
=3D"http://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</=
a>()(64bit), but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-default-device-restore requires <a href=
=3D"http://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</=
a>, but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-detect requires <a href=3D"http://libpuls=
ecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but n=
o providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-detect requires <a href=3D"http://libpuls=
ecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no provide=
rs in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-device-manager requires libprotocol-nativ=
e.so, <a href=3D"http://libpulsecommon-5.0.so" target=3D"_blank">libpulseco=
mmon-5.0.so</a>, but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-device-manager requires <a href=3D"http:/=
/libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit=
), libprotocol-native.so()(64bit), but no providers in its RDEPENDS [file-r=
deps]<br>
pulseaudio-5.0: pulseaudio-module-device-restore requires libprotocol-nativ=
e.so, <a href=3D"http://libpulsecommon-5.0.so" target=3D"_blank">libpulseco=
mmon-5.0.so</a>, but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-device-restore requires <a href=3D"http:/=
/libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit=
), libprotocol-native.so()(64bit), but no providers in its RDEPENDS [file-r=
deps]<br>
pulseaudio-5.0: pulseaudio-module-echo-cancel requires <a href=3D"http://li=
bpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), =
but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-echo-cancel requires <a href=3D"http://li=
bpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no pr=
oviders in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-esound-compat-spawnfd requires <a href=3D=
"http://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>(=
)(64bit), but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-esound-compat-spawnfd requires <a href=3D=
"http://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>,=
 but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-esound-compat-spawnpid requires <a href=
=3D"http://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</=
a>()(64bit), but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-esound-compat-spawnpid requires <a href=
=3D"http://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</=
a>, but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-esound-protocol-tcp requires libprotocol-=
esound.so()(64bit), <a href=3D"http://libpulsecommon-5.0.so" target=3D"_bla=
nk">libpulsecommon-5.0.so</a>()(64bit), but no providers in its RDEPENDS [f=
ile-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-esound-protocol-tcp requires libprotocol-=
esound.so, <a href=3D"http://libpulsecommon-5.0.so" target=3D"_blank">libpu=
lsecommon-5.0.so</a>, but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-esound-protocol-tcp requires <a href=3D"h=
ttp://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, l=
ibprotocol-esound.so, but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-esound-protocol-unix requires libprotocol=
-esound.so, <a href=3D"http://libpulsecommon-5.0.so" target=3D"_blank">libp=
ulsecommon-5.0.so</a>, but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-esound-protocol-unix requires <a href=3D"=
http://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()=
(64bit), libprotocol-esound.so()(64bit), but no providers in its RDEPENDS [=
file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-esound-sink requires <a href=3D"http://li=
bpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), =
but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-esound-sink requires <a href=3D"http://li=
bpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no pr=
oviders in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-filter-apply requires <a href=3D"http://l=
ibpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit),=
 but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-filter-apply requires <a href=3D"http://l=
ibpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no p=
roviders in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-filter-heuristics requires <a href=3D"htt=
p://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64=
bit), but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-filter-heuristics requires <a href=3D"htt=
p://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but=
 no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-gconf requires <a href=3D"http://libpulse=
common-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but no=
 providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-gconf requires <a href=3D"http://libpulse=
common-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no provider=
s in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-http-protocol-tcp requires libprotocol-ht=
tp.so, <a href=3D"http://libpulsecommon-5.0.so" target=3D"_blank">libpulsec=
ommon-5.0.so</a>, but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-http-protocol-tcp requires <a href=3D"htt=
p://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64=
bit), libprotocol-http.so()(64bit), but no providers in its RDEPENDS [file-=
rdeps]<br>
pulseaudio-5.0: pulseaudio-module-http-protocol-unix requires libprotocol-h=
ttp.so, <a href=3D"http://libpulsecommon-5.0.so" target=3D"_blank">libpulse=
common-5.0.so</a>, but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-http-protocol-unix requires <a href=3D"ht=
tp://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(6=
4bit), libprotocol-http.so()(64bit), but no providers in its RDEPENDS [file=
-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-intended-roles requires <a href=3D"http:/=
/libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit=
), but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-intended-roles requires <a href=3D"http:/=
/libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no=
 providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-ladspa-sink requires <a href=3D"http://li=
bpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), =
but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-ladspa-sink requires <a href=3D"http://li=
bpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no pr=
oviders in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-loopback requires <a href=3D"http://libpu=
lsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but=
 no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-loopback requires <a href=3D"http://libpu=
lsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no provi=
ders in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-match requires <a href=3D"http://libpulse=
common-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but no=
 providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-match requires <a href=3D"http://libpulse=
common-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no provider=
s in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-mmkbd-evdev requires <a href=3D"http://li=
bpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), =
but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-mmkbd-evdev requires <a href=3D"http://li=
bpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no pr=
oviders in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-native-protocol-fd requires libprotocol-n=
ative.so, <a href=3D"http://libpulsecommon-5.0.so" target=3D"_blank">libpul=
secommon-5.0.so</a>, but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-native-protocol-fd requires <a href=3D"ht=
tp://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(6=
4bit), libprotocol-native.so()(64bit), but no providers in its RDEPENDS [fi=
le-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-native-protocol-tcp requires libprotocol-=
native.so, <a href=3D"http://libpulsecommon-5.0.so" target=3D"_blank">libpu=
lsecommon-5.0.so</a>, but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-native-protocol-tcp requires <a href=3D"h=
ttp://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(=
64bit), libprotocol-native.so()(64bit), but no providers in its RDEPENDS [f=
ile-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-native-protocol-unix requires libprotocol=
-native.so, <a href=3D"http://libpulsecommon-5.0.so" target=3D"_blank">libp=
ulsecommon-5.0.so</a>, but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-native-protocol-unix requires <a href=3D"=
http://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()=
(64bit), libprotocol-native.so()(64bit), but no providers in its RDEPENDS [=
file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-null-sink requires <a href=3D"http://libp=
ulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), bu=
t no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-null-sink requires <a href=3D"http://libp=
ulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no prov=
iders in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-null-source requires <a href=3D"http://li=
bpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), =
but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-null-source requires <a href=3D"http://li=
bpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no pr=
oviders in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-oss requires liboss-util.so, <a href=3D"h=
ttp://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, b=
ut no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-oss requires <a href=3D"http://libpulseco=
mmon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), liboss-u=
til.so()(64bit), but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-pipe-sink requires <a href=3D"http://libp=
ulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), bu=
t no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-pipe-sink requires <a href=3D"http://libp=
ulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no prov=
iders in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-pipe-source requires <a href=3D"http://li=
bpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), =
but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-pipe-source requires <a href=3D"http://li=
bpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no pr=
oviders in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-position-event-sounds requires <a href=3D=
"http://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>(=
)(64bit), but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-position-event-sounds requires <a href=3D=
"http://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>,=
 but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-remap-sink requires <a href=3D"http://lib=
pulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), b=
ut no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-remap-sink requires <a href=3D"http://lib=
pulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no pro=
viders in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-remap-source requires <a href=3D"http://l=
ibpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit),=
 but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-remap-source requires <a href=3D"http://l=
ibpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no p=
roviders in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-rescue-streams requires <a href=3D"http:/=
/libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit=
), but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-rescue-streams requires <a href=3D"http:/=
/libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no=
 providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-role-cork requires <a href=3D"http://libp=
ulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), bu=
t no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-role-cork requires <a href=3D"http://libp=
ulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no prov=
iders in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-role-ducking requires <a href=3D"http://l=
ibpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit),=
 but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-role-ducking requires <a href=3D"http://l=
ibpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no p=
roviders in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-rtp-recv requires <a href=3D"http://libpu=
lsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), lib=
rtp.so()(64bit), but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-rtp-recv requires librtp.so, <a href=3D"h=
ttp://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, b=
ut no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-rtp-send requires <a href=3D"http://libpu=
lsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), lib=
rtp.so()(64bit), but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-rtp-send requires librtp.so, <a href=3D"h=
ttp://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, b=
ut no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-rygel-media-server requires libprotocol-h=
ttp.so, <a href=3D"http://libpulsecommon-5.0.so" target=3D"_blank">libpulse=
common-5.0.so</a>, but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-rygel-media-server requires <a href=3D"ht=
tp://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(6=
4bit), libprotocol-http.so()(64bit), but no providers in its RDEPENDS [file=
-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-simple-protocol-tcp requires libprotocol-=
simple.so, <a href=3D"http://libpulsecommon-5.0.so" target=3D"_blank">libpu=
lsecommon-5.0.so</a>, but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-simple-protocol-tcp requires <a href=3D"h=
ttp://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(=
64bit), libprotocol-simple.so()(64bit), but no providers in its RDEPENDS [f=
ile-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-simple-protocol-unix requires libprotocol=
-simple.so, <a href=3D"http://libpulsecommon-5.0.so" target=3D"_blank">libp=
ulsecommon-5.0.so</a>, but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-simple-protocol-unix requires <a href=3D"=
http://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()=
(64bit), libprotocol-simple.so()(64bit), but no providers in its RDEPENDS [=
file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-sine requires <a href=3D"http://libpulsec=
ommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but no =
providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-sine requires <a href=3D"http://libpulsec=
ommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no providers=
 in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-sine-source requires <a href=3D"http://li=
bpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), =
but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-sine-source requires <a href=3D"http://li=
bpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no pr=
oviders in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-stream-restore requires libprotocol-nativ=
e.so, <a href=3D"http://libpulsecommon-5.0.so" target=3D"_blank">libpulseco=
mmon-5.0.so</a>, but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-stream-restore requires <a href=3D"http:/=
/libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit=
), libprotocol-native.so()(64bit), but no providers in its RDEPENDS [file-r=
deps]<br>
pulseaudio-5.0: pulseaudio-module-suspend-on-idle requires <a href=3D"http:=
//libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bi=
t), but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-suspend-on-idle requires <a href=3D"http:=
//libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but n=
o providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-switch-on-connect requires <a href=3D"htt=
p://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64=
bit), but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-switch-on-connect requires <a href=3D"htt=
p://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but=
 no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-switch-on-port-available requires <a href=
=3D"http://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</=
a>()(64bit), but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-switch-on-port-available requires <a href=
=3D"http://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</=
a>, but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-systemd-login requires <a href=3D"http://=
libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit)=
, but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-systemd-login requires <a href=3D"http://=
libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no =
providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-tunnel-sink requires <a href=3D"http://li=
bpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), =
but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-tunnel-sink requires <a href=3D"http://li=
bpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no pr=
oviders in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-tunnel-sink-new requires <a href=3D"http:=
//libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bi=
t), but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-tunnel-sink-new requires <a href=3D"http:=
//libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but n=
o providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-tunnel-source requires <a href=3D"http://=
libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit)=
, but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-tunnel-source requires <a href=3D"http://=
libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no =
providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-tunnel-source-new requires <a href=3D"htt=
p://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64=
bit), but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-tunnel-source-new requires <a href=3D"htt=
p://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but=
 no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-udev-detect requires <a href=3D"http://li=
bpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), =
but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-udev-detect requires <a href=3D"http://li=
bpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no pr=
oviders in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-virtual-sink requires <a href=3D"http://l=
ibpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit),=
 but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-virtual-sink requires <a href=3D"http://l=
ibpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no p=
roviders in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-virtual-source requires <a href=3D"http:/=
/libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit=
), but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-virtual-source requires <a href=3D"http:/=
/libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no=
 providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-virtual-surround-sink requires <a href=3D=
"http://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>(=
)(64bit), but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-virtual-surround-sink requires <a href=3D=
"http://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>,=
 but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-volume-restore requires <a href=3D"http:/=
/libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit=
), but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-volume-restore requires <a href=3D"http:/=
/libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no=
 providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-x11-bell requires <a href=3D"http://libpu=
lsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but=
 no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-x11-bell requires <a href=3D"http://libpu=
lsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no provi=
ders in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-x11-cork-request requires <a href=3D"http=
://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64b=
it), but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-x11-cork-request requires <a href=3D"http=
://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but =
no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-x11-publish requires libprotocol-native.s=
o, <a href=3D"http://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommo=
n-5.0.so</a>, but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-x11-publish requires <a href=3D"http://li=
bpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), =
libprotocol-native.so()(64bit), but no providers in its RDEPENDS [file-rdep=
s]<br>
pulseaudio-5.0: pulseaudio-module-x11-xsmp requires <a href=3D"http://libpu=
lsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but=
 no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-x11-xsmp requires <a href=3D"http://libpu=
lsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no provi=
ders in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-zeroconf-discover requires libavahi-wrap.=
so, <a href=3D"http://libpulsecommon-5.0.so" target=3D"_blank">libpulsecomm=
on-5.0.so</a>, but no providers in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-zeroconf-discover requires <a href=3D"htt=
p://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64=
bit), libavahi-wrap.so()(64bit), but no providers in its RDEPENDS [file-rde=
ps]<br>
pulseaudio-5.0: pulseaudio-module-zeroconf-publish requires libavahi-wrap.s=
o, <a href=3D"http://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommo=
n-5.0.so</a>, libprotocol-native.so, but no providers in its RDEPENDS [file=
-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-zeroconf-publish requires libprotocol-nat=
ive.so()(64bit), <a href=3D"http://libpulsecommon-5.0.so" target=3D"_blank"=
>libpulsecommon-5.0.so</a>()(64bit), libavahi-wrap.so()(64bit), but no prov=
iders in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-module-zeroconf-publish requires libprotocol-nat=
ive.so, libavahi-wrap.so, <a href=3D"http://libpulsecommon-5.0.so" target=
=3D"_blank">libpulsecommon-5.0.so</a>, but no providers in its RDEPENDS [fi=
le-rdeps]<br>
pulseaudio-5.0: pulseaudio-server requires <a href=3D"http://libpulsecommon=
-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but no provi=
ders in its RDEPENDS [file-rdeps]<br>
pulseaudio-5.0: pulseaudio-server requires <a href=3D"http://libpulsecommon=
-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no providers in i=
ts RDEPENDS [file-rdeps]<br>
qt-creator-2.8.1: qt-creator requires /usr/bin/perl, but no providers in it=
s RDEPENDS [file-rdeps]<br>
qtbase-5.3.2: qtbase-mkspecs requires /bin/bash, but no providers in its RD=
EPENDS [file-rdeps]<br>
rain-0.0.3+svnr82070: rain requires <a href=3D"http://libpulsecommon-5.0.so=
" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but no providers in=
 its RDEPENDS [file-rdeps]<br>
rain-0.0.3+svnr82070: rain requires <a href=3D"http://libpulsecommon-5.0.so=
" target=3D"_blank">libpulsecommon-5.0.so</a>, but no providers in its RDEP=
ENDS [file-rdeps]<br>
shr-e-gadgets-0.0.0+gitrAUTOINC+42806ea24f: shr-e-gadgets requires <a href=
=3D"http://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</=
a>()(64bit), but no providers in its RDEPENDS [file-rdeps]<br>
shr-e-gadgets-0.0.0+gitrAUTOINC+42806ea24f: shr-e-gadgets requires <a href=
=3D"http://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</=
a>, but no providers in its RDEPENDS [file-rdeps]<br>
shr-wizard-0.0.0+gitrAUTOINC+1dae79221f: shr-wizard requires <a href=3D"htt=
p://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64=
bit), but no providers in its RDEPENDS [file-rdeps]<br>
shr-wizard-0.0.0+gitrAUTOINC+1dae79221f: shr-wizard requires <a href=3D"htt=
p://libpulsecommon-5.0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but=
 no providers in its RDEPENDS [file-rdeps]<br>
sox-14.4.0: sox requires <a href=3D"http://libpulsecommon-5.0.so" target=3D=
"_blank">libpulsecommon-5.0.so</a>()(64bit), but no providers in its RDEPEN=
DS [file-rdeps]<br>
sox-14.4.0: sox requires <a href=3D"http://libpulsecommon-5.0.so" target=3D=
"_blank">libpulsecommon-5.0.so</a>, but no providers in its RDEPENDS [file-=
rdeps]<br>
syslog-ng-3.5.4.1: syslog-ng requires /usr/bin/awk, but no providers in its=
 RDEPENDS [file-rdeps]<br>
systemd-216+gitAUTOINC+5d0ae62c66: systemd-kernel-install requires /bin/bas=
h, but no providers in its RDEPENDS [file-rdeps]<br>
tracker-0.14.2: tracker-nautilus-extension requires libnautilus-extension.s=
o.1()(64bit), but no providers in its RDEPENDS [file-rdeps]<br>
tracker-0.14.2: tracker-nautilus-extension requires libnautilus-extension.s=
o.1, but no providers in its RDEPENDS [file-rdeps]<br>
ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: ubx-utils requires /bin/bash, but n=
o providers in its RDEPENDS [file-rdeps]<br>
unionfs-fuse-0.26: unionfs-fuse requires /bin/bash, but no providers in its=
 RDEPENDS [file-rdeps]<br>
uptime-0.0.2+svnr82070: uptime requires <a href=3D"http://libpulsecommon-5.=
0.so" target=3D"_blank">libpulsecommon-5.0.so</a>()(64bit), but no provider=
s in its RDEPENDS [file-rdeps]<br>
uptime-0.0.2+svnr82070: uptime requires <a href=3D"http://libpulsecommon-5.=
0.so" target=3D"_blank">libpulsecommon-5.0.so</a>, but no providers in its =
RDEPENDS [file-rdeps]<br>
usbpath-0.0+svnr3172: usbpath requires /usr/bin/perl, but no providers in i=
ts RDEPENDS [file-rdeps]<br>
webmin-1.700: webmin-module-ajaxterm requires /sbin/runscript, but no provi=
ders in its RDEPENDS [file-rdeps]<br>
wvstreams-4.6.1: wvstreams requires /usr/bin/perl, but no providers in its =
RDEPENDS [file-rdeps]<br>
xfce4-dev-tools-4.11.0: xfce4-dev-tools requires /bin/bash, but no provider=
s in its RDEPENDS [file-rdeps]<br>
xmlto-0.0.25: xmlto requires /bin/bash, but no providers in its RDEPENDS [f=
ile-rdeps]<br>
<span class=3D""><font color=3D"#888888"></font></span><br></blockquote></d=
iv>a bit off topic (but only a bit :)<br><br></div><div class=3D"gmail_extr=
a">I don&#39;t see these except file-rdeps. IIRC I did a setting to enable =
file-rdeps but I cannot remember where it was. So to take care: Where can I=
 enable all the qa warnings?<br><br></div><div class=3D"gmail_extra">Andrea=
s<br></div></div>

--089e015366882fdeaf05050f52f3--
