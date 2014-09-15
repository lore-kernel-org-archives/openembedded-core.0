Return-Path: <danismostlikely@gmail.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4799E65CD4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 03:15:58 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id e89so3293668qgf.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Sep 2014 20:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=VlQ9RmoC52k08PwSMvo++1aEWtMhbaC2JvMIYO/gR5s=;
	b=rSvS9uOzuqsnPoYKUYP3lNQZQfVRHdQRyJq2R30PbzBy5nKM3T975MO6DkObfK18mU
	75ozFuDuj4onA+kQebprsJfvtVJrwgCswMkc9oDixMeGsKpMsI8GRYyY44ab697ERVqY
	YCyHDbiNfZc77MD/X4srdJ06hyaD3qlzCnd6BSwvobDiXbCzJ5HqsHbURCv7P2/L0JmD
	0Xcbgtrc0Z0+0IfYDMacRWLUaalMAx8bnexx2rlHVgKFFwL3xAb1hXbeRV404I9I3qv8
	rYCuTcogkSHgEXEt7OvO73awW1FU2mDe/tSPN9/dFB2jpXksRtYnIAQkrckrW+XZlWs1
	XIFA==
MIME-Version: 1.0
X-Received: by 10.224.86.5 with SMTP id q5mr33531218qal.36.1410750960307; Sun,
	14 Sep 2014 20:16:00 -0700 (PDT)
Received: by 10.96.138.101 with HTTP; Sun, 14 Sep 2014 20:16:00 -0700 (PDT)
In-Reply-To: <CAJTo0LbT0CkWqp5MoOYS-zg838113JP7GhSuRPYK8WNjNegwXA@mail.gmail.com>
References: <CACS+7ZTLWpoBXXezLOH5k=i9-x4869mrM35ZfhY5=Wsj2d=c7Q@mail.gmail.com>
	<CAJTo0LbT0CkWqp5MoOYS-zg838113JP7GhSuRPYK8WNjNegwXA@mail.gmail.com>
Date: Sun, 14 Sep 2014 21:16:00 -0600
Message-ID: <CACS+7ZRkE2=RWVGQO_oG_MuSFGF722f1cQza+sOkS+k1wVHybg@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Patch v2] libsanitizer: Enable GCC sanitizers
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
X-List-Received-Date: Mon, 15 Sep 2014 03:16:02 -0000
Content-Type: text/plain; charset=UTF-8

On 14 September 2014 14:48, Burton, Ross <ross.burton@intel.com> wrote:
> On 13 September 2014 04:06, Dan McGregor <danismostlikely@gmail.com> wrote:
>> +python __anonymous () {
>> +    arch = d.getVar("TRANSLATED_TARGET_ARCH", True)
>> +    if arch not in { "i586", "i686", "x86_64", "arm" }:
>> +        raise bb.parse.SkipPackage("libsanitizer only works on Intel and ARM.")
>> +}
>
> Shouldn't this be something like
> COMPATIBLE_HOST=(x86_64.*|i.86.*|arm.*)? (assuming it doesn't work on
> aarch64, which isn't matched by arm.*)

Probably, yes. I'll look into whether they work on aarch64 and update this part.
In the mean time, this fixes Jonathan's issues with the last patch, so
I think I'm
at least heading in the right direction.

>
> Ross

