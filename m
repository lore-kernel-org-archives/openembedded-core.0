Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RkzNi-0001KZ-V5 for openembedded-core@lists.openembedded.org;
	Wed, 11 Jan 2012 15:42:27 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0BEYwGx025060
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2012 14:34:58 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24642-05 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2012 14:34:52 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0BEYolJ025053
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2012 14:34:51 GMT
Message-ID: <1326292491.23315.56.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Jan 2012 14:34:51 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] multilib.conf: Clean up file and add missing entries for various dependencies
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
X-List-Received-Date: Wed, 11 Jan 2012 14:42:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This patch adds in various missing dependencies to ensure the set
of recipes listed for multilib support can be cleanly built.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 87a3d86..9554519 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -20,6 +20,7 @@ BBCLASSEXTEND_append_pn-at = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-attr = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-augeas = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-avahi = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-avahi-ui = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-base-files = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-base-passwd = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-bash = " ${MULTILIBS}"
@@ -45,9 +46,11 @@ BBCLASSEXTEND_append_pn-clutter-1.8 = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-clutter-gst-1.8 = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-clutter-gtk-1.8 = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-clutter-box2d = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-cogl = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-compositeproto = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-connman-gnome = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-connman = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-consolekit = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-contacts = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-core-image-lsb = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-core-image-minimal = " ${MULTILIBS}"
@@ -154,6 +157,7 @@ BBCLASSEXTEND_append_pn-latencytop = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-leafpad = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-less = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-libaio = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-libatomics-ops = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-libcap = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-libcheck = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-libcroco = " ${MULTILIBS}"
@@ -175,6 +179,7 @@ BBCLASSEXTEND_append_pn-libgpg-error = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-libical = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-libice = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-libid3tag = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-libjson = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-libmatchbox = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-libmusicbrainz = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-libnewt = " ${MULTILIBS}"
@@ -187,12 +192,16 @@ BBCLASSEXTEND_append_pn-libowl-av = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-libowl = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-libpam = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-libpciaccess = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-libpcap = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-libpcre = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-libpng = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-libproxy = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-libpthread-stubs = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-librsvg = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-libsamplerate0 = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-libsdl = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-libsm = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-libsndfile1 = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-libsoup-2.4 = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-libtasn1 = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-libtheora = " ${MULTILIBS}"
@@ -250,6 +259,7 @@ BBCLASSEXTEND_append_pn-lrzsz = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-lsb = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-lsbsetup = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-lsof = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-ltp = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-lttng-control = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-lttng-ust = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-lttng-viewer = " ${MULTILIBS}"
@@ -292,6 +302,7 @@ BBCLASSEXTEND_append_pn-neon = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-netbase = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-net-tools = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-nfs-utils = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-ocf-linux = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-ofono = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-oh-puzzles = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-openssh = " ${MULTILIBS}"
@@ -317,16 +328,23 @@ BBCLASSEXTEND_append_pn-perl = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-pixman = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-poky-feed-config-opkg = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-pointercal = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-polkit = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-popt = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-portmap = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-powertop = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-ppp = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-printproto = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-procps = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-psmisc = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-psplash = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-pth = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-pulseaudio = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-python-dbus = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-python = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-python-pycairo = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-python-pygtk = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-python-pygobject = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-qemu-config = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-qemugl = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-qt4-x11-free = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-quota = " ${MULTILIBS}"
@@ -335,16 +353,15 @@ BBCLASSEXTEND_append_pn-readline = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-recordproto = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-renderproto = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-resourceproto = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-rgb = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-rpcbind = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-rpm = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-rsync = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-run-postinsts = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-sato-icon-theme = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-sato-screenshot = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-sat-solver = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-screen = " ${MULTILIBS}"
-BBCLASSEXTEND_append_pn-screenshot = " ${MULTILIBS}"
-BBCLASSEXTEND_append_pn-screenshot = " ${MULTILIBS}"
-BBCLASSEXTEND_append_pn-scrnsaverproto = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-scrnsaverproto = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-sed = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-setserial = " ${MULTILIBS}"
@@ -362,7 +379,6 @@ BBCLASSEXTEND_append_pn-sudo = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-sysfsutils = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-sysklogd = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-sysprof = " ${MULTILIBS}"
-BBCLASSEXTEND_append_pn-sysprof = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-sysstat = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-systemtap = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-sysvinit-inittab = " ${MULTILIBS}"
@@ -384,7 +400,6 @@ BBCLASSEXTEND_append_pn-tasks = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-tcf-agent = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-tcl = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-tcp-wrappers = " ${MULTILIBS}"
-BBCLASSEXTEND_append_pn-tcp-wrappers = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-tiff = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-time = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-tinylogin = " ${MULTILIBS}"
@@ -392,12 +407,12 @@ BBCLASSEXTEND_append_pn-trace-cmd = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-trapproto = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-tremor = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-tslib = " ${MULTILIBS}"
-BBCLASSEXTEND_append_pn-tslib = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-tzdata = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-udev-extraconf = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-udev = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-unzip = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-update-modules = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-update-rc.d = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-usbutils = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-util-linux = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-util-macros = " ${MULTILIBS}"
@@ -408,7 +423,6 @@ BBCLASSEXTEND_append_pn-vte = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-watchdog = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-which = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-wireless-tools = " ${MULTILIBS}"
-BBCLASSEXTEND_append_pn-wireless-tools = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-wpa-supplicant = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-x11-common = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-x11perf = " ${MULTILIBS}"
@@ -455,11 +469,4 @@ BBCLASSEXTEND_append_pn-xwininfo = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-zip = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-zlib = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-zypper = " ${MULTILIBS}"
-BBCLASSEXTEND_append_pn-libsdl = " ${MULTILIBS}"
-BBCLASSEXTEND_append_pn-qemu-config = " ${MULTILIBS}"
-BBCLASSEXTEND_append_pn-x11-common = " ${MULTILIBS}"
-BBCLASSEXTEND_append_pn-update-rc.d = " ${MULTILIBS}"
-BBCLASSEXTEND_append_pn-avahi-ui = " ${MULTILIBS}"
-BBCLASSEXTEND_append_pn-python-pycairo = " ${MULTILIBS}"
-BBCLASSEXTEND_append_pn-python-pygtk = " ${MULTILIBS}"
-BBCLASSEXTEND_append_pn-python-pygobject = " ${MULTILIBS}"
+




