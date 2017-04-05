Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 30F5C77BD1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 15:05:55 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 05 Apr 2017 08:05:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,279,1486454400"; d="scan'208";a="1131388058"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.141])
	by fmsmga001.fm.intel.com with ESMTP; 05 Apr 2017 08:05:56 -0700
Message-ID: <1491405256.5062.29.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
Date: Wed, 05 Apr 2017 10:14:16 -0500
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF73244E0B23@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <33D4DBCAC5F2D74E96B07F6E7632BF73244E0B23@G08CNEXMBPEKD01.g08.fujitsu.local>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-freescale]: 32be_rootfs boot from sdcard
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
X-List-Received-Date: Wed, 05 Apr 2017 15:05:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

wrong list, you may have better luck at the meta-fsl mailing list.

BTW, the kernel expects a filesystem on a partition and the latter must
be defined in the kernel command line, using the root parameter.






On Wed, 2017-04-05 at 09:25 +0000, Zheng, Ruoqin wrote:
> 32be_rootfs boot from sdcard (ls1046)
> 
>  
> 
> I used source code provided by nxp  QorIQ-Linux-SDK-v2.0-SOURCE.iso +
> SDK-V2.0-1701 to build the kernel and rootfs , then it can’t boot from
> sdcard.
> 
>  
> 
> I tried to put kernel(32be) and rootfs(32be) in SD card , and boot it
> follow the SDK2.0, it was fail to mount the rootfs(while 64be kernel
> is normal),and here is part of log:
> 
> mmcblk0: mmc0:0007 SL32G 29.0 GiB
> 
>  mcblk0: p1
> 
> VFS: Mounted root (ext2 filesystem) on device 1:0.
> 
> VFS: Cannot open root device "mmcblk0p1" or unknown-block(0,0): error
> -6
> 
> Please append a correct "root=" boot option; here are the available
> partitions:
> 
> 0100          262144 ram0  (driver?)
> 
> 0101          262144 ram1  (driver?)
> 
> 0102          262144 ram2  (driver?)
> 
> 0103          262144 ram3  (driver?)
> 
> 0104          262144 ram4  (driver?)
> 
> 0105          262144 ram5  (driver?)
> 
> 0106          262144 ram6  (driver?)
> 
> 0107          262144 ram7  (driver?)
> 
> 1f00          524288 mtdblock0  (driver?)
> 
> b300        30375936 mmcblk0  driver: mmcblk
> 
>   b301        30371936 mmcblk0p1 00000000-01
> 
> Kernel panic - not syncing: VFS: Unable to mount root fs on
> unknown-block(0,0)
> 
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.1.30-rt34+ #2
> 
> Hardware name: Freescale LAYERSCAPE
> 
>  
> 
> The entire log is in atachments, do anyone have any idea about this
> problem? 
> 
>  
> 
> By the way, I tried to boot the kernel with command “bootm
> a0000000:kernel@1 - a0000000:fdt@1”
> 
> And the log show as below, you can see that mmcblk0 device is missed,
> do anyone know the reason?
> 
>  
> 
> ALSA device list:
> 
>   No soundcards found.
> 
> VFS: Cannot open root device "mmcblk0p1" or unknown-block(0,0): error
> -6
> 
> Please append a correct "root=" boot option; here are the available
> partitions:
> 
> 0100          262144 ram0  (driver?)
> 
> 0101          262144 ram1  (driver?)
> 
> 0102          262144 ram2  (driver?)
> 
> 0103          262144 ram3  (driver?)
> 
> 0104          262144 ram4  (driver?)
> 
> 0105          262144 ram5  (driver?)
> 
> 0106          262144 ram6  (driver?)
> 
> 0107          262144 ram7  (driver?)
> 
> 1f00          524288 mtdblock0  (driver?)
> 
> Kernel panic - not syncing: VFS: Unable to mount root fs on
> unknown-block(0,0)
> 
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.1.30-rt34+ #2
> 
> Hardware name: Freescale LAYERSCAPE
> 
>  
> 
>  
> 
> Zheng Ruoqin
> 
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST)
> 
> ADDR.: No.6 Wenzhu Road, Software Avenue,
> 
>        Nanjing, 210012, China
> 
> MAIL : zhengrq.fnst@cn.fujistu.com
> 
>  
> 
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



