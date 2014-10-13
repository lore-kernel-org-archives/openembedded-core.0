Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2C09B6A362
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Oct 2014 09:04:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9D94fVb015515
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Oct 2014 02:04:45 -0700 (PDT)
Received: from [128.224.162.187] (128.224.162.187) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Mon, 13 Oct 2014 02:04:41 -0700
Message-ID: <543B95F0.8010707@windriver.com>
Date: Mon, 13 Oct 2014 17:05:52 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1407488988-14910-1-git-send-email-sujith.h@gmail.com>	<53E511E2.10300@linux.intel.com>
	<CADyYWLma=JqZF=dJRysw7H4HHWSSKdgcpJe4kL3-As9pcwbK5Q@mail.gmail.com>
In-Reply-To: <CADyYWLma=JqZF=dJRysw7H4HHWSSKdgcpJe4kL3-As9pcwbK5Q@mail.gmail.com>
X-Originating-IP: [128.224.162.187]
Subject: Re: [PATCH] psplash: Adding support for systemd service files
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
X-List-Received-Date: Mon, 13 Oct 2014 09:04:47 -0000
Content-Type: multipart/alternative;
	boundary="------------000009050202010307050500"

--------------000009050202010307050500
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Does anybody know what's the current state of this issue?

Thanks,
Chen Qi

On 08/11/2014 06:00 PM, sujith h wrote:
>
>
>
> On Fri, Aug 8, 2014 at 11:37 PM, Saul Wold <sgw@linux.intel.com 
> <mailto:sgw@linux.intel.com>> wrote:
>
>     On 08/08/2014 02:09 AM, Sujith H wrote:
>
>         From: Sujith H <Sujith_Haridasan@mentor.com
>         <mailto:Sujith_Haridasan@mentor.com>>
>
>         If the DISTRO_FEATURES has systemd, then its better
>         to have corresponding service files associated with
>         the psplash. This change will help to do the same.
>
>     Can you propose a patch to the psplash upstream which is part of
>     the Yocto Project (send the patch to yocto@yoctoproject.org
>     <mailto:yocto@yoctoproject.org>) and then we can do a psplash
>     upgrade to include these files directly?
>
>
> Ok then I will submit the same patch to Yocto Project.
>
> Thanks,
> Sujith H
>
>
>     Thanks
>             Sau!
>
>
>         Signed-off-by: Muzaffar Mahmood <muzaffar_mahmood@mentor.com
>         <mailto:muzaffar_mahmood@mentor.com>>
>         Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com
>         <mailto:Sujith_Haridasan@mentor.com>>
>         ---
>           meta/recipes-core/psplash/files/psplash-quit.service  | 11
>         +++++++++++
>           meta/recipes-core/psplash/files/psplash-start.service | 11
>         +++++++++++
>           meta/recipes-core/psplash/psplash_git.bb
>         <http://psplash_git.bb>              | 12 +++++++++++-
>           3 files changed, 33 insertions(+), 1 deletion(-)
>           create mode 100644
>         meta/recipes-core/psplash/files/psplash-quit.service
>           create mode 100644
>         meta/recipes-core/psplash/files/psplash-start.service
>
>         diff --git
>         a/meta/recipes-core/psplash/files/psplash-quit.service
>         b/meta/recipes-core/psplash/files/psplash-quit.service
>         new file mode 100644
>         index 0000000..14bd499
>         --- /dev/null
>         +++ b/meta/recipes-core/psplash/files/psplash-quit.service
>         @@ -0,0 +1,11 @@
>         +[Unit]
>         +Description=Terminate Psplash Boot Screen
>         +After=psplash-start.service
>         +
>         +[Service]
>         +Type=oneshot
>         +ExecStart=/usr/bin/psplash-write QUIT
>         +TimeoutSec=20
>         +
>         +[Install]
>         +WantedBy=multi-user.target
>         diff --git
>         a/meta/recipes-core/psplash/files/psplash-start.service
>         b/meta/recipes-core/psplash/files/psplash-start.service
>         new file mode 100644
>         index 0000000..502b150
>         --- /dev/null
>         +++ b/meta/recipes-core/psplash/files/psplash-start.service
>         @@ -0,0 +1,11 @@
>         +[Unit]
>         +Description=Starts Psplash Boot screen
>         +Wants=systemd-vconsole-setup.service
>         +After=systemd-vconsole-setup.service
>         systemd-udev-trigger.service systemd-udevd.service
>         +DefaultDependencies=no
>         +
>         +[Service]
>         +ExecStart=/usr/bin/psplash
>         +
>         +[Install]
>         +WantedBy=sysinit.target
>         diff --git a/meta/recipes-core/psplash/psplash_git.bb
>         <http://psplash_git.bb>
>         b/meta/recipes-core/psplash/psplash_git.bb <http://psplash_git.bb>
>         index 628ced4..16fa0ae 100644
>         --- a/meta/recipes-core/psplash/psplash_git.bb
>         <http://psplash_git.bb>
>         +++ b/meta/recipes-core/psplash/psplash_git.bb
>         <http://psplash_git.bb>
>         @@ -11,6 +11,8 @@ PR = "r15"
>
>           SRC_URI = "git://git.yoctoproject.org/${BPN}
>         <http://git.yoctoproject.org/$%7BBPN%7D> \
>                      file://psplash-init \
>         +           file://psplash-start.service \
>         +           file://psplash-quit.service \
>                      ${SPLASH_IMAGES}"
>
>           SPLASH_IMAGES = "file://psplash-poky-img.h;outsuffix=default"
>         @@ -65,11 +67,14 @@ python __anonymous() {
>
>           S = "${WORKDIR}/git"
>
>         -inherit autotools pkgconfig update-rc.d update-alternatives
>         +inherit autotools pkgconfig update-rc.d update-alternatives
>         systemd
>
>           ALTERNATIVE_PRIORITY = "100"
>           ALTERNATIVE_LINK_NAME[psplash] = "${bindir}/psplash"
>
>         +SYSTEMD_PACKAGES =
>         "${@base_contains('DISTRO_FEATURES','systemd','${PN}','',d)}"
>         +SYSTEMD_SERVICE_${PN} =
>         "${@base_contains('DISTRO_FEATURES','systemd','psplash-start.service
>         psplash-quit.service','',d)}"
>         +
>           python do_compile () {
>               import shutil
>
>         @@ -103,6 +108,11 @@ do_install_append() {
>                         install -m 0755 $i ${D}${bindir}/$i
>                 done
>                 rm -f ${D}${bindir}/psplash
>         +
>         +       if
>         ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)};
>         then
>         +                install -d ${D}${systemd_unitdir}/system
>         +                install -m 644 ${WORKDIR}/*.service
>         ${D}/${systemd_unitdir}/system
>         +        fi
>           }
>
>           FILES_${PN} += "/mnt/.psplash"
>
>
>
>
> -- 
> സുജിത് ഹരിദാസന്
> Bangalore
> <Project>Contributor to KDE project
> http://fci.wikia.com/wiki/Anti-DRM-Campaign
> <Blog> http://sujithh.info
>
>


--------------000009050202010307050500
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Does anybody know what's the current
      state of this issue?<br>
      <br>
      Thanks,<br>
      Chen Qi<br>
      <br>
      On 08/11/2014 06:00 PM, sujith h wrote:<br>
    </div>
    <blockquote
cite="mid:CADyYWLma=JqZF=dJRysw7H4HHWSSKdgcpJe4kL3-As9pcwbK5Q@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="ltr"><br>
        <div>
          <div class="gmail_extra"><br>
            <br>
            <div class="gmail_quote">On Fri, Aug 8, 2014 at 11:37 PM,
              Saul Wold <span dir="ltr">&lt;<a moz-do-not-send="true"
                  href="mailto:sgw@linux.intel.com" target="_blank">sgw@linux.intel.com</a>&gt;</span>
              wrote:<br>
              <blockquote class="gmail_quote" style="margin:0 0 0
                .8ex;border-left:1px #ccc solid;padding-left:1ex">
                <div class="">On 08/08/2014 02:09 AM, Sujith H wrote:<br>
                  <blockquote class="gmail_quote" style="margin:0 0 0
                    .8ex;border-left:1px #ccc solid;padding-left:1ex">
                    From: Sujith H &lt;<a moz-do-not-send="true"
                      href="mailto:Sujith_Haridasan@mentor.com"
                      target="_blank">Sujith_Haridasan@mentor.com</a>&gt;<br>
                    <br>
                    If the DISTRO_FEATURES has systemd, then its better<br>
                    to have corresponding service files associated with<br>
                    the psplash. This change will help to do the same.<br>
                    <br>
                  </blockquote>
                </div>
                Can you propose a patch to the psplash upstream which is
                part of the Yocto Project (send the patch to <a
                  moz-do-not-send="true"
                  href="mailto:yocto@yoctoproject.org" target="_blank">yocto@yoctoproject.org</a>)
                and then we can do a psplash upgrade to include these
                files directly?<br>
              </blockquote>
              <div><br>
              </div>
              <div>Ok then I will submit the same patch to Yocto
                Project.<br>
                <br>
              </div>
              <div>Thanks,<br>
                Sujith H <br>
              </div>
              <blockquote class="gmail_quote" style="margin:0 0 0
                .8ex;border-left:1px #ccc solid;padding-left:1ex">
                <br>
                Thanks<br>
                        Sau!
                <div class="HOEnZb">
                  <div class="h5"><br>
                    <br>
                    <blockquote class="gmail_quote" style="margin:0 0 0
                      .8ex;border-left:1px #ccc solid;padding-left:1ex">
                      Signed-off-by: Muzaffar Mahmood &lt;<a
                        moz-do-not-send="true"
                        href="mailto:muzaffar_mahmood@mentor.com"
                        target="_blank">muzaffar_mahmood@mentor.com</a>&gt;<br>
                      Signed-off-by: Sujith H &lt;<a
                        moz-do-not-send="true"
                        href="mailto:Sujith_Haridasan@mentor.com"
                        target="_blank">Sujith_Haridasan@mentor.com</a>&gt;<br>
                      ---<br>
                        meta/recipes-core/psplash/files/psplash-quit.service
                       | 11 +++++++++++<br>
                        meta/recipes-core/psplash/files/psplash-start.service
                      | 11 +++++++++++<br>
                        meta/recipes-core/psplash/<a
                        moz-do-not-send="true"
                        href="http://psplash_git.bb" target="_blank">psplash_git.bb</a>
                                   | 12 +++++++++++-<br>
                        3 files changed, 33 insertions(+), 1 deletion(-)<br>
                        create mode 100644 meta/recipes-core/psplash/files/psplash-quit.service<br>
                        create mode 100644 meta/recipes-core/psplash/files/psplash-start.service<br>
                      <br>
                      diff --git a/meta/recipes-core/psplash/files/psplash-quit.service
                      b/meta/recipes-core/psplash/files/psplash-quit.service<br>
                      new file mode 100644<br>
                      index 0000000..14bd499<br>
                      --- /dev/null<br>
                      +++ b/meta/recipes-core/psplash/files/psplash-quit.service<br>
                      @@ -0,0 +1,11 @@<br>
                      +[Unit]<br>
                      +Description=Terminate Psplash Boot Screen<br>
                      +After=psplash-start.service<br>
                      +<br>
                      +[Service]<br>
                      +Type=oneshot<br>
                      +ExecStart=/usr/bin/psplash-write QUIT<br>
                      +TimeoutSec=20<br>
                      +<br>
                      +[Install]<br>
                      +WantedBy=multi-user.target<br>
                      diff --git a/meta/recipes-core/psplash/files/psplash-start.service
                      b/meta/recipes-core/psplash/files/psplash-start.service<br>
                      new file mode 100644<br>
                      index 0000000..502b150<br>
                      --- /dev/null<br>
                      +++ b/meta/recipes-core/psplash/files/psplash-start.service<br>
                      @@ -0,0 +1,11 @@<br>
                      +[Unit]<br>
                      +Description=Starts Psplash Boot screen<br>
                      +Wants=systemd-vconsole-setup.service<br>
                      +After=systemd-vconsole-setup.service
                      systemd-udev-trigger.service systemd-udevd.service<br>
                      +DefaultDependencies=no<br>
                      +<br>
                      +[Service]<br>
                      +ExecStart=/usr/bin/psplash<br>
                      +<br>
                      +[Install]<br>
                      +WantedBy=sysinit.target<br>
                      diff --git a/meta/recipes-core/psplash/<a
                        moz-do-not-send="true"
                        href="http://psplash_git.bb" target="_blank">psplash_git.bb</a>
                      b/meta/recipes-core/psplash/<a
                        moz-do-not-send="true"
                        href="http://psplash_git.bb" target="_blank">psplash_git.bb</a><br>
                      index 628ced4..16fa0ae 100644<br>
                      --- a/meta/recipes-core/psplash/<a
                        moz-do-not-send="true"
                        href="http://psplash_git.bb" target="_blank">psplash_git.bb</a><br>
                      +++ b/meta/recipes-core/psplash/<a
                        moz-do-not-send="true"
                        href="http://psplash_git.bb" target="_blank">psplash_git.bb</a><br>
                      @@ -11,6 +11,8 @@ PR = "r15"<br>
                      <br>
                        SRC_URI = "git://<a moz-do-not-send="true"
                        href="http://git.yoctoproject.org/$%7BBPN%7D"
                        target="_blank">git.yoctoproject.org/${BPN}</a>
                      \<br>
                                   <a class="moz-txt-link-freetext" href="file://psplash-init">file://psplash-init</a> \<br>
                      +           <a class="moz-txt-link-freetext" href="file://psplash-start.service">file://psplash-start.service</a> \<br>
                      +           <a class="moz-txt-link-freetext" href="file://psplash-quit.service">file://psplash-quit.service</a> \<br>
                                   ${SPLASH_IMAGES}"<br>
                      <br>
                        SPLASH_IMAGES = <a class="moz-txt-link-rfc2396E" href="file://psplash-poky-img.h;outsuffix=default">"file://psplash-poky-img.h;outsuffix=default"</a><br>
                      @@ -65,11 +67,14 @@ python __anonymous() {<br>
                      <br>
                        S = "${WORKDIR}/git"<br>
                      <br>
                      -inherit autotools pkgconfig update-rc.d
                      update-alternatives<br>
                      +inherit autotools pkgconfig update-rc.d
                      update-alternatives systemd<br>
                      <br>
                        ALTERNATIVE_PRIORITY = "100"<br>
                        ALTERNATIVE_LINK_NAME[psplash] =
                      "${bindir}/psplash"<br>
                      <br>
                      +SYSTEMD_PACKAGES = "${@base_contains('DISTRO_FEATURES','systemd','${PN}','',d)}"<br>
                      +SYSTEMD_SERVICE_${PN} =
                      <a class="moz-txt-link-rfc2396E" href="mailto:${@base_contains('DISTRO_FEATURES','systemd','psplash-start.servicepsplash-quit.service','',d)}">"${@base_contains('DISTRO_FEATURES','systemd','psplash-start.service
                      psplash-quit.service','',d)}"</a><br>
                      +<br>
                        python do_compile () {<br>
                            import shutil<br>
                      <br>
                      @@ -103,6 +108,11 @@ do_install_append() {<br>
                                      install -m 0755 $i
                      ${D}${bindir}/$i<br>
                              done<br>
                              rm -f ${D}${bindir}/psplash<br>
                      +<br>
                      +       if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)};
                      then<br>
                      +                install -d
                      ${D}${systemd_unitdir}/system<br>
                      +                install -m 644
                      ${WORKDIR}/*.service
                      ${D}/${systemd_unitdir}/system<br>
                      +        fi<br>
                        }<br>
                      <br>
                        FILES_${PN} += "/mnt/.psplash"<br>
                      <br>
                    </blockquote>
                  </div>
                </div>
              </blockquote>
            </div>
            <br>
            <br clear="all">
            <br>
            -- <br>
            സുജിത് ഹരിദാസന്<br>
            Bangalore<br>
            &lt;Project&gt;Contributor to KDE project<br>
            <a moz-do-not-send="true"
              href="http://fci.wikia.com/wiki/Anti-DRM-Campaign"
              target="_blank">http://fci.wikia.com/wiki/Anti-DRM-Campaign</a><br>
            &lt;Blog&gt; <a moz-do-not-send="true"
              href="http://sujithh.info" target="_blank">http://sujithh.info</a><br>
          </div>
        </div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------000009050202010307050500--
