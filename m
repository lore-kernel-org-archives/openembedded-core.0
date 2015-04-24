Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4E7DA738EB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 08:43:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3O8h5mF008907
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 24 Apr 2015 01:43:05 -0700 (PDT)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 24 Apr 2015 01:43:05 -0700
Message-ID: <553A0217.2070109@windriver.com>
Date: Fri, 24 Apr 2015 16:43:03 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1429861978.git.liezhi.yang@windriver.com>
	<1429864276.26983.129.camel@linuxfoundation.org>
In-Reply-To: <1429864276.26983.129.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/12] Fixes for dangling patches
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
X-List-Received-Date: Fri, 24 Apr 2015 08:43:07 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/24/2015 04:31 PM, Richard Purdie wrote:
> On Fri, 2015-04-24 at 00:54 -0700, Robert Yang wrote:
>> The following changes since commit 166f2587468ae71988c610858aad3f7ef67eccba:
>>
>>    bison: don't depend on help2man (2015-04-21 11:29:30 +0100)
>>
>> are available in the git repository at:
>>
>>    git://git.openembedded.org/openembedded-core-contrib rbt/dangling
>>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/dangling
>
> There are a number of commit messages here which say "its a backport
> patch". We can see that from the Upstream-Status tag, what the commit
> message doesn't say is *why* its safe to remove.
>
> I'm guessing most of these patches have already been applied in the
> versions of the software we have but it would be good to reflect that in
> the commit messages.

Thanks, I've checked that the recipes had been upgraded for the backport
patches, I will do more strictly checking and update the commit message.

// Robert

>
> Cheers,
>
> Richard
>
>> Robert Yang (12):
>>    python3: remove sys_platform_is_now_always_linux2.patch
>>    mtd-utils: enable
>>      mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch
>>    nspr: remove nspr-CVE-2014-1545.patch
>>    libxml2: remove libxml2-CVE-2014-3660.patch
>>    bind: remove 5 backport patches
>>    logrotate: remove logrotate-CVE-2011-1548.patch
>>    kmod: remove 0001-Makefile.am-fix-parallel-build-problem.patch
>>    openssl: remove 3 patches
>>    lttng-modules: remove bio-bvec-iter.patch
>>    libaio: remove libaio-generic.patch
>>    texinfo: remove enumerate_greater_than_ten.patch
>>    elfutils: enable fix-build-gcc-4.8.patch
>>
>>   .../bind/bind/bind-9.8.1-CVE-2012-5166.patch       |  119 ---------------
>>   .../bind/bind/bind-CVE-2011-4313.patch             |   89 -----------
>>   .../bind/bind/bind-CVE-2012-1667.patch             |   92 ------------
>>   .../bind/bind/bind-CVE-2013-2266.patch             |   41 -----
>>   .../bind/bind/bind-Fix-CVE-2012-4244.patch         |  141 ------------------
>>   .../openssl/openssl/debian/make-targets.patch      |   15 --
>>   ...NULL-pointer-dereference-in-dh_pub_encode.patch |   26 ----
>>   .../openssl/update-version-script-for-1.0.2.patch  |   66 ---------
>>   .../libxml/libxml2/libxml2-CVE-2014-3660.patch     |  147 ------------------
>>   meta/recipes-devtools/elfutils/elfutils_0.148.bb   |    1 +
>>   ...t-cleanmarker-with-flash_erase--j-command.patch |   22 +--
>>   meta/recipes-devtools/mtd/mtd-utils_git.bb         |    1 +
>>   .../sys_platform_is_now_always_linux2.patch        |   29 ----
>>   .../libaio/libaio/libaio-generic.patch             |   65 --------
>>   .../logrotate/logrotate-CVE-2011-1548.patch        |   43 ------
>>   .../texinfo/enumerate_greater_than_ten.patch       |   51 -------
>>   ...01-Makefile.am-fix-parallel-build-problem.patch |   29 ----
>>   .../lttng/lttng-modules/bio-bvec-iter.patch        |  156 --------------------
>>   .../nspr/nspr/nspr-CVE-2014-1545.patch             |   67 ---------
>>   19 files changed, 15 insertions(+), 1185 deletions(-)
>>   delete mode 100644 meta/recipes-connectivity/bind/bind/bind-9.8.1-CVE-2012-5166.patch
>>   delete mode 100644 meta/recipes-connectivity/bind/bind/bind-CVE-2011-4313.patch
>>   delete mode 100644 meta/recipes-connectivity/bind/bind/bind-CVE-2012-1667.patch
>>   delete mode 100644 meta/recipes-connectivity/bind/bind/bind-CVE-2013-2266.patch
>>   delete mode 100644 meta/recipes-connectivity/bind/bind/bind-Fix-CVE-2012-4244.patch
>>   delete mode 100644 meta/recipes-connectivity/openssl/openssl/debian/make-targets.patch
>>   delete mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-dh_pub_encode.patch
>>   delete mode 100644 meta/recipes-connectivity/openssl/openssl/update-version-script-for-1.0.2.patch
>>   delete mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2014-3660.patch
>>   delete mode 100644 meta/recipes-devtools/python/python3/sys_platform_is_now_always_linux2.patch
>>   delete mode 100644 meta/recipes-extended/libaio/libaio/libaio-generic.patch
>>   delete mode 100644 meta/recipes-extended/logrotate/logrotate/logrotate-CVE-2011-1548.patch
>>   delete mode 100644 meta/recipes-extended/texinfo/texinfo/enumerate_greater_than_ten.patch
>>   delete mode 100644 meta/recipes-kernel/kmod/kmod/0001-Makefile.am-fix-parallel-build-problem.patch
>>   delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/bio-bvec-iter.patch
>>   delete mode 100644 meta/recipes-support/nspr/nspr/nspr-CVE-2014-1545.patch
>>
>> --
>> 1.7.9.5
>>
>
>
>
>

