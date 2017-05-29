Return-Path: <max.oss.09@gmail.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id B4559607A4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 13:06:34 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id h4so78167157oib.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 06:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yLrKv4yGyHyzwI6GXbJ1+OArS51qu4ZsIP592pYrSFs=;
	b=RO/zkJiruangJUlQLdoK1o3rm52Kin3tVJoSXjtVpdvMiCiJ/DNbtLzGD1aWW+eKun
	h1IiEhamR1GdDL9B4tXvrDOplVEKGArkLBp5ZM8/dpUCfA29tvIKIOIhAZmDQx7Ey5xX
	OIvrbiDVHNTJ53eI3GG0KNfM6KbW33GTJF6U8pExAyOS40I1lirYtL+zqBDOSQCvrCMI
	GTPCGUR3H+7g+6JFOrgOtwzyc1HONmH8AWZN9Q0vfN1Ldoj5hUXc7PSxaP+Opq72vA2L
	soOD81tflQgZZDmqnRy14+WSfnxuf4HQcSOR5cYll4Xkvv9b7102bke2kC9HJUHsLsvT
	62Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yLrKv4yGyHyzwI6GXbJ1+OArS51qu4ZsIP592pYrSFs=;
	b=r/zdIGlIO9EcCzfVadp6aYif2a//E4hVFh9zF5xK5lG2rzGIS3JhK33xO3+iJwqX3R
	9GLUHqSbNHF5bWacJ/brvQmEtos8V2g17b7Rl2q/cnXXGOk2tA4LT9iLq0Eozgd8t/zJ
	VQbKYXRFeLVZtg3ljNsFpkvYEUIwKFcxsFfGYYMdyjE6vYQMKZrAERhTUhdHlKsGaYem
	GQxwNRyKruLNTOWiQA++HPO7wD5Z9pKPQbint79t6imYSwOMdKQpqqGVikUq9U5LlGWS
	x8E1qCCa1QvWhUUjp5Kddz7DZjNx0gS29jTLlji5o/gOJEKweIrQTYFY77jS+Aq3nMmx
	P9vA==
X-Gm-Message-State: AODbwcB7Ac+9cOWB9Ufpe6nojmmExSfR8sNBqKahnr/6vxLpDGwwfmaz
	YLOi5z413xsItQlwgFpuIlqNhX2NqA==
X-Received: by 10.202.212.205 with SMTP id l196mr7146800oig.4.1496063195477;
	Mon, 29 May 2017 06:06:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.84.7 with HTTP; Mon, 29 May 2017 06:06:35 -0700 (PDT)
In-Reply-To: <CAEHkU3VWN7gwy1pZYK6izb5V6kr6=s+9fCymb+Px==ZLRZi6-g@mail.gmail.com>
References: <20170526203537.30721-1-max.krummenacher@toradex.com>
	<cf075667-da8d-6b04-8cbb-a39fd3c0fcfa@linux.intel.com>
	<CAEHkU3VWN7gwy1pZYK6izb5V6kr6=s+9fCymb+Px==ZLRZi6-g@mail.gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Mon, 29 May 2017 15:06:35 +0200
Message-ID: <CAEHkU3VzMEsCgxwL_mc1MiAQ-1-Ks7WEhyz15T3OpzdpJ-C1+w@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] libsolv: don't pick up bundled db from host rpm
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
X-List-Received-Date: Mon, 29 May 2017 13:06:39 -0000
Content-Type: text/plain; charset="UTF-8"

2017-05-29 15:00 GMT+02:00 Max Krummenacher <max.oss.09@gmail.com>:
> 2017-05-29 12:50 GMT+02:00 Alexander Kanavin
> <alexander.kanavin@linux.intel.com>:
>> On 05/26/2017 11:35 PM, Max Krummenacher wrote:
>>>
>>> +-  # check if rpm contains a bundled berkeley db
>>> +-  CHECK_INCLUDE_FILE(rpm/db.h HAVE_RPM_DB_H)
>>> ++  set(HAVE_RPM_DB_H 0)
>>
>>
>> Have you looked into what CHECK_INCLUDE_FILE does, and whether it can be
>> fixed? I'd like to hear about your findings.
>
> Yes, I did.
>
> I creates a c file and tries to compile it with the CFLAGS specified
> in CMaketext.
>
> <<<<<<<<
> #include "rpm/db.h"
> int main () {
> return 0;
> }
>>>>>>>>>
>
> As we're talking about libsolv-native here it uses the build host's
> gcc which has the standard include directory
> /usr/include and thus finds a /usr/include/rpm/db.h
>
> And again, I do not think that it is an error to find/use headers from
> the build host's /usr/include for a *-native
> build.

Maybe to add to 'can it be fixed?'

As I said, IMHO it is not broken, but
yes, one could pass an additional parameter to the compiler '-nostdinc'.
CHECK_INCLUDE_FILE(rpm/db.h HAVE_RPM_DB_H, "-nostdinc")
But this would break the intention of the test on the not '-native'
build as there
the rpm headers whould actually be found in the standard include directories.
So if OE ever would decide to change the rpm recipe to have an included db
this would not be picked up by the test in the not '-native' tests.

Max

