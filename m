Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id AEFDF79180
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 19:02:45 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id y9-v6so8763853vky.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 12:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZE6OapGJJo/UCBczRcSLc7DGNfMG07UbiGGAKyTP/dg=;
	b=CoacsdTVzar4ZSsVhvb4I6tzZGX2i/DwNwSEevWSg31u5qjMPwNuphjLvXfIG4/QnI
	FCZDjRub/fqsLAFJyAbdcZYzL/izq0G4ffFRa39pvbAhVbUBCKpoF+ZTGyOrJZmHCr/o
	QEIpShs8JpBKVrlFsuAnlOxN9RaLD3vawcb8euiTW76EXueLaVQWt2ncDmU5eDAdSaAQ
	OasAb2M9dMOtpZV0CUt9SDBESd7C26dUh/fOXqgRymrlLl8QNT4Gz9rWfe926oVAoA50
	O/7+NzdR8iStU7N1jwS00Ja6elOiU8H1WvCtgc2SBCuNtBng4sIsWAnjSEcZGL6gWNqs
	I0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZE6OapGJJo/UCBczRcSLc7DGNfMG07UbiGGAKyTP/dg=;
	b=tlioN7Cqz7Pnflu31cQy+A41OBSOyM6matpSU0EliJaj0YmnMtSrQuTkD8EgbVha60
	2FS2KmASsU3OxYKXfWYeV17eEb0hSu5J/o3LleocmqiFrEItrY1a9R29w1Oy9IrU2lkD
	hz53VflZJ1Fzl5sQUZ/xzTlLE2u+T9H11e2HNdrcLyF4IT6XDqORps7nOWn4BM4wlOjn
	J+f7KEM38oCdYe+Z8Ri0vH7duCYZU4zuHfKccBydk+arpN42B8JW0uYQs00zJZBf4y5L
	GjDaydJ5FoeQbTdH9KfrLLQa5cE4Js3dxMZU4Ou69KZBTQou/wno1Ad8wJoRLJ04AiOJ
	HoTQ==
X-Gm-Message-State: AOUpUlHQitw6VHka4QxCjWaeOfs8GsNM4Vce4RXqYb5uEuyzIjaErwU6
	geyOcKE7SBk6dKnS99L6KFzSGHLJ0QRmFkXBOgnviw==
X-Google-Smtp-Source: AA+uWPzUhJspShx3iHS2c7HvKbDlLD5QMaTRzXuj9gz5XJpSAbaRt5fhQDEC3o0PDdjPPC2qGbF0lW6ZZUQMgNHkdaQ=
X-Received: by 2002:a1f:c252:: with SMTP id
	s79-v6mr33788457vkf.127.1534878166214; 
	Tue, 21 Aug 2018 12:02:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Tue, 21 Aug 2018 12:02:45 -0700 (PDT)
In-Reply-To: <84bd9292-69b4-bf25-6385-2c92df108651@windriver.com>
References: <20180821062333.21393-1-hongzhi.song@windriver.com>
	<84bd9292-69b4-bf25-6385-2c92df108651@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 21 Aug 2018 12:02:45 -0700
Message-ID: <CAJ86T=UP_i1_dyk3PDy+x4FyMzphg-Xpy1SgeXErqn8RKDykaQ@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runtime selftest: hw breakpoint case correct syntax
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
X-List-Received-Date: Tue, 21 Aug 2018 19:02:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 21, 2018 at 8:30 AM, Randy MacLeod
<randy.macleod@windriver.com> wrote:
> On 08/21/2018 02:23 AM, Hongzhi.Song wrote:
>>
>> 1. There is a wrong syntax.
>
> Usually the word syntax refers to code and grammar refers
> to English phrasing (but it's a weird language and the
> rules are sometimes ignored).
>
>> 2. Since last commit has exclude the arm64, so remove arm64.
>
> What last commit? Please write the log help people who
> have not been working on the patch.
>
> See:
>    https://chris.beams.io/posts/git-commit/
> for guidelines.
>
> Something like:
>
> Subject:
>    runtime selftest: hw breakpoint drop arm64, correct grammar
>
> Improve grammar in skip test output.

I don't see any grammar fixes in the original patch? Just a syntax fix
(adding a missing % to the format string).

> Do not run the test for arm64 because commit XXXXXX did YYYYY.
>
>
>
> Thanks!
>
> ../Randy
>>
>>
>> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
>> ---
>>   meta/lib/oeqa/runtime/cases/ksample.py | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/lib/oeqa/runtime/cases/ksample.py
>> b/meta/lib/oeqa/runtime/cases/ksample.py
>> index eb8713351a..0e00cdeeb6 100644
>> --- a/meta/lib/oeqa/runtime/cases/ksample.py
>> +++ b/meta/lib/oeqa/runtime/cases/ksample.py
>> @@ -166,9 +166,9 @@ class KSampleTest(KSample):
>>       def test_hw_breakpoint_example(self):
>>           # check arch
>>           status, output = self.target.run("uname -m")
>> -        result = ("x86" in output) or ("aarch64" in output)
>> +        result = "x86" in output
>>           if not result:
>> -            self.skipTest("the arch doesn't support hw breakpoint" %
>> output)
>> +            self.skipTest("the arch %s doesn't support hw breakpoint" %
>> output)
>>           # check config
>>           self.check_config("CONFIG_KALLSYMS_ALL")
>>           # make sure if module exists
>>
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

