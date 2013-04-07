Received: from ptmx.org ([178.63.28.110])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dv@pseudoterminal.org>) id 1UOzRN-000654-7l
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 01:56:10 +0200
Received: from [192.168.178.14] (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id 608C626D32;
	Mon,  8 Apr 2013 01:38:49 +0200 (CEST)
Message-ID: <5162038C.2020706@pseudoterminal.org>
Date: Mon, 08 Apr 2013 01:38:52 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130403 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: RFC: gstreamer 1.0 recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 07 Apr 2013 23:56:12 -0000
Content-Type: multipart/alternative;
	boundary="------------000805030704040601030707"

--------------000805030704040601030707
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello all,

to start working with GStreamer 1.0 on several embedded platforms, I 
decided to adapt the existing GStreamer recipes from danny for 1.0. Out 
of this I created a layer, which is hosted at 
https://github.com/dv1/meta-gstreamer1.0 .

I write this RFC, because I figure that GStreamer 1.0 support is already 
on TODO lists of several people, and will eventually end up in OE-Core, 
just like GStreamer 0.10 did. For this reason, I also didn't add it to 
the layer index.

I built the packages for several platforms (cubox, beagleboard, imx6), 
and they worked well. Since 1.0 has been designed to be able to coexist 
with 0.10 in the same rootfs, I changed the naming convention for the 
packages: they all start with "gstreamer1.0-" .

I also tried to reuse the existing patches. I was able to reuse three. 
Several others are no longer necessary. Four are unclear to me, so I did 
not port them:
* gstreamer: check_fix.patch (I could not reproduce the documented 
problem), and gstregistrybin.c/.h (why are these present?)
* gst-plugins-base: configure.ac-fix-subparse-plugin.patch (not sure 
what this is trying to fix, and this line does not exist in 1.0), and 
gst-plugins-base-tremor.patch (again, works well without it)

gst-ffmpeg was replaced by gst-libav upstream. So was gst-openmax 
(gst-omx is its successor). gst-omx has special support for the 
Raspberry Pi and its custom OpenMax IL implementation. The recipe is 
designed in a way that allows for setting the target to something like 
"rpi", and the recipe then sets the PACKAGE_ARCH automatically to 
MACHINE_ARCH. However, I wasn't able to test it on an RPi yet, since I 
do not have one. I will get access to one in a few days.

I am also considering some kind of autodetection for when yasm and 
liborc are available (for example, because meta-oe was added to 
bblayers.conf), and then switches on Orc and enables yasm in gst-libav. 
Or better yet, if libav is available as a recipe, it lets gst-libav use 
it instead of its internal copy. These autodetections would improve 
performance significantly.

Thoughts?

cheers,
Carlos

--------------000805030704040601030707
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Hello all,<br>
    <br>
    to start working with GStreamer 1.0 on several embedded platforms, I
    decided to adapt the existing GStreamer recipes from danny for 1.0.
    Out of this I created a layer, which is hosted at
    <meta http-equiv="content-type" content="text/html;
      charset=ISO-8859-1">
    <a href="https://github.com/dv1/meta-gstreamer1.0">https://github.com/dv1/meta-gstreamer1.0</a>
    .<br>
    <br>
    I write this RFC, because I figure that GStreamer 1.0 support is
    already on TODO lists of several people, and will eventually end up
    in OE-Core, just like GStreamer 0.10 did. For this reason, I also
    didn't add it to the layer index.<br>
    <br>
    I built the packages for several platforms (cubox, beagleboard,
    imx6), and they worked well. Since 1.0 has been designed to be able
    to coexist with 0.10 in the same rootfs, I changed the naming
    convention for the packages: they all start with "gstreamer1.0-" .<br>
    <br>
    I also tried to reuse the existing patches. I was able to reuse
    three. Several others are no longer necessary. Four are unclear to
    me, so I did not port them:<br>
    * gstreamer:
    <meta http-equiv="content-type" content="text/html;
      charset=ISO-8859-1">
    check_fix.patch (I could not reproduce the documented problem), and
    gstregistrybin.c/.h (why are these present?)<br>
    * gst-plugins-base: configure.ac-fix-subparse-plugin.patch (not sure
    what this is trying to fix, and this line does not exist in 1.0),
    and gst-plugins-base-tremor.patch (again, works well without it)<br>
    <br>
    gst-ffmpeg was replaced by gst-libav upstream. So was gst-openmax
    (gst-omx is its successor). gst-omx has special support for the
    Raspberry Pi and its custom OpenMax IL implementation. The recipe is
    designed in a way that allows for setting the target to something
    like "rpi", and the recipe then sets the PACKAGE_ARCH automatically
    to MACHINE_ARCH. However, I wasn't able to test it on an RPi yet,
    since I do not have one. I will get access to one in a few days.<br>
    <br>
    I am also considering some kind of autodetection for when yasm and
    liborc are available (for example, because meta-oe was added to
    bblayers.conf), and then switches on Orc and enables yasm in
    gst-libav. Or better yet, if libav is available as a recipe, it lets
    gst-libav use it instead of its internal copy. These autodetections
    would improve performance significantly.<br>
    <br>
    Thoughts?<br>
    <br>
    cheers,<br>
    Carlos<br>
  </body>
</html>

--------------000805030704040601030707--
