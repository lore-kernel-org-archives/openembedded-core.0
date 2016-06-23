Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5FDCD60043
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 13:56:48 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id p10so107743747qke.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 06:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=d1Jw5jS3aVUg/ag60a9661LRPryIOBSwcFaZwYyd/pA=;
	b=Ba7ueh6TiYPNgu9GXgvHfQ+diPLqyEaMoM/DxSw2WQlunvF1gGPnI+eX9O1s2iCUeV
	rZUU7g894pfkq2VK4G+SB+IdgIl+CtdkkWyK6XdX4nS7NIvbgYbbNohPe7QDno3tdGI7
	F4V2MiIGIy2/Ue0xDUkohOyiXu1SB8etR+j2Ns/kmqOijbHr3fEVrnr2rAYy9TZXoM/T
	+m7qsf9KEZU1InCsgHfbNIGmpzTyRB7OBIecFJeSHbgxW5AJYxCBFd6GQq6kR+Z9v5/j
	lhKVWQ+s7xbisfOMF4cdZ2+mSz7R72ZNg380HWWY5+YsPaEqUn0dXoZqtnl5/erGyNKg
	JiCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=d1Jw5jS3aVUg/ag60a9661LRPryIOBSwcFaZwYyd/pA=;
	b=DKtU6B8RiyEiCq6Qd/TiYr1oy3Q7PMkZBznEnPZvB1T03eV3+FvOwXL22TQmpV118F
	X13fzyOH6WFc8yeiMyMm2rV37V/gMLO7y9bg3KBJxXRnYpnb5C1DS7wrex2XfIxbsruf
	IIbNZue1YHBEvYadDsCAU47WFC2MArRljofkOkgAW3Vt+6AhIfH8vhtFXRDfYCR/mnlQ
	FmeLXpPS2265BF6/skLjQY3N7EWH7YHazXyelnFyKfrUZR8IBQTJFQRwE9qodAN6TLod
	hvvBqzM3OvmwBcSI5b2XdwuUzs7dDplnDev4f9J7ZnWCfpbBDf+ynjFiKlNls1Gl6Z39
	MH0g==
X-Gm-Message-State: ALyK8tKxs70WpIhsaG02grgpVyIzyEaCYvdLeuG9JB8wT1x/8RmSu7/9vuYevFCLesqqd1lfA3LZHFbglvKMSA==
X-Received: by 10.55.16.232 with SMTP id 101mr3054670qkq.151.1466690209293;
	Thu, 23 Jun 2016 06:56:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.8.133 with HTTP; Thu, 23 Jun 2016 06:56:19 -0700 (PDT)
In-Reply-To: <825a92a1-c9ed-11f3-7580-0cef384914db@linux.intel.com>
References: <cover.1466669684.git.Qi.Chen@windriver.com>
	<888ea509ee84e93297278e52a394057993b9a8a4.1466669684.git.Qi.Chen@windriver.com>
	<825a92a1-c9ed-11f3-7580-0cef384914db@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Jun 2016 06:56:19 -0700
Message-ID: <CAMKF1so3JSBtJC6_Uz4L5NJ50HCjtpztxoJ+_H+aU1mVLOduxA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] systemd: upgrade to 230
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
X-List-Received-Date: Thu, 23 Jun 2016 13:56:50 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 23, 2016 at 3:23 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 06/23/2016 11:16 AM, Chen Qi wrote:
>>
>> 'python' is added to RDEPENDS of systemd-ptest.
>> -RDEPENDS_${PN}-ptest += "gawk make perl bash xz \
>> +RDEPENDS_${PN}-ptest += "gawk make perl bash xz python\
>
>
> This is not correct. Systemd is configured using --without-python, and so
> the python scripts are not added to the list of tests in the top level
> Makefile.am. However they are still installed by the recipe - the correct
> fix is to remove them from the test target directory after all the tests
> have been copied into it.

python support could be added too. Using packageconfig

>
> Alex
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

