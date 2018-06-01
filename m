Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2BAEC601F6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 17:21:04 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id b77-v6so3165906vkb.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2018 10:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LuNGFLmsRstShHEUyJE1iEQKsiJOAglzGcnZcRKj3wo=;
	b=s/nfCzS78rhFx2pvoQx135eiydzF3F36CMhGb5/ac2oaKtk23FOy2wjOgLDgaO35C2
	Q7CiUC4+vJ8Yl4ctDyeXh9wtzTGFFnMftzD0ymyFmgeSfGomNq6SWKOsBdGFJVdpdaYB
	ZZOu8fbETZ3yQX4Kwbzi1HbK2lzojwxOSpsV5nEG6o/vWJZQ1dxmQTqzr+8kKCnIj4mn
	RVoNriIylkRqDPF60aLjFTk5KRVaG4nUzwgrNLV3E9oYvU0N94Gxqs1hthqrTtTWqzuN
	e1jm7kRo+1r7w4Wy5t9fLO1ofX1qaF8Pm1Ohfo46F5htwXrIneZC6IUrje3PvFToSLQi
	1OXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LuNGFLmsRstShHEUyJE1iEQKsiJOAglzGcnZcRKj3wo=;
	b=P2i05Mzvw+sYJNxnH6pYMuC6qy4whiVZmC2cETiWPf5qGofnLPg/HwvdiV0ZLsPlt/
	uCm6ZLR0DL3RLHQc7uNod2Iq0t4VHhfNnZI01UHqJYn2nMGb/iRcNQ6ahMdpNeglolIY
	/QY444rPm/mXtfE4ur570g28e9k+hVQkSPtQF4HW3uoElN9d8rqpopiAfl6ajQOomOc/
	af4Iy/gPjeMUI7BmcHrePvwnRuqJhcteMMl3+HFXjxJsNiUWsv4lYmd4UtEWI+mu6Ydh
	nFQFCtA75rc1Atlq4Dkvv+K79zQ8V9LndqhP7GU560a7ZXivjhxKNPGnfqRuXLDMZvZE
	UEuA==
X-Gm-Message-State: ALKqPwfO+rahABYsM4rNAVGZ4aBRAXJTGxta0KJAH498QXAB0Z9BqpO9
	7STzEqtdoZOtvSIV4O65wT23hVskRRe6ZRMvyUs=
X-Google-Smtp-Source: ADUXVKJ6MZTH8OaCEXKiuRWNX5QtBAGUDCvrzp/2JNBYEJ1bHHxnIvYdpXJguLKb9+ahdIk6bu7sRWWXE/QQjbvPYpU=
X-Received: by 2002:a1f:9615:: with SMTP id
	y21-v6mr7264181vkd.154.1527873665817; 
	Fri, 01 Jun 2018 10:21:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Fri, 1 Jun 2018 10:21:05 -0700 (PDT)
In-Reply-To: <aa9dd5c5-57b3-ca5f-19c7-a6288ca4fc40@windriver.com>
References: <1527808243-20215-1-git-send-email-armccurdy@gmail.com>
	<aa9dd5c5-57b3-ca5f-19c7-a6288ca4fc40@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 1 Jun 2018 10:21:05 -0700
Message-ID: <CAJ86T=Wu5v1VnjfJZWd5wgAEieqfPUJCEHd3KavZ47kUkR4-Gg@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tune-i586-nlp.inc: drop tuning file for Intel Quark/X1000 CPU
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
X-List-Received-Date: Fri, 01 Jun 2018 17:21:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 1, 2018 at 7:58 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 5/31/18 6:10 PM, Andre McCurdy wrote:
>> The Quark machine was EOL'ed at the end of 2017 and all support for
>> it has now been removed from meta-intel. Drop the associated tuning
>> file from oe-core.
>
> I would rather this remain.  There are still a lot of people using the quark
> based boards as hobbyists... there is little effort to maintain it for now.
>
> (we still have support for ARMv4 for instance, which hasn't really been used in
> new designs in a while..)

Is there ever a case when we would drop old tuning files? Or should
they live on forever?

We dropped GPLv2 recipes from oe-core on the grounds that they are
old, unmaintained and untested. ARMv4 CPU tuning files meet those
criteria too.

>>   http://git.yoctoproject.org/cgit.cgi/meta-intel/commit/?id=5dbc69e339588834317b632119717996584b0d6c
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  meta/conf/machine/include/tune-i586-nlp.inc | 19 -------------------
>>  1 file changed, 19 deletions(-)
>>  delete mode 100644 meta/conf/machine/include/tune-i586-nlp.inc
>>
>> diff --git a/meta/conf/machine/include/tune-i586-nlp.inc b/meta/conf/machine/include/tune-i586-nlp.inc
>> deleted file mode 100644
>> index 88e5903..0000000
>> --- a/meta/conf/machine/include/tune-i586-nlp.inc
>> +++ /dev/null
>> @@ -1,19 +0,0 @@
>> -# Settings for the GCC(1) cpu-type "quark":
>> -#
>> -#
>> -#
>> -DEFAULTTUNE ?= "i586-nlp-32"
>> -
>> -# Include the previous tune to pull in PACKAGE_EXTRA_ARCHS
>> -require conf/machine/include/x86/arch-x86.inc
>> -
>> -# x86 with no lock prefix
>> -TUNEVALID[i586-nlp] = "IA32 with Lock Prefix omitted"
>> -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'i586-nlp', ' -march=i586 -Wa,-momit-lock-prefix=yes', '', d)}"
>> -
>> -# Quark tune feature
>> -AVAILTUNES = "i586-nlp-32"
>> -TUNE_FEATURES_tune-i586-nlp-32 = "${TUNE_FEATURES_tune-x86} i586-nlp"
>> -BASE_LIB_tune-i586-nlp-32 = "lib"
>> -TUNE_PKGARCH_tune-i586-nlp-32 = "i586-nlp-32"
>> -PACKAGE_EXTRA_ARCHS_tune-i586-nlp-32 = "i586-nlp-32"
>>
>

