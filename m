Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id A7F0160124
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 01:16:51 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so104100781pab.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Nov 2015 17:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=hb3WBpJoayOXhlKSHyrpl5kVvXppnvALauhOu1JiM3E=;
	b=gKDpL3Yk4lvcOk86jFacO0iGv3RMNeJoNpINsn8q3ihac7cn2SKnYVz8AsyEkbGsOC
	K+yHxOINVuBzjGwB+H6ICxyZAnjoO7mHq4a7pLgYLdFQwhmQcxT1b6EQ0djt89EmsTut
	a/SQTJ+YKbDxnW1PYluxL0s092HrdnQU3Bhp3drFaniOCh9rNddSKjCSpFwCyJwYO8OB
	gakla53GxBseSadODRHr4qDRCUH2JavXrIAKs57gUbTt9mBi7HXzF0CSMAGNsuM6+8fT
	ZtLAJlJhCMeHb7IhuXgR5gD15gqage8qS5bt8YyZ1e9HLHesTh3qv3SJZkmNkoE2V23D
	DDUw==
X-Received: by 10.68.99.33 with SMTP id en1mr13450211pbb.34.1446772612083;
	Thu, 05 Nov 2015 17:16:52 -0800 (PST)
Received: from [10.43.100.29] ([64.2.3.194])
	by smtp.googlemail.com with ESMTPSA id
	w8sm10097835pbs.87.2015.11.05.17.16.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Nov 2015 17:16:50 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <1446160961-25182-1-git-send-email-akuster808@gmail.com>
	<563BBC15.7030407@gmail.com> <563BD1B2.2070709@collabora.co.uk>
From: akuster808 <akuster808@gmail.com>
Message-ID: <563BFF80.8000301@gmail.com>
Date: Thu, 5 Nov 2015 17:16:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <563BD1B2.2070709@collabora.co.uk>
Subject: Re: [master][jethro][fido][PATCH] libxslt: CVE-2015-7995
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
X-List-Received-Date: Fri, 06 Nov 2015 01:16:53 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 11/05/2015 02:01 PM, Joshua Lock wrote:
> On 05/11/15 20:29, akuster808 wrote:
>> Ping.
>>
>> - armin
> 
> Hi Armin,
> 
> I've pushed this change to my joshuagl/fido-next branch of
> openembedded-core-contrib and am testing it now.

thanks.

- armin
> 
> Thanks,
> 
> Joshua
> 
> 1.
> http://cgit.openembedded.org/openembedded-core-contrib/log/?h=joshuagl/fido-next
> 
> 
>>
>> On 10/29/2015 04:22 PM, Armin Kuster wrote:
>>> From: Armin Kuster <akuster@mvista.com>
>>>
>>> This is a is being give a High rating so please consider it for
>>> all 1.1.28 versions.
>>>
>>> A type confusion error within the libxslt "xsltStylePreCompute()"
>>> function in preproc.c can lead to a DoS. Confirmed in version 1.1.28,
>>> other versions may also be affected.
>>>
>>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>>> ---
>>>   .../libxslt/libxslt/CVE-2015-7995.patch            | 33
>>> ++++++++++++++++++++++
>>>   meta/recipes-support/libxslt/libxslt_1.1.28.bb     |  3 +-
>>>   2 files changed, 35 insertions(+), 1 deletion(-)
>>>   create mode 100644
>>> meta/recipes-support/libxslt/libxslt/CVE-2015-7995.patch
>>>
>>> diff --git a/meta/recipes-support/libxslt/libxslt/CVE-2015-7995.patch
>>> b/meta/recipes-support/libxslt/libxslt/CVE-2015-7995.patch
>>> new file mode 100644
>>> index 0000000..e4d09c2
>>> --- /dev/null
>>> +++ b/meta/recipes-support/libxslt/libxslt/CVE-2015-7995.patch
>>> @@ -0,0 +1,33 @@
>>> +From 7ca19df892ca22d9314e95d59ce2abdeff46b617 Mon Sep 17 00:00:00 2001
>>> +From: Daniel Veillard <veillard@redhat.com>
>>> +Date: Thu, 29 Oct 2015 19:33:23 +0800
>>> +Subject: Fix for type confusion in preprocessing attributes
>>> +
>>> +CVE-2015-7995 http://www.openwall.com/lists/oss-security/2015/10/27/10
>>> +We need to check that the parent node is an element before
>>> dereferencing
>>> +its namespace
>>> +
>>> +Upstream-Status: Backport
>>> +
>>> +https://git.gnome.org/browse/libxslt/commit/?id=7ca19df892ca22d9314e95d59ce2abdeff46b617
>>>
>>> +
>>> +Signed-off-by: Armin Kuster <akuster@mvista.com>
>>> +
>>> +---
>>> + libxslt/preproc.c | 3 ++-
>>> + 1 file changed, 2 insertions(+), 1 deletion(-)
>>> +
>>> +Index: libxslt-1.1.28/libxslt/preproc.c
>>> +===================================================================
>>> +--- libxslt-1.1.28.orig/libxslt/preproc.c
>>> ++++ libxslt-1.1.28/libxslt/preproc.c
>>> +@@ -2245,7 +2245,8 @@ xsltStylePreCompute(xsltStylesheetPtr st
>>> +     } else if (IS_XSLT_NAME(inst, "attribute")) {
>>> +         xmlNodePtr parent = inst->parent;
>>> +
>>> +-        if ((parent == NULL) || (parent->ns == NULL) ||
>>> ++        if ((parent == NULL) ||
>>> ++            (parent->type != XML_ELEMENT_NODE) || (parent->ns ==
>>> NULL) ||
>>> +         ((parent->ns != inst->ns) &&
>>> +          (!xmlStrEqual(parent->ns->href, inst->ns->href))) ||
>>> +         (!xmlStrEqual(parent->name, BAD_CAST "attribute-set"))) {
>>> diff --git a/meta/recipes-support/libxslt/libxslt_1.1.28.bb
>>> b/meta/recipes-support/libxslt/libxslt_1.1.28.bb
>>> index 166bcd8..87fabec 100644
>>> --- a/meta/recipes-support/libxslt/libxslt_1.1.28.bb
>>> +++ b/meta/recipes-support/libxslt/libxslt_1.1.28.bb
>>> @@ -10,7 +10,8 @@ DEPENDS = "libxml2"
>>>
>>>   SRC_URI = "ftp://xmlsoft.org/libxslt//libxslt-${PV}.tar.gz \
>>>              file://pkgconfig_fix.patch \
>>> -           file://pkgconfig.patch"
>>> +           file://pkgconfig.patch \
>>> +           file://CVE-2015-7995.patch"
>>>
>>>   SRC_URI[md5sum] = "9667bf6f9310b957254fdcf6596600b7"
>>>   SRC_URI[sha256sum] =
>>> "5fc7151a57b89c03d7b825df5a0fae0a8d5f05674c0e7cf2937ecec4d54a028c"
>>>
> 

