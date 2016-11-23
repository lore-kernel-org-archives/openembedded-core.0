Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0B5E7719B3;
	Wed, 23 Nov 2016 18:12:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uANICOkT020329
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 23 Nov 2016 10:12:24 -0800 (PST)
Received: from server.local (128.224.21.22) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 23 Nov 2016 10:12:23 -0800
To: Martin Jansa <martin.jansa@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <20161103133345.6936.13797@opal.openembedded.org>
	<20161103133346.EC39750212@opal.openembedded.org>
	<20161123171218.GE3265@jama>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <e3fde391-64a2-12b2-7dc8-5845bf9e699b@windriver.com>
Date: Wed, 23 Nov 2016 13:12:22 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.5.0
MIME-Version: 1.0
In-Reply-To: <20161123171218.GE3265@jama>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 02/05: linux-yocto/4.8: update to 4.8.6
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
X-List-Received-Date: Wed, 23 Nov 2016 18:12:25 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-11-23 12:12 PM, Martin Jansa wrote:
> On Thu, Nov 03, 2016 at 01:33:47PM +0000, git@git.openembedded.org wrote:
>> rpurdie pushed a commit to branch master-next
>> in repository openembedded-core.
>>
>> commit 2a7d3173c7a05cd09bbcf5fe465403b2d4b2b589
>> Author: Bruce Ashfield <bruce.ashfield@windriver.com>
>> AuthorDate: Thu Nov 3 09:25:14 2016 -0400
>>
>>     linux-yocto/4.8: update to 4.8.6
>>
>>     Integrating the korg -stable release.
>
> Not sure if it's caused by this upgrade or one of kernel tooling
> improvements, but now it fails to build for me in default qemux86
> config:


Interesting. The latest set of commits that I pushed are building with
that same addon feature enabled.

I can rewind to that older commit and see if something is broken, but
the new tools and error checking shouldn't be coming into play with
a commit of that vintage.

Bruce


>
> ERROR: linux-yocto-4.8.6+gitAUTOINC+87e5fc8b7c_9d5f74f941-r0 do_kernel_metadata: Function failed: do_kernel_metadata (log file is located at /OE/build/oe-core/tmp-glibc/work/qemux86-oe-linux/linux-yocto/4.8.6+gitAUTOINC+87e5fc8b7c_9d5f74f941-r0/temp/log.do_kernel_metadata.441)
> ERROR: Logfile of failure stored in: /OE/build/oe-core/tmp-glibc/work/qemux86-oe-linux/linux-yocto/4.8.6+gitAUTOINC+87e5fc8b7c_9d5f74f941-r0/temp/log.do_kernel_metadata.441
> Log data follows:
> | DEBUG: Executing shell function do_kernel_metadata
> | ERROR. input file "features/nfsd/nfsd-enable.scc" does not exist
> | ERROR: could not process input files: features/nfsd/nfsd-enable.scc features/debug/printk.scc features/netfilter/netfilter.scc cfg/virtio.scc cfg/sound.scc cfg/paravirt_kvm.scc
> |        See /tmp/tmp.tLkBgIybCS for details
> | ERROR. input file "features/nfsd/nfsd-enable.scc" does not exist
> | ERROR: could not process input files: features/nfsd/nfsd-enable.scc features/debug/printk.scc features/netfilter/netfilter.scc cfg/virtio.scc cfg/sound.scc cfg/paravirt_kvm.scc
> |        See /tmp/tmp.T7cBZctbo1 for details
> | ERROR: Function failed: do_kernel_metadata (log file is located at /OE/build/oe-core/tmp-glibc/work/qemux86-oe-linux/linux-yocto/4.8.6+gitAUTOINC+87e5fc8b7c_9d5f74f941-r0/temp/log.do_kernel_metadata.441)
> ERROR: Task (/OE/build/oe-core/openembedded-core/meta/recipes-kernel/linux/linux-yocto_4.8.bb:do_kernel_metadata) failed with exit code '1'
>
>
>
>>
>>     Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>  meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb   |  6 +++---
>>  meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb |  6 +++---
>>  meta/recipes-kernel/linux/linux-yocto_4.8.bb      | 20 ++++++++++----------
>>  3 files changed, 16 insertions(+), 16 deletions(-)
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
>> index e51c9cd..26b309d 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
>> @@ -11,13 +11,13 @@ python () {
>>          raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
>>  }
>>
>> -SRCREV_machine ?= "4057556c041f6aac0d29aa3425587d414c9a0090"
>> -SRCREV_meta ?= "83110d94edeb856a3667b62903ed4ae91c24117d"
>
>> +SRCREV_machine ?= "b99b6fac437104e206d30540a5cb12103049af1e"
>> +SRCREV_meta ?= "87e5fc8b7cb387f197cdd098cdde4e96e9e8ed0d"
>>
>>  SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${KBRANCH};name=machine \
>>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
>>
>> -LINUX_VERSION ?= "4.8.3"
>> +LINUX_VERSION ?= "4.8.6"
>>
>>  PV = "${LINUX_VERSION}+git${SRCPV}"
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
>> index c8ddbd9..63dd11b 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
>> @@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
>>
>>  require recipes-kernel/linux/linux-yocto.inc
>>
>> -LINUX_VERSION ?= "4.8.3"
>> +LINUX_VERSION ?= "4.8.6"
>>
>>  KMETA = "kernel-meta"
>>  KCONF_BSP_AUDIT_LEVEL = "2"
>>
>> -SRCREV_machine ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
>> -SRCREV_meta ?= "83110d94edeb856a3667b62903ed4ae91c24117d"
>> +SRCREV_machine ?= "9d5f74f941c3ca234f58ff8e539f5ca64458c0a7"
>> +SRCREV_meta ?= "87e5fc8b7cb387f197cdd098cdde4e96e9e8ed0d"
>>
>>  PV = "${LINUX_VERSION}+git${SRCPV}"
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.8.bb b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
>> index 13778b9..0369198 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
>> @@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
>>  KBRANCH_qemux86-64 ?= "standard/base"
>>  KBRANCH_qemumips64 ?= "standard/mti-malta64"
>>
>> -SRCREV_machine_qemuarm ?= "4cc544ad09ad704322cb66fe4ba197a6a05dc71f"
>> -SRCREV_machine_qemuarm64 ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
>> -SRCREV_machine_qemumips ?= "c285969d4f9376a671167ecf397578c8ad3e6a75"
>> -SRCREV_machine_qemuppc ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
>> -SRCREV_machine_qemux86 ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
>> -SRCREV_machine_qemux86-64 ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
>> -SRCREV_machine_qemumips64 ?= "64f96ba530e58456070f26b0f3fcce3f64988b72"
>> -SRCREV_machine ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
>> -SRCREV_meta ?= "83110d94edeb856a3667b62903ed4ae91c24117d"
>> +SRCREV_machine_qemuarm ?= "94d3e8675e2fcb09f29814a33ccf79df06149104"
>> +SRCREV_machine_qemuarm64 ?= "9d5f74f941c3ca234f58ff8e539f5ca64458c0a7"
>> +SRCREV_machine_qemumips ?= "046ff6344eee25dcc0eea1214e0ad8771ddfabfb"
>> +SRCREV_machine_qemuppc ?= "9d5f74f941c3ca234f58ff8e539f5ca64458c0a7"
>> +SRCREV_machine_qemux86 ?= "9d5f74f941c3ca234f58ff8e539f5ca64458c0a7"
>> +SRCREV_machine_qemux86-64 ?= "9d5f74f941c3ca234f58ff8e539f5ca64458c0a7"
>> +SRCREV_machine_qemumips64 ?= "edcb167f91abc071cc98cbd762418ff7ab9d839b"
>> +SRCREV_machine ?= "9d5f74f941c3ca234f58ff8e539f5ca64458c0a7"
>> +SRCREV_meta ?= "87e5fc8b7cb387f197cdd098cdde4e96e9e8ed0d"
>>
>>  SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;name=machine;branch=${KBRANCH}; \
>>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
>>
>> -LINUX_VERSION ?= "4.8.3"
>> +LINUX_VERSION ?= "4.8.6"
>>
>>  PV = "${LINUX_VERSION}+git${SRCPV}"
>>
>>
>> --
>> To stop receiving notification emails like this one, please contact
>> the administrator of this repository.
>> --
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>


