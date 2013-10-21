Return-Path: <openembedded-core@emagii.com>
Received: from smtprelay-h21.telenor.se (smtprelay-h21.telenor.se
	[195.54.99.196])
	by mail.openembedded.org (Postfix) with ESMTP id 380CC610DC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 16:30:42 +0000 (UTC)
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-h21.telenor.se (Postfix) with ESMTP id 83194E954D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 18:30:42 +0200 (CEST)
X-SENDER-IP: [83.227.59.84]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AnAZAJ1VZVJT4ztUPGdsb2JhbAANTIt3gSOuB4hlAwEBAQE4g1kgHRYYAwIBAgExGwwIAQGIB6ZOkzKUDAOUKoNfikKKaw
X-IronPort-AV: E=Sophos;i="4.93,540,1378850400"; 
	d="scan'208,217";a="640466538"
Received: from c-543be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.199]) ([83.227.59.84])
	by ipb1.telenor.se with ESMTP; 21 Oct 2013 18:30:42 +0200
Message-ID: <526556B1.2010908@emagii.com>
Date: Mon, 21 Oct 2013 18:30:41 +0200
From: Ulf Samuelsson <openembedded-core@emagii.com>
Organization: eMagii
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org, 
	Angstrom-distro-devel@linuxtogo.org
Subject: Using the correct "xserver-xf86-config_0.1.bbappend
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ulf@emagii.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Oct 2013 16:30:44 -0000
Content-Type: multipart/alternative;
	boundary="------------040604030806050408040303"

--------------040604030806050408040303
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Trying to build a systemd-gnome-image raspberrypi under Angstrom, with a 
few extra layers.

This fails on "xserver-xf86-config_0.1.[bb|bbappend]"

The extra layer has BBPRIORITY = 20.
meta-beagleboard has BBPRIORITY = 8
meta-raspberrypi has BBPRIORITY = 6 (later changed to 120)

BBLAYERS are in the order meta-<extra layer> meta-beagleboard 
meta-raspberrypi

It looks like bitbake will select the bbappend in the layer with the 
highest priority,
even if that contains a COMPATIBLE_MACHINE clause, which does not
include the current MACHINE.

/Is there any way to make bitbake select the correct bbappend file 
without modifying the BBPRIORITY? /

--------------------------------------------------------------------------------------------
Looks like the xserver-xf86-config for the raspberry-pi fails on

*SRC_URI_append_raspberrypi = " file://xorg.conf.d/*"**
*
When I change to:

*SRC_URI_append_raspberrypi = " file://xorg.conf.d/10-evdev.conf "*

the raspberry pi version completes.

/Wildcards are not allowed?/

-- 
Best Regards
Ulf Samuelsson
eMagii


--------------040604030806050408040303
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Trying to build a systemd-gnome-image raspberrypi under Angstrom,
    with a few extra layers.<br>
    <br>
    This fails on "xserver-xf86-config_0.1.[bb|bbappend]"<br>
    <br>
    The extra layer has BBPRIORITY = 20.<br>
    meta-beagleboard has BBPRIORITY = 8<br>
    meta-raspberrypi has BBPRIORITY = 6 (later changed to 120)<br>
    <br>
    BBLAYERS are in the order meta-&lt;extra layer&gt; meta-beagleboard
    meta-raspberrypi<br>
    <br>
    It looks like bitbake will select the bbappend in the layer with the
    highest priority,<br>
    even if that contains a COMPATIBLE_MACHINE clause, which does not<br>
    include the current MACHINE.<br>
    <br>
    <i>Is there any way to make bitbake select the correct bbappend file
      without modifying the BBPRIORITY? </i><br>
    <br>
--------------------------------------------------------------------------------------------<br>
    Looks like the xserver-xf86-config for the raspberry-pi fails on <br>
    <br>
    <b>SRC_URI_append_raspberrypi = <a class="moz-txt-link-rfc2396E" href="file://xorg.conf.d/*">" file://xorg.conf.d/*"</a></b><b><br>
    </b><br>
    When I change to:<br>
    <br>
    <b>SRC_URI_append_raspberrypi = <a class="moz-txt-link-rfc2396E" href="file://xorg.conf.d/10-evdev.conf">" file://xorg.conf.d/10-evdev.conf "</a></b><br>
    <br>
    the raspberry pi version completes.<br>
    <br>
    <i>Wildcards are not allowed?</i><br>
    <br>
    <pre class="moz-signature" cols="72">-- 
Best Regards
Ulf Samuelsson
eMagii
</pre>
  </body>
</html>

--------------040604030806050408040303--
