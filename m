Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id E6DF07898C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 16:49:11 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id a15so845523pgn.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 09:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ccPZNdpWliyMAVKFn9reWb/PONbdiggjDEZpLd0Sz/4=;
	b=aYUpiv3A92uSYCTLimqBwKWnXpDAgRKOmBMWaKtuhsYbrSflHJCeU+6qgbEYjr1ALV
	1Jg+XUmCRDgICd+HZcEgSluib/hVSC7aAlBK+1loDpv6i1O7TSJSSGHnU7/Nkys/qSGm
	YLSJpaOtDOEZMdRFiermxhsY3tOHEnUTxUIZ0nCTFkq2EJB7MUmC+8eE8CJSZVGjEd1M
	tngCH9nE6IWyJxgm5+M5Cnhg+L028USyyrPruUQsZ2xoJM+XojmXXpT2/pOfmLi644AV
	sRY6286MDOUTvPzSilSDKDo1M3NnkuJOEIWQARI6DgF5F0ZnRiNDJA9KjqPRQPi38WYc
	4t+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ccPZNdpWliyMAVKFn9reWb/PONbdiggjDEZpLd0Sz/4=;
	b=iCXL50D5mkXfhAhL3pLJrR6hgdV1+JaZYWl7Ydef7ZdfLHBfbNzayOjMauQHffccyG
	k7s+A9DpBb2hz9rn+9p/pyDRTKGiNTO2mLnBDbJRS8PO+MaEXYN4gBLpNJm6CcS+b826
	8Dqb5stJC9KJiJYnMsW6MpZ42vKTPzTsoJeAX+lsNPFOAXYxA4wOODT2BDgSsjeGmwfR
	5RBJ3PuVqETila+aDRbjorD/lFUkLuG92YTm+ogPoNnrdMbQ/t4aYlGzeZBRinu2jeWR
	/IHrc30JiY7hB+3R9/YO3J0d2nDvPkRkw7BnR19lhQxXuDa1DHNxxEoNAohxEmWikInB
	jdyQ==
X-Gm-Message-State: AElRT7ETHEBFHR7UxEeITmssi93Zem9Kfl5XY95iHaJ2vJBJ20pJoVak
	fiocgwLdrte/n28PxF2w76FOW6P/8uM0AQSpgm0=
X-Google-Smtp-Source: AG47ELtTfRkLxeRwODyOP4epMt5RwVcRWNEtn5CCQVQmkffJKHCM13nrhYaqvpEYNu/lamue+MdcKA6bWqsEZXuL0CY=
X-Received: by 10.99.96.147 with SMTP id u141mr12736755pgb.227.1521564552765; 
	Tue, 20 Mar 2018 09:49:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.241.68 with HTTP; Tue, 20 Mar 2018 09:48:42 -0700 (PDT)
In-Reply-To: <CAJTo0La3zWJu2EgjKV+xv6FDUvX8Xnm9d0OOfQX_FN4k30uJYA@mail.gmail.com>
References: <20180320041253.24537-1-raj.khem@gmail.com>
	<CAJTo0La3zWJu2EgjKV+xv6FDUvX8Xnm9d0OOfQX_FN4k30uJYA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Mar 2018 09:48:42 -0700
Message-ID: <CAMKF1so7d+LE+pxbdPUxOpHcFMz3oX2+tW44Y_9qKpKQg9x=Yw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] site/risc-v: Cache common variables to build libIDL
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
X-List-Received-Date: Tue, 20 Mar 2018 16:49:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 20, 2018 at 2:02 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Are the sizeof values actually needed, or are they copy/pasted from another
> site?  autoconf hasn't need to run code to do sizeof for a *long* time.
>

actually let me delete it and we will readd them when we bring up rv32

> Ross
>
> On 20 March 2018 at 04:12, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> These variables force runtime tests during configure
>> they are already cached for other architectures
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> Changes from v1 -> v2:
>> - Drop libIDL specific setting since they need to be in meta-gnome
>>
>>  meta/site/riscv32-linux | 10 ++++++++++
>>  meta/site/riscv64-linux |  5 +++++
>>  2 files changed, 15 insertions(+)
>>
>> diff --git a/meta/site/riscv32-linux b/meta/site/riscv32-linux
>> index 138aeb0a11..fc5b99d147 100644
>> --- a/meta/site/riscv32-linux
>> +++ b/meta/site/riscv32-linux
>> @@ -1,6 +1,16 @@
>> +# general
>> +ac_cv_alignof_guint32=4
>> +ac_cv_alignof_guint64=8
>> +ac_cv_alignof_unsigned_long=4
>> +
>>  # glib-2.0
>>  glib_cv_stack_grows=${glib_cv_stack_grows=no}
>>  glib_cv_uscore=${glib_cv_uscore=no}
>> +glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
>> +glib_cv_sizeof_intmax_t=${glib_cv_sizeof_intmax_t=8}
>> +glib_cv_sizeof_ptrdiff_t=${glib_cv_sizeof_ptrdiff_t=4}
>> +glib_cv_sizeof_size_t=${glib_cv_sizeof_size_t=4}
>> +glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
>>
>>  # startup-notification
>>  lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
>> diff --git a/meta/site/riscv64-linux b/meta/site/riscv64-linux
>> index 138aeb0a11..38bc5f044d 100644
>> --- a/meta/site/riscv64-linux
>> +++ b/meta/site/riscv64-linux
>> @@ -1,3 +1,8 @@
>> +# general
>> +ac_cv_alignof_guint32=4
>> +ac_cv_alignof_guint64=8
>> +ac_cv_alignof_unsigned_long=8
>> +
>>  # glib-2.0
>>  glib_cv_stack_grows=${glib_cv_stack_grows=no}
>>  glib_cv_uscore=${glib_cv_uscore=no}
>> --
>> 2.16.2
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

