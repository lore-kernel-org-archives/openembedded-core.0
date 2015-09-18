Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1ECD67404E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 21:04:30 +0000 (UTC)
Received: by ioiz6 with SMTP id z6so69203046ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 14:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=xS9/mFQHn3/zKYMMdOGJu5McYWIccpZum4PULwpWd5o=;
	b=y+1GBwfV49q6CGPyR3wtddCTUmlMseitbYmoe2C/1WZHQl+u41C8EqS5C/hbY0k/1u
	eccEgRwHwT6VQZ8Wm0cSf0aYHwr9fbf5YQmvBEwaGmHsx4ol4Z4fxaMFb68Te131rEwb
	K53RienKLNNuA95lp+oI5PqCU8RoT8UZE3yXQUMIeVrdB6A6bDqVCqwVP5e/x9yHbADf
	r+KrY+kXtoZWdL36Uh4CYvYj7rVH8qDIbZvwuZWXHU1bmqGpwkjd8yS7cofS/LTqOs9I
	CYPL43TunKJvaugGiQnoZtMi61Z7GgPzZC30u563NRGR1tAl+kmIlF4PXGqxy/KbBSJu
	I1sA==
X-Received: by 10.107.162.139 with SMTP id l133mr15560615ioe.49.1442610270486; 
	Fri, 18 Sep 2015 14:04:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Fri, 18 Sep 2015 14:04:01 -0700 (PDT)
In-Reply-To: <CAJTo0LYSh=oCR54d_A-j8u5Uy2O4sjuL8beULX=Knb+P9hAZkQ@mail.gmail.com>
References: <cover.1442248108.git.raj.khem@gmail.com>
	<0a11e2878fd22572867a93a8e31e26524cab11c1.1442248108.git.raj.khem@gmail.com>
	<CAJTo0LYSh=oCR54d_A-j8u5Uy2O4sjuL8beULX=Knb+P9hAZkQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Sep 2015 14:04:01 -0700
Message-ID: <CAMKF1srSEX+7Exfr0bF2_-53fyEc3pwdBiNsk4dX_6M-6R_6aQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/12] waffle: upgrade waffle_1.5.1.bb -> waffle_1.5.2.bb
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
X-List-Received-Date: Fri, 18 Sep 2015 21:04:33 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 18, 2015 at 1:21 PM, Burton, Ross <ross.burton@intel.com> wrote:
> Hi Khem,
>
> On 14 September 2015 at 17:31, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>  .../waffle/{waffle_1.5.1.bb => waffle_1.5.2.bb}    |  8 ++--
>
>
> Sorry but you missed the M3 build, can you backport the fixes to 1.5.1
> instead?
>

OK, ignore this one for now then I will queue the new fix with next
lot which is all about fixes and no upgrades

