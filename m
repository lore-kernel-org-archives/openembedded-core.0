Return-Path: <raj.khem@gmail.com>
Received: from mail-yw0-f182.google.com (mail-yw0-f182.google.com
	[209.85.161.182])
	by mail.openembedded.org (Postfix) with ESMTP id 47D786060E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 20:48:24 +0000 (UTC)
Received: by mail-yw0-f182.google.com with SMTP id i129so21220815ywb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 13:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ryv/Zp1dakwltxUbQ12FJ7ACaTe8TuBfvHYomeqitHE=;
	b=xFSqy/vU4OA0Q04HKDfSo5D4Y1ZWvypmJ9601nLscxrXLssFIGMvzEbw/M4UYTn3m7
	MM1Oi/UjULQuM12aDBEX36nkxSUZcjiKuj24KmnfXmF8LDchIZ7cArCPZrudLRHgltME
	UXwdRo0+ZkN6RsTOlzfLgXvu0Fngfu6SxDSJxXASEhX3WzCR15BWUVGlfRNctdhLfsW8
	pgY288X0VACX7S1D6uic/JJg2bovPQKZdBBgRin8zGvF0A/VtifK+GAsoZlWxADuxOYM
	CfjrBKDC2cY7vj0lNZZEuY1rRJkcF1vDdjgI7nYX5qDrwjoUGQ7oo6FkSmAEVthmzJT4
	GC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ryv/Zp1dakwltxUbQ12FJ7ACaTe8TuBfvHYomeqitHE=;
	b=WDREZGDOykG64f+caMRIoZoR7yAOqZtTann/5974X9rONnaEP6+RCG+cxmH9bdByQe
	GaJC+zF6qsjw/bMV1kri2Xtnc3NZttRiFXckkBe3C3iuOqsTRuwxBq88iJoVi0CgetHe
	SdROl+OdfgTQu9IPNGUkLo5HFLT/5NBP7i1TyzIciLkpWTdSXnC/j2uSI91xdIgtGxCw
	D/K1Nym4cNI7PwwNYS45sh45PFFyMOFR22VX+4S/msy/I99HnksdtR1O9kzg+n+MrwGV
	jkzz3vQyebV8Zoe1r1liYr7plgpGrzfg8QZs+Q6edONkjiv1rwrliVM1S6xpl+GIPc/T
	AnZw==
X-Gm-Message-State: AE9vXwPrpJQU9eDPkZ9Aw7uLz8Tr32XsxgW5FCPybtFmxBLQGgPHhfOBcwD1mbcpuXc5BfnDgUrlIWJTwu7mQQ==
X-Received: by 10.129.129.134 with SMTP id r128mr31069492ywf.179.1474404506151;
	Tue, 20 Sep 2016 13:48:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.80.33 with HTTP; Tue, 20 Sep 2016 13:47:55 -0700 (PDT)
In-Reply-To: <d8e2a387-eae9-8436-e08e-4768785bd545@windriver.com>
References: <1411725589-20460-1-git-send-email-fathi.boudra@linaro.org>
	<57E09AFD.4040006@windriver.com>
	<CAGNsrLDLQ0sJZyec8KwHxwuFGhMhP5mG+nFbFnR3816oD1MS-g@mail.gmail.com>
	<d8e2a387-eae9-8436-e08e-4768785bd545@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Sep 2016 13:47:55 -0700
Message-ID: <CAMKF1so0b8MZZcRzomeaNjo9pJd_ONx+vex0VvWBQw+nB6ufMg@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] libunwind: add aarch64 support
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
X-List-Received-Date: Tue, 20 Sep 2016 20:48:25 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 20, 2016 at 7:21 AM, Randy MacLeod
<randy.macleod@windriver.com> wrote:
> On 2016-09-20 07:57 AM, Fathi Boudra wrote:
>>
>> Hi,
>>
>> On 20 September 2016 at 05:12, ChenQi <Qi.Chen@windriver.com
>> <mailto:Qi.Chen@windriver.com>> wrote:
>>>
>>> On 09/26/2014 05:59 PM, Fathi Boudra wrote:
>>>>
>>>>
>>>> * pass --enable-debug-frame on aarch64 architecture
>>>
>>>
>>>
>>> Hi Fathi,
>>>
>>> I'm now dealing with a problem related to libunwind support on aarch64.
>>> Could you please tell me why '--enable-debug-frame' is needed for
>>> aarch64?
>>
>>
>> libunwind needs to be configured with --enable-debug-frame to prevent a
>> linkage error.
>> Note: --enable-debug-frame is automatically selected on ARM32, not on
>> ARM64.
>>
>
> Thanks.
> We dropped the configuration flag and don't see any linking/linkage
> problems yet. Can you be more specific about the problems encountered?

This would enable .debug_frame instead of .eh_frame for unwinding.
AFAICT it was only
needed on arm ( 32bit) not sure you need this on aarch64

>
> Our goal is to make tcmalloc from gperftools work on ARM64.
>
> ../Randy
>
>
>>> Best Regards,
>>> Chen Qi
>>
>>
>> Cheers,
>> Fathi
>>
>>
>
>
> --
> # Randy MacLeod. SMTS, Linux, Wind River
> Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, Canada,
> K2K 2W5
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

