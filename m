Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 03EBB6E667
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 14:36:54 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id j37so3914295qta.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 07:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5YyHRUxpHihf+AdVdYhKbJw1AgAs3gkmBDVncsjq5u4=;
	b=vpoPAmhATKaBdWkXJmjAfvvZ2nVVRdxcyKlCxYJ2sLMisEQqNoTC67D3ArUZvVxNu3
	OyEiG8n5nWHZqTvGrPioURqw2DEPtgJfWXR18Tdaphf68w6KenAQSfzDM7gcOQ/c72s+
	WK3rGZAYPj4tfR9oOBe8QgTMbRcK5dH0WNyuzEj4PNXJfqNwdtiujDSIIcYB98EVZjK+
	K7BDLIEkAqJ3hTreOGzLHX3ud7p5LtNAaY6OOHCD2t5JVVTjS+zAbXD7xebdO3rNpzQc
	qBHzwUJXRr0obIUS7oYZ2JWnkZIQOckNGRKCRpE6wKzQ42yKrV8c4ICG+THgI18pvTaE
	k49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5YyHRUxpHihf+AdVdYhKbJw1AgAs3gkmBDVncsjq5u4=;
	b=bukF8Dnyw9dv0xXcgKbxX4WFkSvbYdZ8Y/EZu/YTQ7h1wtl6jZ1NHIBEMs6IAMoMHw
	XKOPUhor5NCBxXv+TSm30/Ns2XnJIputz90sWVDqy3WNWtCHcpOxySiUBGoM4h22utoa
	nmDpe01McWXegfgz1qsJn90xGzVOdDmUYKTEEs1B9yiEk4wi9c2eObY8+9Z+W7anUOb4
	GQ9k8gaQN/UtkU+/P6iwI9g57b8e2VWE2DqoEj3fzHI/ImsOPIF/qXxrh0yjL0FYBtOF
	AIVEh1/SxRa9F12CoAD7uKmWJqF9vTXDd/2ygCpCuxnNc/zs+BWE78S6+q7SG1KpJvrN
	T2HQ==
X-Gm-Message-State: ALyK8tIPLjkPzpF4lno3Vu5YWugbmcq7HlkJyMBO4AGJmYIFN6yWBNFWcLFDMEnf8RhqZqmSsDdCyd5uKQhzxA==
X-Received: by 10.200.53.103 with SMTP id z36mr29497337qtb.5.1468593415245;
	Fri, 15 Jul 2016 07:36:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Fri, 15 Jul 2016 07:36:25 -0700 (PDT)
In-Reply-To: <5788F469.6080303@gmail.com>
References: <20160715100325.29006-1-raj.khem@gmail.com>
	<5788F469.6080303@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Jul 2016 07:36:25 -0700
Message-ID: <CAMKF1somxUOv_S6SQLyGef6aJz+hK2avog96eW3XiHQh=_G-Qw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nss: Fix build on mips/clang
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
X-List-Received-Date: Fri, 15 Jul 2016 14:36:55 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 15, 2016 at 7:34 AM, akuster808 <akuster808@gmail.com> wrote:
> Does this affect Krogoth?


yes


> - armin
>
> On 07/15/2016 03:03 AM, Khem Raj wrote:
>> This issue is also reported here
>> https://trac.macports.org/ticket/51709
>> Patch is also from same ticket
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../recipes-support/nss/nss/pqg.c-ULL_addend.patch | 23 ++++++++++++++++++++++
>>  meta/recipes-support/nss/nss_3.24.bb               |  1 +
>>  2 files changed, 24 insertions(+)
>>  create mode 100644 meta/recipes-support/nss/nss/pqg.c-ULL_addend.patch
>>
>> diff --git a/meta/recipes-support/nss/nss/pqg.c-ULL_addend.patch b/meta/recipes-support/nss/nss/pqg.c-ULL_addend.patch
>> new file mode 100644
>> index 0000000..9caaaeb
>> --- /dev/null
>> +++ b/meta/recipes-support/nss/nss/pqg.c-ULL_addend.patch
>> @@ -0,0 +1,23 @@
>> +nss does not build on mips with clang because wrong types are used?
>> +
>> +pqg.c:339:16: error: comparison of constant 18446744073709551615 with expression of type 'unsigned long' is always true [-Werror,-Wtautological-constant-out-of-range-compare]
>> +     if (addend < MP_DIGIT_MAX) {
>> +       ~~~~~~ ^ ~~~~~~~~~~~~
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +Upstream-Status: Pending
>> +Index: nss-3.24/nss/lib/freebl/pqg.c
>> +===================================================================
>> +--- nss-3.24.orig/nss/lib/freebl/pqg.c
>> ++++ nss-3.24/nss/lib/freebl/pqg.c
>> +@@ -322,8 +322,8 @@ generate_h_candidate(SECItem *hit, mp_in
>> +
>> + static SECStatus
>> + addToSeed(const SECItem * seed,
>> +-          unsigned long   addend,
>> +-          int             seedlen, /* g in 186-1 */
>> ++          unsigned long long  addend,
>> ++          int                 seedlen, /* g in 186-1 */
>> +           SECItem * seedout)
>> + {
>> +     mp_int s, sum, modulus, tmp;
>> diff --git a/meta/recipes-support/nss/nss_3.24.bb b/meta/recipes-support/nss/nss_3.24.bb
>> index caed7fa..c7c9fab 100644
>> --- a/meta/recipes-support/nss/nss_3.24.bb
>> +++ b/meta/recipes-support/nss/nss_3.24.bb
>> @@ -21,6 +21,7 @@ SRC_URI = "\
>>      file://nss-fix-incorrect-shebang-of-perl.patch \
>>      file://nss-fix-nsinstall-build.patch \
>>      file://disable-Wvarargs-with-clang.patch \
>> +    file://pqg.c-ULL_addend.patch \
>>      file://nss.pc.in \
>>      file://signlibs.sh \
>>  "
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

