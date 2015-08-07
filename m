Return-Path: <armccurdy@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id B52FB755F8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 18:09:59 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so69184320wic.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Aug 2015 11:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=965Mg4dGd3JdLBDN7lM+Z5+ql0XY9+acHSRICMy+mnA=;
	b=ks8VDRdKPrlaLFGbqmW2T2LU+2NxnkcK+Rxo/ahicC8AOEPpatQqgkx92plSrGknUk
	ryB0AzUoZqRoWJiRklrNPJd0r9Qt9n1np0rbCqVriLici6dDTloKTgDQYUaablA6zYLO
	POEwdzKVVNq7BoniIeZuN8m61nrnsA9+XxFBIK3FAB1ZRP4B1F+jusDlk9ipYYvFQ7Mq
	bEtC3RAsnqIj0rz9ql32mcULD5vq1sOg0TMZYm7sE3ICpjchG9tulVrP2ToWmjhefnAy
	LUJULAOlopkdYZQWPLfXEet89U7su8MngsI44Wk5KJ4gR9sZGfMJNhmV6FQuceatEFPQ
	90oA==
MIME-Version: 1.0
X-Received: by 10.194.21.230 with SMTP id y6mr19162404wje.132.1438970999191;
	Fri, 07 Aug 2015 11:09:59 -0700 (PDT)
Received: by 10.194.236.166 with HTTP; Fri, 7 Aug 2015 11:09:59 -0700 (PDT)
In-Reply-To: <CAMKF1sr34efvDCOResE8Xu0ag-KnEMw62e10_rr-u8J6fWnHKg@mail.gmail.com>
References: <1438912459-7242-1-git-send-email-armccurdy@gmail.com>
	<1438912459-7242-2-git-send-email-armccurdy@gmail.com>
	<CAMKF1sr34efvDCOResE8Xu0ag-KnEMw62e10_rr-u8J6fWnHKg@mail.gmail.com>
Date: Fri, 7 Aug 2015 11:09:59 -0700
Message-ID: <CAJ86T=VsaqANDJ77YvmC+dOEL6_ndgTUP6t+AVRPDOgXF-EBNA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] uclibc.inc: remove unused UCLIBC_EXTRA_LDFLAGS
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
X-List-Received-Date: Fri, 07 Aug 2015 18:10:03 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 6, 2015 at 7:12 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Aug 6, 2015 at 6:54 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  meta/recipes-core/uclibc/uclibc.inc | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
>> index 08465c4..c483228 100644
>> --- a/meta/recipes-core/uclibc/uclibc.inc
>> +++ b/meta/recipes-core/uclibc/uclibc.inc
>> @@ -59,7 +59,6 @@ export V="2"
>>  #
>>  CFLAGS_arm := "${@oe_filter_out('-fno-omit-frame-pointer', '${CFLAGS}', d)}"
>>  UCLIBC_EXTRA_CFLAGS  := "${@oe_filter_out('(-I\S+|-i\S+)', '${CFLAGS}', d)}"
>> -UCLIBC_EXTRA_LDFLAGS := "${@oe_filter_out('(-L\S+|-l\S+)', '${LDFLAGS}', d)}"
>>
>
> those variables are part of .config so please make sure that they are
> really redundant and dont make into .config

UCLIBC_EXTRA_LDFLAGS isn't used anywhere in the recipe and it's not
exported via the run.do_configure or run.do_compile scripts, so I
think it safe to remove. It's not part of uclibc's .config file.

UCLIBC_EXTRA_CFLAGS is used in the recipe and does need to stay.


>>  do_compile_prepend () {
>>    unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

