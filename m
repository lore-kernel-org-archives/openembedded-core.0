Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 41C9D6065C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2013 19:04:03 +0000 (UTC)
Received: from [192.168.178.14] (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id 337AE1FFCC;
	Mon,  3 Jun 2013 21:04:02 +0200 (CEST)
Message-ID: <51ACE8AE.7000501@pseudoterminal.org>
Date: Mon, 03 Jun 2013 21:04:14 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1370278425-22062-1-git-send-email-otavio@ossystems.com.br>
	<51ACD5A7.2060707@pseudoterminal.org>
	<CAP9ODKovJjk=GaaS2ssA32jSbZy4fHqte68MgBvmnS2CXvjryw@mail.gmail.com>
In-Reply-To: <CAP9ODKovJjk=GaaS2ssA32jSbZy4fHqte68MgBvmnS2CXvjryw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gst-plugins-package.inc: Allow ${PN}-apps and ${PN}-glib to be empty
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
X-List-Received-Date: Mon, 03 Jun 2013 19:04:03 -0000
Content-Type: multipart/alternative;
	boundary="------------000007000800060308020902"

--------------000007000800060308020902
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

This can be done already. The first patch (search for "[OE-core] [PATCH 
1/3] gstreamer: fixed -meta package rdepends") can be applied, and does 
not depend on GStreamer 1.0. I bundled it together with the rest since 
the other patches need this one.

cheers

On 2013-06-03 21:02, Otavio Salvador wrote:
>
>
>
> On Mon, Jun 3, 2013 at 2:43 PM, Carlos Rafael Giani 
> <dv@pseudoterminal.org <mailto:dv@pseudoterminal.org>> wrote:
>
>     On 03.06.2013 18:53, Otavio Salvador wrote:
>
>         The ${PN}-meta package rdepends on ${PN}-apps and ${PN}-glib so we
>         need to have them available or the installation of the meta
>         package
>         will fail.
>
>         Signed-off-by: Otavio Salvador <otavio@ossystems.com.br
>         <mailto:otavio@ossystems.com.br>>
>         ---
>         This patch is need to make the meta packages work. This should
>         also be
>         applied in dylan branch as currently ${PN}-meta packages are not
>         installable.
>
>           meta/recipes-multimedia/gstreamer/gst-plugins-package.inc | 2 ++
>           1 file changed, 2 insertions(+)
>
>         diff --git
>         a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
>         b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
>         index 7ae3ef6..b768094 100644
>         --- a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
>         +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
>         @@ -28,6 +28,8 @@ python populate_packages_prepend () {
>           # each plugin depends on PN, plugin-dev on PN-dev and
>         plugin-staticdev on PN-staticdev
>           # so we need them even when empty (like in gst-plugins-good
>         case)
>           ALLOW_EMPTY_${PN} = "1"
>         +ALLOW_EMPTY_${PN}-apps = "1"
>         +ALLOW_EMPTY_${PN}-glib = "1"
>           ALLOW_EMPTY_${PN}-dev = "1"
>           ALLOW_EMPTY_${PN}-staticdev = "1"
>
>
>     Note that I posted a similar patch here some time ago, and the
>     concern about unnecessary empty packages was raised. My proposed
>     OE-core GStreamer 1.0 patches include code that takes care of this
>     by adding packages to the -meta rdepends only if they are not empty.
>
>
> Oh; good. Maybe you could split this patch from it so we can have it 
> applied and easy to backport to dylan?
>
> -- 
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br http://projetos.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


--------------000007000800060308020902
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">This can be done already. The first
      patch (search for "[OE-core] [PATCH 1/3] gstreamer: fixed -meta
      package rdepends") can be applied, and does not depend on
      GStreamer 1.0. I bundled it together with the rest since the other
      patches need this one.<br>
      <br>
      cheers<br>
      <br>
      On 2013-06-03 21:02, Otavio Salvador wrote:<br>
    </div>
    <blockquote
cite="mid:CAP9ODKovJjk=GaaS2ssA32jSbZy4fHqte68MgBvmnS2CXvjryw@mail.gmail.com"
      type="cite">
      <div dir="ltr"><br>
        <div class="gmail_extra"><br>
          <br>
          <div class="gmail_quote">On Mon, Jun 3, 2013 at 2:43 PM,
            Carlos Rafael Giani <span dir="ltr">&lt;<a
                moz-do-not-send="true"
                href="mailto:dv@pseudoterminal.org" target="_blank">dv@pseudoterminal.org</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div class="HOEnZb">
                <div class="h5">On 03.06.2013 18:53, Otavio Salvador
                  wrote:<br>
                  <blockquote class="gmail_quote" style="margin:0 0 0
                    .8ex;border-left:1px #ccc solid;padding-left:1ex">
                    The ${PN}-meta package rdepends on ${PN}-apps and
                    ${PN}-glib so we<br>
                    need to have them available or the installation of
                    the meta package<br>
                    will fail.<br>
                    <br>
                    Signed-off-by: Otavio Salvador &lt;<a
                      moz-do-not-send="true"
                      href="mailto:otavio@ossystems.com.br"
                      target="_blank">otavio@ossystems.com.br</a>&gt;<br>
                    ---<br>
                    This patch is need to make the meta packages work.
                    This should also be<br>
                    applied in dylan branch as currently ${PN}-meta
                    packages are not<br>
                    installable.<br>
                    <br>
                    &nbsp; meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
                    | 2 ++<br>
                    &nbsp; 1 file changed, 2 insertions(+)<br>
                    <br>
                    diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
                    b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc<br>
                    index 7ae3ef6..b768094 100644<br>
                    --- a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc<br>
                    +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc<br>
                    @@ -28,6 +28,8 @@ python populate_packages_prepend
                    () {<br>
                    &nbsp; # each plugin depends on PN, plugin-dev on PN-dev
                    and plugin-staticdev on PN-staticdev<br>
                    &nbsp; # so we need them even when empty (like in
                    gst-plugins-good case)<br>
                    &nbsp; ALLOW_EMPTY_${PN} = "1"<br>
                    +ALLOW_EMPTY_${PN}-apps = "1"<br>
                    +ALLOW_EMPTY_${PN}-glib = "1"<br>
                    &nbsp; ALLOW_EMPTY_${PN}-dev = "1"<br>
                    &nbsp; ALLOW_EMPTY_${PN}-staticdev = "1"<br>
                    &nbsp; <br>
                  </blockquote>
                  <br>
                </div>
              </div>
              Note that I posted a similar patch here some time ago, and
              the concern about unnecessary empty packages was raised.
              My proposed OE-core GStreamer 1.0 patches include code
              that takes care of this by adding packages to the -meta
              rdepends only if they are not empty.<br>
            </blockquote>
            <div><br>
            </div>
            <div style="">Oh; good. Maybe you could split this patch
              from it so we can have it applied and easy to backport to
              dylan?&nbsp;</div>
          </div>
          <div><br>
          </div>
          -- <br>
          Otavio Salvador &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; O.S. Systems<br>
          <a moz-do-not-send="true" href="http://www.ossystems.com.br"
            target="_blank">http://www.ossystems.com.br</a> &nbsp; &nbsp; &nbsp; &nbsp;<a
            moz-do-not-send="true"
            href="http://projetos.ossystems.com.br" target="_blank">http://projetos.ossystems.com.br</a><br>
          Mobile: +55 (53) 9981-7854 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Mobile: +1 (347)
          903-9750<br>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------000007000800060308020902--
