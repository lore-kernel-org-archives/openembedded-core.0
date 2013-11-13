Return-Path: <kirgene@gmail.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 671B86D75C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 22:20:09 +0000 (UTC)
Received: by mail-qc0-f171.google.com with SMTP id s13so667443qcv.30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 14:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=4egHn7JWJwkkQ+2icG0QyqQl3HnlbMFCW9M3tsl9GFQ=;
	b=ctY6EQamnAOFmK5gtEnkHuyrTnLfUVjrwD0R4qR8xo4Dl+Di5m8VoZdgLHemW2Se18
	p9mFzJGerbazAOvFSH6JESJyIV2yeSKcTud9ctvI/D+jCccTrRvNF4znq8T+9iqu9cX0
	cRw8E8O3osv2hDPhuLZ+YjJJQVXmAmHPnm8BkKKEMKEI17u6KdRlPdGQ64N2qY3dE+YL
	bg/Hk977wIaJXa8jp2ZVrPtwD2uircxgXU2sWA+lAhudeaCvlZPVTxaY2ncHTxf9+rAi
	VPLUdnB8jS7Q98tp0Oh4glKOe3EooKouxKWmtRnReWrHLNL8HtMpJWLmi/IDt1JvUb28
	U5Bg==
MIME-Version: 1.0
X-Received: by 10.224.119.76 with SMTP id y12mr60251945qaq.58.1384381210901;
	Wed, 13 Nov 2013 14:20:10 -0800 (PST)
Received: by 10.96.55.197 with HTTP; Wed, 13 Nov 2013 14:20:10 -0800 (PST)
In-Reply-To: <5283B95F.1090108@linux.intel.com>
References: <1384354266-15425-1-git-send-email-kirgene@gmail.com>
	<5283AA52.4090102@linux.intel.com>
	<CADV-EXGSZuXVO7DqgGUnxCzNQUYXyCtNt1XXAbEAuN9gWisPSA@mail.gmail.com>
	<5283B95F.1090108@linux.intel.com>
Date: Thu, 14 Nov 2013 00:20:10 +0200
Message-ID: <CADV-EXFh8Q+P2QXcPgt-u02OocZD=_cu5cKfZu_pByr0e-LnUQ@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Phil Blundell <philb@gnu.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] curl: allow build with c-ares library support.
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
X-List-Received-Date: Wed, 13 Nov 2013 22:20:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

2013/11/13 Saul Wold <sgw@linux.intel.com>:
> On 11/13/2013 09:25 AM, Yevhen Kyriukha wrote:
>>
>> 2013/11/13 Saul Wold <sgw@linux.intel.com>:
>>>
>>> On 11/13/2013 06:51 AM, Yevhen Kyriukha wrote:
>>>>
>>>>
>>>> Also added c-ares library recipe.
>>>>
>>>> In libcurl there is an issue with DNS lookups that cause crash on some
>>>> platforms:
>>>> http://curl.haxx.se/mail/lib-2008-09/0197.html
>>>> To avoid this issue libcurl has to be built with c-ares name resolver.
>>>>
>>> This still does not fully explain why this is needed. Nor credits to
>>> origin
>>> of the c-ares recipe.
>>>
>>
>> Do you meen to note layer name where I get this recipe from in commit?
>> The c-ares recipe was borrowed from meta-webos-ports.
>>
> Yes, you need to say that as part of your patch, but I still want more
> details below about using the internal threaded resolver before we add a new
> recipe.
>
>
>>> You also did not address Phil Blundell's comment about causing other
>>> issues,
>>> and possibibly using the existing libcurl internal threaded resolver.
>>>
>>> Can you test with the internal resolver to see if it address your issues,
>>> before we add a new recipe.
>>>
>>
>> As far as I've tested curl crashes on i386 and Intel Cedartrail
>> platforms with internal threaded resolver.
>>
> Did you explictly enable the threaded resolver with
> --enable-threaded-resolver?
>
> Thanks
>         Sau!
>
>
>
>> Best regards,
>> Yevhen
>>
>>>
>>>> Signed-off-by: Yevhen Kyriukha <kirgene@gmail.com>
>>>> ---
>>>>    meta/recipes-support/c-ares/c-ares_1.10.0.bb | 24
>>>> ++++++++++++++++++++++++
>>>>    meta/recipes-support/curl/curl_7.33.0.bb     |  2 ++
>>>>    2 files changed, 26 insertions(+)
>>>>    create mode 100644 meta/recipes-support/c-ares/c-ares_1.10.0.bb
>>>>
>>>
>>> This still needs to be split into 2 distict patches, one adding the
>>> c-ares
>>> recipe and a second one to use the PACKAGECONFIG.
>>>
>>> Sau!
>>>
>>>
>>>> diff --git a/meta/recipes-support/c-ares/c-ares_1.10.0.bb
>>>> b/meta/recipes-support/c-ares/c-ares_1.10.0.bb
>>>> new file mode 100644
>>>> index 0000000..23b3d0e
>>>> --- /dev/null
>>>> +++ b/meta/recipes-support/c-ares/c-ares_1.10.0.bb
>>>> @@ -0,0 +1,24 @@
>>>> +# Copyright (c) 2012-2013 LG Electronics, Inc.
>>>> +
>>>> +DESCRIPTION = "c-ares is a C library that resolves names
>>>> asynchronously."
>>>> +HOMEPAGE = "http://daniel.haxx.se/projects/c-ares/"
>>>> +SECTION = "libs"
>>>> +LICENSE = "MIT"
>>>> +LIC_FILES_CHKSUM =
>>>>
>>>> "file://README;beginline=17;endline=18;md5=b320556568bc067d215a1e34c5b34a14"
>>>> +
>>>> +inherit autotools
>>>> +inherit pkgconfig
>>>> +
>>>> +SRC_URI = "http://c-ares.haxx.se/download/${BP}.tar.gz"
>>>> +SRC_URI[md5sum] = "1196067641411a75d3cbebe074fd36d8"
>>>> +SRC_URI[sha256sum] =
>>>> "3d701674615d1158e56a59aaede7891f2dde3da0f46a6d3c684e0ae70f52d3db"
>>>> +
>>>> +EXTRA_OECONF = "--enable-shared"
>>>> +
>>>> +# install private headers to ares subdirectory
>>>> +do_install_append() {
>>>> +    install -d ${D}/${includedir}/ares
>>>> +    install -m 0644 ares*.h ${D}/${includedir}/ares/
>>>> +}
>>>> +
>>>> +FILES_${PN}-dev += "${includedir}/ares/*.h"
>>>> diff --git a/meta/recipes-support/curl/curl_7.33.0.bb
>>>> b/meta/recipes-support/curl/curl_7.33.0.bb
>>>> index 8539fec..717c4f9 100644
>>>> --- a/meta/recipes-support/curl/curl_7.33.0.bb
>>>> +++ b/meta/recipes-support/curl/curl_7.33.0.bb
>>>> @@ -23,6 +23,8 @@ SRC_URI[sha256sum] =
>>>> "0afde4cd949e2658eddc3cda675b19b165eea1af48ac5f3e1ec1607922
>>>>
>>>>    inherit autotools pkgconfig binconfig
>>>>
>>>> +PACKAGECONFIG[c-ares] = "--enable-ares,--disable-ares,c-ares"
>>>> +
>>>>    EXTRA_OECONF = "--with-zlib=${STAGING_LIBDIR}/../ \
>>>>                    --without-libssh2 \
>>>>                    --with-random=/dev/urandom \
>>>>
>>>
>>
>>
>> Best regards,
>> Yevhen
>>
>>
>

Hmm... I thought that threaded resolver is used by default.
I had "longjmp causes uninitialized stack frame" error but enabling
threaded resolver explicitly fixed the problem.

Anyway I think that adding c-ares support in curl is good idea.
I'll prepare new version of patch (without mention of issue) if there
is no objections.

And in this case maybe it will be better to use threaded resolver by
default if c-ares is not specified.

How do you think?

Regards,
Yevhen

