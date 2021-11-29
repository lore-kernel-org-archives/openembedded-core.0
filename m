Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <a0a691a2-dba2-0a71-e0ef-ffc1a9083aa3@gmail.com>
Date: Mon, 29 Nov 2021 09:16:48 -0800
MIME-Version: 1.0
Subject: Re: [OE-core] Not able to install chrony on zeus
References: <CAGsrAHcMZv_H0wa8x9e47tWQOawFhe-s4zy2NN=Or7VteLS12A@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
In-Reply-To: <CAGsrAHcMZv_H0wa8x9e47tWQOawFhe-s4zy2NN=Or7VteLS12A@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: mohammed aqdam <mohammedaqdam@gmail.com>, openembedded-core@lists.openembedded.org, openembedded-core+help@lists.openembedded.org



On 11/29/21 4:08 AM, mohammed aqdam wrote:
> Hi There,
> 
> I am trying to add chrony/chronyd to my final image 
> using IMAGE_INSTALL_append += " chrony ntp pps-tools "
> 
> When I run bitbake(bitbake -k imx-image-full), Seeing "packages have 
> unmet dependencies" errors, please check the logs for more information.
> 
>     Initialising tasks: 100%
>     |###########################################################################################################################|
>     Time: 0:00:05
>     Sstate summary: Wanted 9 Found 7 Missed 2 Current 3666 (77% match,
>     99% complete)
>     NOTE: Executing Tasks
>     NOTE: Setscene tasks completed
>     ERROR: imx-image-full-1.0-r0 do_rootfs: Unable to install packages.
>     Command
>     '/data/home/maqdam/imx-yocto-bsp_latest/build/tmp/work/imx8mpevk-poky-linux/imx-image-full/1.0-r0/recipe-sysroot-native/usr/bin/apt-get
>       install --force-yes --allow-unauthenticated --no-remove
>     android-tools apt autotalks chrony libddsc0 devmem2 dfu-util
>     dhcp-client dhcp-server dpkg gpsd imx-test ink-app-nets-files-obu
>     ink-service iperf3 jailhouse libwebsockets15 luxservice net-snmp
>     net-snmp-client net-snmp-dev net-snmp-libs net-snmp-server
>     net-snmp-server-snmpd net-snmp-server-snmptrapd net-tools ntp
>     opencv-apps opencv-samples openvpn packagegroup-base-extended
>     packagegroup-core-boot packagegroup-core-full-cmdline
>     packagegroup-core-nfs-server packagegroup-core-ssh-dropbear
>     packagegroup-core-tools-debug packagegroup-core-tools-profile
>     packagegroup-core-tools-testapps packagegroup-fsl-gstreamer1.0
>     packagegroup-fsl-gstreamer1.0-full packagegroup-fsl-optee-imx
>     packagegroup-fsl-tools-audio packagegroup-fsl-tools-benchmark
>     packagegroup-fsl-tools-gpu packagegroup-fsl-tools-gpu-external
>     packagegroup-fsl-tools-testapps packagegroup-imx-isp
>     packagegroup-imx-ml packagegroup-qt5-imx
>     packagegroup-tools-bluetooth paho-mqtt paho-mqtt-sn perl
>     perl-module-data-dumper perl-module-file-copy perl-module-file-spec
>     perl-module-getopt-std perl-module-io-file perl-module-term-readline
>     pps-tools psplash python3-opencv rapidjson rtklib run-postinsts
>     strongswan tcpdump tinydtls usbutils versions weston-init
>     weston-xwayland xterm' returned 100:
>     Reading package lists...
>     Building dependency tree...
>     Reading state information...
>     Some packages could not be installed. This may mean that you have
>     requested an impossible situation or if you are using the unstable
>     distribution that some required packages have not yet been created
>     or been moved out of Incoming.
>     The following information may help to resolve the situation:
> 
> 
>     *The following packages have unmet dependencies:
>       chrony : Conflicts: ntp but 4.2.8p15-r0 is to be installed
>     E: Unable to correct problems, you have held broken packages*.
> 

chrony and ntp packages are in conflict, which means both of them are 
trying to install something that other also installs. So you have to 
decide which one of these two you need.

> 
> I see *ntp_4.2.8p15, *in my source code not *4.2.8p15-r0, *so I tried to 
> rename the bb file to ntp_*4.2.8p15-r0.bb <http://4.2.8p15-r0.bb>.*
> Got errors while accessing the Index of /~ntp/ntp_spool/ntp4/ntp-4.2 
> (udel.edu) <https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/> due 
> to missing  ntp_*4.2.8p15-r0.bb <http://4.2.8p15-r0.bb> * in list.
> 
> Kindly let me know if i am missing anything for adding chrony.
> 
> Thanks,
> Aqdam
> 
> 
> 
> 
> 
