Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TvrVd-00020J-Dl
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 16:36:05 +0100
Message-ID: <50F816C9.5000504@communistcode.co.uk>
Date: Thu, 17 Jan 2013 15:20:41 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130109 Thunderbird/17.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <50F816A8.4080508@eumx.net>
In-Reply-To: <50F816A8.4080508@eumx.net>
X-Forwarded-Message-Id: <50F816A8.4080508@eumx.net>
Subject: lttng-ust issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Jan 2013 15:36:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Hi,

On a build today I was hit with this error. I am at commit
169b9afcf2d357fdcf254a380d21d17701685834.

|  * check_data_file_clashes: Package lttng2-ust-dbg wants to install
file
/home/jack/Projects/oe-r0005/r0005/tmp/work/beaglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs/usr/lib/.debug/liblttng-ust-tracepoint.so.0.0.0
|     But that file is already provided by package  * lttng-ust-dbg
|  * check_data_file_clashes: Package lttng2-ust-dbg wants to install
file
/home/jack/Projects/oe-r0005/r0005/tmp/work/beaglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs/usr/lib/.debug/liblttng-ust.so
|     But that file is already provided by package  * lttng-ust-dbg
|  * check_data_file_clashes: Package lttng2-ust-dbg wants to install
file
/home/jack/Projects/oe-r0005/r0005/tmp/work/beaglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs/usr/lib/.debug/liblttng-ust-fork.so.0
|     But that file is already provided by package  * lttng-ust-dbg
|  * check_data_file_clashes: Package lttng2-ust-dbg wants to install
file
/home/jack/Projects/oe-r0005/r0005/tmp/work/beaglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs/usr/lib/.debug/liblttng-ust-tracepoint.so.0
|     But that file is already provided by package  * lttng-ust-dbg
|  * check_data_file_clashes: Package lttng2-ust-dbg wants to install
file
/home/jack/Projects/oe-r0005/r0005/tmp/work/beaglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs/usr/lib/.debug/liblttng-ust-fork.so
|     But that file is already provided by package  * lttng-ust-dbg
|  * check_data_file_clashes: Package lttng2-ust-dbg wants to install
file
/home/jack/Projects/oe-r0005/r0005/tmp/work/beaglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs/usr/lib/.debug/liblttng-ust-ctl.so.1
|     But that file is already provided by package  * lttng-ust-dbg
|  * check_data_file_clashes: Package lttng2-ust-dbg wants to install
file
/home/jack/Projects/oe-r0005/r0005/tmp/work/beaglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs/usr/lib/.debug/liblttng-ust.so.0
|     But that file is already provided by package  * lttng-ust-dbg
|  * check_data_file_clashes: Package lttng2-ust-dbg wants to install
file
/home/jack/Projects/oe-r0005/r0005/tmp/work/beaglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs/usr/lib/.debug/liblttng-ust-tracepoint.so
|     But that file is already provided by package  * lttng-ust-dbg
|  * check_data_file_clashes: Package lttng2-ust-dbg wants to install
file
/home/jack/Projects/oe-r0005/r0005/tmp/work/beaglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs/usr/lib/.debug/liblttng-ust.so.0.0.0
|     But that file is already provided by package  * lttng-ust-dbg
|  * check_data_file_clashes: Package lttng2-ust-dbg wants to install
file
/home/jack/Projects/oe-r0005/r0005/tmp/work/beaglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs/usr/lib/.debug/liblttng-ust-libc-wrapper.so.0
|     But that file is already provided by package  * lttng-ust-dbg
|  * check_data_file_clashes: Package lttng2-ust-dbg wants to install
file
/home/jack/Projects/oe-r0005/r0005/tmp/work/beaglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs/usr/lib/.debug/liblttng-ust-libc-wrapper.so
|     But that file is already provided by package  * lttng-ust-dbg
|  * check_data_file_clashes: Package lttng2-ust-dbg wants to install
file
/home/jack/Projects/oe-r0005/r0005/tmp/work/beaglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs/usr/lib/.debug/liblttng-ust-ctl.so.1.0.0
|     But that file is already provided by package  * lttng-ust-dbg
|  * check_data_file_clashes: Package lttng2-ust-dbg wants to install
file
/home/jack/Projects/oe-r0005/r0005/tmp/work/beaglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs/usr/lib/.debug/liblttng-ust-ctl.so
|     But that file is already provided by package  * lttng-ust-dbg
|  * check_data_file_clashes: Package lttng2-ust-dbg wants to install
file
/home/jack/Projects/oe-r0005/r0005/tmp/work/beaglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs/usr/lib/.debug/liblttng-ust-libc-wrapper.so.0.0.0
|     But that file is already provided by package  * lttng-ust-dbg
|  * check_data_file_clashes: Package lttng2-ust-dbg wants to install
file
/home/jack/Projects/oe-r0005/r0005/tmp/work/beaglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs/usr/lib/.debug/liblttng-ust-fork.so.0.0.0
|     But that file is already provided by package  * lttng-ust-dbg
|  * opkg_install_cmd: Cannot install package
packagegroup-core-tools-profile-dbg.
| ERROR: Function failed: do_rootfs (see
/home/jack/Projects/oe-r0005/r0005/tmp/work/beaglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/temp/log.do_rootfs.16929
for further information)
ERROR: Task 7
(/home/jack/Projects/oe-r0005/meta-db/recipes-core/images/core-image-dev.bb,
do_rootfs) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2620 tasks of which 2607 didn't need to
be rerun and 1 failed.
No currently running tasks (2620 of 2621)

Any ideas?

Cheers,
Jack





