Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id EBE5177E35
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 08:42:48 +0000 (UTC)
Received: from [172.16.1.14] (62-178-118-86.cable.dynamic.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id C711B48219;
	Fri,  2 Jun 2017 10:42:48 +0200 (CEST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1494933979-5139-1-git-send-email-dv@pseudoterminal.org>
	<1494933979-5139-5-git-send-email-dv@pseudoterminal.org>
	<CAJTo0LZRyKSoQPEZDqSHL7qD7viYz6QJq8Vd34rViUdh-dbsMA@mail.gmail.com>
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <6ae04e38-de16-a2bf-9e66-07b569da9aac@pseudoterminal.org>
Date: Fri, 2 Jun 2017 10:42:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZRyKSoQPEZDqSHL7qD7viYz6QJq8Vd34rViUdh-dbsMA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/9] gstreamer1.0-plugins-ugly: upgrade to version 1.12.0
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
X-List-Received-Date: Fri, 02 Jun 2017 08:42:50 -0000
Content-Type: multipart/alternative;
	boundary="------------BA73C08FE9AC31074AB56E36"
Content-Language: en-US

--------------BA73C08FE9AC31074AB56E36
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Note that this might be because of a change I did in 
gstreamer1.0-vaapi.inc. Previously, the PACKAGECONFIG line contained 
"${@bb.utils.contains('DISTRO_FEATURES', 'opengl x11', 'glx', '', d)}". 
I replaced that with a PACKAGECONFIG_GL variable that can be overridden 
by distros and/or BSP layers, just like how PACKAGECONFIG_GL works in 
gstreamer1.0-plugins-bad.inc .


On 2017-06-01 17:32, Burton, Ross wrote:
>
> On 16 May 2017 at 12:26, Carlos Rafael Giani <dv@pseudoterminal.org 
> <mailto:dv@pseudoterminal.org>> wrote:
>
>     * libmad plugin was removed in 1.12.0, since mad is GPLed,
>     unmaintained,
>       and both gst-libav & the mpg123 plugin are fully functional
>     alternatives
>
>
> Something in this series is causing other plugins to change their 
> dependencies and I'm not sure if it's intentional or not.
>
> For example, this happens when upgrading base/good/bad:
>
> packages/corei7-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi: 
> RDEPENDS: removed all items "libwayland-egl (['>= 17.1.1']) 
> libgles2-mesa (['>= 17.1.1'])"
>
> I've not dug into this to see if that is expected or not.
>
> Ross


--------------BA73C08FE9AC31074AB56E36
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Note that this might be because of a change I did in
      gstreamer1.0-vaapi.inc. Previously, the PACKAGECONFIG line
      contained <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('DISTRO_FEATURES','openglx11','glx','',d)}">"${@bb.utils.contains('DISTRO_FEATURES', 'opengl x11',
      'glx', '', d)}"</a>. I replaced that with a PACKAGECONFIG_GL variable
      that can be overridden by distros and/or BSP layers, just like how
      PACKAGECONFIG_GL works in gstreamer1.0-plugins-bad.inc .<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 2017-06-01 17:32, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0LZRyKSoQPEZDqSHL7qD7viYz6QJq8Vd34rViUdh-dbsMA@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 16 May 2017 at 12:26, Carlos
            Rafael Giani <span dir="ltr">&lt;<a
                href="mailto:dv@pseudoterminal.org" target="_blank"
                moz-do-not-send="true">dv@pseudoterminal.org</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">
              <div id="gmail-:295" class="gmail-a3s gmail-aXjCH
                gmail-m15c110378563ba6e">* libmad plugin was removed in
                1.12.0, since mad is GPLed, unmaintained,<br>
                  and both gst-libav &amp; the mpg123 plugin are fully
                functional alternatives<br>
              </div>
            </blockquote>
          </div>
          <br>
          Something in this series is causing other plugins to change
          their dependencies and I'm not sure if it's intentional or
          not.</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">For example, this happens when
          upgrading base/good/bad:</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">packages/corei7-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi:
          RDEPENDS: removed all items "libwayland-egl (['&gt;= 17.1.1'])
          libgles2-mesa (['&gt;= 17.1.1'])"<br>
        </div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">I've not dug into this to see if that
          is expected or not.</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------BA73C08FE9AC31074AB56E36--
