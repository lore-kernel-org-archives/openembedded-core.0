Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2967460670
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 18:21:56 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 30 Oct 2014 11:21:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="408655215"
Received: from unknown (HELO [10.255.13.109]) ([10.255.13.109])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Oct 2014 11:13:47 -0700
Message-ID: <545281C5.2020004@linux.intel.com>
Date: Thu, 30 Oct 2014 11:21:57 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.7.0
MIME-Version: 1.0
To: Yocto Project Discussion <yocto@yoctoproject.org>, 
	'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Package Upgrading for 1.8
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
X-List-Received-Date: Thu, 30 Oct 2014 18:22:00 -0000
X-Groupsio-MsgNum: 59044
Content-Type: multipart/mixed; boundary="------------040401000502020408070001"

--------------040401000502020408070001
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit


Folks,

Just a reminder now that master is open again for patches, now is a 
great time to consider doing package Updates.  Based on some rough 
estimates from 1.7 we did around 300 updates from 34 contributors, that 
got us about 73% packages upgrades.

We currently have about 180 packages due to be updated based on the 
Package Reporting from this last week, about 65 of those where not 
updated in 1.7 so should be given some priority (see attached file), 
there are also 10 that need maintainers, let me know if you are 
interested in any of them.

Here are the stats from 1.7 on who has upgraded packages (I guess I 
don't have enough to do!).  Thanks to everyone who contributed package 
updates.

      61 Saul Wold
      43 Cristian Iorga
      25 Ross Burton
      23 Bruce Ashfield
      15 Armin Kuster
      14 Richard Purdie
      12 Laurentiu Palcu
      11 Paul Eggleton
       9 Hongxu Jia
       9 Cristiana Voicu
       9 Chen Qi
       8 Valentin Popa
       7 Chong Lu
       7 Carlos Rafael Giani
       6 Khem Raj
       5 Tim Orling
       4 Roxana Ciobanu
       4 Robert Yang
       4 Marko Lindqvist
       4 Mark Hatle
       3 Paul Barker
       3 Maxin B. John
       2 Yasir-Khan
       2 Nicolas Dechesne
       2 Fathi Boudra
       1 Ricardo Neri
       1 Peter Seebach
       1 Peter Kjellerstedt
       1 Martin Jansa
       1 Jackie Huang
       1 Darren Hart
       1 Ciobanu Roxana
       1 Chunrong Guo
       1 Andreas Müller


-- 
     Sau!

Saul Wold
Yocto Component Wrangler @ Intel
Yocto Project / Poky Build System


--------------040401000502020408070001
Content-Type: text/plain; charset=UTF-8;
 name="upgrades"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="upgrades"

ccache                        3.1.9                         3.1.10                        Wenzong Fan <wenzong.fan@windriver.com>           
chkconfig                     1.3.58                        1.3.62                        Wenzong Fan <wenzong.fan@windriver.com>           
gettext                       0.18.3.2                      0.19.3                        Wenzong Fan <wenzong.fan@windriver.com>           
npth                          0.91                          1.0                           Saul Wold <sgw@linux.intel.com>                   
apt                           0.9.9.4                       1.0.9.3                       Saul Wold <sgw@linux.intel.com>                   
hdparm                        9.43                          9.45                          Saul Wold <sgw@linux.intel.com>                   
dpkg                          1.17.4                        1.17.21                       Saul Wold <sgw@linux.intel.com>                   
libaio                        0.3.109                       0.3.110                       Saul Wold <sgw@linux.intel.com>                   
valgrind                      3.9.0                         3.10.0                        Saul Wold <sgw@linux.intel.com>                   
cronie                        1.4.11                        1.4.12                        Saul Wold <sgw@linux.intel.com>                   
usbutils                      007                           008                           Saul Wold <sgw@linux.intel.com>                   
libksba                       1.3.0                         1.3.1                         Saul Wold <sgw@linux.intel.com>                   
base-passwd                   3.5.29                        3.5.36                        Saul Wold <sgw@linux.intel.com>                   
puzzles                       r10116                        N/A                           Ross Burton <ross.burton@intel.com>               
xcb-util-image                0.3.9                         0.4.0                         Ross Burton <ross.burton@intel.com>               
libxext                       1.3.2                         1.3.3                         Ross Burton <ross.burton@intel.com>               
libxcb                        1.10                          1.11                          Ross Burton <ross.burton@intel.com>               
xcb-util                      0.3.9                         0.4.0                         Ross Burton <ross.burton@intel.com>               
libpam                        1.1.6                         1.1.8                         Ross Burton <ross.burton@intel.com>               
gsettings-desktop-schemas     3.10.1                        3.14.1                        Ross Burton <ross.burton@intel.com>               
xcb-proto                     1.10                          1.11                          Ross Burton <ross.burton@intel.com>               
xinit                         1.3.3                         1.3.4                         Ross Burton <ross.burton@intel.com>               
libnotify                     0.6.0                         0.7.6                         Ross Burton <ross.burton@intel.com>               
screen                        4.0.3                         4.2.1                         Ross Burton <ross.burton@intel.com>               
xcb-util-keysyms              0.3.9                         0.4.0                         Ross Burton <ross.burton@intel.com>               
cairo                         1.12.16                       1.14.0                        Ross Burton <ross.burton@intel.com>               
make                          4.0                           4.1                           Robert Yang <liezhi.yang@windriver.com>           
gmp                           6.0.0                         6.0.0a                        Robert Yang <liezhi.yang@windriver.com>           
rsync                         3.1.0                         3.1.1                         Robert Yang <liezhi.yang@windriver.com>           
e2fsprogs                     1.42.9                        1.42.12                       Robert Yang <liezhi.yang@windriver.com>           
gpgme                         1.4.3                         1.5.1                         Paul Eggleton <paul.eggleton@linux.intel.com>     
dropbear                      2014.63                       2014.66                       Paul Eggleton <paul.eggleton@linux.intel.com>     
yasm                          1.2.0                         1.3.0                         Paul Eggleton <paul.eggleton@linux.intel.com>     
unfs3                         0.9.22.r490                   N/A                           Paul Eggleton <paul.eggleton@linux.intel.com>     
python-nose                   1.2.1                         1.3.4                         No Maintainer info                                
xmlto                         0.0.25                        0.0.26                        No Maintainer info                                
libevdev                      1.2.2                         1.3                           No Maintainer info                                
libnewt-python                0.52.17                       0.52.18                       No Maintainer info                                
serf                          1.3.6                         1.3.8                         No Maintainer info                                
python-mako                   0.9.1                         1.0.0                         No Maintainer info                                
xf86-video-modesetting        0.8.1                         0.9.0                         No Maintainer info                                
python-numpy                  1.7.0                         1.9.0                         No Maintainer info                                
pinentry                      0.8.4                         0.9.0                         No Maintainer info                                
python3-distribute            0.6.32                        0.7.3                         No Maintainer info                                
libsdl                        1.2.15                        1.2.15-1                      Kai Kang <kai.kang@windriver.com>                 
parted                        3.1                           3.2                           Hongxu Jia <hongxu.jia@windriver.com>             
lsb                           4.1                           1.4                           Hongxu Jia <hongxu.jia@windriver.com>             
libnewt                       0.52.17                       0.52.18                       Hongxu Jia <hongxu.jia@windriver.com>             
cracklib                      2.9.1                         2.9.2                         Hongxu Jia <hongxu.jia@windriver.com>             
libxml2                       2.9.1                         2.9.2                         Hongxu Jia <hongxu.jia@windriver.com>             
ppp                           2.4.6                         2.4.7                         Hongxu Jia <hongxu.jia@windriver.com>             
syslinux                      6.01                          6.03                          Darren Hart <dvhart@linux.intel.com>              Waiting for 4.06 for 3.3 kern...
apmd                          3.2.2-14                      3.2.2                         Cristian Iorga <cristian.iorga@intel.com>         
net-tools                     1.60-25                       1.60                          Cristian Iorga <cristian.iorga@intel.com>         
gst-fluendo-mp3               0.10.19                       0.10.30                       Cristian Iorga <cristian.iorga@intel.com>         
gst-fluendo-mpegdemux         0.10.72                       0.10.81                       Cristian Iorga <cristian.iorga@intel.com>         
neon                          0.30.0                        0.30.1                        Cristian Iorga <cristian.iorga@intel.com>         
netbase                       5.2                           5.3                           Cristian Iorga <cristian.iorga@intel.com>         
tcl                           8.6.1                         8.6.3                         Chong Lu <Chong.Lu@windriver.com>                 
strace                        4.8                           4.9                           Chong Lu <Chong.Lu@windriver.com>                 
bison                         2.7.1                         3.0.2                         Chong Lu <Chong.Lu@windriver.com>                 
tar                           1.27.1                        1.28                          Chen Qi <Qi.Chen@windriver.com>                   
xz                            5.1.3alpha                    5.1.4beta                     Chen Qi <Qi.Chen@windriver.com>                   
coreutils                     8.22                          8.23                          Chen Qi <Qi.Chen@windriver.com>                   
sysklogd                      1.5                           1.5.1                         Chen Qi <Qi.Chen@windriver.com>                   

--------------040401000502020408070001--
