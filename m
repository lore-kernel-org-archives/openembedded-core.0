Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 8DF13789BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 10:00:22 +0000 (UTC)
Received: from [172.16.1.14] (62-178-50-190.cable.dynamic.surfer.at
	[62.178.50.190]) by ptmx.org (Postfix) with ESMTPSA id C49CA10DB;
	Tue, 17 Jul 2018 12:00:22 +0200 (CEST)
To: Martin Jansa <martin.jansa@gmail.com>
References: <20180717093523.5582-1-dv@pseudoterminal.org>
	<20180717093523.5582-2-dv@pseudoterminal.org>
	<CA+chaQcHrnAFA5wmOx2QAj=-58wR-HUri+VWiXn6FBmm2BVJUw@mail.gmail.com>
	<328d9bf4-dbf8-0f65-7e6d-e0199697625e@pseudoterminal.org>
	<CA+chaQe+ZT2Kc-cv3mKz+e9uLkfGpVy1CkwVOv=yZ=Xpdy4cAw@mail.gmail.com>
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <b85ab46b-d634-d80a-91f2-f6254e5a7708@pseudoterminal.org>
Date: Tue, 17 Jul 2018 12:00:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQe+ZT2Kc-cv3mKz+e9uLkfGpVy1CkwVOv=yZ=Xpdy4cAw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] gstreamer1.0-plugin-good: Update packageconfigs
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
X-List-Received-Date: Tue, 17 Jul 2018 10:00:23 -0000
Content-Type: multipart/alternative;
	boundary="------------7F63E89F29295F49E5E84EDD"
Content-Language: en-US

--------------7F63E89F29295F49E5E84EDD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Is it realistic that anybody would want to disable zlib and bzip2 
support in the qtdemux and matroska plugins? Especially since zlib and 
bzip2 are essential parts of pretty much _all_ rootfs in existence?

That's why I thought to remove these packageconfigs. I also don't add 
packageconfigs for things like ncurses or libdl.


On 2018-07-17 11:57, Martin Jansa wrote:
> The PACKAGECONFIG for them is already there, why do you need to remove 
> the option for someone to disable the support if they want?
>
> On Tue, Jul 17, 2018 at 11:54 AM Carlos Rafael Giani 
> <dv@pseudoterminal.org <mailto:dv@pseudoterminal.org>> wrote:
>
>     The zlib and bz2 switches enable zlib and bzip2 support in the
>     qtdemux and matroska plugins. They do not enable some sort of
>     standalone bz2/zlib plugins. Is there any reason why these
>     shouldn't be enabled always?
>
>
>     On 2018-07-17 11:50, Martin Jansa wrote:
>>     Why do you remove bz2 and zlib PACKAGECONFIGs instead of just
>>     enabling them by default?
>>
>>     On Tue, Jul 17, 2018 at 11:45 AM Carlos Rafael Giani
>>     <dv@pseudoterminal.org <mailto:dv@pseudoterminal.org>> wrote:
>>
>>         * Always enable bz2 and zlib, since these are part of
>>         oe-core, and
>>           dependencies that are in oe-core can be always enabled
>>         * There is no twolame recipe in oe-core or in
>>         meta-openembedded, so
>>           disable it
>>         * Reorder the packageconfigs alphabetically
>>
>>         Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org
>>         <mailto:dv@pseudoterminal.org>>
>>         ---
>>          .../gstreamer1.0-plugins-good_1.14.1.bb
>>         <http://gstreamer1.0-plugins-good_1.14.1.bb>        | 17
>>         +++++++++--------
>>          1 file changed, 9 insertions(+), 8 deletions(-)
>>
>>         diff --git
>>         a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.1.bb
>>         <http://gstreamer1.0-plugins-good_1.14.1.bb>
>>         b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.1.bb
>>         <http://gstreamer1.0-plugins-good_1.14.1.bb>
>>         index 36eb3107ae..baeb19ddfe 100644
>>         ---
>>         a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.1.bb
>>         <http://gstreamer1.0-plugins-good_1.14.1.bb>
>>         +++
>>         b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.1.bb
>>         <http://gstreamer1.0-plugins-good_1.14.1.bb>
>>         @@ -18,7 +18,7 @@ LIC_FILES_CHKSUM =
>>         "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
>>         file://common/coverage/coverage-report.pl
>>         <http://coverage-report.pl>;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607
>>         \
>>         file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
>>
>>         -DEPENDS += "gstreamer1.0-plugins-base libcap"
>>         +DEPENDS += "gstreamer1.0-plugins-base libcap zlib bzip2"
>>          RPROVIDES_${PN}-pulseaudio += "${PN}-pulse"
>>          RPROVIDES_${PN}-soup += "${PN}-souphttpsrc"
>>
>>         @@ -28,7 +28,7 @@ PACKAGECONFIG ??= " \
>>              ${GSTREAMER_ORC} \
>>              ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio x11',
>>         d)} \
>>              ${@bb.utils.contains_any('DISTRO_FEATURES',
>>         d.getVar('GTK3DISTROFEATURES'), 'gtk', '', d)} \
>>         -    cairo flac gdk-pixbuf gudev jpeg libpng soup speex
>>         taglib v4l2 bz2 zlib mpg123 lame \
>>         +    cairo flac gdk-pixbuf gudev jpeg lame libpng mpg123 soup
>>         speex taglib v4l2 \
>>          "
>>
>>          X11DEPENDS = "virtual/libx11 libsm libxrender libxfixes
>>         libxdamage"
>>         @@ -37,11 +37,14 @@ PACKAGECONFIG[cairo]      =
>>         "--enable-cairo,--disable-cairo,cairo"
>>          PACKAGECONFIG[dv1394]     =
>>         "--enable-dv1394,--disable-dv1394,libiec61883 libavc1394
>>         libraw1394"
>>          PACKAGECONFIG[flac]       = "--enable-flac,--disable-flac,flac"
>>          PACKAGECONFIG[gdk-pixbuf] =
>>         "--enable-gdk_pixbuf,--disable-gdk_pixbuf,gdk-pixbuf"
>>         +PACKAGECONFIG[gtk]        = "--enable-gtk3,--disable-gtk3,gtk+3"
>>          PACKAGECONFIG[gudev]      =
>>         "--with-gudev,--without-gudev,libgudev"
>>          PACKAGECONFIG[jack]       = "--enable-jack,--disable-jack,jack"
>>          PACKAGECONFIG[jpeg]       = "--enable-jpeg,--disable-jpeg,jpeg"
>>         +PACKAGECONFIG[lame]       = "--enable-lame,--disable-lame,lame"
>>          PACKAGECONFIG[libpng]     =
>>         "--enable-libpng,--disable-libpng,libpng"
>>          PACKAGECONFIG[libv4l2]    =
>>         "--with-libv4l2,--without-libv4l2,v4l-utils"
>>         +PACKAGECONFIG[mpg123]     =
>>         "--enable-mpg123,--disable-mpg123,mpg123"
>>          PACKAGECONFIG[pulseaudio] =
>>         "--enable-pulse,--disable-pulse,pulseaudio"
>>          PACKAGECONFIG[soup]       =
>>         "--enable-soup,--disable-soup,libsoup-2.4"
>>          PACKAGECONFIG[speex]      =
>>         "--enable-speex,--disable-speex,speex"
>>         @@ -50,11 +53,6 @@ PACKAGECONFIG[v4l2]       =
>>         "--enable-gst_v4l2 --enable-v4l2-probe,--disable-gst
>>          PACKAGECONFIG[vpx]        = "--enable-vpx,--disable-vpx,libvpx"
>>          PACKAGECONFIG[wavpack]    =
>>         "--enable-wavpack,--disable-wavpack,wavpack"
>>          PACKAGECONFIG[x11]        =
>>         "--enable-x,--disable-x,${X11DEPENDS}"
>>         -PACKAGECONFIG[bz2]        = "--enable-bz2,--disable-bz2,bzip2"
>>         -PACKAGECONFIG[zlib]       = "--enable-zlib,--disable-zlib,zlib"
>>         -PACKAGECONFIG[lame]       = "--enable-lame,--disable-lame,lame"
>>         -PACKAGECONFIG[mpg123]     =
>>         "--enable-mpg123,--disable-mpg123,mpg123"
>>         -PACKAGECONFIG[gtk]        = "--enable-gtk3,--disable-gtk3,gtk+3"
>>
>>          # qt5 support is disabled, because it is not present in OE
>>         core, and requires more work than
>>          # just adding a packageconfig (it requires access to moc,
>>         uic, rcc, and qmake paths).
>>         @@ -62,7 +60,9 @@ PACKAGECONFIG[gtk]        =
>>         "--enable-gtk3,--disable-gtk3,gtk+3"
>>          # in a gstreamer1.0-plugins-good bbappend).
>>
>>          EXTRA_OECONF += " \
>>         +    --enable-bz2 \
>>              --enable-oss \
>>         +    --enable-zlib \
>>              --disable-aalib \
>>              --disable-aalibtest \
>>              --disable-directsound \
>>         @@ -71,9 +71,10 @@ EXTRA_OECONF += " \
>>              --disable-oss4 \
>>              --disable-osx_audio \
>>              --disable-osx_video \
>>         +    --disable-qt \
>>              --disable-shout2 \
>>         +    --disable-twolame \
>>              --disable-waveform \
>>         -    --disable-qt \
>>          "
>>
>>          FILES_${PN}-equalizer +=
>>         "${datadir}/gstreamer-1.0/presets/*.prs"
>>         -- 
>>         2.17.1
>>
>>         -- 
>>         _______________________________________________
>>         Openembedded-core mailing list
>>         Openembedded-core@lists.openembedded.org
>>         <mailto:Openembedded-core@lists.openembedded.org>
>>         http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>


--------------7F63E89F29295F49E5E84EDD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Is it realistic that anybody would want to disable zlib and bzip2
      support in the qtdemux and matroska plugins? Especially since zlib
      and bzip2 are essential parts of pretty much _all_ rootfs in
      existence?</p>
    <p>That's why I thought to remove these packageconfigs. I also don't
      add packageconfigs for things like ncurses or libdl.<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 2018-07-17 11:57, Martin Jansa
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CA+chaQe+ZT2Kc-cv3mKz+e9uLkfGpVy1CkwVOv=yZ=Xpdy4cAw@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=utf-8">
      <div dir="ltr">The PACKAGECONFIG for them is already there, why do
        you need to remove the option for someone to disable the support
        if they want?</div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr">On Tue, Jul 17, 2018 at 11:54 AM Carlos Rafael
          Giani &lt;<a href="mailto:dv@pseudoterminal.org"
            moz-do-not-send="true">dv@pseudoterminal.org</a>&gt; wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">
          <div text="#000000" bgcolor="#FFFFFF">
            <p>The zlib and bz2 switches enable zlib and bzip2 support
              in the qtdemux and matroska plugins. They do not enable
              some sort of standalone bz2/zlib plugins. Is there any
              reason why these shouldn't be enabled always?<br>
            </p>
            <br>
            <div class="m_-4186692926023383277moz-cite-prefix">On
              2018-07-17 11:50, Martin Jansa wrote:<br>
            </div>
            <blockquote type="cite">
              <div dir="ltr">Why do you remove bz2 and zlib
                PACKAGECONFIGs instead of just enabling them by default?</div>
              <br>
              <div class="gmail_quote">
                <div dir="ltr">On Tue, Jul 17, 2018 at 11:45 AM Carlos
                  Rafael Giani &lt;<a
                    href="mailto:dv@pseudoterminal.org" target="_blank"
                    moz-do-not-send="true">dv@pseudoterminal.org</a>&gt;
                  wrote:<br>
                </div>
                <blockquote class="gmail_quote" style="margin:0 0 0
                  .8ex;border-left:1px #ccc solid;padding-left:1ex">*
                  Always enable bz2 and zlib, since these are part of
                  oe-core, and<br>
                    dependencies that are in oe-core can be always
                  enabled<br>
                  * There is no twolame recipe in oe-core or in
                  meta-openembedded, so<br>
                    disable it<br>
                  * Reorder the packageconfigs alphabetically<br>
                  <br>
                  Signed-off-by: Carlos Rafael Giani &lt;<a
                    href="mailto:dv@pseudoterminal.org" target="_blank"
                    moz-do-not-send="true">dv@pseudoterminal.org</a>&gt;<br>
                  ---<br>
                   .../<a
                    href="http://gstreamer1.0-plugins-good_1.14.1.bb"
                    rel="noreferrer" target="_blank"
                    moz-do-not-send="true">gstreamer1.0-plugins-good_1.14.1.bb</a> 
                         | 17 +++++++++--------<br>
                   1 file changed, 9 insertions(+), 8 deletions(-)<br>
                  <br>
                  diff --git a/meta/recipes-multimedia/gstreamer/<a
                    href="http://gstreamer1.0-plugins-good_1.14.1.bb"
                    rel="noreferrer" target="_blank"
                    moz-do-not-send="true">gstreamer1.0-plugins-good_1.14.1.bb</a>
                  b/meta/recipes-multimedia/gstreamer/<a
                    href="http://gstreamer1.0-plugins-good_1.14.1.bb"
                    rel="noreferrer" target="_blank"
                    moz-do-not-send="true">gstreamer1.0-plugins-good_1.14.1.bb</a><br>
                  index 36eb3107ae..baeb19ddfe 100644<br>
                  --- a/meta/recipes-multimedia/gstreamer/<a
                    href="http://gstreamer1.0-plugins-good_1.14.1.bb"
                    rel="noreferrer" target="_blank"
                    moz-do-not-send="true">gstreamer1.0-plugins-good_1.14.1.bb</a><br>
                  +++ b/meta/recipes-multimedia/gstreamer/<a
                    href="http://gstreamer1.0-plugins-good_1.14.1.bb"
                    rel="noreferrer" target="_blank"
                    moz-do-not-send="true">gstreamer1.0-plugins-good_1.14.1.bb</a><br>
                  @@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "<a
                    class="m_-4186692926023383277moz-txt-link-freetext"
                    moz-do-not-send="true">file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343</a>
                  \<br>
                                       <a
                    class="m_-4186692926023383277moz-txt-link-freetext"
                    moz-do-not-send="true">file://common/coverage/</a><a
                    href="http://coverage-report.pl" rel="noreferrer"
                    target="_blank" moz-do-not-send="true">coverage-report.pl</a>;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607
                  \<br>
                                     
                   <a
                    class="m_-4186692926023383277moz-txt-link-freetext"
                    moz-do-not-send="true">file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe</a>"<br>
                  <br>
                  -DEPENDS += "gstreamer1.0-plugins-base libcap"<br>
                  +DEPENDS += "gstreamer1.0-plugins-base libcap zlib
                  bzip2"<br>
                   RPROVIDES_${PN}-pulseaudio += "${PN}-pulse"<br>
                   RPROVIDES_${PN}-soup += "${PN}-souphttpsrc"<br>
                  <br>
                  @@ -28,7 +28,7 @@ PACKAGECONFIG ??= " \<br>
                       ${GSTREAMER_ORC} \<br>
                       ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio
                  x11', d)} \<br>
                       ${@bb.utils.contains_any('DISTRO_FEATURES',
                  d.getVar('GTK3DISTROFEATURES'), 'gtk', '', d)} \<br>
                  -    cairo flac gdk-pixbuf gudev jpeg libpng soup
                  speex taglib v4l2 bz2 zlib mpg123 lame \<br>
                  +    cairo flac gdk-pixbuf gudev jpeg lame libpng
                  mpg123 soup speex taglib v4l2 \<br>
                   "<br>
                  <br>
                   X11DEPENDS = "virtual/libx11 libsm libxrender
                  libxfixes libxdamage"<br>
                  @@ -37,11 +37,14 @@ PACKAGECONFIG[cairo]      =
                  "--enable-cairo,--disable-cairo,cairo"<br>
                   PACKAGECONFIG[dv1394]     =
                  "--enable-dv1394,--disable-dv1394,libiec61883
                  libavc1394 libraw1394"<br>
                   PACKAGECONFIG[flac]       =
                  "--enable-flac,--disable-flac,flac"<br>
                   PACKAGECONFIG[gdk-pixbuf] =
                  "--enable-gdk_pixbuf,--disable-gdk_pixbuf,gdk-pixbuf"<br>
                  +PACKAGECONFIG[gtk]        =
                  "--enable-gtk3,--disable-gtk3,gtk+3"<br>
                   PACKAGECONFIG[gudev]      =
                  "--with-gudev,--without-gudev,libgudev"<br>
                   PACKAGECONFIG[jack]       =
                  "--enable-jack,--disable-jack,jack"<br>
                   PACKAGECONFIG[jpeg]       =
                  "--enable-jpeg,--disable-jpeg,jpeg"<br>
                  +PACKAGECONFIG[lame]       =
                  "--enable-lame,--disable-lame,lame"<br>
                   PACKAGECONFIG[libpng]     =
                  "--enable-libpng,--disable-libpng,libpng"<br>
                   PACKAGECONFIG[libv4l2]    =
                  "--with-libv4l2,--without-libv4l2,v4l-utils"<br>
                  +PACKAGECONFIG[mpg123]     =
                  "--enable-mpg123,--disable-mpg123,mpg123"<br>
                   PACKAGECONFIG[pulseaudio] =
                  "--enable-pulse,--disable-pulse,pulseaudio"<br>
                   PACKAGECONFIG[soup]       =
                  "--enable-soup,--disable-soup,libsoup-2.4"<br>
                   PACKAGECONFIG[speex]      =
                  "--enable-speex,--disable-speex,speex"<br>
                  @@ -50,11 +53,6 @@ PACKAGECONFIG[v4l2]       =
                  "--enable-gst_v4l2 --enable-v4l2-probe,--disable-gst<br>
                   PACKAGECONFIG[vpx]        =
                  "--enable-vpx,--disable-vpx,libvpx"<br>
                   PACKAGECONFIG[wavpack]    =
                  "--enable-wavpack,--disable-wavpack,wavpack"<br>
                   PACKAGECONFIG[x11]        =
                  "--enable-x,--disable-x,${X11DEPENDS}"<br>
                  -PACKAGECONFIG[bz2]        =
                  "--enable-bz2,--disable-bz2,bzip2"<br>
                  -PACKAGECONFIG[zlib]       =
                  "--enable-zlib,--disable-zlib,zlib"<br>
                  -PACKAGECONFIG[lame]       =
                  "--enable-lame,--disable-lame,lame"<br>
                  -PACKAGECONFIG[mpg123]     =
                  "--enable-mpg123,--disable-mpg123,mpg123"<br>
                  -PACKAGECONFIG[gtk]        =
                  "--enable-gtk3,--disable-gtk3,gtk+3"<br>
                  <br>
                   # qt5 support is disabled, because it is not present
                  in OE core, and requires more work than<br>
                   # just adding a packageconfig (it requires access to
                  moc, uic, rcc, and qmake paths).<br>
                  @@ -62,7 +60,9 @@ PACKAGECONFIG[gtk]        =
                  "--enable-gtk3,--disable-gtk3,gtk+3"<br>
                   # in a gstreamer1.0-plugins-good bbappend).<br>
                  <br>
                   EXTRA_OECONF += " \<br>
                  +    --enable-bz2 \<br>
                       --enable-oss \<br>
                  +    --enable-zlib \<br>
                       --disable-aalib \<br>
                       --disable-aalibtest \<br>
                       --disable-directsound \<br>
                  @@ -71,9 +71,10 @@ EXTRA_OECONF += " \<br>
                       --disable-oss4 \<br>
                       --disable-osx_audio \<br>
                       --disable-osx_video \<br>
                  +    --disable-qt \<br>
                       --disable-shout2 \<br>
                  +    --disable-twolame \<br>
                       --disable-waveform \<br>
                  -    --disable-qt \<br>
                   "<br>
                  <br>
                   FILES_${PN}-equalizer +=
                  "${datadir}/gstreamer-1.0/presets/*.prs"<br>
                  -- <br>
                  2.17.1<br>
                  <br>
                  -- <br>
                  _______________________________________________<br>
                  Openembedded-core mailing list<br>
                  <a
                    href="mailto:Openembedded-core@lists.openembedded.org"
                    target="_blank" moz-do-not-send="true">Openembedded-core@lists.openembedded.org</a><br>
                  <a
                    href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                    rel="noreferrer" target="_blank"
                    moz-do-not-send="true">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
                </blockquote>
              </div>
            </blockquote>
            <br>
          </div>
        </blockquote>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------7F63E89F29295F49E5E84EDD--
