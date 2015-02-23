Return-Path: <darren.hart@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4501E706B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 16:25:13 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 23 Feb 2015 08:25:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,631,1418112000"; d="scan'208";a="689502128"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
	by orsmga002.jf.intel.com with ESMTP; 23 Feb 2015 08:25:14 -0800
Received: from orsmsx152.amr.corp.intel.com (10.22.226.39) by
	ORSMSX108.amr.corp.intel.com (10.22.240.6) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Mon, 23 Feb 2015 08:25:12 -0800
Received: from fmsmsx116.amr.corp.intel.com (10.18.116.20) by
	ORSMSX152.amr.corp.intel.com (10.22.226.39) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Mon, 23 Feb 2015 08:25:12 -0800
Received: from fmsmsx118.amr.corp.intel.com ([169.254.1.93]) by
	fmsmsx116.amr.corp.intel.com ([169.254.2.201]) with mapi id
	14.03.0195.001; Mon, 23 Feb 2015 08:25:11 -0800
From: "Hart, Darren" <darren.hart@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Thread-Topic: linux-yocto task performance numbers
Thread-Index: AQHQTqAhyFhFGx0bS02+B/CEPvM2ZZz+bU+A
Date: Mon, 23 Feb 2015 16:25:11 +0000
Message-ID: <D1109451.BE80B%darren.hart@intel.com>
References: <1424610251.11836.74.camel@linuxfoundation.org>
In-Reply-To: <1424610251.11836.74.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.252.195.61]
MIME-Version: 1.0
Subject: Re: linux-yocto task performance numbers
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
X-List-Received-Date: Mon, 23 Feb 2015 16:25:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9F719A356F4A3B489A2E7367E2196F65@intel.com>
Content-Transfer-Encoding: quoted-printable

On 2/22/15, 5:04 AM, "Richard Purdie" <richard.purdie@linuxfoundation.org>
wrote:

>As people know, I've been looking at performance a little, one of the
>benchmarks is how long the kernel takes to build. I dumped out the task
>performance data from buildstats for a linux-yocto build (nothing else
>running):=20
>
>do_fetch:                 Elapsed time: 0.04 seconds
>do_unpack:                Elapsed time: 1.61 seconds
>do_kernel_checkout:       Elapsed time: 4.39 seconds
>do_validate_branches:     Elapsed time: 0.47 seconds
>do_patch:                 Elapsed time: 57.77 seconds
>do_kernel_configme:       Elapsed time: 44.92 seconds
>do_kernel_configcheck:    Elapsed time: 8.94 seconds
>do_configure:             Elapsed time: 0.60 seconds
>do_compile:               Elapsed time: 72.95 seconds
>do_compile_kernelmodules: Elapsed time: 34.84 seconds
>do_populate_lic:          Elapsed time: 0.14 seconds
>do_strip:                 Elapsed time: 0.03 seconds
>do_uboot_mkimage:         Elapsed time: 0.03 seconds
>do_install:               Elapsed time: 1.87 seconds
>do_populate_sysroot:      Elapsed time: 0.16 seconds
>do_shared_workdir:        Elapsed time: 0.05 seconds
>do_sizecheck:             Elapsed time: 0.03 seconds
>do_bundle_initramfs:      Elapsed time: 0.03 seconds
>do_kernel_link_vmlinux:   Elapsed time: 0.03 seconds
>do_deploy:                Elapsed time: 13.17 seconds
>do_package:               Elapsed time: 31.54 seconds
>do_packagedata:           Elapsed time: 0.59 seconds
>do_package_qa:            Elapsed time: 5.30 seconds
>do_package_write_ipk:     Elapsed time: 83.24 seconds
>do_package_write_rpm:     Elapsed time: 44.58 seconds
>
>The "core" was getting blamed for a lot of the build time. As can be
>seen, the "core" isn't taking that much time now, apart from the fact
>that ipk packaging seems to be taking twice the time of rpm which needs
>looking into.
>
>Some tasks like the compile tasks are understandable and likely
>minimised by upstream work already.
>
>The other tasks which as consuming a disproportionate amount of time are
>kernel_configme and patch, I believe we need to look into those a little
>further too. To put it into context, should the kernel compile be at the
>same order of magnitude as the patch and configure?

Agreed, that was may take away from the above.

--=20
Darren Hart
Intel Open Source Technology Center



