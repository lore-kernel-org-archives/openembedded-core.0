Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1C3A9766E1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 13:45:30 +0000 (UTC)
Received: by igui7 with SMTP id i7so61629083igu.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 06:45:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=JT9nGXXSi2CSfZRZel8nLH9ctZtG4wPQKvuJwsSYJCw=;
	b=NCO9Vizw3zTRn4iTfHiVfxJNgIJqCloj+R0EOrXyJ7qNdsDrGyQQT3DdY76ClC38sc
	RCvgcVbLSP4s+z0tYEtSzc0vDwJzdkzp9sU792990sT3DaYuctf8BACEbvaShKR/iX0E
	s4XSV8AU5yVlwAi4p2wxjBK3adkp3bR3zes6gRk7xO+WSOncZqOtytNXPLY3W9WXO8uu
	J5G9B76QV5BL17DNf7DaQ2vIb2sa0Y/Rj93/fYbszGUGNqKaXh4/mNUFhgT+Z5pvZCKl
	38XFX4E+7Th5afaSFFMz3ubBJ0T+hwt5vKAhk0ceS2Teor2xespEMtNFlD6KlDrDhFx9
	rOPg==
X-Gm-Message-State: ALoCoQmk++ztac3wNijaeFY8EiGu5L1M4+r9R6RyqLqiW+8Rs3+X9QzpQn0x27YzhXieF3vc9vPZ
X-Received: by 10.50.178.161 with SMTP id cz1mr24754965igc.85.1439387130883;
	Wed, 12 Aug 2015 06:45:30 -0700 (PDT)
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com.
	[209.85.213.170]) by smtp.gmail.com with ESMTPSA id
	q10sm10439240ige.16.2015.08.12.06.45.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Aug 2015 06:45:30 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igfj19 with SMTP id j19so13774842igf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 06:45:29 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.64.212 with SMTP id q20mr25493452igs.5.1439387129760;
	Wed, 12 Aug 2015 06:45:29 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Wed, 12 Aug 2015 06:45:29 -0700 (PDT)
In-Reply-To: <55CAABC2.50008@windriver.com>
References: <cover.1438269391.git.liezhi.yang@windriver.com>
	<50edd6dd2fa86d9a51cc54ecdaa1599a1efc5a43.1438269391.git.liezhi.yang@windriver.com>
	<CAP9ODKqzs9VF7C6YFcgdu1tPuFq_ftOyS6HQZda9qvv=i23e4w@mail.gmail.com>
	<55CAABC2.50008@windriver.com>
Date: Wed, 12 Aug 2015 10:45:29 -0300
Message-ID: <CAP9ODKqw2QCuWD+NG3uGQONhFQGfc0SQihC4979mCCb5esuNEg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] base.bbclass/blacklist.bbclass: remove doc item when d.getVarFlags()
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
X-List-Received-Date: Wed, 12 Aug 2015 13:45:31 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 11, 2015 at 11:13 PM, Robert Yang <liezhi.yang@windriver.com> wrote:
>
>
> On 08/11/2015 08:45 PM, Otavio Salvador wrote:
>>
>> On Thu, Jul 30, 2015 at 12:18 PM, Robert Yang <liezhi.yang@windriver.com>
>> wrote:
>>>
>>> The FOO[doc] is set in meta/conf/documentation.conf, we need remove it
>>> from d.getVarFlags()'s return dict when it causes many loops.
>>>
>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>
>>
>> It seems your commit log is incomplete or so as I couldn't understand
>> why this is need.
>>
>> Also as Andre says, we ought to not break existing layer without a
>> very strong reason and if needed, changing documentation.conf instead
>> of this seems more adequate.
>>
>
> The code in base.bbclass is: (no remove PACKAGECONFIG[doc])
>
>     pkgconfigflags = d.getVarFlags("PACKAGECONFIG") or {}
>     if pkgconfigflags:
>        <foo>
>
> And documentation.conf:
> PACKAGECONFIG[doc] = "This variable provides a means of enabling or
> disabling features of a recipe on a per-recipe basis."
>
> This will make "if pkgconfigflags:" always be true and cause many unneeded
> loops since there is always PACKAGECONFIG[doc].
>
> Remove PACKAGECONFIG[doc] or comment it sounds good to me.

So documentation.conf needs change.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

