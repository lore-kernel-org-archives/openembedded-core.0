Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9122B60991
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 08:56:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4U8uX80003510
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 May 2013 01:56:33 -0700 (PDT)
Received: from [128.224.162.232] (128.224.162.232) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 30 May 2013 01:56:31 -0700
Message-ID: <51A7143D.8050502@windriver.com>
Date: Thu, 30 May 2013 16:56:29 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1369815393.git.jackie.huang@windriver.com>
	<7daac921cf8635193b8f9654d67ccd0082fa77ed.1369815393.git.jackie.huang@windriver.com>
	<51A60A8F.40403@linux.intel.com>
In-Reply-To: <51A60A8F.40403@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] lrzsz: check locale.h in configure
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
X-List-Received-Date: Thu, 30 May 2013 08:56:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 5/29/2013 10:02 PM, Saul Wold wrote:
> On 05/29/2013 05:27 PM, jackie.huang@windriver.com wrote:
>> From: Jackie Huang <jackie.huang@windriver.com>
>>
>> fix the build failure when using -O0 in debug build:
>> lrz.c:284:13: error: 'LC_ALL' undeclared (first use in this function)
>>
>> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>> ---
>>   .../lrzsz/lrzsz-0.12.20/lrzsz-check-locale.h.patch |   26
>> ++++++++++++++++++++
>>   meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb            |    3 ++-
>>   2 files changed, 28 insertions(+), 1 deletion(-)
>>   create mode 100644
>> meta/recipes-bsp/lrzsz/lrzsz-0.12.20/lrzsz-check-locale.h.patch
>>
>> diff --git
>> a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/lrzsz-check-locale.h.patch
>> b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/lrzsz-check-locale.h.patch
>> new file mode 100644
>> index 0000000..d628a5a
>> --- /dev/null
>> +++ b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/lrzsz-check-locale.h.patch
>> @@ -0,0 +1,26 @@
>> +From 28b473c3c96682a820e292cc1be006e19aee11bc Mon Sep 17 00:00:00 2001
>> +From: Jackie Huang <jackie.huang@windriver.com>
>> +Date: Fri, 24 May 2013 01:07:24 -0400
>> +Subject: [PATCH] lrzsz check locale.h
>> +
> What about an Upstream-Status: Tag??

Upstream-Status: Submitted [uwe@ohse.de]

Do I need to re-send the patch here?

Thanks,
Jackie

>
> This looks like a resonable patch to submit upstream also, please do so.
>
> Thanks
>      Sau!
>
>> +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>> +---
>> + configure.in |    2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/configure.in b/configure.in
>> +index 6e2064c..c10460c 100644
>> +--- a/configure.in
>> ++++ b/configure.in
>> +@@ -130,7 +130,7 @@ AC_CHECK_HEADERS(fcntl.h limits.h sys/ioctl.h
>> sys/time.h unistd.h sys/times.h)
>> + LRZSZ_HEADERS_TERM_IO
>> + AC_CHECK_HEADERS(termios.h sys/termios.h termio.h sys/termio.h sgtty.h)
>> + AC_CHECK_HEADERS(sys/mman.h utime.h syslog.h sys/syslog.h sys/param.h)
>> +-AC_CHECK_HEADERS(sys/select.h strings.h arpa/inet.h)
>> ++AC_CHECK_HEADERS(sys/select.h strings.h locale.h arpa/inet.h)
>> +
>> + dnl Checks for typedefs, structures, and compiler characteristics.
>> + AC_TYPE_SIZE_T
>> +--
>> +1.7.9.5
>> +
>> diff --git a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
>> b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
>> index 83a75e3..38ce493 100644
>> --- a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
>> +++ b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
>> @@ -10,13 +10,14 @@ LIC_FILES_CHKSUM =
>> "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
>>
>> file://src/lrz.c;beginline=1;endline=10;md5=5276956373ff7d8758837f6399a1045f"
>>
>>   SECTION = "console/network"
>>   DEPENDS = ""
>> -PR = "r5"
>> +PR = "r6"
>>
>>   SRC_URI = "http://www.ohse.de/uwe/releases/lrzsz-${PV}.tar.gz \
>>          file://autotools.patch \
>>          file://makefile.patch \
>>          file://gettext.patch \
>>          file://lrzsz_fix_for_automake-1.12.patch \
>> +       file://lrzsz-check-locale.h.patch \
>>              "
>>
>>   SRC_URI[md5sum] = "b5ce6a74abc9b9eb2af94dffdfd372a4"
>>
>
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745

