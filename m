Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2B6A678715
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jan 2018 02:32:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w0O2WoOc001146
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 23 Jan 2018 18:32:50 -0800 (PST)
Received: from [128.224.163.220] (128.224.163.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 23 Jan 2018 18:32:49 -0800
To: Martin Jansa <martin.jansa@gmail.com>
References: <151627986059.9023.14010623458474127186@git.openembedded.org>
	<20180118125101.2F92F235ED3@git.openembedded.org>
	<CA+chaQeG05c0KXRoFMrb_=rh3C+MMJuMFWvQjtuyedFXg-PdMQ@mail.gmail.com>
	<070341c4-d323-07ef-58e9-78b8e9c9908a@windriver.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <02c21a1f-69e3-dc9e-5a6d-a83a5ad7325b@windriver.com>
Date: Wed, 24 Jan 2018 10:31:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <070341c4-d323-07ef-58e9-78b8e9c9908a@windriver.com>
X-Originating-IP: [128.224.163.220]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 08/08: json-glib: update to 1.4.2
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
X-List-Received-Date: Wed, 24 Jan 2018 02:32:50 -0000
Content-Type: multipart/alternative;
	boundary="------------B60C9281355D8217B1A52258"
Content-Language: en-US

--------------B60C9281355D8217B1A52258
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



在 2018年01月24日 10:26, Yi Zhao 写道:
>
>
>
> 在 2018年01月19日 21:58, Martin Jansa 写道:
>> It fails here since this upgrade, maybe the 
>> 0001-Do-not-disable-gobject-introspection-when-cross-comp.patch is 
>> still useful and wasn't completely merged upstream?
>>
>> FAILED: json-glib/Json-1.0.typelib
>> json-glib/1.4.2-r0/recipe-sysroot/usr/bin/g-ir-compiler-wrapper 
>> json-glib/Json-1.0.gir --output json-glib/Json-1.0.typelib
>> Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use 
>> --includedir
>> error parsing file json-glib/Json-1.0.gir: Failed to parse included 
>> gir GObject-2.0
>> If the above error message is about missing .so libraries, then 
>> setting up GIR_EXTRA_LIBS_PATH in the recipe should help.
>> (typically like this: GIR_EXTRA_LIBS_PATH="${B}/something/.libs" )
>> ninja: build stopped: subcommand failed.
>> WARNING: exit code 1 from a shell command.
>
> Hi  Martin,
>
> I still can not reproduced it.  Could you tell me which layers 
> include, the DISTRO set and the build machine OS ?
>

Sorry. Please ignore this mail. I missed your previous mail.

Yi

> Thanks,
> Yi
>
>
>>
>> On Thu, Jan 18, 2018 at 1:51 PM, <git@git.openembedded.org 
>> <mailto:git@git.openembedded.org>> wrote:
>>
>>     This is an automated email from the git hooks/post-receive script.
>>
>>     rpurdie pushed a commit to branch master
>>     in repository openembedded-core.
>>
>>     commit 6b87ad5b08004554f08d2f68027908956f3795e1
>>     Author: Yi Zhao <yi.zhao@windriver.com
>>     <mailto:yi.zhao@windriver.com>>
>>     AuthorDate: Tue Jan 16 08:32:33 2018 +0800
>>
>>         json-glib: update to 1.4.2
>>
>>         Drop
>>     0001-Do-not-disable-gobject-introspection-when-cross-comp.patch
>>         since it has been fixed upstream.
>>
>>         Signed-off-by: Yi Zhao <yi.zhao@windriver.com
>>     <mailto:yi.zhao@windriver.com>>
>>         Signed-off-by: Richard Purdie
>>     <richard.purdie@linuxfoundation.org
>>     <mailto:richard.purdie@linuxfoundation.org>>
>>     ---
>>      ...ble-gobject-introspection-when-cross-comp.patch | 32
>>     ----------------------
>>      .../{json-glib_1.2.8.bb <http://json-glib_1.2.8.bb> =>
>>     json-glib_1.4.2.bb <http://json-glib_1.4.2.bb>}    |  7 ++---
>>      2 files changed, 2 insertions(+), 37 deletions(-)
>>
>>     diff --git
>>     a/meta/recipes-gnome/json-glib/json-glib/0001-Do-not-disable-gobject-introspection-when-cross-comp.patch
>>     b/meta/recipes-gnome/json-glib/json-glib/0001-Do-not-disable-gobject-introspection-when-cross-comp.patch
>>     deleted file mode 100644
>>     index 849bb9d..0000000
>>     ---
>>     a/meta/recipes-gnome/json-glib/json-glib/0001-Do-not-disable-gobject-introspection-when-cross-comp.patch
>>     +++ /dev/null
>>     @@ -1,32 +0,0 @@
>>     -From 293452c963188666dae99521294f09a0cf9582e2 Mon Sep 17
>>     00:00:00 2001
>>     -From: Alexander Kanavin <alex.kanavin@gmail.com
>>     <mailto:alex.kanavin@gmail.com>>
>>     -Date: Fri, 4 Aug 2017 16:01:11 +0300
>>     -Subject: [PATCH] Do not disable gobject introspection when
>>     cross-compiling.
>>     -
>>     -Introspection does work fine for instance in Open Embedded,
>>     -one of the most prominent cross-compilation frameworks
>>     -(through qemu emulating target hardware), so let the user
>>     -decide if he wants the feature or not.
>>     -
>>     -Upstream-Status: Pending
>>     -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com
>>     <mailto:alex.kanavin@gmail.com>>
>>     ----
>>     - meson.build | 2 +-
>>     - 1 file changed, 1 insertion(+), 1 deletion(-)
>>     -
>>     -diff --git a/meson.build b/meson.build
>>     -index 43cbfd9..8a32f26 100644
>>     ---- a/meson.build
>>     -+++ b/meson.build
>>     -@@ -147,7 +147,7 @@ root_dir = include_directories('.')
>>     -
>>     - gnome = import('gnome')
>>     - gir = find_program('g-ir-scanner', required: false)
>>     --build_gir = gir.found() and not meson.is_cross_build() and not
>>     get_option('disable_introspection')
>>     -+build_gir = gir.found() and not get_option('disable_introspection')
>>     -
>>     - subdir('json-glib')
>>     -
>>     ---
>>     -2.13.2
>>     -
>>     diff --git a/meta/recipes-gnome/json-glib/json-glib_1.2.8.bb
>>     <http://json-glib_1.2.8.bb>
>>     b/meta/recipes-gnome/json-glib/json-glib_1.4.2.bb
>>     <http://json-glib_1.4.2.bb>
>>     similarity index 84%
>>     rename from meta/recipes-gnome/json-glib/json-glib_1.2.8.bb
>>     <http://json-glib_1.2.8.bb>
>>     rename to meta/recipes-gnome/json-glib/json-glib_1.4.2.bb
>>     <http://json-glib_1.4.2.bb>
>>     index 31912d1..fad0a2d 100644
>>     --- a/meta/recipes-gnome/json-glib/json-glib_1.2.8.bb
>>     <http://json-glib_1.2.8.bb>
>>     +++ b/meta/recipes-gnome/json-glib/json-glib_1.4.2.bb
>>     <http://json-glib_1.4.2.bb>
>>     @@ -10,11 +10,8 @@ LIC_FILES_CHKSUM =
>>     "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
>>
>>      DEPENDS = "glib-2.0"
>>
>>     -SRC_URI_append = " \
>>     -
>>     file://0001-Do-not-disable-gobject-introspection-when-cross-comp.patch
>>     \
>>     -           "
>>     -SRC_URI[archive.md5sum] = "ff31e7d0594df44318e12facda3d086e"
>>     -SRC_URI[archive.sha256sum] =
>>     "fd55a9037d39e7a10f0db64309f5f0265fa32ec962bf85066087b83a2807f40a"
>>     +SRC_URI[archive.md5sum] = "35107e23a7bbbc70f31c34f7b9adf1c3"
>>     +SRC_URI[archive.sha256sum] =
>>     "2d7709a44749c7318599a6829322e081915bdc73f5be5045882ed120bb686dc8"
>>
>>      GNOMEBASEBUILDCLASS = "meson"
>>      inherit gnomebase lib_package gobject-introspection gtk-doc
>>     manpages gettext
>>
>>     --
>>     To stop receiving notification emails like this one, please contact
>>     the administrator of this repository.
>>     --
>>     _______________________________________________
>>     Openembedded-commits mailing list
>>     Openembedded-commits@lists.openembedded.org
>>     <mailto:Openembedded-commits@lists.openembedded.org>
>>     http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>>     <http://lists.openembedded.org/mailman/listinfo/openembedded-commits>
>>
>>
>
>
>


--------------B60C9281355D8217B1A52258
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">在 2018年01月24日 10:26, Yi Zhao 写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:070341c4-d323-07ef-58e9-78b8e9c9908a@windriver.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <p><br>
      </p>
      <br>
      <div class="moz-cite-prefix">在 2018年01月19日 21:58, Martin Jansa 写道:<br>
      </div>
      <blockquote type="cite"
cite="mid:CA+chaQeG05c0KXRoFMrb_=rh3C+MMJuMFWvQjtuyedFXg-PdMQ@mail.gmail.com">
        <div dir="ltr">
          <div>It fails here since this upgrade, maybe the <span
              style="font-size:12.8px">0001-Do-not-disable-</span><wbr
              style="font-size:12.8px"><span style="font-size:12.8px">gobject-introspection-when-</span><wbr
              style="font-size:12.8px"><span style="font-size:12.8px">cross-comp.patch
              is still useful and wasn't completely merged upstream?</span></div>
          <div><span style="font-size:12.8px"><br>
            </span></div>
          <div>FAILED: json-glib/Json-1.0.typelib </div>
          <div>json-glib/1.4.2-r0/recipe-sysroot/usr/bin/g-ir-compiler-wrapper
            json-glib/Json-1.0.gir --output json-glib/Json-1.0.typelib</div>
          <div>Could not find GIR file 'GObject-2.0.gir'; check
            XDG_DATA_DIRS or use --includedir</div>
          <div>error parsing file json-glib/Json-1.0.gir: Failed to
            parse included gir GObject-2.0</div>
          <div>If the above error message is about missing .so
            libraries, then setting up GIR_EXTRA_LIBS_PATH in the recipe
            should help.</div>
          <div>(typically like this:
            GIR_EXTRA_LIBS_PATH="${B}/something/.libs" )</div>
          <div>ninja: build stopped: subcommand failed.</div>
          <div>WARNING: exit code 1 from a shell command.</div>
        </div>
      </blockquote>
      <br>
      Hi  Martin,<br>
      <br>
      I still can not reproduced it.  Could you tell me which layers
      include, the DISTRO set and the build machine OS ?<br>
      <br>
    </blockquote>
    <br>
    Sorry. Please ignore this mail. I missed your previous mail.<br>
    <br>
    Yi<br>
    <br>
    <blockquote type="cite"
      cite="mid:070341c4-d323-07ef-58e9-78b8e9c9908a@windriver.com">
      Thanks,<br>
      Yi<br>
      <br>
      <br>
      <blockquote type="cite"
cite="mid:CA+chaQeG05c0KXRoFMrb_=rh3C+MMJuMFWvQjtuyedFXg-PdMQ@mail.gmail.com">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Thu, Jan 18, 2018 at 1:51 PM, <span
              dir="ltr">&lt;<a href="mailto:git@git.openembedded.org"
                target="_blank" moz-do-not-send="true">git@git.openembedded.org</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">This is
              an automated email from the git hooks/post-receive script.<br>
              <br>
              rpurdie pushed a commit to branch master<br>
              in repository openembedded-core.<br>
              <br>
              commit 6b87ad5b08004554f08d2f68027908<wbr>956f3795e1<br>
              Author: Yi Zhao &lt;<a href="mailto:yi.zhao@windriver.com"
                moz-do-not-send="true">yi.zhao@windriver.com</a>&gt;<br>
              AuthorDate: Tue Jan 16 08:32:33 2018 +0800<br>
              <br>
                  json-glib: update to 1.4.2<br>
              <br>
                  Drop 0001-Do-not-disable-gobject-<wbr>introspection-when-cross-comp.<wbr>patch<br>
                  since it has been fixed upstream.<br>
              <br>
                  Signed-off-by: Yi Zhao &lt;<a
                href="mailto:yi.zhao@windriver.com"
                moz-do-not-send="true">yi.zhao@windriver.com</a>&gt;<br>
                  Signed-off-by: Richard Purdie &lt;<a
                href="mailto:richard.purdie@linuxfoundation.org"
                moz-do-not-send="true">richard.purdie@<wbr>linuxfoundation.org</a>&gt;<br>
              ---<br>
               ...ble-gobject-introspection-<wbr>when-cross-comp.patch |
              32 ----------------------<br>
               .../{<a href="http://json-glib_1.2.8.bb" rel="noreferrer"
                target="_blank" moz-do-not-send="true">json-glib_1.2.8.bb</a>
              =&gt; <a href="http://json-glib_1.4.2.bb"
                rel="noreferrer" target="_blank" moz-do-not-send="true">json-glib_1.4.2.bb</a>} 
                 |  7 ++---<br>
               2 files changed, 2 insertions(+), 37 deletions(-)<br>
              <br>
              diff --git a/meta/recipes-gnome/json-<wbr>glib/json-glib/0001-Do-not-<wbr>disable-gobject-introspection-<wbr>when-cross-comp.patch
              b/meta/recipes-gnome/json-<wbr>glib/json-glib/0001-Do-not-<wbr>disable-gobject-introspection-<wbr>when-cross-comp.patch<br>
              deleted file mode 100644<br>
              index 849bb9d..0000000<br>
              --- a/meta/recipes-gnome/json-<wbr>glib/json-glib/0001-Do-not-<wbr>disable-gobject-introspection-<wbr>when-cross-comp.patch<br>
              +++ /dev/null<br>
              @@ -1,32 +0,0 @@<br>
              -From 293452c963188666dae99521294f09<wbr>a0cf9582e2 Mon
              Sep 17 00:00:00 2001<br>
              -From: Alexander Kanavin &lt;<a
                href="mailto:alex.kanavin@gmail.com"
                moz-do-not-send="true">alex.kanavin@gmail.com</a>&gt;<br>
              -Date: Fri, 4 Aug 2017 16:01:11 +0300<br>
              -Subject: [PATCH] Do not disable gobject introspection
              when cross-compiling.<br>
              -<br>
              -Introspection does work fine for instance in Open
              Embedded,<br>
              -one of the most prominent cross-compilation frameworks<br>
              -(through qemu emulating target hardware), so let the user<br>
              -decide if he wants the feature or not.<br>
              -<br>
              -Upstream-Status: Pending<br>
              -Signed-off-by: Alexander Kanavin &lt;<a
                href="mailto:alex.kanavin@gmail.com"
                moz-do-not-send="true">alex.kanavin@gmail.com</a>&gt;<br>
              ----<br>
              - meson.build | 2 +-<br>
              - 1 file changed, 1 insertion(+), 1 deletion(-)<br>
              -<br>
              -diff --git a/meson.build b/meson.build<br>
              -index 43cbfd9..8a32f26 100644<br>
              ---- a/meson.build<br>
              -+++ b/meson.build<br>
              -@@ -147,7 +147,7 @@ root_dir = include_directories('.')<br>
              -<br>
              - gnome = import('gnome')<br>
              - gir = find_program('g-ir-scanner', required: false)<br>
              --build_gir = gir.found() and not meson.is_cross_build()
              and not get_option('disable_<wbr>introspection')<br>
              -+build_gir = gir.found() and not get_option('disable_<wbr>introspection')<br>
              -<br>
              - subdir('json-glib')<br>
              -<br>
              ---<br>
              -2.13.2<br>
              -<br>
              diff --git a/meta/recipes-gnome/json-<wbr>glib/<a
                href="http://json-glib_1.2.8.bb" rel="noreferrer"
                target="_blank" moz-do-not-send="true">json-glib_1.2.8.bb</a>
              b/meta/recipes-gnome/json-<wbr>glib/<a
                href="http://json-glib_1.4.2.bb" rel="noreferrer"
                target="_blank" moz-do-not-send="true">json-glib_1.4.2.bb</a><br>
              similarity index 84%<br>
              rename from meta/recipes-gnome/json-glib/<a
                href="http://json-glib_1.2.8.bb" rel="noreferrer"
                target="_blank" moz-do-not-send="true">j<wbr>son-glib_1.2.8.bb</a><br>
              rename to meta/recipes-gnome/json-glib/<a
                href="http://json-glib_1.4.2.bb" rel="noreferrer"
                target="_blank" moz-do-not-send="true">j<wbr>son-glib_1.4.2.bb</a><br>
              index 31912d1..fad0a2d 100644<br>
              --- a/meta/recipes-gnome/json-<wbr>glib/<a
                href="http://json-glib_1.2.8.bb" rel="noreferrer"
                target="_blank" moz-do-not-send="true">json-glib_1.2.8.bb</a><br>
              +++ b/meta/recipes-gnome/json-<wbr>glib/<a
                href="http://json-glib_1.4.2.bb" rel="noreferrer"
                target="_blank" moz-do-not-send="true">json-glib_1.4.2.bb</a><br>
              @@ -10,11 +10,8 @@ LIC_FILES_CHKSUM = "<a
                class="moz-txt-link-freetext" href="file://COPYING;md5="
                moz-do-not-send="true">file://COPYING;md5=</a><wbr>7fbc338309ac38fefcd64b04bb903e<wbr>34"<br>
              <br>
               DEPENDS = "glib-2.0"<br>
              <br>
              -SRC_URI_append = " \<br>
              -           <a class="moz-txt-link-freetext"
                href="file://0001-Do-not-disable" moz-do-not-send="true">file://0001-Do-not-disable</a>-<wbr>gobject-introspection-when-<wbr>cross-comp.patch
              \<br>
              -           "<br>
              -SRC_URI[archive.md5sum] = "<wbr>ff31e7d0594df44318e12facda3d08<wbr>6e"<br>
              -SRC_URI[archive.sha256sum] = "<wbr>fd55a9037d39e7a10f0db64309f5f0<wbr>265fa32ec962bf85066087b83a2807<wbr>f40a"<br>
              +SRC_URI[archive.md5sum] = "<wbr>35107e23a7bbbc70f31c34f7b9adf1<wbr>c3"<br>
              +SRC_URI[archive.sha256sum] = "<wbr>2d7709a44749c7318599a6829322e0<wbr>81915bdc73f5be5045882ed120bb68<wbr>6dc8"<br>
              <br>
               GNOMEBASEBUILDCLASS = "meson"<br>
               inherit gnomebase lib_package gobject-introspection
              gtk-doc manpages gettext<br>
              <span class="HOEnZb"><font color="#888888"><br>
                  --<br>
                  To stop receiving notification emails like this one,
                  please contact<br>
                  the administrator of this repository.<br>
                  --<br>
                  ______________________________<wbr>_________________<br>
                  Openembedded-commits mailing list<br>
                  <a
                    href="mailto:Openembedded-commits@lists.openembedded.org"
                    moz-do-not-send="true">Openembedded-commits@lists.<wbr>openembedded.org</a><br>
                  <a
href="http://lists.openembedded.org/mailman/listinfo/openembedded-commits"
                    rel="noreferrer" target="_blank"
                    moz-do-not-send="true">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>commits</a><br>
                </font></span></blockquote>
          </div>
          <br>
        </div>
      </blockquote>
      <br>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------B60C9281355D8217B1A52258--
