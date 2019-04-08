Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8D21060079
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Apr 2019 02:14:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x382E9Xe002473
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 7 Apr 2019 19:14:09 -0700 (PDT)
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Sun, 7 Apr 2019 19:14:09 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1554196113-200535-1-git-send-email-changqing.li@windriver.com>
	<CAJTo0LYUXZAW7ewEa_5=3eZm-mey-vBq6vkdZ2NX8gYW4Uz4zw@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <1696d9ef-30d6-23f0-e2ea-2f25403c304d@windriver.com>
Date: Mon, 8 Apr 2019 10:14:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYUXZAW7ewEa_5=3eZm-mey-vBq6vkdZ2NX8gYW4Uz4zw@mail.gmail.com>
X-Originating-IP: [128.224.162.228]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cogl: fix compile error with -Werror=maybe-uninitialized
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
X-List-Received-Date: Mon, 08 Apr 2019 02:14:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 4/4/19 9:42 PM, Burton, Ross wrote:
> +Upstream-Status: Submitted
> [https://github.com/GNOME/cogl/pull/4/commits/be7a7b983952d3f2ce2cbaa7b89f413b92e15066]
The pull request has automatically  forwarded to GNOME gitlab,  I will 
send a V2 to fix this.
>
> That's a GNOME mirror, note how your PR was closed.  GNOME is at
> gitlab.gnome.org.
>
> Ross
>
> On Tue, 2 Apr 2019 at 10:37, <changqing.li@windriver.com> wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> fix below compile error with -Werror=maybe-uninitialized
>>
>> | ../../cogl-1.22.2/cogl/driver/gl/gles/cogl-driver-gles.c:217:17: error: 'gltype' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>> |      *out_gltype = gltype;
>> |      ~~~~~~~~~~~~^~~~~~~~
>> | ../../cogl-1.22.2/cogl/driver/gl/gles/cogl-driver-gles.c:213:22: error: 'glintformat' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>> |      *out_glintformat = glintformat;
>> |      ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   ...mpile-error-with-Werror-maybe-uninitializ.patch | 40 ++++++++++++++++++++++
>>   meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb      |  4 ++-
>>   2 files changed, 43 insertions(+), 1 deletion(-)
>>   create mode 100644 meta/recipes-graphics/cogl/cogl-1.0/0001-cogl-fix-compile-error-with-Werror-maybe-uninitializ.patch
>>
>> diff --git a/meta/recipes-graphics/cogl/cogl-1.0/0001-cogl-fix-compile-error-with-Werror-maybe-uninitializ.patch b/meta/recipes-graphics/cogl/cogl-1.0/0001-cogl-fix-compile-error-with-Werror-maybe-uninitializ.patch
>> new file mode 100644
>> index 0000000..3c99d25
>> --- /dev/null
>> +++ b/meta/recipes-graphics/cogl/cogl-1.0/0001-cogl-fix-compile-error-with-Werror-maybe-uninitializ.patch
>> @@ -0,0 +1,40 @@
>> +From e05ee89fcc978fceccab3e4724a3a37f7a338499 Mon Sep 17 00:00:00 2001
>> +From: Changqing Li <changqing.li@windriver.com>
>> +Date: Tue, 2 Apr 2019 14:48:49 +0800
>> +Subject: [PATCH] cogl: fix compile error with -Werror=maybe-uninitialized
>> +
>> +fix below compile error with -Werror=maybe-uninitialized
>> +
>> +| ../../cogl-1.22.2/cogl/driver/gl/gles/cogl-driver-gles.c:217:17: error: 'gltype' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>> +|      *out_gltype = gltype;
>> +|      ~~~~~~~~~~~~^~~~~~~~
>> +| ../../cogl-1.22.2/cogl/driver/gl/gles/cogl-driver-gles.c:213:22: error: 'glintformat' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>> +|      *out_glintformat = glintformat;
>> +|      ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
>> +
>> +Upstream-Status: Submitted [https://github.com/GNOME/cogl/pull/4/commits/be7a7b983952d3f2ce2cbaa7b89f413b92e15066]
>> +
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> +---
>> + cogl/driver/gl/gles/cogl-driver-gles.c | 4 ++--
>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/cogl/driver/gl/gles/cogl-driver-gles.c b/cogl/driver/gl/gles/cogl-driver-gles.c
>> +index e94449f..a59d815 100644
>> +--- a/cogl/driver/gl/gles/cogl-driver-gles.c
>> ++++ b/cogl/driver/gl/gles/cogl-driver-gles.c
>> +@@ -74,9 +74,9 @@ _cogl_driver_pixel_format_to_gl (CoglContext *context,
>> +                                  GLenum *out_gltype)
>> + {
>> +   CoglPixelFormat required_format;
>> +-  GLenum glintformat;
>> ++  GLenum glintformat = 0;
>> +   GLenum glformat = 0;
>> +-  GLenum gltype;
>> ++  GLenum gltype = 0;
>> +
>> +   required_format = format;
>> +
>> +--
>> +2.7.4
>> +
>> diff --git a/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb b/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb
>> index 5901062..5ddeb4a 100644
>> --- a/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb
>> +++ b/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb
>> @@ -1,7 +1,9 @@
>>   require cogl-1.0.inc
>>
>>   SRC_URI += "file://test-backface-culling.c-fix-may-be-used-uninitialize.patch \
>> -            file://0001-Fix-an-incorrect-preprocessor-conditional.patch"
>> +            file://0001-Fix-an-incorrect-preprocessor-conditional.patch \
>> +            file://0001-cogl-fix-compile-error-with-Werror-maybe-uninitializ.patch \
>> +           "
>>   SRC_URI[archive.md5sum] = "d53b708ca7c4af03d7254e46945d6b33"
>>   SRC_URI[archive.sha256sum] = "39a718cdb64ea45225a7e94f88dddec1869ab37a21b339ad058a9d898782c00d"
>>
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
BRs

Sandy(Li Changqing)


