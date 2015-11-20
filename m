Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 862E160118
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 23:43:39 +0000 (UTC)
Received: by igvg19 with SMTP id g19so42513130igv.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 15:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=6w1mABzaXGPyQcY2nY4VPIoiPv3rFcEGMtHRlxd2xPY=;
	b=LLiiVZkXuOS6UOw9sFDbq2n7PjT8RjSzY6mw0GZMbMqfKdy50kgHLU84yLC+2GgXhS
	B6nnoQo+RoqQ89FfpOTlZV9vu7orzGI9cv0D9VJH+RdpXy679Vldx1MTptxyT3EePenp
	rP7CKy/HMAnwqvGFvDt0i15BTvIkUOTa2L3GwS+sfe3wM0wgQzL0eINcGBh5kXDc0LWb
	wdlXOA0F8dpCGHxGXZWKa2TqgglSgqd6Kr2LWJ+wZDMIpMD3zE4ekHMkOlnil5ccMhif
	W/b+cnDaH/F3WWIAuok3/iOlOy+CvSgNftosj1E6irdjKiZxPA5vKqIOVODNRu2lE1Kj
	T4jg==
X-Received: by 10.50.138.3 with SMTP id qm3mr2628899igb.11.1448063020177; Fri,
	20 Nov 2015 15:43:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.12.205 with HTTP; Fri, 20 Nov 2015 15:43:10 -0800 (PST)
In-Reply-To: <564F4068.8030701@collabora.co.uk>
References: <1447944434-63631-1-git-send-email-adrian.calianu@enea.com>
	<564F4068.8030701@collabora.co.uk>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 20 Nov 2015 15:43:10 -0800
Message-ID: <CAMKF1soWaQ9NGetzHap6YLyK+qjdL2Cc3iGits4i6HqjtPT1Wg@mail.gmail.com>
To: Joshua Lock <joshua.lock@collabora.co.uk>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [fido][PATCH] [AArch64] Fix the big endian loader name
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
X-List-Received-Date: Fri, 20 Nov 2015 23:43:42 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 20, 2015 at 7:46 AM, Joshua Lock
<joshua.lock@collabora.co.uk> wrote:
> Adrian,
>
> On 19/11/15 14:47, Adrian Calianu wrote:
>>
>> Backported from glibc 2.22 (master)
>
>
> Thanks for this change, after fleshing out the commit message a bit[1] I've
> queued it for inclusion in my latest pull request for fido.

it should get into master first so if you refined the commit message
then please repost it for master.

>
> Regards,
>
> Joshua
>
> 1.
> http://cgit.openembedded.org/openembedded-core-contrib/commit/?h=joshuagl/fido-next&id=513e52670ea52e8143f46777accf441bb5c299fa
>
>
>> Signed-off-by: Adrian Calianu <adrian.calianu@enea.com>
>> ---
>>   .../AArch64-Fix-the-big-endian-loader-name.patch   | 49
>> ++++++++++++++++++++++
>>   meta/recipes-core/glibc/glibc_2.21.bb              |  1 +
>>   2 files changed, 50 insertions(+)
>>   create mode 100644
>> meta/recipes-core/glibc/glibc/AArch64-Fix-the-big-endian-loader-name.patch
>>
>> diff --git
>> a/meta/recipes-core/glibc/glibc/AArch64-Fix-the-big-endian-loader-name.patch
>> b/meta/recipes-core/glibc/glibc/AArch64-Fix-the-big-endian-loader-name.patch
>> new file mode 100644
>> index 0000000..fd2bd8e
>> --- /dev/null
>> +++
>> b/meta/recipes-core/glibc/glibc/AArch64-Fix-the-big-endian-loader-name.patch
>> @@ -0,0 +1,49 @@
>> +[AArch64] Fix the big endian loader name
>> +
>> +Signed-off-by: Szabolcs Nagy  <szabolcs.nagy@arm.com>
>> +
>> +The patch was imported from the glibc's official git server
>> +(https://sourceware.org/git/?p=glibc.git) as of commit id
>> +44cb254f9a024db33ba549e59dc9d90355b797c9.
>> +
>> +Fixed conflicts raised on glibc 2.21.
>> +
>> +Upstream-Status: Backport [glibc 2.22]
>> +
>> +Signed-off-by: Adrian Calianu <adrian.calianu@enea.com>
>> +---
>> + ChangeLog   | 5 +++++
>> + config.h.in | 3 +++
>> + 2 files changed, 8 insertions(+)
>> +
>> +diff --git a/ChangeLog b/ChangeLog
>> +index dc1ed1b..503ad41 100644
>> +--- a/ChangeLog
>> ++++ b/ChangeLog
>> +@@ -56278,4 +56278,9 @@
>> +       added check.  Only act on the data if no current modification
>> +       happened.
>> +
>> ++2015-05-01  Szabolcs Nagy  <szabolcs.nagy@arm.com>
>> ++
>> ++    * config.h.in (HAVE_AARCH64_BE): Add.
>> ++
>> ++
>> + See ChangeLog.17 for earlier changes.
>> +diff --git a/config.h.in b/config.h.in
>> +index 695ca35..85c1761 100644
>> +--- a/config.h.in
>> ++++ b/config.h.in
>> +@@ -114,6 +114,9 @@
>> +    include/libc-symbols.h that avoid PLT slots in the shared objects.
>> */
>> + #undef        NO_HIDDEN
>> +
>> ++/* AArch64 big endian ABI */
>> ++#undef HAVE_AARCH64_BE
>> ++
>> +
>> + /* Defined to some form of __attribute__ ((...)) if the compiler
>> supports
>> +    a different, more efficient calling convention.  */
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-core/glibc/glibc_2.21.bb
>> b/meta/recipes-core/glibc/glibc_2.21.bb
>> index a0b2f2d..3bba734 100644
>> --- a/meta/recipes-core/glibc/glibc_2.21.bb
>> +++ b/meta/recipes-core/glibc/glibc_2.21.bb
>> @@ -30,6 +30,7 @@ SRC_URI =
>> "git://sourceware.org/git/glibc.git;branch=${BRANCH} \
>>              file://Fix-__memcpy_chk-on-non-SSE2-CPUs.patch \
>>              ${EGLIBCPATCHES} \
>>              ${CVEPATCHES} \
>> +           file://AArch64-Fix-the-big-endian-loader-name.patch \
>>             "
>>   EGLIBCPATCHES = "\
>>              file://timezone-re-written-tzselect-as-posix-sh.patch \
>>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

