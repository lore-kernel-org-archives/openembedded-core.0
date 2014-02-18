Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 47DDF6E9F6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 00:11:23 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id m12so6082799iga.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 16:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=kKVJI6rB+jMjEN4RvJLy33sSUFCguNUc4pjOeJx3rZU=;
	b=fc9CylLNwy+xHgJ7WrB29notuuPX/364dj++5D/X12ddcoxDB9MhFB0Qj2ObkjV/4w
	H1PJpd1v3y4mUdMkjMWJEjneQIAXNFOxi8wYDp8T76C+DLaYaZcB1phu43xLgvX5e+8z
	S7kmPiEz586/ytB5Y4Pz5wyfn9G9mg/03s895QnOdDVDeBBAep5B0fmDy9KNYC5qf3zl
	+xCSFe57I0K1BAi/s4VS/vurwmjQwd4v6YDnfZ+WcPwjVcjQl7W3cFlf/ilzaq63FBwX
	vNVwOM+9XnFREfF5T70XzoWJj7uiwyA3Y0Gp0fjl/1Gj5SEd0EFeZf95WJUlFGciEr/H
	+aUg==
X-Received: by 10.42.64.17 with SMTP id e17mr19673787ici.26.1392682283083;
	Mon, 17 Feb 2014 16:11:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.224.137 with HTTP; Mon, 17 Feb 2014 16:10:53 -0800 (PST)
In-Reply-To: <1392674033.14081.175.camel@ted>
References: <74162f3b1e7a4f7da6939103dfee9bb3f16c2c39.1392665521.git.raj.khem@gmail.com>
	<08134b74807c2647df869b226024213082332899.1392665521.git.raj.khem@gmail.com>
	<1392674033.14081.175.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Feb 2014 16:10:53 -0800
Message-ID: <CAMKF1so=fUnY1cfpBt80QSXEk_Xtrdi5XUbyHAnGVxfMG0q=yA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/6] icu: Disable the default LDFLAGSICUDT for target compile
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
X-List-Received-Date: Tue, 18 Feb 2014 00:11:24 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 17, 2014 at 1:53 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2014-02-17 at 11:34 -0800, Khem Raj wrote:
>
> What appears to be missing here is an explanation of why we're doing
> this? Its not in the patch header either...

right. should have done that, now I have pushed a newer patch with
some description in commit log
take a look

>
> Cheers,
>
> Richard
>
>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../0001-Disable-LDFLAGSICUDT-for-Linux.patch      |   28 ++++++++++++++++++++
>>  meta/recipes-support/icu/icu_51.2.bb               |    3 +++
>>  2 files changed, 31 insertions(+)
>>  create mode 100644 meta/recipes-support/icu/icu-51.2/0001-Disable-LDFLAGSICUDT-for-Linux.patch
>>
>> diff --git a/meta/recipes-support/icu/icu-51.2/0001-Disable-LDFLAGSICUDT-for-Linux.patch b/meta/recipes-support/icu/icu-51.2/0001-Disable-LDFLAGSICUDT-for-Linux.patch
>> new file mode 100644
>> index 0000000..2968d57
>> --- /dev/null
>> +++ b/meta/recipes-support/icu/icu-51.2/0001-Disable-LDFLAGSICUDT-for-Linux.patch
>> @@ -0,0 +1,28 @@
>> +From 0c82d6aa02c08e41b13c83b14782bd7024e25d59 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Sat, 15 Feb 2014 21:06:42 +0000
>> +Subject: [PATCH] Disable LDFLAGSICUDT for Linux
>> +
>> +Upstream-Status: Inappropriate [ OE Configuration ]
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + source/config/mh-linux |    2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/config/mh-linux b/config/mh-linux
>> +index 366f0cc..2689aab 100644
>> +--- a/config/mh-linux
>> ++++ b/config/mh-linux
>> +@@ -21,7 +21,7 @@ LD_RPATH= -Wl,-zorigin,-rpath,'$$'ORIGIN
>> + LD_RPATH_PRE = -Wl,-rpath,
>> +
>> + ## These are the library specific LDFLAGS
>> +-LDFLAGSICUDT=-nodefaultlibs -nostdlib
>> ++# LDFLAGSICUDT=-nodefaultlibs -nostdlib
>> +
>> + ## Compiler switch to embed a library name
>> + # The initial tab in the next line is to prevent icu-config from reading it.
>> +--
>> +1.7.10.4
>> +
>> diff --git a/meta/recipes-support/icu/icu_51.2.bb b/meta/recipes-support/icu/icu_51.2.bb
>> index aabe07b..2d1fd42 100644
>> --- a/meta/recipes-support/icu/icu_51.2.bb
>> +++ b/meta/recipes-support/icu/icu_51.2.bb
>> @@ -9,5 +9,8 @@ SRC_URI = "${BASE_SRC_URI} \
>>             file://add_buffer_length_check_to_UTF_16_or_32_detector.patch \
>>            "
>>
>> +SRC_URI_append_class-target = "\
>> +           file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
>> +          "
>>  SRC_URI[md5sum] = "072e501b87065f3a0ca888f1b5165709"
>>  SRC_URI[sha256sum] = "deb027a05f1b3bec03298b96fb93b28c84e9683c22e6f94effa67fdc7bd704cc"
>
>

