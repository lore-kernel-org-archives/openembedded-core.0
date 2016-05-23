Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id BD240601F6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 18:50:11 +0000 (UTC)
Received: from [172.16.1.106] (62-178-118-86.cable.dynamic.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id BF67F2B955;
	Mon, 23 May 2016 20:50:09 +0200 (CEST)
To: Christopher Larson <clarson@kergoth.com>
References: <1461870393-3545-1-git-send-email-dv@pseudoterminal.org>
	<1461870393-3545-5-git-send-email-dv@pseudoterminal.org>
	<CABcZANm+312ETxgrpkuO9OcAubc7UC6AwoXvVcUDu7_5TbLdPw@mail.gmail.com>
	<CABcZANkXv6BTe6r4-N50=SzOU-QbndnA_TKT6vOEygd-CFnayw@mail.gmail.com>
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <574350E1.9040305@pseudoterminal.org>
Date: Mon, 23 May 2016 20:50:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CABcZANkXv6BTe6r4-N50=SzOU-QbndnA_TKT6vOEygd-CFnayw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 5/8] gstreamer1.0-plugins-bad: upgrade to version 1.8.1
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
X-List-Received-Date: Mon, 23 May 2016 18:50:13 -0000
Content-Type: multipart/alternative;
	boundary="------------050208070306090901030604"

--------------050208070306090901030604
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Quoting Ross Burton from an earlier posting where I wanted to remove the 
gst-player recipe because gst-player is now part of -bad:

 > gst-player the API is, but not the applications gtk-player or 
gst-player which is the main reason this recipe exists in oe-core.
 >
 > Current gst-player HEAD is now using non-trivial parts of GTK+ 3, so 
I started to backport the API changes to gst-player so we could ship a 
GTK+ 2 gtk-player that links to the API in -bad 1.8, but didn't finish 
the work.  We > plan on merging the GTK+ 3 Sato patches fairly soon so 
it may be that the -bad 1.8 upgrade waits for that, then gst-player can 
switch to git HEAD with GTK+ 3, and everything works again.


On 2016-05-23 20:37, Christopher Larson wrote:
>
> On Mon, May 23, 2016 at 11:36 AM, Christopher Larson 
> <clarson@kergoth.com <mailto:clarson@kergoth.com>> wrote:
>
>     On Thu, Apr 28, 2016 at 12:06 PM, Carlos Rafael Giani
>     <dv@pseudoterminal.org <mailto:dv@pseudoterminal.org>> wrote:
>
>         0002-glplugin-glwindow-fix-memory-leak-of-navigation-thre.patch is
>         a
>         backport, and is no longer needed.
>
>         configure-allow-to-disable-libssh2.patch got replaced by a
>         patch that does
>         the same thing but has been submitted.
>
>         Vulkan is disabled for now since libxcb alone is not enough -
>         the Vulkan
>         headers and libraries are needed as well.
>
>         Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org
>         <mailto:dv@pseudoterminal.org>>
>
>
>     It seems this series was applied to oe-core, but incompletely.
>     This patch specifically wasn't applied, so
>     gstreamer1.0-plugins-bad is still 1.6.3 in oe-core. Would you mind
>     checking to see which patches in this series were actually
>     applied? Thanks!
>
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=9664 has been opened 
> for this issue.
> -- 
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics


--------------050208070306090901030604
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Quoting Ross Burton from an earlier posting where I wanted to remove
    the gst-player recipe because gst-player is now part of -bad:<br>
    <br>
    &gt; gst-player the API is, but not the applications gtk-player or
    gst-player which is the main reason this recipe exists in oe-core.
    <div>&gt; <br>
    </div>
    <div>&gt; Current gst-player HEAD is now using non-trivial parts of
      GTK+ 3, so I started to backport the API changes to gst-player so
      we could ship a GTK+ 2 gtk-player that links to the API in -bad
      1.8, but didn't finish the work.  We &gt; plan on merging the GTK+
      3 Sato patches fairly soon so it may be that the -bad 1.8 upgrade
      waits for that, then gst-player can switch to git HEAD with GTK+
      3, and everything works again.</div>
    <br>
    <br>
    <div class="moz-cite-prefix">On 2016-05-23 20:37, Christopher Larson
      wrote:<br>
    </div>
    <blockquote
cite="mid:CABcZANkXv6BTe6r4-N50=SzOU-QbndnA_TKT6vOEygd-CFnayw@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Mon, May 23, 2016 at 11:36 AM,
            Christopher Larson <span dir="ltr">&lt;<a
                moz-do-not-send="true" href="mailto:clarson@kergoth.com"
                target="_blank"><a class="moz-txt-link-abbreviated" href="mailto:clarson@kergoth.com">clarson@kergoth.com</a></a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex"><span
                class="">On Thu, Apr 28, 2016 at 12:06 PM, Carlos Rafael
                Giani <span dir="ltr">&lt;<a moz-do-not-send="true"
                    href="mailto:dv@pseudoterminal.org" target="_blank">dv@pseudoterminal.org</a>&gt;</span>
                wrote:<br>
                <blockquote class="gmail_quote" style="margin:0px 0px
                  0px
0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">
                  <div>
                    <div>0002-glplugin-glwindow-fix-memory-leak-of-navigation-thre.patch
                      is a<br>
                      backport, and is no longer needed.<br>
                      <br>
                      configure-allow-to-disable-libssh2.patch got
                      replaced by a patch that does<br>
                      the same thing but has been submitted.<br>
                      <br>
                      Vulkan is disabled for now since libxcb alone is
                      not enough - the Vulkan<br>
                      headers and libraries are needed as well.<br>
                      <br>
                      Signed-off-by: Carlos Rafael Giani &lt;<a
                        moz-do-not-send="true"
                        href="mailto:dv@pseudoterminal.org"
                        target="_blank"><a class="moz-txt-link-abbreviated" href="mailto:dv@pseudoterminal.org">dv@pseudoterminal.org</a></a>&gt;<br>
                    </div>
                  </div>
                </blockquote>
                <div><br>
                </div>
              </span>
              <div>It seems this series was applied to oe-core, but
                incompletely. This patch specifically wasn't applied, so
                gstreamer1.0-plugins-bad is still <span class="">1</span>.6.3
                in oe-core. Would you mind checking to see which patches
                in this series were actually applied? Thanks!</div>
            </blockquote>
          </div>
          <br>
          <a moz-do-not-send="true"
            href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=9664">https://bugzilla.yoctoproject.org/show_bug.cgi?id=9664</a>
          has been opened for this issue.<br>
          -- <br>
          <div class="gmail_signature">Christopher Larson<br>
            clarson at kergoth dot com<br>
            Founder - BitBake, OpenEmbedded, OpenZaurus<br>
            Maintainer - Tslib<br>
            Senior Software Engineer, Mentor Graphics</div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------050208070306090901030604--
