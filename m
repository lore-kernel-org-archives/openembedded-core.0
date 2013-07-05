Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 6402E6AD81
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 15:28:29 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jul 2013 08:28:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1002,1363158000"; d="scan'208";a="327230082"
Received: from unknown (HELO helios.localnet) ([10.252.122.22])
	by azsmga001.ch.intel.com with ESMTP; 05 Jul 2013 08:28:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 05 Jul 2013 16:28:24 +0100
Message-ID: <1458807.Cif2MtSWk2@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-25-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <cover.1372987648.git.Martin.Jansa@gmail.com>
References: <cover.1372987648.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/8] Missing deps discovered in per-recipe builds
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
X-List-Received-Date: Fri, 05 Jul 2013 15:28:29 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 05 July 2013 03:28:21 Martin Jansa wrote:
> I was using simple script to build each component alone:
> 
> #!/bin/bash
> 
> rm -rf tmp-eglibc/abi_version tmp-eglibc/buildstats tmp-eglibc/cache
> tmp-eglibc/deploy tmp-eglibc/log tmp-eglibc/pkgdata pseudodone
> tmp-eglibc/saved_tmpdir tmp-eglibc/sstate-control tmp-eglibc/stamps
> tmp-eglibc/sysroots tmp-eglibc/work-shared tmp-eglibc/work/* rm -rf log.*
> 
> ls -d buildhistory/packages/*/* | xargs -n 1 basename | sort -u >
> component.list ncomponents=`cat component.list | wc -l`
> i=1
> for component in `cat component.list`; do
>   echo "Building component: ${component} ($i/$ncomponents)"
>   bitbake -c cleansstate ${component} | tee log.${component};
>   bitbake ${component} | tee -a log.${component};
>   rm -rf tmp-eglibc/abi_version tmp-eglibc/buildstats tmp-eglibc/cache
> tmp-eglibc/deploy tmp-eglibc/log tmp-eglibc/pkgdata pseudodone
> tmp-eglibc/saved_tmpdir tmp-eglibc/sstate-control tmp-eglibc/stamps
> tmp-eglibc/sysroots tmp-eglibc/work-shared tmp-eglibc/work/* i=`expr $i +
> 1`
> done

A cleaned up form of this would be a great addition to the scripts/contrib 
directory if you have time...

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

