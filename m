Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 24A747F2B0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 18:10:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x83IA5Bf028238
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Sep 2019 11:10:15 -0700
Received: from [128.224.56.214] (128.224.56.214) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 3 Sep 2019 11:09:54 -0700
To: Ross Burton <ross.burton@intel.com>,
	<openembedded-core@lists.openembedded.org>,
	<maxime.roussinbelanger@gmail.com>
References: <20190830010801.2496-1-maxime.roussinbelanger@gmail.com>
	<25fa496f-ad5b-2943-7794-11e55656f37b@intel.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <b2313edd-4555-8290-e0b7-73e59926fac2@windriver.com>
Date: Tue, 3 Sep 2019 14:09:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <25fa496f-ad5b-2943-7794-11e55656f37b@intel.com>
X-Originating-IP: [128.224.56.214]
Subject: Re: [PATCH] meta: add missing descriptions and homepage in bsp
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
X-List-Received-Date: Tue, 03 Sep 2019 18:10:58 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

On 9/3/19 11:00 AM, Ross Burton wrote:
> On 30/08/2019 02:08, Maxime Roussin-Bélanger wrote:
>> +DESCRIPTION = "In recent linux kernels, the /proc/acpi/event 
>> interface has \
>> +been deprecated. The same information (and more) is available via 
>> netlink \
>> +(a way for the kernel to communicate with userspace that is usually 
>> used \
>> +for networking) and the input layer (mouse, keyboard, power button, 
>> etc...). \
>> +This version of acpid supports netlink and the input layer."
>
> This is not a meaningful description of acpid.

Hi Maxime,

Thanks for staring on this work.


People often just copy info from another distro as a starting or even 
ending point.

 From my ubu-19.04 system is below (1).


You can also look the package info for several distros using:

   https://pkgs.org/download/acpid

I think the Debian-based distro and SUSE distros tend to have good short 
and long

summaries but I've only looked briefly at the acpid one.


Please take a look, let us know if you have any questions and send a v2 
if not.

Thanks,

../Randy


[1]

$ apt show acpid
Package: acpid
Version: 1:2.0.31-1ubuntu2
Priority: optional
Section: admin
Origin: Ubuntu
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Original-Maintainer: Debian Acpi Team 
<pkg-acpi-devel@lists.alioth.debian.org>
Bugs: https://bugs.launchpad.net/ubuntu/+filebug
Installed-Size: 145 kB
Depends: libc6 (>= 2.27), lsb-base (>= 3.2-14), kmod
Homepage: http://sourceforge.net/projects/acpid2/
Task: ubuntu-desktop-minimal, ubuntu-desktop, kubuntu-desktop, 
xubuntu-core, xubuntu-desktop, lubuntu-desktop, 
ubuntustudio-desktop-core, ubuntustudio-desktop, ubuntukylin-desktop, 
ubuntu-mate-core, ubuntu-mate-desktop, ubuntu-budgie-desktop
Supported: 9m
Download-Size: 37.3 kB
APT-Manual-Installed: no
APT-Sources: http://ca.archive.ubuntu.com/ubuntu disco/main amd64 Packages
Description: Advanced Configuration and Power Interface event daemon
  Modern computers support the Advanced Configuration and Power 
Interface (ACPI)
  to allow intelligent power management on your system and to query 
battery and
  configuration status.
  .
  ACPID is a completely flexible, totally extensible daemon for delivering
  ACPI events. It listens on netlink interface (or on the deprecated file
  /proc/acpi/event), and when an event occurs, executes programs to 
handle the
  event. The programs it executes are configured through a set of 
configuration
  files, which can be dropped into place by packages or by the admin.


>
>> +DESCRIPTION = "The grub.cfg file contains Bash-like code and a list 
>> of installed \
>> +kernels in an array ordered by sequence of installation. For 
>> example, if you \
>> +have four installed kernels, the most recent kernel will be at index 
>> 0, the \
>> +previous kernel will be at index 1, and the oldest kernel will be 
>> index 3."
>
> This reads more as documentation than description.
>
> Ross


-- 
# Randy MacLeod
# Wind River Linux


