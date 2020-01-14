Return-Path: <crg7475@mailbox.org>
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	by mail.openembedded.org (Postfix) with ESMTP id 456437FC08
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 18:37:56 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 47xzjJ55T1zQlDQ;
	Tue, 14 Jan 2020 19:37:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	content-language:content-type:content-type:in-reply-to
	:mime-version:date:date:message-id:from:from:references:subject
	:subject:received; s=mail20150812; t=1579027072; bh=hiPf1jJgR7FP
	d48bcMC1lSqAlx2dwY7G9f5lloQfZpM=; b=uemAseP4v9+NA6WZNUG5Za5nRUZy
	Obo//Ccc7l0kburDhZV85/UpDcy7ee0j3MvdKfWYm2To/7tcFPa3RA6+ai01ScOe
	BvrihySCKTbv8CZMkrjO2ESw0GYrY5mlRXX69SbaPyI0EXO+CAq6ocaOQ2DJM0fw
	/9ROudOVxoIfeuonGf47S19lXDeHmq4Rp++UmXUexoBxraWPII1GAj5Fb2SaR8so
	DuklzHHw53XUFarzqPeAAf2qKqIU0ghVNINc+FPW+gla+Hk1hxTyXwd/h9hG1tHq
	1eReOvmntl4mcLr2ZoLwcxVDe3X3C9lwIP8Y/SbY8aqDo5JpR4XG0a7FQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1579027074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=qS0quMOlL7MQEvDI9zcyZQZMec98lnkokRu9imgym10=;
	b=Q28Bx6z04kF0CfZ0m5oSzoNnW4Qwn9teEKQAXWO1iJ36iAMiLZdvNbkvHMD7/FOKmrDupi
	ugpspprqYMHKqsNfz22OGKzMXBbMt/270Iv0F6HJ1js3xAIw7kDDxcfuvKJGHX9jyIybiH
	W1vrd9onyQ9DPrMgAOlYu/vFsz4htPdJT7n32b1c0RbvAtYCtFoAOnJ+0jbDRiPtohOUna
	1k+u3eGHL6pcz8IW0kIdtG8cbS3DfJUfXME6jgCstUzS86F+K0TJI+roJyhvkriRBkUKHg
	uOJQCiAVMQMTbSi5qSjikSmOXp5S72wquykKrpCp4H6M/6JXY0X5SLjEK63NqQ==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by gerste.heinlein-support.de (gerste.heinlein-support.de
	[91.198.250.173]) (amavisd-new, port 10030)
	with ESMTP id tOfhtJxz9npT; Tue, 14 Jan 2020 19:37:52 +0100 (CET)
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20200112135954.23868-1-crg7475@mailbox.org>
	<725d92f91a56183e4166e633c0443fad44f6c5ba.camel@linuxfoundation.org>
	<a7a27af5-86c6-de19-d426-d8e62f2e8497@mailbox.org>
	<10f99a93a316115216d4e63d2b34a84dfc9e6925.camel@linuxfoundation.org>
	<a2b0cd22-c849-2bc4-9032-485ad4d51108@mailbox.org>
	<CANNYZj9teCJ8-B_Zq51zKzCC+mHK5f0CseRm4LDymT9Ci5JBwQ@mail.gmail.com>
	<CANNYZj-Vd2E76rvAbxw8xNeyQa-SWy_zwomCOcSSKViCYdATDw@mail.gmail.com>
From: Carlos Rafael Giani <crg7475@mailbox.org>
Message-ID: <91334112-4d52-8f7e-d656-8989cc462b93@mailbox.org>
Date: Tue, 14 Jan 2020 19:37:51 +0100
MIME-Version: 1.0
In-Reply-To: <CANNYZj-Vd2E76rvAbxw8xNeyQa-SWy_zwomCOcSSKViCYdATDw@mail.gmail.com>
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
X-List-Received-Date: Tue, 14 Jan 2020 18:37:56 -0000
Content-Type: multipart/alternative;
	boundary="------------5884E9447F6976A78A856A80"
Content-Language: en-US

--------------5884E9447F6976A78A856A80
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Nice find! But, there is still one issue Khem found, regarding errors in 
meta-multimedia plugins: https://errors.yoctoproject.org/Errors/Build/96752/

This, and the discussion about the qt5 packageconfig, means to me that a 
v2 set is warranted. What do you think?

On 14.01.20 16:51, Alexander Kanavin wrote:
> I just sent a patch for this, and for the ptest issue. Should be good 
> to merge now!
>
> Alex
>
> On Mon, 13 Jan 2020 at 19:01, Alexander Kanavin 
> <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>> wrote:
>
>     I have reproduced this just now. You need to set up a special
>     'nodistro' configuration like this:
>
>     bblayers.conf:
>     BBLAYERS ?= " \
>       /home/alexander/development/poky/meta \
>     "
>     (and no other layers)
>
>     local.conf:
>
>     MACHINE ??= "qemuarm"
>     DISTRO ?= "nodistro"
>     INHERIT += 'uninative'
>     require conf/distro/include/yocto-uninative.inc
>     ... (dl_dir, sstate etc)
>
>     and build gstreamer1.0-plugins-base.
>
>     Alex
>
>
>     On Mon, 13 Jan 2020 at 16:38, Carlos Rafael Giani
>     <crg7475@mailbox.org <mailto:crg7475@mailbox.org>> wrote:
>
>         Except that there is no such package. Also, even if I build
>         GStreamer
>         from scratch with all optional packageconfigs disabled, I do
>         not get
>         this error, nor do I get any warnings about potentially missing
>         dependencies. So, I don't know what is going on here..
>
>         On 13.01.20 13:59, Richard Purdie wrote:
>         > On Mon, 2020-01-13 at 13:55 +0100, Carlos Rafael Giani wrote:
>         >> Nope. This is an odd one. Are you sure there isn't a
>         problem with
>         >> the
>         >> setup itself? In step2c, I see:
>         >>
>         >>   > ERROR: core-image-sato-1.0-r0 do_testsdk: The toolchain
>         >> /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-
>         >> glibc/deploy/sdk/oecore-i686-armv7vet2hf-neon-toolchain-
>         >> nodistro.0.sh <http://nodistro.0.sh>
>         >> is not built. Build it before running the tests: 'bitbake
>         <image> -c
>         >> populate_sdk' .
>         > 2c fails as earlier stepd didn't build. I think the real
>         issue is
>         > step1b which says:
>         >
>         > | Compiler for C supports arguments
>         -Wdeclaration-after-statement: YES
>         > | Found pkg-config:
>         /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.0-plugins-base/1.16.1-r0/recipe-sysroot-native/usr/bin/pkg-config
>         (0.29.2)
>         > | Run-time dependency x11 found: YES 1.6.9
>         > | Run-time dependency glib-2.0 found: YES 2.62.4
>         > | Run-time dependency gobject-2.0 found: YES 2.62.4
>         > | Run-time dependency gio-2.0 found: YES 2.62.4
>         > | Run-time dependency gio-unix-2.0 found: YES 2.62.4
>         > | Run-time dependency gmodule-no-export-2.0 found: YES 2.62.4
>         > | Dependency gdk-pixbuf-2.0 skipped: feature examples disabled
>         > | Dependency gtk+-3.0 skipped: feature examples disabled
>         > | Dependency gtk+-x11-3.0 skipped: feature examples disabled
>         > | Run-time dependency gstreamer-1.0 found: YES 1.16.1
>         > | Run-time dependency gstreamer-base-1.0 found: YES 1.16.1
>         > | Run-time dependency gstreamer-net-1.0 found: YES 1.16.1
>         > | Found CMake: NO
>         > | Run-time dependency gstreamer-check-1.0 found: NO (tried
>         pkgconfig and cmake)
>         > | Looking for a fallback subproject for the dependency
>         gstreamer-check-1.0
>         > | Subproject directory not found and gstreamer.wrap file not
>         found
>         > | Subproject  subprojects/gstreamer is buildable: NO (disabling)
>         > | Dependency gstreamer-check-1.0 from subproject
>         subprojects/gstreamer found: NO
>         > |
>         > | meson.build:309:0: ERROR: Could not find dependency
>         gst_controller_dep in subproject gstreamer
>         > |
>         > | A full log can be found at
>         /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.0-plugins-base/1.16.1-r0/build/meson-logs/meson-log.txt
>         > | WARNING:
>         /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.0-plugins-base/1.16.1-r0/temp/run.do_configure.46093:1
>         exit 1 from 'exit 1'
>         > |
>         > NOTE: recipe gstreamer1.0-plugins-base-1.16.1-r0: task
>         do_configure: Failed
>         >
>         > | Compiler for C supports arguments
>         -Wdeclaration-after-statement: YES
>         > | Found pkg-config:
>         /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.0-plugins-base/1.16.1-r0/recipe-sysroot-native/usr/bin/pkg-config
>         (0.29.2)
>         > | Run-time dependency x11 found: YES 1.6.9
>         > | Run-time dependency glib-2.0 found: YES 2.62.4
>         > | Run-time dependency gobject-2.0 found: YES 2.62.4
>         > | Run-time dependency gio-2.0 found: YES 2.62.4
>         > | Run-time dependency gio-unix-2.0 found: YES 2.62.4
>         > | Run-time dependency gmodule-no-export-2.0 found: YES 2.62.4
>         > | Dependency gdk-pixbuf-2.0 skipped: feature examples disabled
>         > | Dependency gtk+-3.0 skipped: feature examples disabled
>         > | Dependency gtk+-x11-3.0 skipped: feature examples disabled
>         > | Run-time dependency gstreamer-1.0 found: YES 1.16.1
>         > | Run-time dependency gstreamer-base-1.0 found: YES 1.16.1
>         > | Run-time dependency gstreamer-net-1.0 found: YES 1.16.1
>         > | Found CMake: NO
>         > | Run-time dependency gstreamer-check-1.0 found: NO (tried
>         pkgconfig and cmake)
>         > | Looking for a fallback subproject for the dependency
>         gstreamer-check-1.0
>         > | Subproject directory not found and gstreamer.wrap file not
>         found
>         > | Subproject  subprojects/gstreamer is buildable: NO (disabling)
>         > | Dependency gstreamer-check-1.0 from subproject
>         subprojects/gstreamer found: NO
>         > |
>         > | meson.build:309:0: ERROR: Could not find dependency
>         gst_controller_dep in subproject gstreamer
>         > |
>         > | A full log can be found at
>         /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.0-plugins-base/1.16.1-r0/build/meson-logs/meson-log.txt
>         > | WARNING:
>         /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.0-plugins-base/1.16.1-r0/temp/run.do_configure.46093:1
>         exit 1 from 'exit 1'
>         > |
>         > NOTE: recipe gstreamer1.0-plugins-base-1.16.1-r0: task
>         do_configure: Failed
>         >
>         > missing a check dependency?
>         >
>         > Cheers,
>         >
>         > Richard
>         >
>         >
>         -- 
>         _______________________________________________
>         Openembedded-core mailing list
>         Openembedded-core@lists.openembedded.org
>         <mailto:Openembedded-core@lists.openembedded.org>
>         http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--------------5884E9447F6976A78A856A80
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Nice find! But, there is still one issue Khem found, regarding
      errors in meta-multimedia plugins:
      <a class="moz-txt-link-freetext" href="https://errors.yoctoproject.org/Errors/Build/96752/">https://errors.yoctoproject.org/Errors/Build/96752/</a></p>
    <p>This, and the discussion about the qt5 packageconfig, means to me
      that a v2 set is warranted. What do you think?<br>
    </p>
    <div class="moz-cite-prefix">On 14.01.20 16:51, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANNYZj-Vd2E76rvAbxw8xNeyQa-SWy_zwomCOcSSKViCYdATDw@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div>I just sent a patch for this, and for the ptest issue.
          Should be good to merge now!<br>
        </div>
        <div><br>
        </div>
        <div>Alex<br>
        </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Mon, 13 Jan 2020 at 19:01,
          Alexander Kanavin &lt;<a href="mailto:alex.kanavin@gmail.com"
            moz-do-not-send="true">alex.kanavin@gmail.com</a>&gt; wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <div dir="ltr">
            <div>I have reproduced this just now. You need to set up a
              special 'nodistro' configuration like this:</div>
            <div><br>
            </div>
            <div>bblayers.conf:</div>
            <div>BBLAYERS ?= " \<br>
                /home/alexander/development/poky/meta \<br>
            </div>
            <div>"</div>
            <div>(and no other layers)</div>
            <div><br>
            </div>
            <div>local.conf:</div>
            <div><br>
            </div>
            <div>MACHINE ??= "qemuarm"<br>
              DISTRO ?= "nodistro"<br>
            </div>
            <div>INHERIT += 'uninative'<br>
              require conf/distro/include/yocto-uninative.inc</div>
            <div>... (dl_dir, sstate etc)<br>
            </div>
            <div><br>
            </div>
            <div>and build gstreamer1.0-plugins-base.</div>
            <div><br>
            </div>
            <div>Alex<br>
            </div>
            <div><br>
            </div>
          </div>
          <br>
          <div class="gmail_quote">
            <div dir="ltr" class="gmail_attr">On Mon, 13 Jan 2020 at
              16:38, Carlos Rafael Giani &lt;<a
                href="mailto:crg7475@mailbox.org" target="_blank"
                moz-do-not-send="true">crg7475@mailbox.org</a>&gt;
              wrote:<br>
            </div>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
              0.8ex;border-left:1px solid
              rgb(204,204,204);padding-left:1ex">Except that there is no
              such package. Also, even if I build GStreamer <br>
              from scratch with all optional packageconfigs disabled, I
              do not get <br>
              this error, nor do I get any warnings about potentially
              missing <br>
              dependencies. So, I don't know what is going on here..<br>
              <br>
              On 13.01.20 13:59, Richard Purdie wrote:<br>
              &gt; On Mon, 2020-01-13 at 13:55 +0100, Carlos Rafael
              Giani wrote:<br>
              &gt;&gt; Nope. This is an odd one. Are you sure there
              isn't a problem with<br>
              &gt;&gt; the<br>
              &gt;&gt; setup itself? In step2c, I see:<br>
              &gt;&gt;<br>
              &gt;&gt;   &gt; ERROR: core-image-sato-1.0-r0 do_testsdk:
              The toolchain<br>
              &gt;&gt;
              /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-<br>
              &gt;&gt;
              glibc/deploy/sdk/oecore-i686-armv7vet2hf-neon-toolchain-<br>
              &gt;&gt; <a href="http://nodistro.0.sh" rel="noreferrer"
                target="_blank" moz-do-not-send="true">nodistro.0.sh</a><br>
              &gt;&gt; is not built. Build it before running the tests:
              'bitbake &lt;image&gt; -c<br>
              &gt;&gt; populate_sdk' .<br>
              &gt; 2c fails as earlier stepd didn't build. I think the
              real issue is<br>
              &gt; step1b which says:<br>
              &gt;<br>
              &gt; | Compiler for C supports arguments
              -Wdeclaration-after-statement: YES<br>
              &gt; | Found pkg-config:
/home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.0-plugins-base/1.16.1-r0/recipe-sysroot-native/usr/bin/pkg-config
              (0.29.2)<br>
              &gt; | Run-time dependency x11 found: YES 1.6.9<br>
              &gt; | Run-time dependency glib-2.0 found: YES 2.62.4<br>
              &gt; | Run-time dependency gobject-2.0 found: YES 2.62.4<br>
              &gt; | Run-time dependency gio-2.0 found: YES 2.62.4<br>
              &gt; | Run-time dependency gio-unix-2.0 found: YES 2.62.4<br>
              &gt; | Run-time dependency gmodule-no-export-2.0 found:
              YES 2.62.4<br>
              &gt; | Dependency gdk-pixbuf-2.0 skipped: feature examples
              disabled<br>
              &gt; | Dependency gtk+-3.0 skipped: feature examples
              disabled<br>
              &gt; | Dependency gtk+-x11-3.0 skipped: feature examples
              disabled<br>
              &gt; | Run-time dependency gstreamer-1.0 found: YES 1.16.1<br>
              &gt; | Run-time dependency gstreamer-base-1.0 found: YES
              1.16.1<br>
              &gt; | Run-time dependency gstreamer-net-1.0 found: YES
              1.16.1<br>
              &gt; | Found CMake: NO<br>
              &gt; | Run-time dependency gstreamer-check-1.0 found: NO
              (tried pkgconfig and cmake)<br>
              &gt; | Looking for a fallback subproject for the
              dependency gstreamer-check-1.0<br>
              &gt; | Subproject directory not found and gstreamer.wrap
              file not found<br>
              &gt; | Subproject  subprojects/gstreamer is buildable: NO
              (disabling)<br>
              &gt; | Dependency gstreamer-check-1.0 from subproject
              subprojects/gstreamer found: NO<br>
              &gt; |<br>
              &gt; | meson.build:309:0: ERROR: Could not find dependency
              gst_controller_dep in subproject gstreamer<br>
              &gt; |<br>
              &gt; | A full log can be found at
/home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.0-plugins-base/1.16.1-r0/build/meson-logs/meson-log.txt<br>
              &gt; | WARNING:
/home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.0-plugins-base/1.16.1-r0/temp/run.do_configure.46093:1
              exit 1 from 'exit 1'<br>
              &gt; |<br>
              &gt; NOTE: recipe gstreamer1.0-plugins-base-1.16.1-r0:
              task do_configure: Failed<br>
              &gt;<br>
              &gt; | Compiler for C supports arguments
              -Wdeclaration-after-statement: YES<br>
              &gt; | Found pkg-config:
/home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.0-plugins-base/1.16.1-r0/recipe-sysroot-native/usr/bin/pkg-config
              (0.29.2)<br>
              &gt; | Run-time dependency x11 found: YES 1.6.9<br>
              &gt; | Run-time dependency glib-2.0 found: YES 2.62.4<br>
              &gt; | Run-time dependency gobject-2.0 found: YES 2.62.4<br>
              &gt; | Run-time dependency gio-2.0 found: YES 2.62.4<br>
              &gt; | Run-time dependency gio-unix-2.0 found: YES 2.62.4<br>
              &gt; | Run-time dependency gmodule-no-export-2.0 found:
              YES 2.62.4<br>
              &gt; | Dependency gdk-pixbuf-2.0 skipped: feature examples
              disabled<br>
              &gt; | Dependency gtk+-3.0 skipped: feature examples
              disabled<br>
              &gt; | Dependency gtk+-x11-3.0 skipped: feature examples
              disabled<br>
              &gt; | Run-time dependency gstreamer-1.0 found: YES 1.16.1<br>
              &gt; | Run-time dependency gstreamer-base-1.0 found: YES
              1.16.1<br>
              &gt; | Run-time dependency gstreamer-net-1.0 found: YES
              1.16.1<br>
              &gt; | Found CMake: NO<br>
              &gt; | Run-time dependency gstreamer-check-1.0 found: NO
              (tried pkgconfig and cmake)<br>
              &gt; | Looking for a fallback subproject for the
              dependency gstreamer-check-1.0<br>
              &gt; | Subproject directory not found and gstreamer.wrap
              file not found<br>
              &gt; | Subproject  subprojects/gstreamer is buildable: NO
              (disabling)<br>
              &gt; | Dependency gstreamer-check-1.0 from subproject
              subprojects/gstreamer found: NO<br>
              &gt; |<br>
              &gt; | meson.build:309:0: ERROR: Could not find dependency
              gst_controller_dep in subproject gstreamer<br>
              &gt; |<br>
              &gt; | A full log can be found at
/home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.0-plugins-base/1.16.1-r0/build/meson-logs/meson-log.txt<br>
              &gt; | WARNING:
/home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.0-plugins-base/1.16.1-r0/temp/run.do_configure.46093:1
              exit 1 from 'exit 1'<br>
              &gt; |<br>
              &gt; NOTE: recipe gstreamer1.0-plugins-base-1.16.1-r0:
              task do_configure: Failed<br>
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
              <a href="mailto:Openembedded-core@lists.openembedded.org"
                target="_blank" moz-do-not-send="true">Openembedded-core@lists.openembedded.org</a><br>
              <a
                href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                rel="noreferrer" target="_blank" moz-do-not-send="true">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
            </blockquote>
          </div>
        </blockquote>
      </div>
    </blockquote>
  </body>
</html>

--------------5884E9447F6976A78A856A80--
