Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f193.google.com (mail-ob0-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3291C7638A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 23:14:16 +0000 (UTC)
Received: by obbtr2 with SMTP id tr2so3084774obb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 16:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=sW83Mm2ovvP734De6CPdHFqZjqnYwCsBC1c7seJ1+Oo=;
	b=Q4IC93j9sldl1IhCLgX2WnctX7ajj0g7Sz609TtZiy9zk4kVu7Hy7OMxofntVafH3V
	P5NP41BAgmRqOF0KOiDYHP96Jf/aOfDCRgDy5pioQuJyvcA7kBer1Dn+wBajFNJIZVg4
	/eVLovyS0fe2gwfULmqhCDPnfJxzRt2h134oyHjiTNUeTYruqzYTy3FdUeUaYwSiF+CR
	usIH6CHOm5MfRM4zR0tfQXdeEUhFiQrleTREMOjz668ZphRAMJr/izunm3m1HExVUj/9
	7G/TL+JWBQG+h5Kwf+19K6eOPMUoIwBdDN/xlvu4ArzQO4rf3fHeBDAGWJDqmhqnq5RP
	sLMg==
MIME-Version: 1.0
X-Received: by 10.182.213.68 with SMTP id nq4mr5489608obc.16.1438298056400;
	Thu, 30 Jul 2015 16:14:16 -0700 (PDT)
Received: by 10.202.102.147 with HTTP; Thu, 30 Jul 2015 16:14:16 -0700 (PDT)
In-Reply-To: <55BA134F.9010908@linux.intel.com>
References: <1436426071-3790-1-git-send-email-leimaohui@cn.fujitsu.com>
	<56502.10.252.20.69.1436441609.squirrel@linux.intel.com>
	<CAP9ODKqHNtENns2SOk-C9S2hh1weyf15=n1V8Rxgs+Rh5rMJGw@mail.gmail.com>
	<CAJTo0Layj-AXfYMmvqjZ-ASSDx_PptbysS7tUiGDLAyPjLGN5A@mail.gmail.com>
	<CAJ86T=WJiNC5fJj+Vgj=4T-dS+E9_CvTw79nFLVuFETxrp1qdw@mail.gmail.com>
	<1436601450.3310.27.camel@linuxfoundation.org>
	<55BA134F.9010908@linux.intel.com>
Date: Thu, 30 Jul 2015 16:14:16 -0700
Message-ID: <CAJ86T=UHTjTA7S_4EV66VEUoaRhYmaYveVcfxbqzVJsxZ4s6dg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: meta-gplv2? [Was Re: parted_1.8.6.bb: add parted that not GPLv3]
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
X-List-Received-Date: Thu, 30 Jul 2015 23:14:19 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 30, 2015 at 5:06 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 07/11/2015 10:57 AM, Richard Purdie wrote:
>
>> This does touch on something I have wondered about for a while, which is
>> whether the time has come to move the GPLv2 pieces to their own layer
>> and possibly their own maintainership. Obviously there are pros and cons
>> to doing that.
>>
>> Thoughts?
>
> I'm all for that, which shouldn't be surprising :) The rationale is that we
> need to keep the scope and breadth of oe-core sane and manageable. The
> emphasis should be on having lesser amount of high quality, up-to-date
> recipes than vice versa.

To play devil's advocate, a counter argument could be:

The number of high quality recipes which can be maintained in oe-core
depends on the number of developers actively using and contributing to
oe-core. More active developers means more recipes can be maintained
to a high quality.

By restricting the scope of oe-core you reduce the number of
developers who are able to use it directly. If the developers who can
no longer use oe-core directly lose interest in tracking master
between releases or start to go off and maintain their own personal
forks, then you reduce the number of developers actively using and
contributing to oe-core.

Whether oe-core is at a stage in it's life cycle where it would
benefit more from growing it's developer base or from knuckling down
and focusing on a smaller set of core functionality is an interesting
question...


> That means a continuous lookout for possible things to remove. Qt4 is one
> such thing, old GPLv2 software is another.
>
>
> Alex
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

