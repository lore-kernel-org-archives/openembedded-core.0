Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id EE67D731AF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 01:16:34 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id b14so149774581wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 17:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=RQyOlk/H44sx0ISOOPUlkeck3WrdK0HHEvN+yANMvAQ=;
	b=cKSarkBzFiqK8XvIxM6gNKSLsUzrYq8YGNhJi8XkFOIoMshBD++Lu2NGiQg9m6sVNP
	fngOxw6qF2GhMn+hEpnC5yJu5cx8bNzpEyqDi/M5FHMpPPgF35uyBe88TF/P0m9PQhan
	/Sy3svNzQZbjrGomFsm3wfL1dtXDM3hnz8BmOeg4+P54mLSoUc3TW1+NKDIhD36QAk1g
	ESniBZ3YrZ098qKamP43MOchqe/ta7ippQvb+uWsxj5m8zcUbMtuTWNx/VArsMI7aVsi
	U3HkFHzuTDzeAvbbdhJEa4Ldn5AKoK3ypm/P1qautjr75xu8+0WsGvD9VuEuCus1ZuRQ
	dfmg==
MIME-Version: 1.0
X-Received: by 10.194.24.226 with SMTP id x2mr115243660wjf.43.1452215795395;
	Thu, 07 Jan 2016 17:16:35 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Thu, 7 Jan 2016 17:16:35 -0800 (PST)
In-Reply-To: <1452209673.2002.125.camel@pbcl.net>
References: <1452205752-6353-1-git-send-email-armccurdy@gmail.com>
	<1452205752-6353-3-git-send-email-armccurdy@gmail.com>
	<1452209673.2002.125.camel@pbcl.net>
Date: Thu, 7 Jan 2016 17:16:35 -0800
Message-ID: <CAJ86T=XK8e9FnfZCTP_B=Uw=sBHsFo-8rHFxVAZEG-hYPOGfEQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/4] gcc-configure-common.inc: duplicate armv7a over-ride for armv7ve
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
X-List-Received-Date: Fri, 08 Jan 2016 01:16:37 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 7, 2016 at 3:34 PM, Phil Blundell <pb@pbcl.net> wrote:
> On Thu, 2016-01-07 at 14:29 -0800, Andre McCurdy wrote:
>>  EXTRA_OECONF_append_armv7a = " --with-arch=armv7-a"
>>  EXTRA_OECONF_append_armv7m = " --with-arch=armv7-m"
>>  EXTRA_OECONF_append_armv7r = " --with-arch=armv7-r"
>> +EXTRA_OECONF_append_armv7ve = " --with-arch=armv7-a"
>
> Please add a comment explaining why this isn't --with-arch=armv7ve.

To make it possible to (continue to) share the same gcc-cross etc
binaries between armv7a and armv7ve builds. It's the minimal change to
keep things working as they are now.

The more invasive, but perhaps more correct, change might be to
completely remove these "--with-arch=XXX" options from
gcc-configure-common.inc and replace them with "--with-cpu=XXX"
options in gcc-target.inc ?

> p.
>
>

