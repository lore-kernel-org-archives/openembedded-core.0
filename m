Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2D53174860
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 21:07:44 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id c2-v6so5128872uae.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 14:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lSrnGqzY1M6wJqMp1kM7t6Ubr+U3aO8RpOtVpBxbkLw=;
	b=T0OCQH9K9QmtpmwhBtV7omG8xw3/XaDEf+WukCfOMbQyABnnWo6uHeHb1kHCInbSEe
	fZ8X7NRCv/dTiLJzhY9KThesHM/tYXVfZGkJRFOitYAedqkDBDovnay1K2r9TLns3PNi
	nqTr8u6OTgYjkOVx+J3vTOUoCAqTmUD/Pu2SnE8BxNSI+eVyvl/9gwDIBADbPh8shZVm
	7aW2xCDb3haV+Ti6Oo0cnJjUp8pY5D0mAOCcy0g0cWMC2hAVOqEvtzWx5uUDeazd7phQ
	75Z6mFxErcsdoiymF1p3IdlaC/oSr9ezkB0PfiTkSUp2J+CSFX20pwk3hU/z9+ZC0GMf
	ZwQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lSrnGqzY1M6wJqMp1kM7t6Ubr+U3aO8RpOtVpBxbkLw=;
	b=HTPTNgSYSLPSaseHmscB6zeDeo9Ljyw+qIKWo1ia+nDlL14dnM6vhRQyBmW0fDFQtf
	BIEOgj++6r9ZfSTExNCVrN1x0jDRFUECk+oTH/gTog2wmVaOR+PdY14tnbctFE+T5Ri1
	zbwYSmZ705dloCVV2Dyfrx7xVtPmTFPwdp7Xid9ioRwTikQS17Y3piVnm/f2MS8fB0ik
	+wVEhHG+VfaTE8af4yN3E46d1N82vGdBeSKL4V+hSVBVDoqOri2pseBRuDZ+qdndBMw3
	d8UO7ITydVhpRmPmXodcDnynKcY+BvQcsp/N5ZJ6WOePOs1Ez8VeYhn+3V14dk6tDgz4
	LTvQ==
X-Gm-Message-State: APt69E2KzMCfqfOEAmKsFQFIdwIBrR4pml4s0gx1kRjE59Eu31z1tRsl
	3waCJcJsSQ/2txTYAP5qUMJkal9L7f5i0gJguPE=
X-Google-Smtp-Source: ADUXVKKEf55+OirypyC0L7AIJ836RxEOwgGsajSfcxdm6kBYwZIGNItP1JtufhkRb+zJ30HZ7ZfSF0mLezMw4AbHJfc=
X-Received: by 2002:a9f:3b9b:: with SMTP id
	r27-v6mr2085419uah.191.1529701664825; 
	Fri, 22 Jun 2018 14:07:44 -0700 (PDT)
MIME-Version: 1.0
References: <20180622192316.235356-1-joe.slater@windriver.com>
	<CA+chaQdiOW9FqcaBnk95MNba=w_LSH0LP3nNATyK5c4nwf6WkQ@mail.gmail.com>
In-Reply-To: <CA+chaQdiOW9FqcaBnk95MNba=w_LSH0LP3nNATyK5c4nwf6WkQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Jun 2018 14:07:29 -0700
Message-ID: <CAMKF1sqS=gezXr5ibD+A3Zq-dEaZOjWcTHyyOmxKQO8r+iE8jQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] mdadm: fix format-overflow
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
X-List-Received-Date: Fri, 22 Jun 2018 21:07:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 22, 2018 at 12:56 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> See https://patchwork.openembedded.org/patch/151888/
>

yeah Martin is frugal with the extra space :)  using 16 probably provides
some benefits of data being aligned hard to say

> On Fri, Jun 22, 2018 at 9:24 PM Joe Slater <joe.slater@windriver.com> wrote:
>>
>> nb[] is not quite big enough.
>>
>> Signed-off-by: Joe Slater <joe.slater@windriver.com>
>> ---
>>  .../0002-mdadm-Specify-enough-length-when-write-to-buffer.patch     | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-extended/mdadm/files/0002-mdadm-Specify-enough-length-when-write-to-buffer.patch b/meta/recipes-extended/mdadm/files/0002-mdadm-Specify-enough-length-when-write-to-buffer.patch
>> index cbce053..6bbe8f4 100644
>> --- a/meta/recipes-extended/mdadm/files/0002-mdadm-Specify-enough-length-when-write-to-buffer.patch
>> +++ b/meta/recipes-extended/mdadm/files/0002-mdadm-Specify-enough-length-when-write-to-buffer.patch
>> @@ -24,6 +24,10 @@ Change the length to 47.
>>
>>  Signed-off-by: Xiao Ni <xni@redhat.com>
>>  Signed-off-by: Jes Sorensen <Jes.Sorensen@gmail.com>
>> +
>> +nb[] actually needs to be at least 12, but we will make it 16.
>> +
>> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
>>  ---
>>  Upstream-Status: Backport
>>   Detail.c | 2 +-
>> @@ -53,7 +57,7 @@ index 938cfd9..f5b4507 100644
>>                 mdp_disk_t *dp;
>>                 char *dv;
>>  -              char nb[5];
>> -+              char nb[11];
>> ++              char nb[16];
>>                 int wonly, failfast;
>>                 if (d>=0) dp = &sb->disks[d];
>>                 else dp = &sb->this_disk;
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

