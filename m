Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id B9E2B77E34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 23:26:41 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id u18so22568726wrc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Qd4BWLGuJgJY73ZCJXG/lTJLdExtGvOlzxdPcz46FtQ=;
	b=Kn0bM5kPY8fUnY+j4m/o0OWfIb1NpKMcNqmJvQ/+PQNB1V5ZqrOz3RcPGJEZ3qOg1I
	bJkv9JBtBPBcapp7iG5pNHTW7OIAV/nAaHp+yqSMwa7b2PRcLh4DZ1sxQQXRKRWxlXzB
	QJbK8865Mq38NeyMa90CX3zZrNPiw5m+jotN+leXLUiGYX4wVlz633NPPdqehp2U+IJo
	J0X0WAKdsGetDTdlkODvImBKlJrn5A74Jw40cBfvYE7WRDJ+RUPiPuGag0Nyj0ceKUmW
	3oiR8FuYptt2O9Q7jBYsvOYJRa7TIvd47AmMxrhnJbDEDAjg43MP2/wnrnZBvTT9DskO
	VtRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Qd4BWLGuJgJY73ZCJXG/lTJLdExtGvOlzxdPcz46FtQ=;
	b=hLLe3jpvyJilgpS2hArm+PKKdrdOQyTXLuh9wODS8OGzdSa1lgocYhWlLBhTk/bCWY
	HZwucF+5OnzyvXXXQmipPt64F/FQrBO0bK4PBLZCrgp1AGXFwmzoFKQAD80upj2Z6qpL
	7t5nUPJbx0TXZfHqppRD/jX+TFHRbGh70B+w2RFyG3mtKpBRloV0AvqavcSONv01MheW
	+tCeqYTZeJXBTpiLopRmykEkMqRsis6jzkwiYAIPm6wpARJpFqW89yyQkBWYTXxcAedZ
	eWIKKUccC8oJQGYDQt+Zfi+NRoD0VnU/JDu/RnNmt6FWsifxnb0yYkaSeUxRayngypvV
	ex6A==
X-Gm-Message-State: AFeK/H2jUPSDOdhW8ff+pLLM8Ez0imkbkfPw+4F8R3OVDjbwkpZ1oRbU8qG+mBXokVgbMlpXHMpOqQS8aDdWOw==
X-Received: by 10.223.181.135 with SMTP id c7mr1243652wre.19.1491002802259;
	Fri, 31 Mar 2017 16:26:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.152.55 with HTTP; Fri, 31 Mar 2017 16:26:41 -0700 (PDT)
In-Reply-To: <CAMKF1sp=tgkByXMiELBa+K1=mQ5=ggr-7TwkTdK9m7ieGeeEPg@mail.gmail.com>
References: <1490995693-19005-1-git-send-email-juro.bystricky@intel.com>
	<CAMKF1sp=tgkByXMiELBa+K1=mQ5=ggr-7TwkTdK9m7ieGeeEPg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 31 Mar 2017 16:26:41 -0700
Message-ID: <CAJ86T=VWV2VZQkJnNLZQ5WdhPaXRbiGM3qVguOqvvQW5ZtJBkg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: richard.purdie@intel.com,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ncurses_6.0: Improve reproducibility
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
X-List-Received-Date: Fri, 31 Mar 2017 23:26:42 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 31, 2017 at 3:27 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Fri, Mar 31, 2017 at 2:29 PM Juro Bystricky <juro.bystricky@intel.com>
> wrote:
>>
>> Build static libraries without the binutils "ar" -U option.
>> This option deliberately breaks deterministic mode.
>
> While this patch is ok it would be better if we configured binutils with
> enable-deterministic-archives option please file a ticket for it

We already do that:

  http://git.openembedded.org/openembedded-core/commit/?id=df0d525c02780b5a0bd7a177a249c55f41797476

>>
>> The option seems to be a relic from 2015, intended as a workaround
>> for some unspecified build problems.
>>
>> [YOCTO#11247]
>>
>> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
>> ---
>>  .../ncurses/files/configure-reproducible.patch       | 20
>> ++++++++++++++++++++
>>  meta/recipes-core/ncurses/ncurses_6.0+20161126.bb    |  1 +
>>  2 files changed, 21 insertions(+)
>>  create mode 100644
>> meta/recipes-core/ncurses/files/configure-reproducible.patch
>>
>> diff --git a/meta/recipes-core/ncurses/files/configure-reproducible.patch
>> b/meta/recipes-core/ncurses/files/configure-reproducible.patch
>> new file mode 100644
>> index 0000000..54a8bdc
>> --- /dev/null
>> +++ b/meta/recipes-core/ncurses/files/configure-reproducible.patch
>> @@ -0,0 +1,20 @@
>> +"configure" enforces -U for ar flags, breaking deterministic builds.
>> +The flag was added to fix some vaguely specified "recent POSIX binutil
>> +build problems" in 2015.
>> +
>> +Upstream-Status: Pending
>> +Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
>> +
>> +diff --git a/configure b/configure
>> +index 7f31208..aa80911 100755
>> +--- a/configure
>> ++++ b/configure
>> +@@ -4428,7 +4428,7 @@ if test "${cf_cv_ar_flags+set}" = set; then
>> + else
>> +
>> +       cf_cv_ar_flags=unknown
>> +-      for cf_ar_flags in -curvU -curv curv -crv crv -cqv cqv -rv rv
>> ++      for cf_ar_flags in -curv curv -crv crv -cqv cqv -rv rv
>> +       do
>> +
>> +               # check if $ARFLAGS already contains this choice
>> diff --git a/meta/recipes-core/ncurses/ncurses_6.0+20161126.bb
>> b/meta/recipes-core/ncurses/ncurses_6.0+20161126.bb
>> index e95741f..ace3108 100644
>> --- a/meta/recipes-core/ncurses/ncurses_6.0+20161126.bb
>> +++ b/meta/recipes-core/ncurses/ncurses_6.0+20161126.bb
>> @@ -3,6 +3,7 @@ require ncurses.inc
>>  SRC_URI += "file://tic-hang.patch \
>>              file://fix-cflags-mangle.patch \
>>              file://config.cache \
>> +            file://configure-reproducible.patch \
>>  "
>>  # commit id corresponds to the revision in package version
>>  SRCREV = "3db0bd19cb50e3d9b4f2cf15b7a102fe11302068"
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

