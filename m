Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id B704678897
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 16:25:06 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id m19so3729906pgn.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Mar 2018 08:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Teb1XJOIVyVwKXmdshQ1t9KMh9he9+EQsBwaYlSZE9w=;
	b=YzNP5j8W8npqfVhu32BdA3LjiEcG5kd8LZuo2bybpVLv5+gvvqi93gCMfTOkIOVf9L
	mQ2aFSXRkcYYKDFi1wdix8N/9UfwMy7iJc1VJOjE4mXT7K4fo/gmZfs+7fpKTzUnjVPE
	QMqTBF1fMX4P2Uiikn2uIHPfAvuEX+BwIPK3Pilr+kaXsKcduODUQHDjfcwgGXJPNzIy
	nf+OwVQl/O3b5MMMqQ8bnaVBfitIWpdmbrkcTaqw7XA3C2OJZUJFoQWtszXwmxkFzniW
	FbimSVqndngzId2MyeKHQpVdE7GyvGphYk0bA/YWxMSdkLeVzl/jnSxYRuKbWLnb43BF
	+D9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Teb1XJOIVyVwKXmdshQ1t9KMh9he9+EQsBwaYlSZE9w=;
	b=k9LWYrnHJTJX1Q8kpiQE3TjZkB0xJ0aKGkhQU7SkDxWq5XG1lzU1uH8/853FJ1CqJE
	tv20NUjWCyf+iFD0VQRhAR6BMh3cm7leZq1hwJYXC/vKSHaO72l+z3jyByI4jO9gQzf4
	nhRLEOzHDu39/VRLRnhxSlBUwMnyJWKQs70IhdobFJfQ4KbEnyqsmPCXVevu0aQtYHin
	9uY+4uoBTTcuw4WQ3qTEM7CM+4jpl/N+4G+KPhu8BdTuXBtb7CMnMA67uDEGn2/ALF9f
	12bx5mag0aYQGwTlyNyJqQT2AeNYmup2vQIhBJJkfWMWATLW05i8X/B8mGR2bA+QZOEc
	f46A==
X-Gm-Message-State: AElRT7F6rcp0pkufBa47oRW7XJ83238NoTIQuPSRTUuDtVDJOAadS2X1
	+VKQdr4p6x7u15Y5B7CZreIU5RK79ZOFTGQ9360=
X-Google-Smtp-Source: AG47ELvOXPXGDm+OBRlu+48a8bQAxpcuDONJiMo5e/jpGbiksRZR0L2tabi2SBsd+dOSs2NmwikptyfNFSBCiPFoYdM=
X-Received: by 10.98.28.202 with SMTP id c193mr5039802pfc.109.1520612707726;
	Fri, 09 Mar 2018 08:25:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.170.69 with HTTP; Fri, 9 Mar 2018 08:24:37 -0800 (PST)
In-Reply-To: <1520611008.10851.127.camel@linuxfoundation.org>
References: <20180309110049.10725-1-raj.khem@gmail.com>
	<20180309110049.10725-2-raj.khem@gmail.com>
	<1520611008.10851.127.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Mar 2018 08:24:37 -0800
Message-ID: <CAMKF1sr8+t8NpZ5Ozdk+b8hBdxhxkZrfg4wuZJkbGc3eaS8OAw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] liburcu: Explicitly add pthread options to cflags
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
X-List-Received-Date: Fri, 09 Mar 2018 16:25:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 9, 2018 at 7:56 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2018-03-09 at 03:00 -0800, Khem Raj wrote:
>> Some architectures e.g. riscv gcc does not add -D_REENTRANT
>> when enabling pthreads. Help it here by adding these options
>> while gcc gets fixed
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-support/liburcu/liburcu_0.10.1.bb | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-support/liburcu/liburcu_0.10.1.bb
>> b/meta/recipes-support/liburcu/liburcu_0.10.1.bb
>> index 0c8cd3571a..a73890af90 100644
>> --- a/meta/recipes-support/liburcu/liburcu_0.10.1.bb
>> +++ b/meta/recipes-support/liburcu/liburcu_0.10.1.bb
>> @@ -15,3 +15,5 @@ SRC_URI[sha256sum] =
>> "9c09220be4435dc27fcd22d291707b94b97f159e0c442fbcd60c168f8f
>>
>>  S = "${WORKDIR}/userspace-rcu-${PV}"
>>  inherit autotools
>> +
>> +CPPFLAGS  += "-pthread -D_REENTRANT"
>
> Should we use a riscv override here so that we have some idea why we're
> doing this and show its not needed for other arches?

we could, its a difference in gcc specs for riscv, it seems a bug to me in gcc.
this change actually provides the options that configure tries to
otherwise guess.

