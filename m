Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
	[209.85.222.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1D45A79860
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 01:13:55 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id r15-v6so3405840uao.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 18:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IXZhyRjW5r3MPPMuGX3RbpDV4/+w5jGqWFzbbNPOLzU=;
	b=R7NXur1x2lWYjQ5uxdMlCpuoNfn1UDrrIZz738H2VaFZ05c2Ib0sZHdVguuKUtt12U
	+oVqFCe5jAJxCZ1yziWmunSmr0n3cYXX3JoDvLRViFpankt3+1oxg3LZl24M9uqUJuaB
	LRhVqjUdf76ZBa6rFEZLZYXgbwlNkkF55X5ws/RzIAER8wV7PnTdbjwmvzfywsDqpFYS
	chap4noSHfm2erUeYIgNf8REa6jFn09lgCrb8PtJ7FYtviSY8onhBvePWPGJ0nDCAZwP
	LokidTzMb+EdGlnM9fEb7uKojR88DzhNX4tHPyK7cim+X5Ip/1hC/jlTHLAgJnq+Mb48
	JGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IXZhyRjW5r3MPPMuGX3RbpDV4/+w5jGqWFzbbNPOLzU=;
	b=EJzfrQEGNjOqf9B6uFPk2lCjLptZbJ3zKruVkQOWl8FBeJMmKn2BlFs+Sr45N5Hs3P
	dayEPWFOCyA9Q1mXw9/HjBROB5rxvdbXetbX3mkk9tBySbED9HS240aEmg8mebPbTNlX
	SeXbvAXHZfBOtSgyHeIoOyIER6qW1ipCQ7bmsX/lpPt94ypmeXaVTfz/nqrbPW+bqsEp
	co6vL1U/YjSwt8+j2lSqkeVilX5B0WPKvorLYseJGVssLIaT3o+vr5/RRTackReQh4m7
	+xxzK56qOUZeLla97G12bOLd1Un9Y7fqIv48eMuGdJis9LSP40bBwgNR//rQTVSl0ZP0
	uRyQ==
X-Gm-Message-State: APzg51CbIXD31QkvS/wUrbokAehnWOlHFO9EuJ0jnGhA8BA2OpSXG1Wc
	LW2opnPqo8tXFyJe/jEQZmy24d2eOS8MmCcv7VY=
X-Google-Smtp-Source: ANB0VdarDa5Meh1EQ6aXcN0bH46kHUC3dzXANvwqqQXDPawdsHyLEjjpYqiydFQPkUCHq3oqWDkf/7813008cL/YZ40=
X-Received: by 2002:a67:3515:: with SMTP id
	c21-v6mr1908924vsa.42.1536801236910; 
	Wed, 12 Sep 2018 18:13:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2904:0:0:0:0:0 with HTTP; Wed, 12 Sep 2018 18:13:56
	-0700 (PDT)
In-Reply-To: <CANNYZj90HLS4HZwtZK+9azCa1iMOjTXtWGy1RCBqCwRGPk+mfA@mail.gmail.com>
References: <1536656353-30689-1-git-send-email-hongxu.jia@windriver.com>
	<CANNYZj8SRYoj3QXZ7_bCLe6qrJq1TBq-WOsHMOLVLpveh151bA@mail.gmail.com>
	<41457254-4083-3d7c-4e93-95b320fe7dbb@windriver.com>
	<CANNYZj9EZF5u2R55LBnBooyPpAhi7O69kVtWsvZesXZ3H7qxOQ@mail.gmail.com>
	<0a2370ce-a756-5cf8-256b-929b70367e3a@windriver.com>
	<CANNYZj90HLS4HZwtZK+9azCa1iMOjTXtWGy1RCBqCwRGPk+mfA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 12 Sep 2018 18:13:56 -0700
Message-ID: <CAJ86T=U96L46iLVd3mA7nsK8v=G9XcOj9tJivTGVcmVO1WaXZA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: lpd-cdc-core-dev <lpd-cdc-core-dev@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssh: build support openssl 1.1
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
X-List-Received-Date: Thu, 13 Sep 2018 01:13:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 12, 2018 at 3:30 AM, Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
> 2018-09-12 11:59 GMT+02:00 Hongxu Jia <hongxu.jia@windriver.com>:
>> It's a long term target, we should try to push upstream to accept
>> openssl 1.1, such as split one patch to multiple sub patches step
>> by step, make it more reviewable,  not only openssh, ideally any
>> recipe depends on 1.0 should be turned to 1.1
>
> The pull request has been open for two years now:
> https://github.com/openssh/openssh-portable/pull/48
>
> I don't think you'll get far with the pushing the upstream. They are
> happy using libressl on *BSD, and don't particularly care about Linux
> or openssl.
>
>> Currently, use openssl10 as the standalone recipe to provide openssl,
>> everything works well in oe-core + oe.
>
> openssl10 upstream support ends at the end of 2019. We can no longer
> afford to do nothing about the situation.
>
>> As I mention before, there is still a issue at run time image. Even though
>> openssh depends on `openssl10',  but the `openssl' is installed at do_rootfs
>>
>> It breaks DEPEND/RDEPENDS principle
>>
>> [local.conf]
>> IMAGE_INSTALL_append = " openssh"
>> [local.conf]
>>
>> $ bitbake core-image-minimal
>>
>> [log.do_rootfs]
>>   Installing       : openssl-1.1.1~pre9-r0.core2_64
>> [log.do_rootfs]
>>
>> The recipe depends on openssl10, but openssl10 will not be installed.
>
> There is a library package split, so you should be seeing libcrypto10
> or libssl10 installed as well. Can you provide the full log please?

It's deliberate that including openssl10 in an image will at least
cause openssl 1.1 to built as the openssl10 libcrypto depends on
openssl10-conf and that's now provided by the openssl-conf package
from openssl 1.1

So the expected outcome of adding openssh to a minimal image would be
for the image to include libcrypto10 and libssl10 from openssl10 and
openssl-conf from openssl 1.1. Is that what you see?

(As a potential cleanup, we should perhaps remove openssl10-conf and
have libcrypto10 RDEPEND directly on openssl-conf, to make it a little
clearer that we expect to use the openssl 1.1 config for all versions
of the openssl libs).

>> BTW, Is pre9 1.1.1 openssl a stable release?
>
> Final 1.1.1 has been released yesterday, so I'll send a patch in a moment.
>
> Alex
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

