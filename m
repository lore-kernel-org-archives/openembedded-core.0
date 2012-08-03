Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SxAg8-0000wR-NR
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Aug 2012 07:44:05 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 02 Aug 2012 22:32:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; 
	d="scan'208,217";a="201762147"
Received: from dell-desktop (HELO [10.237.105.32]) ([10.237.105.32])
	by fmsmga002.fm.intel.com with ESMTP; 02 Aug 2012 22:32:09 -0700
Message-ID: <501B62C6.20205@intel.com>
Date: Fri, 03 Aug 2012 08:33:58 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1343909173-2161-1-git-send-email-radu.moisan@intel.com>
	<CAK18fxFW89ficqdXn-H2VOPApOUhaXH0yNOkK4xb3J1HtxfLnA@mail.gmail.com>
In-Reply-To: <CAK18fxFW89ficqdXn-H2VOPApOUhaXH0yNOkK4xb3J1HtxfLnA@mail.gmail.com>
Subject: Re: [PATCH v2] usbutils: Upgrade usbutils to upstream v006
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Aug 2012 05:44:05 -0000
Content-Type: multipart/alternative;
	boundary="------------070109030502040805050308"

--------------070109030502040805050308
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 08/02/2012 06:25 PM, Andrei Gherzan wrote:
> On Thu, Aug 2, 2012 at 3:06 PM, Radu Moisan <radu.moisan@intel.com 
> <mailto:radu.moisan@intel.com>> wrote:
>
>     Signed-off-by: Radu Moisan <radu.moisan@intel.com
>     <mailto:radu.moisan@intel.com>>
>     ---
>      .../usbutils/{usbutils_0.91.bb <http://usbutils_0.91.bb> =>
>     usbutils_006.bb <http://usbutils_006.bb>} |    7 +++----
>      1 file changed, 3 insertions(+), 4 deletions(-)
>      rename meta/recipes-bsp/usbutils/{usbutils_0.91.bb
>     <http://usbutils_0.91.bb> => usbutils_006.bb
>     <http://usbutils_006.bb>} (80%)
>
>     diff --git a/meta/recipes-bsp/usbutils/usbutils_0.91.bb
>     <http://usbutils_0.91.bb>
>     b/meta/recipes-bsp/usbutils/usbutils_006.bb <http://usbutils_006.bb>
>     similarity index 80%
>     rename from meta/recipes-bsp/usbutils/usbutils_0.91.bb
>     <http://usbutils_0.91.bb>
>     rename to meta/recipes-bsp/usbutils/usbutils_006.bb
>     <http://usbutils_006.bb>
>     index abe807c..c1c9fc0 100644
>     --- a/meta/recipes-bsp/usbutils/usbutils_0.91.bb
>     <http://usbutils_0.91.bb>
>     +++ b/meta/recipes-bsp/usbutils/usbutils_006.bb
>     <http://usbutils_006.bb>
>     @@ -7,19 +7,18 @@ LICENSE = "GPLv2+"
>      LIC_FILES_CHKSUM =
>     "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>
>      DEPENDS = "libusb zlib"
>     -PR = "r5"
>     +PR = "r0"
>
>      SRC_URI =
>     "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz \
>                 file://usb-devices-avoid-dependency-on-bash.patch \
>                 file://Fix-NULL-pointer-crash.patch"
>
>     -SRC_URI[md5sum] = "49de2403b40bf3a9863faaa8d3858deb"
>     -SRC_URI[sha256sum] =
>     "c122346b0225121bcf159abf804116f826a4a3462c94ce7b8871f7559e6b3a46"
>     +SRC_URI[md5sum] = "850790442f5eb487cdc7e35f8ee03e11"
>     +SRC_URI[sha256sum] =
>     "553270b4030f0844cb70aed57e61c7f10a7ed6641c3bed20249201cec9bcf122"
>
>      inherit autotools
>
>      do_install_append() {
>     -       ln -s ../sbin/lsusb ${D}${bindir}/lsusb
>
>
> This is not needed anymore?
>
No, it's already in place.

radu

--------------070109030502040805050308
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <div class="moz-cite-prefix">On 08/02/2012 06:25 PM, Andrei Gherzan
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAK18fxFW89ficqdXn-H2VOPApOUhaXH0yNOkK4xb3J1HtxfLnA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=ISO-8859-1">
      <div class="gmail_quote">On Thu, Aug 2, 2012 at 3:06 PM, Radu
        Moisan <span dir="ltr">&lt;<a moz-do-not-send="true"
            href="mailto:radu.moisan@intel.com" target="_blank">radu.moisan@intel.com</a>&gt;</span>
        wrote:<br>
        <blockquote class="gmail_quote" style="margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">
          Signed-off-by: Radu Moisan &lt;<a moz-do-not-send="true"
            href="mailto:radu.moisan@intel.com">radu.moisan@intel.com</a>&gt;<br>
          ---<br>
          &nbsp;.../usbutils/{<a moz-do-not-send="true"
            href="http://usbutils_0.91.bb" target="_blank">usbutils_0.91.bb</a>
          =&gt; <a moz-do-not-send="true" href="http://usbutils_006.bb"
            target="_blank">usbutils_006.bb</a>} | &nbsp; &nbsp;7 +++----<br>
          &nbsp;1 file changed, 3 insertions(+), 4 deletions(-)<br>
          &nbsp;rename meta/recipes-bsp/usbutils/{<a moz-do-not-send="true"
            href="http://usbutils_0.91.bb" target="_blank">usbutils_0.91.bb</a>
          =&gt; <a moz-do-not-send="true" href="http://usbutils_006.bb"
            target="_blank">usbutils_006.bb</a>} (80%)<br>
          <br>
          diff --git a/meta/recipes-bsp/usbutils/<a
            moz-do-not-send="true" href="http://usbutils_0.91.bb"
            target="_blank">usbutils_0.91.bb</a>
          b/meta/recipes-bsp/usbutils/<a moz-do-not-send="true"
            href="http://usbutils_006.bb" target="_blank">usbutils_006.bb</a><br>
          similarity index 80%<br>
          rename from meta/recipes-bsp/usbutils/<a
            moz-do-not-send="true" href="http://usbutils_0.91.bb"
            target="_blank">usbutils_0.91.bb</a><br>
          rename to meta/recipes-bsp/usbutils/<a moz-do-not-send="true"
            href="http://usbutils_006.bb" target="_blank">usbutils_006.bb</a><br>
          index abe807c..c1c9fc0 100644<br>
          --- a/meta/recipes-bsp/usbutils/<a moz-do-not-send="true"
            href="http://usbutils_0.91.bb" target="_blank">usbutils_0.91.bb</a><br>
          +++ b/meta/recipes-bsp/usbutils/<a moz-do-not-send="true"
            href="http://usbutils_006.bb" target="_blank">usbutils_006.bb</a><br>
          @@ -7,19 +7,18 @@ LICENSE = "GPLv2+"<br>
          &nbsp;LIC_FILES_CHKSUM =
          <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f">"file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"</a><br>
          <br>
          &nbsp;DEPENDS = "libusb zlib"<br>
          -PR = "r5"<br>
          +PR = "r0"<br>
          <br>
          &nbsp;SRC_URI =
          "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz
          \<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a class="moz-txt-link-freetext" href="file://usb-devices-avoid-dependency-on-bash.patch">file://usb-devices-avoid-dependency-on-bash.patch</a>
          \<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a class="moz-txt-link-freetext" href="file://Fix-NULL-pointer-crash.patch">file://Fix-NULL-pointer-crash.patch</a>"<br>
          <br>
          -SRC_URI[md5sum] = "49de2403b40bf3a9863faaa8d3858deb"<br>
          -SRC_URI[sha256sum] =
          "c122346b0225121bcf159abf804116f826a4a3462c94ce7b8871f7559e6b3a46"<br>
          +SRC_URI[md5sum] = "850790442f5eb487cdc7e35f8ee03e11"<br>
          +SRC_URI[sha256sum] =
          "553270b4030f0844cb70aed57e61c7f10a7ed6641c3bed20249201cec9bcf122"<br>
          <br>
          &nbsp;inherit autotools<br>
          <br>
          &nbsp;do_install_append() {<br>
          - &nbsp; &nbsp; &nbsp; ln -s ../sbin/lsusb ${D}${bindir}/lsusb</blockquote>
        <div><br>
        </div>
        <div>This is not needed anymore?&nbsp;</div>
        <div><br>
        </div>
      </div>
    </blockquote>
    No, it's already in place.<br>
    <br>
    radu<br>
  </body>
</html>

--------------070109030502040805050308--
