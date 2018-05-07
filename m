Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 7B67B74DF9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 May 2018 12:40:38 +0000 (UTC)
Received: from [10.1.14.248] (vpn.streamunlimited.com [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id 4B776C0C79
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 May 2018 14:40:39 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <20180503081758.4661-1-anuj.mittal@intel.com>
	<CAMKF1sowEveYKrjFkNi9SmrtWYxtEqasXcbR0QFbs_V8hcw6hw@mail.gmail.com>
	<CAJTo0LbXVMbEAseGtawGOUqb2EL9=8EnfZxhgVoRa-U_Jw3xxg@mail.gmail.com>
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <afc2163b-7940-5868-84a3-adc515b1f9bf@pseudoterminal.org>
Date: Mon, 7 May 2018 14:40:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbXVMbEAseGtawGOUqb2EL9=8EnfZxhgVoRa-U_Jw3xxg@mail.gmail.com>
Subject: Re: [PATCH 01/12] gstreamer1.0: upgrade 1.12.4 -> 1.14.0
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
X-List-Received-Date: Mon, 07 May 2018 12:40:39 -0000
Content-Type: multipart/alternative;
	boundary="------------63F9E0FE0362870E96F97732"
Content-Language: en-US

--------------63F9E0FE0362870E96F97732
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

True. But it should stay as close to oe-core as possible. I already 
committed updates to meta-gstreamer1.0, so I am not sure what to think 
of this.


On 2018-05-04 12:23, Burton, Ross wrote:
> meta-gstreamer ships its own inc files (as it should).
>
> Ross
>
> On 3 May 2018 at 23:49, Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
>
>
>     On Thu, May 3, 2018 at 1:18 AM Anuj Mittal <anuj.mittal@intel.com
>     <mailto:anuj.mittal@intel.com>> wrote:
>
>         * For changes, please see:
>         https://gstreamer.freedesktop.org/releases/1.14/
>         <https://gstreamer.freedesktop.org/releases/1.14/>
>         * Merge inc and bb file since we only have one version now.
>
>
>     Threre is meta gstreamer can you check if this is not going to
>     affect that layer
>
>
>
>         Signed-off-by: Anuj Mittal <anuj.mittal@intel.com
>         <mailto:anuj.mittal@intel.com>>
>         ---
>          meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.4.bb
>         <http://gstreamer1.0_1.12.4.bb>  | 14 --------------
>          .../gstreamer/{gstreamer1.0.inc => gstreamer1.0_1.14.0.bb
>         <http://gstreamer1.0_1.14.0.bb>} | 12 +++++++++++-
>          2 files changed, 11 insertions(+), 15 deletions(-)
>          delete mode 100644
>         meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.4.bb
>         <http://gstreamer1.0_1.12.4.bb>
>          rename meta/recipes-multimedia/gstreamer/{gstreamer1.0.inc =>
>         gstreamer1.0_1.14.0.bb <http://gstreamer1.0_1.14.0.bb>} (84%)
>
>         diff --git
>         a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.4.bb
>         <http://gstreamer1.0_1.12.4.bb>
>         b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.4.bb
>         <http://gstreamer1.0_1.12.4.bb>
>         deleted file mode 100644
>         index 01b2396513..0000000000
>         --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.4.bb
>         <http://gstreamer1.0_1.12.4.bb>
>         +++ /dev/null
>         @@ -1,14 +0,0 @@
>         -require gstreamer1.0.inc
>         -
>         -LIC_FILES_CHKSUM =
>         "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
>         -                   
>         file://gst/gst.h;beginline=1;endline=21;md5=e059138481205ee2c6fc1c079c016d0d"
>         -
>         -SRC_URI = " \
>         -
>         http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz
>         <http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-$%7BPV%7D.tar.xz>
>         \
>         -"
>         -SRC_URI[md5sum] = "9d268f2e891cce1ac0832f1cc467d4ea"
>         -SRC_URI[sha256sum] =
>         "5a8704aa4c2eeb04da192c4a9942f94f860ac1a585de90d9f914bac26a970674"
>         -
>         -S = "${WORKDIR}/gstreamer-${PV}"
>         -
>         -CVE_PRODUCT = "gstreamer"
>         diff --git
>         a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
>         b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.0.bb
>         <http://gstreamer1.0_1.14.0.bb>
>         similarity index 84%
>         rename from meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
>         rename to
>         meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.0.bb
>         <http://gstreamer1.0_1.14.0.bb>
>         index c2df1f3258..b4398c8111 100644
>         --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
>         +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.0.bb
>         <http://gstreamer1.0_1.14.0.bb>
>         @@ -14,11 +14,19 @@ inherit autotools pkgconfig gettext
>         upstream-version-is-even gobject-introspecti
>          # (it has a custom INTROSPECTION_INIT macro, and so must be
>         used instead of our common introspection.m4 file)
>          acpaths = "-I ${S}/common/m4 -I ${S}/m4"
>
>         -SRC_URI_append = " \
>         +LIC_FILES_CHKSUM =
>         "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
>         +                   
>         file://gst/gst.h;beginline=1;endline=21;md5=e059138481205ee2c6fc1c079c016d0d"
>         +
>         +S = "${WORKDIR}/gstreamer-${PV}"
>         +
>         +SRC_URI = " \
>         +
>         http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz
>         <http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-$%7BPV%7D.tar.xz>
>         \
>            
>          file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch
>         \
>              file://gtk-doc-tweaks.patch \
>            
>          file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch
>         \
>          "
>         +SRC_URI[md5sum] = "63c7cbfb86aa28c4522e374dc5555b96"
>         +SRC_URI[sha256sum] =
>         "fc361367f0d4b780a868a8833f9f30b9c9f4ac9faea4e6b251db8b4b0398466e"
>
>          PACKAGECONFIG ??= ""
>
>         @@ -59,3 +67,5 @@ do_configure[prefuncs] += "delete_pkg_m4_file"
>          do_compile_prepend() {
>                  export
>         GIR_EXTRA_LIBS_PATH="${B}/gst/.libs:${B}/libs/gst/base/.libs"
>          }
>         +
>         +CVE_PRODUCT = "gstreamer"
>         -- 
>         2.14.1
>
>         -- 
>         _______________________________________________
>         Openembedded-core mailing list
>         Openembedded-core@lists.openembedded.org
>         <mailto:Openembedded-core@lists.openembedded.org>
>         http://lists.openembedded.org/mailman/listinfo/openembedded-core
>         <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>
>
>


--------------63F9E0FE0362870E96F97732
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>True. But it should stay as close to oe-core as possible. I
      already committed updates to meta-gstreamer1.0, so I am not sure
      what to think of this.<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 2018-05-04 12:23, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0LbXVMbEAseGtawGOUqb2EL9=8EnfZxhgVoRa-U_Jw3xxg@mail.gmail.com">
      <div dir="ltr">meta-gstreamer ships its own inc files (as it
        should).
        <div><br>
        </div>
        <div>Ross</div>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On 3 May 2018 at 23:49, Khem Raj <span
            dir="ltr">&lt;<a href="mailto:raj.khem@gmail.com"
              target="_blank" moz-do-not-send="true">raj.khem@gmail.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <div><br>
              <div class="gmail_quote"><span class="">
                  <div dir="auto">On Thu, May 3, 2018 at 1:18 AM Anuj
                    Mittal &lt;<a href="mailto:anuj.mittal@intel.com"
                      target="_blank" moz-do-not-send="true">anuj.mittal@intel.com</a>&gt;
                    wrote:<br>
                  </div>
                  <blockquote class="gmail_quote" style="margin:0 0 0
                    .8ex;border-left:1px #ccc solid;padding-left:1ex">*
                    For changes, please see: <a
                      href="https://gstreamer.freedesktop.org/releases/1.14/"
                      rel="noreferrer" target="_blank"
                      moz-do-not-send="true">https://gstreamer.freedesktop.<wbr>org/releases/1.14/</a><br>
                    * Merge inc and bb file since we only have one
                    version now.</blockquote>
                  <div dir="auto"><br>
                  </div>
                </span>
                <div dir="auto">Threre is meta gstreamer can you check
                  if this is not going to affect that layer</div>
                <div>
                  <div class="h5">
                    <blockquote class="gmail_quote" style="margin:0 0 0
                      .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
                      <br>
                      Signed-off-by: Anuj Mittal &lt;<a
                        href="mailto:anuj.mittal@intel.com"
                        target="_blank" moz-do-not-send="true">anuj.mittal@intel.com</a>&gt;<br>
                      ---<br>
                       meta/recipes-multimedia/<wbr>gstreamer/<a
                        href="http://gstreamer1.0_1.12.4.bb"
                        rel="noreferrer" target="_blank"
                        moz-do-not-send="true">gstreamer1.0_1.12.4.<wbr>bb</a> 
                       | 14 --------------<br>
                       .../gstreamer/{gstreamer1.0.<wbr>inc =&gt; <a
                        href="http://gstreamer1.0_1.14.0.bb"
                        rel="noreferrer" target="_blank"
                        moz-do-not-send="true">gstreamer1.0_1.14.0.bb</a>}
                      | 12 +++++++++++-<br>
                       2 files changed, 11 insertions(+), 15
                      deletions(-)<br>
                       delete mode 100644 meta/recipes-multimedia/<wbr>gstreamer/<a
                        href="http://gstreamer1.0_1.12.4.bb"
                        rel="noreferrer" target="_blank"
                        moz-do-not-send="true">gstreamer1.0_1.12.4.<wbr>bb</a><br>
                       rename meta/recipes-multimedia/<wbr>gstreamer/{gstreamer1.0.inc
                      =&gt; <a href="http://gstreamer1.0_1.14.0.bb"
                        rel="noreferrer" target="_blank"
                        moz-do-not-send="true">gstreamer1.0_1.14.0.bb</a>}
                      (84%)<br>
                      <br>
                      diff --git a/meta/recipes-multimedia/<wbr>gstreamer/<a
                        href="http://gstreamer1.0_1.12.4.bb"
                        rel="noreferrer" target="_blank"
                        moz-do-not-send="true">gstreamer1.0_1.12.4.<wbr>bb</a>
                      b/meta/recipes-multimedia/<wbr>gstreamer/<a
                        href="http://gstreamer1.0_1.12.4.bb"
                        rel="noreferrer" target="_blank"
                        moz-do-not-send="true">gstreamer1.0_1.12.4.<wbr>bb</a><br>
                      deleted file mode 100644<br>
                      index 01b2396513..0000000000<br>
                      --- a/meta/recipes-multimedia/<wbr>gstreamer/<a
                        href="http://gstreamer1.0_1.12.4.bb"
                        rel="noreferrer" target="_blank"
                        moz-do-not-send="true">gstreamer1.0_1.12.4.<wbr>bb</a><br>
                      +++ /dev/null<br>
                      @@ -1,14 +0,0 @@<br>
                      -require gstreamer1.0.inc<br>
                      -<br>
                      -LIC_FILES_CHKSUM = "<a class="moz-txt-link-freetext" href="file://COPYING;md5=">file://COPYING;md5=</a><wbr>6762ed442b3822387a51c92d928ead<wbr>0d
                      \<br>
                      -                    <a class="moz-txt-link-freetext" href="file://gst/gst.h;beginline=1">file://gst/gst.h;beginline=1</a>;<wbr>endline=21;md5=<wbr>e059138481205ee2c6fc1c079c016d<wbr>0d"<br>
                      -<br>
                      -SRC_URI = " \<br>
                      -    <a
href="http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-$%7BPV%7D.tar.xz"
                        rel="noreferrer" target="_blank"
                        moz-do-not-send="true">http://gstreamer.freedesktop.<wbr>org/src/gstreamer/gstreamer-${<wbr>PV}.tar.xz</a>
                      \<br>
                      -"<br>
                      -SRC_URI[md5sum] = "<wbr>9d268f2e891cce1ac0832f1cc467d4<wbr>ea"<br>
                      -SRC_URI[sha256sum] = "<wbr>5a8704aa4c2eeb04da192c4a9942f9<wbr>4f860ac1a585de90d9f914bac26a97<wbr>0674"<br>
                      -<br>
                      -S = "${WORKDIR}/gstreamer-${PV}"<br>
                      -<br>
                      -CVE_PRODUCT = "gstreamer"<br>
                      diff --git a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0.inc
                      b/meta/recipes-multimedia/<wbr>gstreamer/<a
                        href="http://gstreamer1.0_1.14.0.bb"
                        rel="noreferrer" target="_blank"
                        moz-do-not-send="true">gstreamer1.0_1.14.0.<wbr>bb</a><br>
                      similarity index 84%<br>
                      rename from meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0.inc<br>
                      rename to meta/recipes-multimedia/<wbr>gstreamer/<a
                        href="http://gstreamer1.0_1.14.0.bb"
                        rel="noreferrer" target="_blank"
                        moz-do-not-send="true">gstreamer1.0_1.14.0.<wbr>bb</a><br>
                      index c2df1f3258..b4398c8111 100644<br>
                      --- a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0.inc<br>
                      +++ b/meta/recipes-multimedia/<wbr>gstreamer/<a
                        href="http://gstreamer1.0_1.14.0.bb"
                        rel="noreferrer" target="_blank"
                        moz-do-not-send="true">gstreamer1.0_1.14.0.<wbr>bb</a><br>
                      @@ -14,11 +14,19 @@ inherit autotools pkgconfig
                      gettext upstream-version-is-even
                      gobject-introspecti<br>
                       # (it has a custom INTROSPECTION_INIT macro, and
                      so must be used instead of our common
                      introspection.m4 file)<br>
                       acpaths = "-I ${S}/common/m4 -I ${S}/m4"<br>
                      <br>
                      -SRC_URI_append = " \<br>
                      +LIC_FILES_CHKSUM = "<a class="moz-txt-link-freetext" href="file://COPYING;md5=">file://COPYING;md5=</a><wbr>6762ed442b3822387a51c92d928ead<wbr>0d
                      \<br>
                      +                    <a class="moz-txt-link-freetext" href="file://gst/gst.h;beginline=1">file://gst/gst.h;beginline=1</a>;<wbr>endline=21;md5=<wbr>e059138481205ee2c6fc1c079c016d<wbr>0d"<br>
                      +<br>
                      +S = "${WORKDIR}/gstreamer-${PV}"<br>
                      +<br>
                      +SRC_URI = " \<br>
                      +    <a
href="http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-$%7BPV%7D.tar.xz"
                        rel="noreferrer" target="_blank"
                        moz-do-not-send="true">http://gstreamer.freedesktop.<wbr>org/src/gstreamer/gstreamer-${<wbr>PV}.tar.xz</a>
                      \<br>
                           <a class="moz-txt-link-freetext" href="file://0001-introspection.m4">file://0001-introspection.m4</a>-<wbr>prefix-pkgconfig-paths-with-<wbr>PKG_CON.patch
                      \<br>
                           <a class="moz-txt-link-freetext" href="file://gtk-doc-tweaks.patch">file://gtk-doc-tweaks.patch</a> \<br>
                           <a class="moz-txt-link-freetext" href="file://0001-gst">file://0001-gst</a>-<wbr>gstpluginloader.c-when-env-<wbr>var-is-set-do-not-fal.patch
                      \<br>
                       "<br>
                      +SRC_URI[md5sum] = "<wbr>63c7cbfb86aa28c4522e374dc5555b<wbr>96"<br>
                      +SRC_URI[sha256sum] = "<wbr>fc361367f0d4b780a868a8833f9f30<wbr>b9c9f4ac9faea4e6b251db8b4b0398<wbr>466e"<br>
                      <br>
                       PACKAGECONFIG ??= ""<br>
                      <br>
                      @@ -59,3 +67,5 @@ do_configure[prefuncs] +=
                      "delete_pkg_m4_file"<br>
                       do_compile_prepend() {<br>
                               export GIR_EXTRA_LIBS_PATH="${B}/gst/<wbr>.libs:${B}/libs/gst/base/.<wbr>libs"<br>
                       }<br>
                      +<br>
                      +CVE_PRODUCT = "gstreamer"<br>
                      -- <br>
                      2.14.1<br>
                      <br>
                      -- <br>
                      ______________________________<wbr>_________________<br>
                      Openembedded-core mailing list<br>
                      <a
                        href="mailto:Openembedded-core@lists.openembedded.org"
                        target="_blank" moz-do-not-send="true">Openembedded-core@lists.<wbr>openembedded.org</a><br>
                      <a
                        href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                        rel="noreferrer" target="_blank"
                        moz-do-not-send="true">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
                    </blockquote>
                  </div>
                </div>
              </div>
            </div>
            <br>
            -- <br>
            ______________________________<wbr>_________________<br>
            Openembedded-core mailing list<br>
            <a href="mailto:Openembedded-core@lists.openembedded.org"
              moz-do-not-send="true">Openembedded-core@lists.<wbr>openembedded.org</a><br>
            <a
              href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
              rel="noreferrer" target="_blank" moz-do-not-send="true">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
            <br>
          </blockquote>
        </div>
        <br>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------63F9E0FE0362870E96F97732--
