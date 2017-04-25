Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9718D71C71;
	Tue, 25 Apr 2017 01:41:14 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id z129so21539759wmb.1;
	Mon, 24 Apr 2017 18:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=imTuOv3ak3qFq7AUDQClB9bg9ogr7jXTVZYc5fPGsPY=;
	b=KCGsTStCk7a8VMOrddNImrj8NFJkar1R1hQvXwb/BGLBZoXghJVBx7qGkOf0ZMWhIZ
	++AsPfAWHx1CxZ6RlZfF3gxrGs0flXzFiZo2nq3nzGVhHsWLxv+3cnBdKYYES2UO32b/
	fZw0C6UoRLo63XCZIm56O7Z4ptqEZDd4pa4ReJfvlibjJWt6KJaLHikdnNHOmoIWA+ic
	lBwcekn9e0TKEnKXesReDy1DhbQsyR+6oXPFyoLv+Kqmf3iVgU7V5+M8ybPhwVRBKqjx
	+SnIv29OTJwnjJfH1yi77PbxVgCILCyNi4obMsfDULgKX7llRLo5Y8XYqar3iUYE+pHv
	6Fxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=imTuOv3ak3qFq7AUDQClB9bg9ogr7jXTVZYc5fPGsPY=;
	b=X5OIxzRxywNAz2aSgxYaeO2vS0Ql3GRNVTZ2jsJoyOlMeCG5OCmrs8FlMTWQtQolxy
	4ntMFS5i7cMuiEg/P07KSG1zfkyBiqbqQQoG6qCZ54a9GQ8WfLbzfoDrZkoQ8JxocS+g
	s3zn9TtS6IOeqoA9S/gNi6dLMb978UF9OkJitc7N3Re2BWkdUVxtaSqQ5yYeHe0LGS9N
	6+DVuzRA75R3V+N72LhqoODi4ox8QX8t6xe8L4nozPz2GFSKKFdHRpeIpN5BXmmr/K7p
	ZRnc8H2wA93Gha0NrynHg36tsooAbI0WY3b96SBqtGFbfI//E7WpMYNRzVL7Mv0EHr4p
	TMnw==
X-Gm-Message-State: AN3rC/6ELgWaXu8W7JGZhs9q5yNCfxwYGmcJjQQUMUzHe/C5CtSsRIf6
	YLEmULq/Rxp4z5MS2kdL+warJvH74tkE
X-Received: by 10.80.178.228 with SMTP id p91mr3111317edd.131.1493084475374;
	Mon, 24 Apr 2017 18:41:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.141 with HTTP; Mon, 24 Apr 2017 18:40:44 -0700 (PDT)
In-Reply-To: <CAJTo0La+bGDBuJ42yVy79hW2iN3ZhpeyjXrhUApLn-PAi6PYBw@mail.gmail.com>
References: <CAMKF1spGM+kugUDOB4kF7NAgSCt9vCw8GFT0nLKFRd2tHei=pw@mail.gmail.com>
	<CAJTo0La0mtVGyLysCnqi9EQmT+4L1eYRxgE-TV=3Va45jnt=Xg@mail.gmail.com>
	<CAMKF1sqfvtQPWN5Yuz3RPYkXpneS+XWcYmit_=bcvKGo3_hx8w@mail.gmail.com>
	<CAJTo0LakaSZhJodT2KQx6u0TEaBL5Ruig3oOdfrtCzQUf1cxXg@mail.gmail.com>
	<CAJTo0La+bGDBuJ42yVy79hW2iN3ZhpeyjXrhUApLn-PAi6PYBw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Apr 2017 18:40:44 -0700
Message-ID: <CAMKF1sqf=hEejwiMGdQyhpXzWeUZLYxkCV2a2H9pS4JkBRz-9g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] gcc7 and glibc-2.26 recipes
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
X-List-Received-Date: Tue, 25 Apr 2017 01:41:14 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 24, 2017 at 12:13 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 24 April 2017 at 10:09, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> All merged, I'll fire in a moment.
>
>
> lttng-modules fails:
>
> In function 'lib_ring_buffer_align',
>     inlined from 'lib_ring_buffer_try_reserve' at
> TOPDIR/tmp/work/qemumips-poky-linux/lttng-modules/2.9.1-r0/lttng-modules-2.9.1/lib/ringbuffer/frontend_api.h:118:3,
>     inlined from 'lib_ring_buffer_reserve' at
> TOPDIR/tmp/work/qemumips-poky-linux/lttng-modules/2.9.1-r0/lttng-modules-2.9.1/lib/ringbuffer/frontend_api.h:179:6,
>     inlined from 'lttng_event_reserve' at
> TOPDIR/tmp/work/qemumips-poky-linux/lttng-modules/2.9.1-r0/lttng-modules-2.9.1/lttng-ring-buffer-metadata-client.h:317:6:
> TOPDIR/tmp/work-shared/qemumips/kernel-source/include/linux/compiler.h:518:38:
> error: call to '__compiletime_assert_269' declared with attribute error:
> BUILD_BUG_ON failed: (size_of_type) == 0 || ((size_of_type) &
> ((size_of_type) - 1))
>   _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
>                                       ^
>
> Suggestions welcome :)

my builds have been primarily arm/aarch64/x86_64 only thus far
probably BUILD_BUG_ON  can be replaced may be with BUG_ON

>
> Ross

