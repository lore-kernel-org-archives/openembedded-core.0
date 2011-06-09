Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QUh0q-0002Hd-1I
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 17:19:12 +0200
Received: by wye20 with SMTP id 20so1335323wye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jun 2011 08:15:52 -0700 (PDT)
Received: by 10.216.142.165 with SMTP id i37mr880982wej.106.1307632552097;
	Thu, 09 Jun 2011 08:15:52 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id w62sm900802wec.18.2011.06.09.08.15.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Jun 2011 08:15:51 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 9 Jun 2011 17:15:49 +0200
Message-Id: <233337C7-346F-4E05-887C-776008F90E5F@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Subject: List of bbappends without matching recipes
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
X-List-Received-Date: Thu, 09 Jun 2011 15:19:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hey,

I ran bitbake layers on a stock angstrom setup and it reported a lot of =
'broken' bbappends:

meta-intel:
  =
/OE/tentacle/sources/meta-intel/meta-sugarbay/../common/recipes-core/initr=
dscripts/initramfs-live-install_1.0.bbappend
  =
/OE/tentacle/sources/meta-intel/meta-crownbay/../common/recipes-core/initr=
dscripts/initramfs-live-install_1.0.bbappend
  =
/OE/tentacle/sources/meta-intel/meta-jasperforest/../common/recipes-core/i=
nitrdscripts/initramfs-live-install_1.0.bbappend
  =
/OE/tentacle/sources/meta-intel/meta-sugarbay/recipes-kernel/linux/linux-y=
octo_git.bbappend
  =
/OE/tentacle/sources/meta-intel/meta-crownbay/recipes-kernel/linux/linux-y=
octo_git.bbappend
  =
/OE/tentacle/sources/meta-intel/meta-emenlow/recipes-kernel/linux/linux-yo=
cto_git.bbappend
  =
/OE/tentacle/sources/meta-intel/meta-fishriver/recipes-kernel/linux/linux-=
yocto_git.bbappend
  =
/OE/tentacle/sources/meta-intel/meta-jasperforest/recipes-kernel/linux/lin=
ux-yocto_git.bbappend
  =
/OE/tentacle/sources/meta-intel/meta-n450/recipes-kernel/linux/linux-yocto=
_git.bbappend
  =
/OE/tentacle/sources/meta-intel/meta-crownbay/recipes-kernel/linux/linux-y=
octo-stable_git.bbappend
  =
/OE/tentacle/sources/meta-intel/meta-emenlow/recipes-kernel/linux/linux-yo=
cto-stable_git.bbappend
  =
/OE/tentacle/sources/meta-intel/meta-fishriver/recipes-kernel/linux/linux-=
yocto-stable_git.bbappend
  =
/OE/tentacle/sources/meta-intel/meta-jasperforest/recipes-kernel/linux/lin=
ux-yocto-stable_git.bbappend
  =
/OE/tentacle/sources/meta-intel/meta-n450/recipes-kernel/linux/linux-yocto=
-stable_git.bbappend
  =
/OE/tentacle/sources/meta-intel/meta-emenlow/recipes-gnome/tasks/task-poky=
-standalone-gmae-sdk-target.bbappend
  =
/OE/tentacle/sources/meta-intel/meta-jasperforest/recipes-graphics/xorg-xs=
erver/xserver-xf86-dri-lite_1.9.3.bbappend
  =
/OE/tentacle/sources/meta-intel/meta-emenlow/recipes-gnome/tasks/task-poky=
-sdk-gmae.bbappend

meta-smartphone:
  =
/OE/tentacle/sources/meta-smartphone/meta-nokia/recipes-bsp/udev/udev_168.=
bbappend

meta-nslu2:
  =
/OE/tentacle/sources/meta-nslu2/recipes-core/images/slugos-image.bbappend

regards,

Koen=


