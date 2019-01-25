Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C56876086F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 02:18:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0P2I8wu031329
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 24 Jan 2019 18:18:18 -0800
Received: from localhost.corp.ad.wrs.com (128.224.163.177) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 24 Jan 2019 18:17:57 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1548313400.git.liezhi.yang@windriver.com>
	<a0f8078a8e439288441f29fd2d152265b7cc767f.1548313400.git.liezhi.yang@windriver.com>
	<CAJTo0LbYj7GnSvosGqNMsnsTR8Ty=DfZW_oTaijvjPYG=Hp7gg@mail.gmail.com>
	<31ac6abb-9154-6280-9950-6c90692d099f@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <4c1144f4-7274-6cb0-d16c-3cca03882f6e@windriver.com>
Date: Fri, 25 Jan 2019 10:22:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <31ac6abb-9154-6280-9950-6c90692d099f@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] fontconfig: Fix define for HAVE_POSIX_FADVISE
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
X-List-Received-Date: Fri, 25 Jan 2019 02:18:45 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 1/25/19 9:38 AM, Robert Yang wrote:
> Hi Ross,
> 
> On 1/24/19 10:33 PM, Burton, Ross wrote:
>> Please send this upstream.
> 
> I tried a few times to subscribe fontconfig@lists.freedesktop.org, but it
> requires manual approval, I didn't receive the approval after about 1 month.
> 
> I tried it again just now, let's see what will happen.

Strangely, it doesn't require manual approval now, so I subscribed it just now
and sent the patch to upstream:

https://lists.freedesktop.org/archives/fontconfig/2019-January/thread.html

It is not in the archive yet.

// Robert

> 
> // Robert
> 
>>
>> Ross
>>
>> On Thu, 24 Jan 2019 at 06:46, Robert Yang <liezhi.yang@windriver.com> wrote:
>>>
>>> Otherwise, there would be build errors in the following 2 cases:
>>> * define HAVE_POSIX_FADVISE
>>> Or:
>>> * undef HAVE_POSIX_FADVISE
>>>
>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>> ---
>>>   ...cache.c-Fix-define-for-HAVE_POSIX_FADVISE.patch | 33 ++++++++++++++++++++++
>>>   .../fontconfig/fontconfig_2.12.6.bb                |  1 +
>>>   2 files changed, 34 insertions(+)
>>>   create mode 100644 
>>> meta/recipes-graphics/fontconfig/fontconfig/0001-src-fccache.c-Fix-define-for-HAVE_POSIX_FADVISE.patch 
>>>
>>>
>>> diff --git 
>>> a/meta/recipes-graphics/fontconfig/fontconfig/0001-src-fccache.c-Fix-define-for-HAVE_POSIX_FADVISE.patch 
>>> b/meta/recipes-graphics/fontconfig/fontconfig/0001-src-fccache.c-Fix-define-for-HAVE_POSIX_FADVISE.patch 
>>>
>>> new file mode 100644
>>> index 0000000..07b2d65
>>> --- /dev/null
>>> +++ 
>>> b/meta/recipes-graphics/fontconfig/fontconfig/0001-src-fccache.c-Fix-define-for-HAVE_POSIX_FADVISE.patch 
>>>
>>> @@ -0,0 +1,33 @@
>>> +From ab9522177a8396a51812fdbebb6387df451a8499 Mon Sep 17 00:00:00 2001
>>> +From: Robert Yang <liezhi.yang@windriver.com>
>>> +Date: Mon, 24 Dec 2018 11:03:58 +0800
>>> +Subject: [PATCH] src/fccache.c: Fix define for HAVE_POSIX_FADVISE
>>> +
>>> +Otherwise, there would be build errors in the following 2 cases:
>>> +* define HAVE_POSIX_FADVISE
>>> +Or:
>>> +* undef HAVE_POSIX_FADVISE
>>> +
>>> +Upstream-Status: Pending
>>> +
>>> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>> +---
>>> + fccache.c |    2 +-
>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>> +
>>> +diff --git a/src/fccache.c b/src/fccache.c
>>> +index 6f3c68a..85cc4b4 100644
>>> +--- a/src/fccache.c
>>> ++++ b/src/fccache.c
>>> +@@ -700,7 +700,7 @@ FcDirCacheMapFd (FcConfig *config, int fd, struct stat 
>>> *fd_stat, struct stat *di
>>> +     {
>>> + #if defined(HAVE_MMAP) || defined(__CYGWIN__)
>>> +       cache = mmap (0, fd_stat->st_size, PROT_READ, MAP_SHARED, fd, 0);
>>> +-#if (HAVE_POSIX_FADVISE) && defined(POSIX_FADV_WILLNEED)
>>> ++#if defined(HAVE_POSIX_FADVISE) && defined(POSIX_FADV_WILLNEED)
>>> +       posix_fadvise (fd, 0, fd_stat->st_size, POSIX_FADV_WILLNEED);
>>> + #endif
>>> +       if (cache == MAP_FAILED)
>>> +--
>>> +2.7.4
>>> +
>>> diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb 
>>> b/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
>>> index 6128d5e..beeae7f 100644
>>> --- a/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
>>> +++ b/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
>>> @@ -23,6 +23,7 @@ DEPENDS = "expat freetype zlib gperf-native"
>>>   SRC_URI = "http://fontconfig.org/release/fontconfig-${PV}.tar.gz \
>>>              file://revert-static-pkgconfig.patch \
>>>              file://0001-src-fcxml.c-avoid-double-free-of-filename.patch \
>>> +           file://0001-src-fccache.c-Fix-define-for-HAVE_POSIX_FADVISE.patch \
>>>              "
>>>
>>>   SRC_URI[md5sum] = "00e748c67fad11e7057a71ed385e8bdb"
>>> -- 
>>> 2.7.4
>>>
>>> -- 
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>

