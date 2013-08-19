Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 3682C6AFFE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2013 21:00:29 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Aug 2013 14:00:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,914,1367996400"; d="scan'208";a="348563756"
Received: from unknown (HELO [10.255.14.105]) ([10.255.14.105])
	by azsmga001.ch.intel.com with ESMTP; 19 Aug 2013 14:00:28 -0700
Message-ID: <5212876C.7080806@linux.intel.com>
Date: Mon, 19 Aug 2013 14:00:28 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1376674064-14468-1-git-send-email-muhammad_shakeel@mentor.com>
	<CAMKF1srCL2f+Cxb+2xvLY4_+oikJgXtj0vcR3=9h0tbDf1jGSg@mail.gmail.com>
	<5211B8C4.7070601@mentor.com>
	<CAMKF1srikv98W6EQ0Jk7_3FbKaPppaG1sBW-=A6YyD-eR-aj+Q@mail.gmail.com>
In-Reply-To: <CAMKF1srikv98W6EQ0Jk7_3FbKaPppaG1sBW-=A6YyD-eR-aj+Q@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] [v3] openssh: Add systemd support
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
X-List-Received-Date: Mon, 19 Aug 2013 21:00:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/18/2013 11:40 PM, Khem Raj wrote:
> On Sun, Aug 18, 2013 at 11:18 PM, Muhammad Shakeel
> <muhammad_shakeel@mentor.com> wrote:
>> /usr/sbin/ is being sed'ed with ${sbindir} in do_install_append of the
>> respective recipe file. /usr/bin/ and /bin/ is also taken care of.
>
> i see, thats better. however I do see a need to have  a generalized
> way of specifying service files and a generic
> processing engine which then takes care of it. Otherwise we have the
> same code replicated in multiple recipes

Agreed, I think there should be a generalized solution here, implemented 
in the systemd.bbclass.

It also appears that this set is also creating a /lib dir that should 
not be there for non-systemd builds.

> ERROR: Task 25 (/home/sgw/yocto/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb, do_package) failed with exit code '1'
> ERROR: QA Issue: nfs-utils: Files/directories were installed but not shipped
>   /lib
> ERROR: QA run found fatal errors. Please consider fixing them.
> ERROR: Function failed: do_package_qa
> ERROR: Logfile of failure stored in: /home/sgw/yocto/builds/world/tmp/work/x86_64-poky-linux/nfs-utils/1.2.8-r0/temp/log.do_package.17558

Thanks
	Sau!


> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

