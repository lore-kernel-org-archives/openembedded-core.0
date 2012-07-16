Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SqpHI-00035u-VC
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 19:40:14 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jul 2012 10:28:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; 
	d="eml'208?log'208?png'208,150?scan'208,150,208,150";a="178103357"
Received: from unknown (HELO [10.255.12.178]) ([10.255.12.178])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jul 2012 10:28:52 -0700
Message-ID: <50044F54.1050709@linux.intel.com>
Date: Mon, 16 Jul 2012 10:28:52 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Yocto Project Discussion <yocto@yoctoproject.org>, 
	'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
References: <20120715022506.GA28265@ab01.i.yoctoproject.org>
	<20120715022506.GA28259@ab01.i.yoctoproject.org>
In-Reply-To: <20120715022506.GA28259@ab01.i.yoctoproject.org>
X-Forwarded-Message-Id: <20120715022506.GA28265@ab01.i.yoctoproject.org>
	<20120715022506.GA28259@ab01.i.yoctoproject.org>
Subject: Package Updating for Milestone 3
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
X-List-Received-Date: Mon, 16 Jul 2012 17:40:14 -0000
X-Groupsio-MsgNum: 25436
Content-Type: multipart/mixed; boundary="------------070707050909000000060003"

--------------070707050909000000060003
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


OE-Core / Yocto Project Recipe Maintainers:

Please find attached the set lists from the Package reporting system 
sent out over the weekend.  This list will be what should be worked 
against for our target in Milestone 3.

Please remember to review the Manual Check List before the end of the 
Milestone so we can have it updated with current version information. 
There is effort to more fully automate this process and I will inform 
the team as we get that working.

As for the Recipe Upgrading, we have about 83 packages, 77 listed in 
Upgrade list and another 6 from the Manual list that need upgrading, our 
target has been 70% and we are meeting that most, so I would like to 
challenge the team to work on getting 80% of the packages upgraded. That 
would mean we need to update 66 or more recipes.

Please update the RECIPE_NO_UPGRADE_REASON in the upstream-tracking.inc 
file, if the recipe can not or should not be updated for some reason. 
Also be sure to verify the upstream versioning scheme to ensure we are 
updating to a released version and not a development version.

Thanks for your efforts.

Sau!



--------------070707050909000000060003
Content-Type: message/rfc822;
 name="[Package Report System]Manual check recipes name list.eml"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="[Package Report System]Manual check recipes name list.eml"

Return-Path: <swold@autobuilder.yoctoproject.org>
X-Original-To: sgw@linux.intel.com
Delivered-To: sgw@linux.intel.com
Received: from orsmga002.jf.intel.com (orsmga002.jf.intel.com [10.7.209.21])
	by linux.intel.com (Postfix) with ESMTP id 3A2B12C8001
	for <sgw@linux.intel.com>; Sat, 14 Jul 2012 19:25:11 -0700 (PDT)
Received: from orsmga101.jf.intel.com ([10.7.208.22])
  by orsmga002-1.jf.intel.com with ESMTP; 14 Jul 2012 19:25:07 -0700
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AgoKAFkpAlCM06l2/2dsb2JhbABFtwADgSaBB4JhZycmGESIDQuZPqA1hjWFJQJAhEZgA5U6AYEShGaKDoJfgVcI
X-IronPort-AV: E=Sophos;i="4.77,587,1336374000"; 
   d="scan'208";a="474022220"
Received: from unknown (HELO autobuilder.yoctoproject.org) ([140.211.169.118])
  by mtab.intel.com with ESMTP; 14 Jul 2012 19:25:07 -0700
Received: by autobuilder.yoctoproject.org (Postfix, from userid 1008)
	id B94FB40CCC; Sun, 15 Jul 2012 02:25:06 +0000 (UTC)
Date: Sun, 15 Jul 2012 02:25:06 +0000
From: Yocto Project Package Report System <yocto.package.reporting@intel.com>
To: sgw@linux.intel.com
Subject: [Package Report System]Manual check recipes name list
Message-ID: <20120715022506.GA28265@ab01.i.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.20 (2009-12-10)

This mail was sent out by Package Report System.
It will list all the recipes which can't check upstream version by script, and will show how long it is since their last mannual version check.
You can check the detail information at http://packages.yoctoproject.org/manuallychkinfo


PackageName              Version             LastChkVersion      LastChkTime              Maintainer                              NoUpgradeReason               
lsb                      1.4                 1.4                 88 days                  Yi Zhao <yi.zhao@windriver.co...        1.4 is fixed version of LSB Te...
mingetty                 1.08                1.08                185 day                  Xiaofeng.Yan <xiaofeng@windri...        No data                       
libfm                    0.1.17              0.1.17              9 days,                  Valentin Popa <valentin.popa@...        No data                       
puzzles                  r9561               r9561               9 days,                  Valentin Popa <valentin.popa@...        No data                       
pcmanfm                  0.9.10              0.9.10              9 days,                  Valentin Popa <valentin.popa@...        No data                       
menu-cache               0.3.3               0.3.3               41103 d                  Valentin Popa <valentin.popa@...        No data                       
freetype                 2.4.9               2.4.10              9 days,                  Valentin Popa <valentin.popa@...        No data                       
libpng                   1.2.49              1.5.11              10 days                  Scott Garman <scott.a.garman@...        1.4.3 and later changes the AP...
opensp                   1.5.2               1.5.2               10 days                  Scott Garman <scott.a.garman@...        No data                       
e2fsprogs                1.42.1              1.42.4              10 days                  Scott Garman <scott.a.garman@...        No data                       
chrpath                  0.14                0.14                10 days                  Scott Garman <scott.a.garman@...        No data                       
expat                    2.1.0               2.0.1               10 days                  Scott Garman <scott.a.garman@...        No data                       
nfs-utils                1.2.3               1.2.6               10 days                  Scott Garman <scott.a.garman@...        No data                       
sqlite3                  3.7.13              3.7.13              10 days                  Saul Wold <sgw@linux.intel.co...        No data                       
libcap                   2.22                2.22                10 days                  Saul Wold <sgw@linux.intel.co...        No data                       
libexif                  0.6.20              0.6.20              10 days                  Saul Wold <sgw@linux.intel.co...        No data                       
libcheck                 0.9.8               0.9.8               10 days                  Saul Wold <sgw@linux.intel.co...        No data                       
boost                    1.49.0              1.50.0              10 days                  Saul Wold <sgw@linux.intel.co...        No data                       
libmad                   0.15.1b             0.15.1b             10 days                  Saul Wold <sgw@linux.intel.co...        No data                       
glew                     1.7.0               1.7.0               10 days                  Saul Wold <sgw@linux.intel.co...        No data                       
sysstat                  10.0.5              10.0.5              10 days                  Saul Wold <sgw@linux.intel.co...        No data                       
psmisc                   22.19               22.19               10 days                  Saul Wold <sgw@linux.intel.co...        No data                       
less                     444                 444                 10 days                  Saul Wold <sgw@linux.intel.co...        No data                       
cracklib                 2.8.19              2.8.19              10 days                  Saul Wold <sgw@linux.intel.co...        No data                       
sysfsutils               2.1.0               2.1.0               10 days                  Saul Wold <sgw@linux.intel.co...        No data                       
console-tools            0.3.2               0.3.2               10 days                  Saul Wold <sgw@linux.intel.co...        No data                       
beecrypt                 4.2.1               4.2.1               9 days,                  Radu Moisan <radu.moisan@inte...        No data                       
lame                     3.99.5              3.99.5              9 days,                  Radu Moisan <radu.moisan@inte...        No data                       
tslib                    1.0                 1.0                 9 days,                  Radu Moisan <radu.moisan@inte...        No data                       
watchdog                 5.11                5.12                9 days,                  Radu Moisan <radu.moisan@inte...        No data                       
tzdata                   2012c               2012c               9 days,                  Radu Moisan <radu.moisan@inte...        No data                       
zip                      3.0                 3.0                 9 days,                  Radu Moisan <radu.moisan@inte...        No data                       
hdparm                   9.39                9.39                9 days,                  Radu Moisan <radu.moisan@inte...        No data                       
unzip                    6.0                 6.0                 9 days,                  Radu Moisan <radu.moisan@inte...        No data                       
squashfs-tools           4.2                 4.2                 9 days,                  Radu Moisan <radu.moisan@inte...        No data                       
setserial                2.17                2.17                81 days                  Radu Moisan <radu.moisan@inte...        No data                       
acpid                    1.0.10              1.0.10              9 days,                  Radu Moisan <radu.moisan@inte...        No data                       
ltp                      20120401            20120401            124 day                  Mihai Lindner <mihaix.lindner...        No data                       
prelink                  1.0+git1+7b47...    1.0+git1+9552...    184 day                  Mark Hatle <mark.hatle@windri...        No data                       
x11vnc                   0.9.13              0.9.13              9 days,                  Laurentiu Palcu <laurentiu.pa...        No data                       
libical                  0.48                0.48                9 days,                  Cristian Iorga <cristian.iorg...        No data                       
libsamplerate0           0.1.8               0.1.8               9 days,                  Cristian Iorga <cristian.iorg...        No data                       
libomxil                 0.9.3               0.9.3               9 days,                  Cristian Iorga <cristian.iorg...        No data                       
flac                     1.2.1               1.2.1               9 days,                  Cristian Iorga <cristian.iorg...        No data                       
rpcbind                  0.2.0               0.2.0               9 days,                  Cristian Iorga <cristian.iorg...        No data                       
quota                    4.00                4.00                9 days,                  Cristian Iorga <cristian.iorg...        No data                       
libtirpc                 0.2.2               0.2.2               9 days,                  Cristian Iorga <cristian.iorg...        No data                       
minicom                  2.6.1               2.6.1               9 days,                  Cristian Iorga <cristian.iorg...        No data                       
cwautomacros             20110201            20110201            9 days,                  Cristian Iorga <cristian.iorg...        No data                       
eggdbus                  0.6                 0.6                 9 days,                  Cristian Iorga <cristian.iorg...        No data                       
wireless-tools           29                  29                  9 days,                  Cristian Iorga <cristian.iorg...        No data                       
irda-utils               0.9.18              0.9.18              9 days,                  Cristian Iorga <cristian.iorg...        No data                       
mpfr                     3.1.0               3.1.1               9 days,                  Bogdan Marinescu <bogdan.a.ma...        No data                       
libpcre                  8.30                8.30                9 days,                  Bogdan Marinescu <bogdan.a.ma...        No data                       
oprofile                 0.9.7               0.9.7               9 days,                  Bogdan Marinescu <bogdan.a.ma...        No data                       
tcl                      8.5.11              8.5.11              9 days,                  Bogdan Marinescu <bogdan.a.ma...        No data                       
strace                   4.7                 4.7                 9 days,                  Bogdan Marinescu <bogdan.a.ma...        No data                       
python-scons             2.1.0               N/A                 41103 d                  Bogdan Marinescu <bogdan.a.ma...        No data                       
flex                     2.5.35              2.5.35              9 days,                  Bogdan Marinescu <bogdan.a.ma...        No data                       
Manual Check Count: 59
Manual Need Check Count: 7
Any problem, please contact Mei Lei <lei.mei@intel.com> 

--------------070707050909000000060003
Content-Type: message/rfc822;
 name="[Package Report System]Upgrade recipes name list.eml"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="[Package Report System]Upgrade recipes name list.eml"

Return-Path: <swold@autobuilder.yoctoproject.org>
X-Original-To: sgw@linux.intel.com
Delivered-To: sgw@linux.intel.com
Received: from AZSMGA002.ch.intel.com (azsmga002.ch.intel.com [10.2.17.35])
	by linux.intel.com (Postfix) with ESMTP id 57CBF2C8001
	for <sgw@linux.intel.com>; Sat, 14 Jul 2012 19:25:12 -0700 (PDT)
Received: from azsmga101.ch.intel.com ([10.2.16.36])
  by AZSMGA002-1.ch.intel.com with ESMTP; 14 Jul 2012 19:25:08 -0700
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Ag0KAFkpAlCM06l2/2dsb2JhbABFtwADDYEZgQeCLAGBGwcJAQEVFBIDARREiA0LmT6gNYtAGg01hEZgA45NgSEBhUsBgRKEZooOgl+BWAc
X-IronPort-AV: E=Sophos;i="4.77,587,1336374000"; 
   d="log'?png'150?scan'150,208,150";a="828379979"
Received: from unknown (HELO autobuilder.yoctoproject.org) ([140.211.169.118])
  by mtab.intel.com with ESMTP; 14 Jul 2012 19:25:07 -0700
Received: by autobuilder.yoctoproject.org (Postfix, from userid 1008)
	id B038F40B27; Sun, 15 Jul 2012 02:25:06 +0000 (UTC)
Date: Sun, 15 Jul 2012 02:25:06 +0000
From: Yocto Project Package Report System <yocto.package.reporting@intel.com>
To: sgw@linux.intel.com
Subject: [Package Report System]Upgrade recipes name list
Message-ID: <20120715022506.GA28259@ab01.i.yoctoproject.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline
User-Agent: Mutt/1.5.20 (2009-12-10)


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This mail was sent out by Package Report System.
This message list those recipes which need to be upgraded. If maintainers believe some of them needn't to upgrade this time, they can fill in RECIPE_NO_UPDATE_REASON_pn-"xxx" in upstream_tracking files to ignore this recipe remainder until newer upstream version was detected.
Example:
RECIPE_NO_UPDATE_REASON_pn-"xxx" = "Not upgrade to 2.0 because the new version is unstable"
You can check the detail information at http://packages.yoctoproject.org/upgradepkgname


PackageName                   Version                       UpVersion                     Maintainer                                        NoUpgradeReason               
qmmp                          0.5.2                         0.6.0                         Xiaofeng Yan <xiaofeng.yan@windriver.com>         
xserver-xorg-lite             1.11.2                        1.12.99.901                   Xiaofeng Yan <xiaofeng.yan@windriver.com>         
xserver-kdrive                1.7.99.2                      1.12.99.901                   Xiaofeng Yan <xiaofeng.yan@windriver.com>         
matchbox-panel-2              0.0+git1+cdf7a22716b8746      2.0                           Valentin Popa <valentin.popa@intel.com>           
evolution-data-server         2.30+git1+3ca578d968d097      6.0                           Valentin Popa <valentin.popa@intel.com>           
randrproto                    1.3.2                         1.4.0                         Valentin Popa <valentin.popa@intel.com>           
glproto                       1.4.15                        1.4.16                        Valentin Popa <valentin.popa@intel.com>           
dri2proto                     2.6                           2.8                           Valentin Popa <valentin.popa@intel.com>           
lttng-viewer                  0.12.38                       0.12.38.21032011              Valentin Popa <valentin.popa@intel.com>           
liberation-fonts              1.04                          1.07.2                        Valentin Popa <valentin.popa@intel.com>           
xdg-utils                     1.0.2                         1.1.0                         Valentin Popa <valentin.popa@intel.com>           
qemu                          0.15.1                        1.1.1                         Valentin Popa <valentin.popa@intel.com>           
pciutils                      3.1.9                         3.1.10                        Valentin Popa <valentin.popa@intel.com>           
shadow                        4.1.4.3                       4.1.5.1                       Scott Garman <scott.a.garman@intel.com>           
blktool                       4-6                           4                             Scott Garman <scott.a.garman@intel.com>           
dbus-glib                     0.98                          0.100                         Scott Garman <scott.a.garman@intel.com>           
libnfsidmap                   0.24                          0.25                          Scott Garman <scott.a.garman@intel.com>           
apmd                          3.2.2-14                      3.2.2                         Scott Garman <scott.a.garman@intel.com>           
libnl                         2.0                           3.2.11                        Saul Wold <sgw@linux.intel.com>                   libnl-3.2.2 is incompatible w...
createrepo                    0.4.11                        0.9.9                         Saul Wold <sgw@linux.intel.com>                   Versions after 0.9.* use YUM,...
foomatic-filters              4.0.16                        4.0.17                        Saul Wold <sgw@linux.intel.com>                   
pkgconfig                     0.25                          0.27                          Saul Wold <sgw@linux.intel.com>                   0.26 removes glib-conf, adds ...
dpkg                          1.15.8.7                      1.16.4.3                      Saul Wold <sgw@linux.intel.com>                   
apt                           0.7.14                        0.9.7.2                       Saul Wold <sgw@linux.intel.com>                   
build-appliance-image         1.0                           3.2.1                         Saul Wold <sgw@linux.intel.com>                   
dhcp                          4.2.3-P2                      4.2.3                         Saul Wold <sgw@linux.intel.com>                   ftp://ftp.isc.org/isc/dhcp/4.2.3-P2/dhcp-4.2.3-P2.tar.gz
liburcu                       0.6.7                         0.7.3                         Radu Moisan <radu.moisan@intel.com>               
js                            1.7.0+1.8.0rc1                1.60                          Radu Moisan <radu.moisan@intel.com>               
babeltrace                    0.8+git1+efc507756840300      1.0.0                         Radu Moisan <radu.moisan@intel.com>               
kmod                          8                             74.207.229.112                Radu Moisan <radu.moisan@intel.com>               
udev                          164                           182                           Radu Moisan <radu.moisan@intel.com>               
busybox                       1.19.4                        1.20.2                        Radu Moisan <radu.moisan@intel.com>               
mobile-broadband-provider-info1.0.0+gitr1+d9995ef693cb      20090309                      Radu Moisan <radu.moisan@intel.com>               
usbutils                      0.91                          006                           Radu Moisan <radu.moisan@intel.com>               
grub                          1.99                          2.00                          Radu Moisan <radu.moisan@intel.com>               ftp://ftp.gnu.org/gnu/grub/grub-1.99.tar.gz
u-boot-mkimage                2011.06                       2012.07                       Radu Moisan <radu.moisan@intel.com>               
kconfig-frontends             3.4.0                         3.4.0.0                       No Maintainer information                         
mkelfimage                    1.0.0+gitr1+e13632a939e7      4.0                           No Maintainer information                         
base-passwd                   3.5.24                        3.5.26                        No Maintainer information                         
zypper                        1.5.3-git1+2c5bb6ceb99ec      11.0                          Mark Hatle <mark.hatle@windriver.com>             
libzypp                       0.0-git1+15b6c52260bbc52      11.0                          Mark Hatle <mark.hatle@windriver.com>             
rpm                           5.4.9                         5.4.9.0.20120508              Mark Hatle <mark.hatle@windriver.com>             
xserver-xorg                  1.11.2                        1.12.99.901                   Laurentiu Palcu <laurentiu.palcu@intel.com>       
xkeyboard-config              2.1                           2.5.99                        Laurentiu Palcu <laurentiu.palcu@intel.com>       
xf86-video-fbdev              0.4.2                         0.4.3                         Laurentiu Palcu <laurentiu.palcu@intel.com>       
fontconfig                    2.9.0                         2.9.92                        Laurentiu Palcu <laurentiu.palcu@intel.com>       
libdrm                        2.4.35                        2.4.37                        Laurentiu Palcu <laurentiu.palcu@intel.com>       
xz                            5.1.1alpha                    5.1.2alpha                    Laurentiu Palcu <laurentiu.palcu@intel.com>       
liburi-perl                   1.59                          1.60                          Kai Kang <kai.kang@windriver.com>                 
syslinux                      4.03                          4.05                          Darren Hart <dvhart@linux.intel.com>              Waiting for 4.06 for 3.3 kern...
tremor                        20120314                      18153                         Cristian Iorga <cristian.iorga@intel.com>         
pulseaudio                    1.1                           2.0                           Cristian Iorga <cristian.iorga@intel.com>         
libmusicbrainz                3.0.3                         4.0.0                         Cristian Iorga <cristian.iorga@intel.com>         
gst-plugins-ugly              0.10.19                       0.11.90                       Cristian Iorga <cristian.iorga@intel.com>         
gst-plugins-good              0.10.31                       0.11.90                       Cristian Iorga <cristian.iorga@intel.com>         
gst-plugins-base              0.10.36                       0.11.90                       Cristian Iorga <cristian.iorga@intel.com>         
gstreamer                     0.10.36                       0.11.90                       Cristian Iorga <cristian.iorga@intel.com>         upgrading to 0.11.1 causes gs...
gst-plugins-bad               0.10.23                       0.11.90                       Cristian Iorga <cristian.iorga@intel.com>         
gst-ffmpeg                    0.10.13                       0.11.2                        Cristian Iorga <cristian.iorga@intel.com>         
gst-fluendo-mp3               0.10.16                       0.10.19                       Cristian Iorga <cristian.iorga@intel.com>         
gst-fluendo-mpegdemux         0.10.70                       0.10.71                       Cristian Iorga <cristian.iorga@intel.com>         
net-tools                     1.60-23                       1.60                          Cristian Iorga <cristian.iorga@intel.com>         
iptables                      1.4.13                        1.4.14                        Cristian Iorga <cristian.iorga@intel.com>         
dbus                          1.4.20                        1.6.2                         Cristian Iorga <cristian.iorga@intel.com>         
telepathy-mission-control     5.12.0                        5.12.1                        Cristian Iorga <cristian.iorga@intel.com>         
telepathy-glib                0.19.2                        0.19.3                        Cristian Iorga <cristian.iorga@intel.com>         
wpa-supplicant                0.7.3                         1.0                           Cristian Iorga <cristian.iorga@intel.com>         
iproute2                      3.2.0                         3.4.0                         Cristian Iorga <cristian.iorga@intel.com>         
libpcap                       1.2.1                         1.3.0                         Cristian Iorga <cristian.iorga@intel.com>         
connman                       1.0                           1.3                           Cristian Iorga <cristian.iorga@intel.com>         
gmp                           5.0.4                         5.0.5                         Bogdan Marinescu <bogdan.a.marinescu@intel.com>   
lttng2-ust                    2.0.2+git1+a367ee66aad3f      2.0.4                         Bogdan Marinescu <bogdan.a.marinescu@intel.com>   
linux-libc-headers-yocto      3.4+git-1+a1cdb60720c452      3.4.4                         Bogdan Marinescu <bogdan.a.marinescu@intel.com>   
linux-libc-headers            3.4                           3.4.4                         Bogdan Marinescu <bogdan.a.marinescu@intel.com>   
lttng-control                 0.89                          0.89.05122011                 Bogdan Marinescu <bogdan.a.marinescu@intel.com>   
libconvert-asn1-perl          0.22                          0.26                          Bogdan Marinescu <bogdan.a.marinescu@intel.com>   
byacc                         20120115                      20120526                      Bogdan Marinescu <bogdan.a.marinescu@intel.com>   
tcf-agent                     0.4.0+git1+4ef94ecb927a8      8.0                           Bogdan Marinescu <bogdan.a.marinescu@intel.com>   
subversion                    1.7.2                         1.7.5                         Bogdan Marinescu <bogdan.a.marinescu@intel.com>   
python-dbus                   1.0.0                         1.1.1                         Bogdan Marinescu <bogdan.a.marinescu@intel.com>   
guile                         2.0.5                         2.0.6                         Bogdan Marinescu <bogdan.a.marinescu@intel.com>   
bison                         2.5                           2.5.1                         Bogdan Marinescu <bogdan.a.marinescu@intel.com>   
automake                      1.11.3                        1.12.2                        Bogdan Marinescu <bogdan.a.marinescu@intel.com>   
autoconf                      2.68                          2.69                          Bogdan Marinescu <bogdan.a.marinescu@intel.com>   seeing rpm issue with the 2.6...
eglibc                        2.15                          19352                         Bogdan Marinescu <bogdan.a.marinescu@intel.com>   
Upgradable Count: 77
Upgrade Total Count: 85
The based commit merge time is:
Thu Jul 12 12:52:09 2012 +0100
The based commit is:
commit eb0cb7e8234f5d2e5623406e9660be91cf52f65e
Author: Tom Zanussi <tom.zanussi@intel.com>
Date:   Thu Jul 12 07:17:11 2012 +0000
Any problem, please contact Mei Lei <lei.mei@intel.com> 

--bp/iNruPH9dso1Pn
Content-Type: image/png
Content-Disposition: attachment; filename="weekly_upgrde_history_chart.png"
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAyAAAAJYCAYAAACadoJwAAAABHNCSVQICAgIfAhkiAAAAAlw
SFlzAAAPYQAAD2EBqD+naQAAIABJREFUeJzs3X18j/X////78do5jZ0w4U3I5qTmbPK2xDYm
kpWGakVtvTtB48tbhWKMwrt4R2+da4rFO0QnqpWTzUnlnKZ3NGQWOYk5mZPR7Pj90Wevn1fb
ZLLjZXvdrpfL65I9n8/jOB7H67XqdXc8n8dhmKZpCgAAAAAsYHN2AQAAAABcBwEEAAAAgGUI
IAAAAAAsQwABAAAAYBkCCAAAAADLEEAAAAAAWIYAAgAAAMAyBBAAAAAAliGAAAAAALAMAQQA
AACAZQggAAAAACxDAAEAAABgGQIIAAAAAMsQQAAAAABYhgACQJGRkbLZLu8/B9nZ2bLZbEpI
SCjnqiBJGRkZstlsSk5OdnYpAABcFQQQ4CrbtGmTbDab2rdvX2L/vHnzZLPZZLPZtG/fvmL9
p0+flqenp3x9fXXhwoXyLtfOMIxyHX+5xo0b96dfuN99912XC0Hl9X5LUoMGDey/kzabTW5u
bvLz81N4eLimT5+ugoKCcju2lQhzAHBtcHd2AUBl06ZNG/n7+2vz5s3Ky8uTr6+vQ//y5cvt
XyZXrFihhx56yKF/9erVKigoUNeuXeXm5mZZ3deay/nCXZ5fyl3R0KFD5efnJ9M0tX//fn34
4YcaNmyYli1bpk8//dTZ5V01/N4AgHNxBQS4ygzDUGRkpAoKCrRy5cpi/StWrFCXLl1UvXp1
rVixosR+SerSpUu51woUMQxDQ4cOVVJSksaOHau33npLW7ZsUbVq1fTZZ5+V+LtcUZmm6ewS
AMClEUCAclAUHv4YMLKzs5Wdna2uXbuqU6dOlx1ACgoK9Nprr6l9+/aqVq2aqlatqjZt2ujV
V18t9cvUunXr1KdPH11//fXy8vJS/fr1NWDAAB04cOCyz2PFihWqXr266tatq8zMzFLHxcXF
yWazadWqVSX2L1y4UDabTUOGDLnsY1+JorUs+fn5GjVqlBo2bChvb281btxY48eP12+//Vbi
du+//77atGmjKlWqqFatWurfv79ycnJKXBtz8TSe1atXq3v37vL395fNZlNOTo4kadmyZXro
oYcUHBwsHx8fValSRTfffLPGjRun/Pz8Ems4dOiQ/vGPf6hWrVqqUqWKWrdurXfeeeeS55ub
m6tRo0apWbNmqlKlivz8/BQdHa2lS5dewbtXXP369dW5c2dJ0saNG4v179ixQ/Hx8apXr568
vLx0/fXX68EHH1RWVlaxsfHx8bLZbPrpp5/04osvqmnTpvLx8VG9evX0z3/+U3l5eSXWsHHj
RsXGxiooKEje3t5q0KCBBg0aVOLv8cXHeOmllxQaGqoqVaooKipKCQkJ9nNJTk52mHJW2u8t
AKB8MAULKAdFX3T+GDCWL18uSYqKipKnp6c++eQT7dy5U8HBwZKkY8eOacuWLapRo4Zatmwp
Sfrtt98UExOjr776Si1bttRjjz0mT09PLV++XIMHD9batWs1Z84ch+OkpKTo8ccfV/Xq1dWr
Vy/VqVNHu3fv1rvvvqtPP/1Ua9euVb169S55Du+//74eeeQRNW7cWGlpaZccP2jQIH3wwQd6
66231KlTp2L9b775pgzD0IABA/7knbs6YmNj9d1336lv377y8PDQRx99pHHjxmnjxo365JNP
HMa++OKLGjlypAICAhQfH6/q1avrq6++UseOHeXn51fqdJ1Vq1Zp0qRJuv3225WYmKgDBw7I
09NTkjR16lRlZ2crIiJCtWvX1rlz57Rq1SqNHz9e6enpWrFihcP0uiNHjujWW2/Vnj171LFj
R91222365ZdfNHjwYEVGRpZ4/L179yoyMlI5OTnq2rWrYmNjderUKX388cfq3r273nzzTT36
6KN/+b0sCrh/fB/S0tIUGxsrNzc33XXXXWrUqJF++eUXLViwQJ999pnS09PVunXrYvtLTEzU
2rVrdd9998nPz09paWmaNm2aVq9erTVr1sjLy8s+9uOPP1bfvn3l5uamPn36qH79+tqwYYPe
eOMNffzxx1qzZo0aNmxY7BiDBg3Sxo0b1adPH919992y2WwKCwuTJL333nuKjIx0eF9vuOGG
v/w+AQDKwARQLmrXrm26ubmZv/76q73tgQceMP38/MzCwkJz69atpmEY5htvvGHvX7RokWkY
hnnvvffa28aOHWsahmE+99xzxY4xePBg0zAM86OPPrK3/fjjj6aHh4fZsmVL88iRIw7jv/nm
G9PLy8vs1auXQ3tERIRps9nsP0+ePNm02Wxmp06dzGPHjjmM3bNnj2kYhpmQkODQHhoaanp7
e5tHjx51aN+1a5dpGIZ52223lfpeXazofJOTk0sdM2vWrBJriIiIMA3DMJs3b24eP37c3p6f
n2927NjRNAzDnDNnjr199+7dpru7u1m7dm1z3759Dvvq16+faRiGw/timqaZnp5uGoZhGoZh
zps3r8T6fv755xLbx48fbxqGYf73v/91aH/sscdMwzDMZ555xqF948aNpre3d4nvR0REhOnh
4WF+/vnnDu2nTp0y27dvb/r4+JgHDx4ssY4/uuGGG0ybzWZmZ2c7tGdnZ5u+vr6mzWYzN23a
ZG/Pzc01/fz8zHr16pk//fSTwzZZWVlmQECA2bp1a4f2hx9+2DQMw7z++uvNnJwce3thYaF5
7733moZhmBMmTLC35+XlmQEBAaaXl5f57bffOuzrxRdfNA3DMLt27VriMRo0aGAeOnSo2HkW
fXaX+t0CAJQ/pmAB5SQ6OlqFhYVKT0+3t6Wnp6tjx44yDEMtWrRQYGCgw1WSoj8XXUEpLCzU
f/7zHzVo0EDPP/98sWO88MIL8vDw0Pvvv29ve/3111VQUKCXX35ZgYGBDuPDw8PVq1cvffrp
pzp16lSx/ZmmqcTERI0aNUqxsbFaunSp/Pz8Lut8Bw4cqHPnzum9995zaH/rrbckybKrH5I0
YcIEVa9e3f6zl5eXpk6dKun3q0NF5s6dqwsXLuipp55S3bp1Hfbx73//+5K3Jm7fvr3uv//+
Evv+9re/ldg+bNgwSXKYIvXbb7/p/fffl7+/vyZMmOAwPiwsTI888kix/Xz33XdatWqV4uLi
dMcddzj0Va1aVWPHjlV+fr4+/PDDUuv/I9M0NW3aNI0bN05jx47VY489ptatW+v06dN69tln
1aZNG/vY2bNn68SJE0pOTi52BSI4OFiPPfaYtm7dqh9++KHYcZ5++mmHq2mGYWj69Olyc3Nz
+Gw++ugjHTt2TA8//HCxO8o9/fTTCg4O1rJly+zT3i42atQoBQUFXfa5AwCsxRQsoJx07txZ
qampWrFihfr27avt27fr4MGDioqKkvT7F6+IiAhlZGTYt1mxYoUMw7Cv/8jKytKxY8dUq1Yt
jRs3rsTjeHl5aceOHfafv/32W0m/f8ktaeHwL7/8osLCQmVlZTl8qTRNU7Gxsfr44481ZMgQ
TZs2rUzn279/f40YMUJvvfWW/Yv2+fPnNWvWLAUGBqpv375l2t+VKnpf/6ht27aqUqWKtm7d
am/bsmWLJKljx47FxtesWVNNmjRxeG8vFh4eXmoNp0+f1vTp07V48WJlZWXp1KlTDmt19u/f
b//zjh07dPbsWXXq1Mk+hetiERERev311x3aij7jX3/9tcTfi9zcXPu+y2L69OnF2iZMmKDn
nnuuxONv2LBBe/fuLbZNUfDYsWOHmjdv7tBX0mdz/fXXKzg4WD/++KNOnjypatWq2T+bojD+
R507d9bOnTu1detW1a9f36HvUp8NAMD5CCBAOfnjQvSi9R8Xf6GKiIjQokWLtG3bNtWsWVPb
t29XvXr11LhxY0nS0aNHJf3+RW78+PElHscwDJ0+fdr+c9E2kydPLrW2P25TZPXq1XJ3d1dM
TMxln2eR6667Tv369dMbb7yhVatWqVOnTlq8eLGOHDmif/7znyV+uS5J0VWHwsLCUscU9ZV2
hSIgIKBYm2EY8vPz08GDB+1tJ06ckKRSr/L4+/uXWsPFV1gu9ttvv6lz587asGGDQkNDFRcX
p5o1a8rDw0OmaSo5OVnnzp0rVkNJNZfWXvQZp6WlKS0trcTtSvuMS2MYhvbs2aP69evr/Pnz
2rRpkwYPHqykpCTVr19f/fv3L3b8N95445L7K+n4lzpP0zR14sQJVatW7U/fl6Kre0XjLlba
ZwMAuDYwBQsoJ/Xq1VOjRo20a9cu7du3TytWrFBAQIB9cbn0/4eR5cuXl3j3q6IvUrGxsSos
LCzxdeHCBe3evdthG8MwdPLkyUtu88e/9TcMQxkZGfL391dMTEypX2wvZdCgQZJ+X3Re9E/D
MPT4449f9j6KzrnoS25Jjhw5Iqn04FB0BeBipmnq+PHjqlatmr2t6M/Hjx8vcT+ltV/Kxx9/
rA0bNmjQoEH67rvv9MYbb2jChAlKSkqyXxm6WNH5llRzae1F27zyyiuX/Iz/7C5apfH09FR4
eLg+++wz+fn5adCgQfrll1+KHT8zM/OSx784tFzqfIraDcOw7/ty3xfCBgBUPAQQoBxFR0fL
NE0tW7ZMGRkZxaafNG/eXDVr1tSKFStKDCDNmjWTn5+fvv3228t+GnV4eLhM07yiW4vefPPN
ysjIkJ+fn3r16lXsjlGXs/1tt92mRYsW6ZtvvrGfc0hIyGXvoyigffPNN6WOKZoC1KJFi2J9
pmk6TGsrsmHDBp05c8bhzkxFU9BKeq8OHz5c5ilMkuy3oO3Vq1exvovXAxVp1qyZfHx8tH79
eocrI0VKOpeiKUblffvYWrVqaeTIkTp9+rTDVK+/cvySzufAgQPKyspSgwYN7KGw6LMp6VbV
0u/vpWEYDtMI/0zRncdMngMCAE5FAAHKUdEVjpdfflnHjx+3r/8oUvTQwpUrV9qfkH5xAHFz
c9PgwYN14MABDR06VBcuXCh2jGPHjunHH3+0/5yYmCgPDw8NGzZMP//8c7HxhYWFWrduXak1
N2vWTKtWrVJQUJD69OmjhQsXlumcBw0apHPnztnXfJR18XmnTp3UsGFDbdmypdiCdkn2p3JX
r15d99xzT4n7GDNmjMPVi/z8fA0fPlySlJCQYG9/4IEH5O7urqlTp2rfvn32dtM0NXz48EtO
AytN7dq1JRX/4nzgwAE99dRTxca7u7urX79+OnbsmMaMGePQt3HjRoeF2UXCwsLUsWNHLVq0
SHPnzi2xjl27dtmvFP0ViYmJqlWrlt59913t2rVL0u/voZ+fn5KTk7Vt27YStysKiX/00ksv
OSwcLyws1NChQ1VYWOjw2fTq1UsBAQF67733tH79eod9TJs2TT/++KOio6NLXfBfkqJpWxev
wQEAWI81IEA5KgogRV/S/hhAitoWLFigvLw8NWvWTNdff71D/5gxY/Tdd9/ptdde0xdffKHb
b79dNWrU0IkTJ/T999/rm2++0fjx4/XMM89Ikpo0aaKUlBQ98sgjatq0qe688041btxYFy5c
0J49e7Rq1SoFBAQUu0PRxX8r3LhxY61atUqdO3dWXFyczp8/rwceeOCyzrl3794KCgrSgQMH
FBQUpNjY2Mt/w/T7uo7U1FR1795dCQkJevfdd3XLLbfIzc1NmZmZSktLk6enp2bNmiVfX98S
99G0aVPddNNN6tOnj9zd3fXxxx/rp59+Us+ePdWvXz/7uEaNGmn8+PF69tln1bJlS913332q
Vq2ali5dqiNHjig0NFT/+9//ylR/7969lZSUpMmTJ2vbtm1q2bKlDh48qA8//FDR0dEO0+WK
TJw4UcuXL9eUKVO0du1adejQQQcOHND8+fPVvXv3Eq9EzZ07V507d1a/fv30yiuv6NZbb1WV
KlV0+PBhbdy4UVu3btXatWtVo0aNy6q7tKsCPj4+GjlypIYNG6akpCTNnTtXAQEBWrhwoe65
5x6FhYWpW7duuummm2QYhn7++WetWbNGhw8f1pkzZ4rt79Zbb1WrVq3s7/WXX36pzMxMtW3b
1v47LP1+N6+UlBT17dtXnTp1Ut++fVWvXj1t2rRJS5cuVe3ate1T/S5X06ZN9be//U2pqany
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
J1oGEZefn2aV5zkK4NS4ChZkZgoEAqpSpYq6dOmia6+9VlWqVJF09Ljy+vXrKzExUZs2bYpw
aWlmJs/z1LFjRyUnJ6t3796qUqVKaPnq1at1+eWXq3nz5pFOLaWkpERVqlTRsGHD9PHHH+u5
557TnXfeKc/z9I9//ENLly5VXFycUlJSdNddd6lOnTqRTg4pKipS9erVtX79ep177rmKjY2V
dPT/RePGjfXLX/5SO3bsUJUqVVRcXBx6HEWLTZs2acOGDerevbtq1KhRanmXLl3Url27Mp/d
E02CbXXq1NHevXvVpUsX9enTR1OnTlX37t3Vt2/fqLnCXvD/v4uPc+nHbf31118rNjZWgwYN
kiQ9/vjjev7553XOOecoPj5e1113ne67776o2O6FhYVOPz8l95+jAMopouMPIiZ4/HJxcXHo
nbtj3zktKSkJLd++fbt5nhfa9R3Jd/qO7T6VN954w+rXr28NGjSw1NRUu++++ywzM9OPxBM6
Wffjjz9unufZzTffbBdffLElJSVZ37597aKLLjLP86xHjx72ySefRCI55Ke2efDx8N1331m7
du0sJSXF8vLyfOs7mZN1t2/f3po2bWpTpkyxQ4cO2Ztvvmn169e3evXqWZMmTax///62YMGC
E/6sX3Jzc0/4LnVwW48YMcK6du1qZmbZ2dnmeZ7169fPDh48aGYW2hvit5N1u/A4P1n7hAkT
LD4+3hYsWGAjR460Cy64wJ588kmbMGGCde7c2TzPs6eeeioCxUedrDsoWp+fZidvd+E5CuD0
MICcZbZs2WLDhg2zcePGhZYdP1Ac/33whNdIHspUnu7gX0TXXHNN6LCUiRMn2vDhwy0+Pt4u
ueQS3/+yOll3sGPTpk12xRVXWO3ate3ee++1rVu3hk7OnTJligUCAbvlllsiMvSVZ5sfv3zQ
oEGWnJxsX3/9tS+NJ3Ky7uDheStWrLDu3btb/fr1rVWrVuZ5nv3pT3+yt956y/72t7/ZhRde
aDVr1rScnBzf2zdt2mRDhgyxyy+/3Lp06WITJkywbdu2mdnRQ5aC2/mhhx6y/v37hwaNBx98
0DzPswceeMB+85vf2KxZs3x9rJ+qO3h7tD7Of6p94cKF5nme3XbbbXbhhRfa3LlzQ7dt27bN
Bg0aZPHx8bZ79+6o6T72UFSz6Hp+mv30No/m5yiAM4MB5Czyyiuv2HnnnWee59lll10W2iNw
sr/0g+9MjRw50ho0aGD79+/3rfVY5e0OvuBatGiRZWRklLp91KhRFhcXZzNnzoy67pdeesme
fPJJ27lzZ5n7SEtLs+bNm9uGDRt8aQ6q6GMluO3/+te/WiAQsKysrFLL/VLe7oKCAvvss88s
NTXVXnjhhVIv2GbOnGmBQMAeffRRX9vHjBlj1apVs969e9uIESPsyiuvtJiYGLvmmmtC6wS3
50033WRXX311aPmePXusevXqFhMTYxdffLFlZ2f7dpx/ebrNovNxXp72I0eO2L/927+Z53nW
tm3bMvcxZ84cCwQCvu4FKe82D4qW56dZ+duj8TkK4MxhADlLBHdh//a3v7VHHnnEPM+zhx56
KPQu5IleWAb/cmrXrp0NHTq01G27du3y5TCPn9N9rONPwHzvvffC3mxWvu7g9s3Pzy910n9J
SUnoSjt///vfrXr16r6+u3o62/yZZ54xz/Ps5Zdf9is35ETdf/7zn0/a/eyzz1qtWrVs69at
Zvbju8a7d++2mjVr2vDhw315EZ+fn2/jxo2zFi1a2LPPPlvq8Jibb77ZatasaYsXLzazH5+T
Q4YMsYceesjMzB577DGrUaOGNWzY0DzPswcffNCXE6Mr0h1cP1oe5xXd5tOnTzfP8ywuLs6+
+uorM7NQ+/bt2y02NtaeffbZqOo+kUg+P3/O4zxanqMAzjzO4jpL1K1bVykpKXr88cf16KOP
6uqrr9aLL76oFStWSNIJT6AMBALasWOHPv/8c/Xs2VOStGfPHo0dO1ZpaWmaP39+VHbb0cFa
klSlShUdPnxYr7/+uurWravk5OSwN5e3O3gSZfXq1RUbG6vi4mKVlJTI8zxVq1ZNBw8e1Pz5
85WcnKxq1ar59kFzP2ebB9u6desmz/NUUFBQanmkul966aWTdm/btk2BQED79u2TJMXExKi4
uFhLlixRIBDQ5Zdf7stJunl5eVq0aJG6d++uoUOHKj4+PrTdhgwZooMHD4bag4/rvLw8zZ49
W61bt9aECRM0atQoZWVlqVOnTnr++ef1/vvvn/C/OVLdUnQ9zsvTHhQIBNSrVy9dd911Kigo
0KRJkyQp1Pqvf/1L8fHxat26dVR0R+vzsyLtwX9Gy3MUQBhEeABCmJ3sHdC1a9dalSpV7Kab
brJvv/3WzE68O37atGkWCARs+fLlNnfuXLvwwgstPj7eJk6cGNXdwfvIy8uzadOmWcuWLe3h
hx8OW++x/84TqUi3mVleXp49//zz1rRpU3v++efD0nq8M9G+fv16a9Cggf3Hf/zHKe/zTKpo
d3D9FStWWLVq1eyWW26xzMxM27Ztm82dO9dSUlKsT58+tmPHjrC3B7fjihUrSi0PNr733nvm
eV6pd7WPHDlio0aNsnPPPdd+97vf2bp160In3C9fvtxq164d9s+++TndJxKJx/nPbd+9e7c1
adLEPM+zxx57zBYsWGCzZ8+2Fi1a2ODBg+3AgQNR2X2sSDw/zSrefuz6kX6OAggPBpCzTGFh
YeiX+z333GPVq1e3V199tcx6wXXuvvtuq1WrlnXr1i10ImYkThQtb3fQq6++aq+88or17NnT
YmJibOTIkX6lllLR7jlz5thrr71mPXv2tKpVq9ro0aP9Si2jou1mZvv27bNq1apZWlpa6IpM
fvup7mOv+jZmzBjzPM/OOecca9OmjVWvXt3uvPPOiF3pLXg4SfBQkwkTJliNGjVsy5YtoWYz
sw0bNlhmZmapF72RvBrQT3UfL5oe5+VpD962cuVKu+WWWywQCFjDhg0tMTExYo+Xim5zs+h4
fpr9dHs0P0cBnBkMIJXc7Nmz7bXXXjOzsh/8lZuba/Xr17e0tLTQSYnHa9u2rXmeZ3379rVN
mzaFvTfodLqLiors6quvtpSUFBswYEDomG0/nE53Tk6O9ejRwxo1amR9+/a1zZs3+9IcdLqP
leAL4IkTJ5a6ok24nW73W2+9ZZMmTbKnnnoqdKy5X07Vbnb0XI9f/epXduTIEV+7fsrpdEfz
49ysfNs8OzvbPvzwwxOeUB8up9sdqeen2em3v/322xF7jgIIDwaQSuLYy4wG7d+/3y655BJr
06ZNmfWDfxlNmjTJPM+zp59+OnQ/ubm5ofXmz59vCxcudK5769atYb2izpns3rt3b2i9zz//
3NasWRO27uC/80xvc78OtQrHY8UPFW03Mztw4IC1aNHC7r777lLLg/dz/P2FQzi6zY4eChRt
j3Ozn273YxB09bFiFp52PucDqJw4Cb2S8DxPMTExys/PV2FhoSQpPj5eXbp0UX5+vtatWyfp
x5NYA4GAzEy33nqr2rdvr8mTJ2vBggV64YUX1LdvX+3atUuS1Lt3b6WlpTnXnZycrBYtWjjX
feGFFyo1NTVs3eFq9+NToMO1zf1QkfZg/7p167Rp0yZdeeWVkqT8/HzNmzdPAwcOlHT0hFwX
uyWpVatWUfU4L2971apVw9ocrm4/HivhaucTz4HKiWd2JTJ16lTVqlVLEyZM0Pbt21WlShV1
6NBBO3fu1NatWyWVvipO8OtHHnlE69ev1/XXX68//vGPSkpKUr169ej2qbt+/fq+dp/Jdle3
ud/dFWkPXhlo2bJlSkhI0MUXX6w1a9boxhtv1IABA1RSUqLi4uLQCzi6K1+7q92utwPwDwOI
o4qLi8ssW7t2rYqKijR//nyNGTNGkjR48GBVrVpVq1atkiQVFRWF1v/++++1cuVKvf3225Kk
zp07a+3atZo1a1bY3jGj299ul9td7T6d9uLi4tBlRVevXq3GjRvr2WefVZcuXfT1118rMzNT
8+bNU5UqVcKy18nVbpfbXe12vR1AhPl2sBdO27EfXmdmtmXLFvvwww9D369evdqqV69u9957
r6Wmptq9995reXl5dv3111vr1q1L3Y+ZWWZmptWuXdsaNmxos2fPpruSdLvc7mr3mWwvLi62
b775xho3bmye59kFF1xg6enpdFeidle7XW8HED38OTAUZ4TnefI8T2am3NxcdevWTYcPH9by
5cvVrFkzxcfH65JLLlGtWrU0btw49enTR+eee65q1KihQCCgf/3rX+ratWvo/tq1a6e//e1v
uummm+iuRN0ut7vafSbbA4GAatasqZYtW+ree+/V8OHD6a5k7a52u94OIIpEavLBzzN16lT7
3e9+Z2ZHLx/arl07S01NtU8//dQKCwutV69eduutt5qZ2RNPPGE9evSwVq1a2XnnnWczZsww
s7LvYNFd+bpdbne1+0y1+33lIpe7XW53tdv1dgDRgQEkSp3ocoZmZjfffLMlJSXZoUOHrKio
yNasWWNJSUnWqVMn27Bhg02ePNkaNWpkZkcvGTllyhRr2bKleZ5nw4cPp7uSdbvc7mq3y+2u
drvc7mq36+0AohsDSJTbtWuXrV27NvT9okWLzPM8W7ZsWWjZe++9Z6mpqdakSRN79913rXbt
2vb++++b2dFf/rNnz7a6deuG/Rh4uiPX7XK7q90ut7va7XK7q92utwOITgwgUeT4D3N79913
zfM8a9u2rW3cuNHMzD799FNLSUmxu+66q9S6CxYssNatW1u9evWscePG9l//9V90V9JuM3fb
Xe02c7fd1W4zd9td7TZzux2AO7gMb5QwszKXG8zJyVHt2rW1fft2DRo0SLt27VLbtm3VoEED
bdy4UTk5OaF1r7rqKqWnpysQCGjr1q3atGmTDh06RHcl63a53dVul9td7Xa53dVu19sBOCZS
kw/KysjIsGnTpoW+37JliyUlJdmzzz5rrVu3tp49e9qXX35pL730kiUkJNju3bvN7Og7VkVF
RWZm9sYbb1j//v0tIyOD7kra7XK7q90ut7va7XK7q92utwNwBwNIlNi3b5/ddNNN5nmeTZo0
yXJzc83MrGvXrnb77bfbN998Yz179rSLL77YZsyYYbVq1bJXX33VzMyKiorK7Danu3J2u9zu
arfL7a52u9zuarfr7QDcwgASRb7//nu74YYbrEGDBvbII4+YmdkzzzxjF154oeXk5NjatWst
LS3NatasaRdccIENGzYsKn7h0+0/V9td7TZzt93VbjN3213tNnO7HYA7GEDC7P/+7//snXfe
sY8//viUv6SDt+Xl5dl1111n1atXt+nTp9uMGTOsc+fOtnjxYjMz+/bbb61t27bmeZ5ddtll
tmvXLrorQbfL7a52u9zuarfL7a52u94OoHJiAAmT1atXW8eOHa1BgwbWoEED8zzPrr/+elu3
bp2ZWehY2WMFl23evNl+//vfW40aNWzs2LFWq1Ytmzp1ami9Dz/80IYNG2ZLly6l2/Ful9td
7Xa53dVul9td7Xa9HUDlxgByhhUXF9ukSZPs3HPPtcGDB9vKlSvt008/tXHjxllsbKz94Q9/
KPd99erVK/Qu029/+9swVtNt5m+3mbvtrnabudvuareZu+2udpu53Q7g7MAAcoZlZGRY+/bt
7fbbby+zW/ryyy+3Nm3a2LfffnvK+wi+A7V9+3YbNmyYeZ5n5513nn3zzTd0V5JuM3fbXe02
c7fd1W4zd9td7TZzux3A2YEB5AzbsGGDDRo0yL7++uvQsu+//97MzO69915LSkoKfX8qxcXF
Znb0EogTJkyw9evXhyf4B3T7223mbrur3WbutrvabeZuu6vdZm63Azg7eGZmkf4sElcdOHBA
NWvWVElJiQKBQOhDnIqKihQTExNaHtS7d2/t379fixcvVmxsLN1nSbfkbrur3ZK77a52S+62
IJoWXQAABxJJREFUu9otud0O4OzFJ6H/DEVFRRoxYoS6du2qzZs3KxAIqLi4OPQJsjExMZIU
+qVfUlKiwsJCbd68WW3atInYL326aa/s3S63u9rtcrur3a63AwCHYFXQxx9/bFdccYV5nmfV
q1e3UaNGnXL94GUN169fb4FAwF555ZVSy/1Ct//XqXe13dVuM3fbXe02c7fd1W4zt9sBwMyM
PSAV8M033+jBBx/U7t279fTTT+viiy/W66+/rhUrVkiSiouLy/yM/XCE27Jly3TOOefosssu
kyR5nqfvvvtOmzdvPunP0u1mt8vtrna73O5qt8vtrna73g4AIZGafFw1ZMgQmzFjhpmZvfXW
W5aYmGjXXXdd6PaTvaM0ePBg69Kli33//feWn59vM2bMsCZNmlhaWhrdlbDbzN12V7vN3G13
tdvM3XZXu83cbgcAM66CVW5Hjhw54fJBgwZZUlKSvfbaa2ZW9oOdiouLbd++fZacnGy33Xab
ZWZmWlpamnmeZ3fffTfdlazbzN12V7vN3G13tdvM3XZXu83cbgeAYzGAnMCLL75ov/71r23A
gAH2n//5n7Z9+/bQbSUlJVZcXBz6i+CTTz6xRo0aWbdu3Sw3N9fMfvzlH3wX6pNPPrEaNWpY
8+bNrWrVqta9e3fbunUr3Y53u9zuarfL7a52u9zuarfr7QDwUxhAjpGbm2v9+/e3evXq2R13
3GH9+vWzqlWrWmpqqs2bN8/MSr+zFPzFPmLECKtZs6b993//9wnv94UXXjDP86xjx462ePFi
uh3vdrnd1W6X213tdrnd1W7X2wGgvBhAjrFo0SI7//zz7Y033gj9gl+yZIlddNFF1qBBA9uz
Z0+p9YPr7N6921q3bm2pqam2adMmMzPbtWtX6JNmDx06FDpel273u11ud7Xb5XZXu11ud7Xb
9XYAKK8qjz766KORPhE+Wvz973/XunXrNHny5NC10xs3bqy6devqzTffVFZWlgYOHBj6oKdA
IKCioiIlJCQoJiZGM2fOVF5enqpWrao777xT+/fvV4cOHRQfH6/WrVvTXUm6XW53tdvldle7
XW53tdv1dgAot0hNPtEkeDztrbfear/4xS9sx44dZvbjCX8HDhywBx54wDzPs2XLlplZ2ZP8
Dh06ZJ07dzbP88zzPOvQoYNlZ2fTXYm6XW53tdvldle7XW53tdv1dgCoqLNuAPnyyy9t6tSp
9vbbb9u2bdtKXa7wiSeesLi4OFuwYEFoWfD2lStXWtOmTa179+6l7q+kpMS+/PJLGzt2rFWr
Vs1atWpV6ufpdrPb5XZXu11ud7Xb5XZXu11vB4Az4awZQA4dOmQ33nijJSQkWLNmzczzPGvW
rJn9z//8T2idHTt2WI0aNeyuu+6y/fv3m9mP7zAdOXLE7rjjDktKSrLPPvss9DN5eXn2hz/8
wWJjY+0vf/kL3Y53u9zuarfL7a52u9zuarfr7QBwJp0VA8iHH35oHTt2tA4dOtiCBQvsyy+/
tIyMDGvTpo2df/75oRP2CgsL7a677rLatWvbokWLQj8f3AWenp5usbGxtmrVKjP78V2pZcuW
WV5eHt2Od7vc7mq3y+2udrvc7mq36+0AcKZV+gFk//799sc//tE6depkH374Yanbnn/+eYuJ
ibH09PTQsi+++MLOP/9869Wrl61fv97Mjn6Ik5nZu+++a57nWUZGhpmd/NNm6Xav2+V2V7td
bne12+V2V7tdbweAcKj0A4iZ2Z/+9Cd75513Qt8Hd2d/8cUX5nmezZ8/v9T606dPN8/zbOjQ
oXbgwAEzMzt48KDdcMMN1r17dyssLKS7Ena73O5qt8vtrna73O5qt+vtAHCmnRUDSEFBQejr
Y98tmj17tsXGxtry5cvL3P7AAw9YvXr1LCkpyYYMGWKXX3651apVq9S7VHRXrm4zd9td7TZz
t93VbjN3213tNnO7HQDOtECkLwPsh9jY2NDXnueppKREkrRhwwbVrVtXzZo1C90evG3MmDFa
tGiRBg4cKM/z1LJlS2VlZenaa6+lu5J2u9zuarfL7a52u9zuarfr7QBwpnlmZpGO8FtRUZFi
YmLUvXt3SdLixYtVUlIS+tAnSSouLlaVKlUkSYWFhapatWpEWo9Ft/9cbXe1W3K33dVuyd12
V7slt9sB4HSdFXtAjhcTE6OdO3dqzZo1uuqqqyQdfUcqPz9fq1atCn0fFC2/9On2n6vtrnZL
7ra72i252+5qt+R2OwCcrrNyAJGk1atXq6CgQJ07d5YkZWRkqF+/furcubO2bNlS6l2oaEK3
/1xtd7Vbcrfd1W7J3XZXuyW32wHgdJx1v92Ki4slScuWLVOtWrWUkJCge+65R126dFFJSYmy
srLUuHHjyEaeAN3+c7Xd1W7J3XZXuyV3213tltxuB4Az4f8DJoUOYPJyQ3IAAAAASUVORK5C
YII=

--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="potential_format_problem.log"

recipe_color.inc/17: RECIPE_COLOR = "green"

--bp/iNruPH9dso1Pn--

--------------070707050909000000060003--
