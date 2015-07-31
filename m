Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7B0417646E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 12:16:05 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 31 Jul 2015 05:16:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,584,1432623600"; d="scan'208";a="533661109"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by FMSMGA003.fm.intel.com with ESMTP; 31 Jul 2015 05:16:05 -0700
Message-ID: <55BB6744.3020205@linux.intel.com>
Date: Fri, 31 Jul 2015 15:17:08 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Max Krummenacher <max.oss.09@gmail.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>	
	<316d1fc15fc3ef12d5164dbc974c1ba15f4a3564.1438262915.git.alexander.kanavin@linux.intel.com>
	<1438278300.2650.6.camel@Saturn.local.all>
In-Reply-To: <1438278300.2650.6.camel@Saturn.local.all>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 20/26] stress: use developer's website for SRC_URI
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
X-List-Received-Date: Fri, 31 Jul 2015 12:16:06 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/30/2015 08:45 PM, Max Krummenacher wrote:
> Please note that the package has now a changed file COPYING for GPLv3
> (but the sources still reference GPLv2)
>
> So unless you still have stress-1.0.4.tar.gz in your download folder
> the package checksums and LIC_FILES_CHKSUM will throw an error/warning
> and then fallback successfully to the OE mirror.
>> -SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/stress/stress-${PV}.tar.gz/a607afa695a511765b40993a64c6e2f4/stress-${PV}.tar.gz \
>> +SRC_URI = "http://people.seas.harvard.edu/~apw/stress/stress-${PV}.tar.gz \
>>              file://texinfo.patch \
>>              "


That's right. Fedora's tarball has a GPLv3 COPYING in it, while upstream 
tarball has GPLv2 (the source trees are otherwise identical).

I've updated all the checksums in the recipe to match upstream tarball.


Alex

