Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6E8BA75E80
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 12:28:41 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 01 Sep 2015 05:28:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,448,1437462000"; d="scan'208";a="780274219"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 01 Sep 2015 05:28:33 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id 9203F6A4087; Tue,  1 Sep 2015 05:27:42 -0700 (PDT)
Received: from 10.252.32.34 (SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Tue, 1 Sep 2015 15:27:42 +0300 (EEST)
Message-ID: <51225.10.252.32.34.1441110462.squirrel@linux.intel.com>
In-Reply-To: <51176.10.252.32.34.1441109979.squirrel@linux.intel.com>
References: <cover.1440763946.git.alexander.kanavin@linux.intel.com>
	<838cec7998682f102d8db694548d9eda8ddfe214.1440763946.git.alexander.kanavin@linux.intel.com>
	<1441040586.26554.54.camel@linuxfoundation.org>
	<51176.10.252.32.34.1441109979.squirrel@linux.intel.com>
Date: Tue, 1 Sep 2015 15:27:42 +0300 (EEST)
From: alexander.kanavin@linux.intel.com
To: alexander.kanavin@linux.intel.com
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 7/8] ccache: update to 3.2.3
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
X-List-Received-Date: Tue, 01 Sep 2015 12:28:44 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

>>
>> I suspect this resulted in:
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-rpm/builds/464/steps/BuildImages/logs/stdio
>>
>
> The issue is caused by this construct in ccache's Makefile:
>
> extra_libs = -lz
>
> ccache$(EXEEXT): $(ccache_objs) $(extra_libs)
>         $(CC) $(all_cflags) -o $@ $(ccache_objs) $(all_ldflags)
> $(extra_libs) $(LIBS)
>
>
> Yet, what is really strange, on my machine 'make' does not see such
> definition and use of extra_libs as a problem and the build succeeds fine.
>
> Does the autobuilder run a different make than I do?
>
> ak@kanavin-desktop:~/development/poky/build$ make -v
> GNU Make 4.0
> Built for x86_64-pc-linux-gnu
> ...


Nevermind, I should've dug a bit deeper:
https://git.samba.org/?p=ccache.git;a=commit;h=f74c76107933046309861680b741adc67ac2a34e

I'll resend with this patch included.


Alex


