Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5B50A6098F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 07:11:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5H7B0GL005625
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Jun 2013 00:11:00 -0700 (PDT)
Received: from [128.224.162.189] (128.224.162.189) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 17 Jun 2013 00:11:00 -0700
Message-ID: <51BEB682.30702@windriver.com>
Date: Mon, 17 Jun 2013 15:10:58 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1371450622-3850-1-git-send-email-jackie.huang@windriver.com>
	<C5D1E420-8F11-410E-B763-C631248F2113@gmail.com>
In-Reply-To: <C5D1E420-8F11-410E-B763-C631248F2113@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libproxy_0.4.7 do_unpack failed of qemuppc_world
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
X-List-Received-Date: Mon, 17 Jun 2013 07:11:02 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 6/17/2013 3:02 PM, Khem Raj wrote:
>
> On Jun 16, 2013, at 11:30 PM, jackie.huang@windriver.com wrote:
>
>> From: Jackie Huang <jackie.huang@windriver.com>
>>
>> The tarball from upstream shows many lines of....
>>
>>    tar: Ignoring unknown extended header keyword
>>       `LIBARCHIVE.xattr.security.selinux'
>>    tar: Ignoring unknown extended header keyword `SCHILY.dev'
>>    tar: Ignoring unknown extended header keyword `SCHILY.ino'
>>    tar: Ignoring unknown extended header keyword `SCHILY.nlink'
>>
>> Replacing it with the .zip file from upstream
>
> maybe now it would better to add zip-native to DEPENDS ?

I think the base.bbclass have added this:

     # unzip-native should already be staged before unpacking ZIP recipes
     if ".zip" in srcuri:
         d.appendVarFlag('do_unpack', 'depends', ' 
unzip-native:do_populate_sysroot')

Thanks,
Jackie

>
>>
>> Signed-off-by: Amy Fong <amy.fong@windriver.com>
>> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>> ---
>> meta/recipes-support/libproxy/libproxy_0.4.7.bb |    8 ++++----
>> 1 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-support/libproxy/libproxy_0.4.7.bb b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
>> index 89f22b8..30abc27 100644
>> --- a/meta/recipes-support/libproxy/libproxy_0.4.7.bb
>> +++ b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
>> @@ -8,16 +8,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7d7044444a7b1b116e8783edcdb44ff4 \
>>
>> DEPENDS = "gconf glib-2.0"
>>
>> -PR = "r5"
>> +PR = "r6"
>>
>> -SRC_URI = "http://libproxy.googlecode.com/files/libproxy-${PV}.tar.gz \
>> +SRC_URI = "http://libproxy.googlecode.com/files/libproxy-${PV}.zip \
>>             file://g++-namepace.patch \
>>             file://libproxy_fix_for_gcc4.7.patch \
>>             file://libproxy-0.4.7-CVE-2012-4504.patch \
>>            "
>>
>> -SRC_URI[md5sum] = "509e03a488a61cd62bfbaf3ab6a2a7a5"
>> -SRC_URI[sha256sum] = "8fe0a58810139ba3c2e186deccf3e68adcd127aa0e972b0862b30b3dde493797"
>> +SRC_URI[md5sum] = "62585570de17d10f03a5a63b701ffd52"
>> +SRC_URI[sha256sum] = "429a19c57d9990349d622beecc805b23051caa62a478066bff5d9a312a8937be"
>>
>> inherit cmake pkgconfig
>>
>> --
>> 1.7.4.1
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745

