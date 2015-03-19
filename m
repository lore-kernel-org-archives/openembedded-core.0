Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9959D65CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 15:46:58 +0000 (UTC)
Received: by wgbcc7 with SMTP id cc7so66024609wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 08:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=user-agent:in-reply-to:references:mime-version
	:content-transfer-encoding:content-type:subject:from:date:to:cc
	:message-id; bh=D1V6F22HBZvFIh8tbAfi7i5rDzrOBbbQlH1qxMIyQZc=;
	b=rrFcN0Q6ZYArMN+TEDt9QuG4vvEE843NNfdaT0lvXF+PSzXHpslpxnu3z1/OSYduCC
	TIUYomdb056EYgYFsJwohS5qf1dcKZ494mHOiQ4hvJZg4bLKdsxeFypjJcpIcc0tU5I+
	6Jq1rHTtHt7xirPZlpUSv0CoZt1bF4Xkc97Cboc93uvwPyDg4Gqb6Da6gRauJAEVzHCD
	cOqIzGB2o66HmTZSRTmv2syibs4HMImyv9V3QK0jXMcUUpdJvKUNYYimZQjQnjiRkzVK
	iFBh35h1u6pLOlNfScVcqIbDK7HvZjPGQd6Xm8EtlwfblzNdQQBLT1uy18UZoCRBwb96
	68mg==
X-Received: by 10.180.202.228 with SMTP id kl4mr5712284wic.66.1426780018983;
	Thu, 19 Mar 2015 08:46:58 -0700 (PDT)
Received: from ?IPv6:2001:62a:4:421:dd5f:939a:314f:78a8?
	([2001:62a:4:421:dd5f:939a:314f:78a8])
	by mx.google.com with ESMTPSA id z13sm2435455wjr.44.2015.03.19.08.46.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Mar 2015 08:46:58 -0700 (PDT)
User-Agent: K-9 Mail for Android
In-Reply-To: <CAFoFrHYdbOOACdGg9FrL0JAiR7AHfABmBjqRd2e5+9QHi2_RnA@mail.gmail.com>
References: <1426678029-19516-1-git-send-email-naresh.bhat@linaro.org>
	<1426678029-19516-4-git-send-email-naresh.bhat@linaro.org>
	<CAC1BbcTHOXPNLyWBLYkNW5=4qMRGjF=XgMB=R-nZ=PSfCJA0hw@mail.gmail.com>
	<CAFoFrHa4BC3yH4NmSyNqn_P1A64o+Xpja+HrcT3P_Zszn69s4Q@mail.gmail.com>
	<CAFoFrHYdbOOACdGg9FrL0JAiR7AHfABmBjqRd2e5+9QHi2_RnA@mail.gmail.com>
MIME-Version: 1.0
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Thu, 19 Mar 2015 16:46:52 +0100
To: Naresh Bhat <naresh.bhat@linaro.org>
Message-ID: <AAD87218-E8D3-48AF-BD7A-FC21FED7DBBB@gmail.com>
Cc: Matt Fleming <matt.fleming@intel.com>,
	oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core v2 PATCH 3/5] bootimg: Skip iso image build on aarch64
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
X-List-Received-Date: Thu, 19 Mar 2015 15:47:01 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8

On March 19, 2015 10:47:22 AM GMT+01:00, Naresh Bhat <naresh.bhat@linaro.org> wrote:
>Hi Bernhard Reutner-Fischer,
>
>On 18 March 2015 at 18:12, Naresh Bhat <naresh.bhat@linaro.org> wrote:
>
>>
>>
>> On 18 March 2015 at 18:05, Bernhard Reutner-Fischer
><rep.dot.nop@gmail.com
>> > wrote:
>>
>>> On 18 March 2015 at 12:27, Naresh Bhat <naresh.bhat@linaro.org>
>wrote:
>>> > To generate bootable ISO image the x86 architecture uses syslinux
>>> package (syslinux/isolinux.bin).
>>> > We have already skip the syslinux package on aarch64.  Hence skip
>the
>>> iso image build on aarch64.
>>> >
>>> > Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
>>> > ---
>>> >  meta/classes/bootimg.bbclass |    1 +
>>> >  1 file changed, 1 insertion(+)
>>> >
>>> > diff --git a/meta/classes/bootimg.bbclass
>b/meta/classes/bootimg.bbclass
>>> > index ed7b32f..5a8e70c 100644
>>> > --- a/meta/classes/bootimg.bbclass
>>> > +++ b/meta/classes/bootimg.bbclass
>>> > @@ -33,6 +33,7 @@ do_bootimg[depends] +=
>>> "dosfstools-native:do_populate_sysroot \
>>> >
>>> >  PACKAGES = " "
>>> >  EXCLUDE_FROM_WORLD = "1"
>>> > +NOISO_aarch64 = "1"
>>>
>>> how does that help !COMPATIBLE_HOST (of syslinux) except aarch64?
>>>
>>> I meant you to
>>> def mycheck(d):
>>>   h = d.getVar('COMPATIBLE_HOST', True)
>>>   if h:
>>>     t = d.getVar('TARGET_ARCH', True)
>>>     if re.match(h, t):
>>>       return 0
>>>   return 1
>>>
>>> and use that to set NOISO ?= "${@mycheck(d)}"
>>> (modulo typos and testing)
>>>
>>> I think something like that should work and i think this would be
>>> preferable to adding all those upcoming NOISO_baz
>>> See what i mean?
>>>
>> Thank you very much.  I will do it right now, test with luvos
>> distribution, re-post this patch.
>>
>
>I have implemented and tried it with luvOS distribution.
>
>def check_iso_build(d):
>       host = d.getVar('COMPATIBLE_HOST', True)
>       if host:
>            import re
>            target = d.getVar('TARGET_ARCH', True)
>            if re.match(host, target):
>                return 0
>       return 1
>
>NOISO ?= "${@check_iso_build(d)}"
>
>
>For the following reason
>
>The COMPATIBLE_HOST value is NULL.  Now the question is why it contains
>value NULL.  That's simply because syslinux recipe does not inherit
>bootimg.bbclass.
>
>I did following experiment - The luv-live-image.bb inherit the
>bootimg.bbclass hence I have defined the COMPATIBLE_HOST as "x86" or
>"aarch64" depending on the build I am doing. This will work for x86
>architecture but definitely going to break for aarch64  because of the
>below condition
>
>if re.match(host, target):
>                return 0
>
>Let me know If I need to experiment/change the logic of the
>implementation.

Unfortunately bitbake does not currently allow for inter-package interrogation.
Your distro should (IMHO) set NOISO appropriately (like in that func) and the IMG.bbclass should honour that decision.

HTH,



