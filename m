Return-Path: <alexander.kanavin@linux.intel.com>
X-Greylist: delayed 566 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 23 Aug 2016 12:23:45 UTC
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id E82E26FFFE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 12:23:45 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP; 23 Aug 2016 05:14:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,565,1464678000"; d="scan'208";a="1018992997"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.49])
	([10.237.68.49])
	by orsmga001.jf.intel.com with ESMTP; 23 Aug 2016 05:14:19 -0700
To: openembedded-core@lists.openembedded.org
References: <20160823012731.22993-1-raj.khem@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <39624d78-d684-3ab5-7287-8e1f526d37d5@linux.intel.com>
Date: Tue, 23 Aug 2016 15:13:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <20160823012731.22993-1-raj.khem@gmail.com>
Subject: Re: [PATCH] gcc: Update to final 6.2.0 release
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
X-List-Received-Date: Tue, 23 Aug 2016 12:23:47 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 08/23/2016 04:27 AM, Khem Raj wrote:
> -#BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2"
> +BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2"
>  #SRCREV = "bd9a826d5448db11d29d2ec5884e7e679066f140"
>  #BASEURI ?= "git://github.com/gcc-mirror/gcc;branch=gcc-6-branch;protocol=git"
> -BASEURI ?= "ftp://sourceware.org/pub/gcc/snapshots/6.2.0-RC-20160815/gcc-6.2.0-RC-20160815.tar.bz2"
> +#BASEURI ?= "ftp://sourceware.org/pub/gcc/snapshots/6.2.0-RC-20160815/gcc-6.2.0-RC-20160815.tar.bz2"
> -S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}${SNAP}"
> +S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
>  #S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/git"
>  B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"

The commented out lines should be dropped, they're just clutter.

Alex


