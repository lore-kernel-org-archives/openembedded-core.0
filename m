Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C1AD978893
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 14:05:09 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vBDE546U007496
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 13 Dec 2017 14:05:06 GMT
Message-ID: <1513173904.16507.1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Wed, 13 Dec 2017 14:05:04 +0000
In-Reply-To: <694b540b-1fc8-0388-5419-01c6e3f100c6@windriver.com>
References: <1513168490.19417.183.camel@linuxfoundation.org>
	<694b540b-1fc8-0388-5419-01c6e3f100c6@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: "Lock, Joshua" <joshua.g.lock@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Fix for the APIC hangs in qemux86-64
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
X-List-Received-Date: Wed, 13 Dec 2017 14:05:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-12-13 at 08:38 -0500, Bruce Ashfield wrote:
> On 12/13/2017 07:34 AM, Richard Purdie wrote:
> > 
> > Hi Bruce,
> > 
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=12301
> > 
> > We've root caused the hangs we're seeing in qemux86-64 on our
> > autobuilder workers. We've identified a commit on 4.15-rc3 which
> > fixes
> > the issue but backporting it to the autobuilder's host kernels will
> > be
> > a pain.
> > 
> > As a workaround I'd like to enable x2apic on qemux86-64. Since that
> > works via MSRs it avoids the problem.
> > 
> > Would it be a big issue to set CONFIG_X86_X2APIC=y for qemux86-64?
> Nope. No big deal at all. I've used the same config i the past
> when doing work with rt-KVM, so I know it well.
> 
> I'll prep a commit, and send it along as part of a rebased set
> of kernel patches.

Thanks, much appreciated.

Did we get to the bottom of the 4.12 selftest failures?

We may also need to backport the defconfig change back to the older
releases so we don't get the hangs in those builds either...

Cheers,

Richard

