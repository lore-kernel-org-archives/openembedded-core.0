Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SJgwv-0005nj-Ge
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 10:06:13 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q3G7ulOm003696
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 00:56:47 -0700 (PDT)
Received: from [128.224.162.196] (128.224.162.196) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 16 Apr 2012 00:56:47 -0700
Message-ID: <4F8BD0BE.7090602@windriver.com>
Date: Mon, 16 Apr 2012 15:56:46 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120310 Thunderbird/11.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <4F8B88C5.2050100@windriver.com>
In-Reply-To: <4F8B88C5.2050100@windriver.com>
Subject: Re: meta-toolchain-sdk failed on Ubuntu 10.10 and FC17 64bit
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
X-List-Received-Date: Mon, 16 Apr 2012 08:06:14 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/16/2012 10:49 AM, Robert Yang wrote:
>
> The errors are below, does anyone meet the same errors, please?
>
> On Ubuntu 10.10 32bit:
>
> MACHINE ?= "qemumips"
> $ bitbake core-image-sato meta-toolchain-sdk
>
> | eds-dbus-dev ##################################################
> | Installing NATIVESDK packages
> | Processing task-sdk-host-nativesdk...
> | Processing task-cross-canadian-mips...
> | error: Failed dependencies:
> | libcurl.so.4 is needed by qemu-nativesdk-0.15.1-r5.i686
> NOTE: package meta-toolchain-gmae-1.0-r7: task do_populate_sdk: Failed
> ERROR: Task 21
> (/buildarea2/lyang1/poky/meta/recipes-core/meta/meta-toolchain-gmae.bb,
> do_populate_sdk) failed with exit code '1'
> Waiting for 1 running tasks to finish:
> 0:
> linux-yocto-3.2.11+git1+135c75bf9615334b5b8bb9108d612fe7dfbdb901_1+0e0c67635b74199d534f75500e5c1654a1219bc6-r1
> do_package_write_rpm (pid 12511)
> NOTE: package
> linux-yocto-3.2.11+git1+135c75bf9615334b5b8bb9108d612fe7dfbdb901_1+0e0c67635b74199d534f75500e5c1654a1219bc6-r1:
> task do_package_write_rpm: Succeeded
> NOTE: Tasks Summary: Attempted 5931 tasks of which 498 didn't need to be rerun
> and 1 failed.
>
> Summary: 1 task failed:
> /buildarea2/lyang1/poky/meta/recipes-core/meta/meta-toolchain-gmae.bb,
> do_populate_sdk
> Summary: There were 22 WARNING messages shown.
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
>
>
> On FC 17 64bit:
> MACHINE ?= "qemuppc"
> $ bitbake meta-toolchain-sdk
>
> | hdrload: 155 0.728660 MB 0.000876 secs
> | hdrget: 4539 0.000000 MB 0.005195 secs
> | Processing task-core-standalone-gmae-sdk-target...
> | Processing task-core-standalone-gmae-sdk-target-dbg...
> | error: Failed dependencies:
> | /bin/perl is needed by libglib-2.0-utils-2.30.3-r0.ppc603e

Found 2 more pkgs have the similar issue: automake and autoconf, I will
send a patch for them.

// Robert


> NOTE: package meta-toolchain-gmae-1.0-r7: task do_populate_sdk: Failed
> ERROR: Task 8
> (/buildarea2/lyang1/poky/meta/recipes-core/meta/meta-toolchain-gmae.bb,
> do_populate_sdk) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 3775 tasks of which 3746 didn't need to be rerun
> and 1 failed.
>
> Summary: 1 task failed:
> /buildarea2/lyang1/poky/meta/recipes-core/meta/meta-toolchain-gmae.bb,
> do_populate_sdk
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
>


