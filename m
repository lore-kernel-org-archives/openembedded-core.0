Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1ABFC74197
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 17:51:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7VHp85V022862
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 31 Aug 2015 10:51:09 -0700 (PDT)
Received: from Marks-MacBook-Pro-2.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.235.1; Mon, 31 Aug 2015 10:51:08 -0700
To: Christopher Larson <clarson@kergoth.com>, Khem Raj <raj.khem@gmail.com>
References: <1440952270-9085-1-git-send-email-raj.khem@gmail.com>
	<CAPhnLPBue6s_m7rYYyuy6hyxdBTz8y1MedgspDeOLcL1XaunYQ@mail.gmail.com>
	<CAMKF1srWus=7f3EoCGtMVez0FbsFPsa1g8COMM87pqxxpkg2zw@mail.gmail.com>
	<CABcZANmWhU5sFXSU1j=3GOPu0gOCY3Nt_b54oQkRLhzs=ERSYQ@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
X-Enigmail-Draft-Status: N1110
Organization: Wind River Systems
Message-ID: <55E4940B.5050105@windriver.com>
Date: Mon, 31 Aug 2015 12:51:07 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:38.0)
	Gecko/20100101 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CABcZANmWhU5sFXSU1j=3GOPu0gOCY3Nt_b54oQkRLhzs=ERSYQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xz: Correctly specify GPL-3.0 with autoconf exception
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
X-List-Received-Date: Mon, 31 Aug 2015 17:51:12 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 8/31/15 12:35 PM, Christopher Larson wrote:
> 
> On Mon, Aug 31, 2015 at 10:10 AM, Khem Raj <raj.khem@gmail.com
> <mailto:raj.khem@gmail.com>> wrote:
> 
>     On Mon, Aug 31, 2015 at 10:05 AM, Flanagan, Elizabeth
>     <elizabeth.flanagan@intel.com <mailto:elizabeth.flanagan@intel.com>> wrote:
>     > On 30 August 2015 at 17:31, Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>> wrote:
>     >> There is m4/ax_pthread.m4 macro which uses GPL-3.0 with autoconf
>     >> exception, there is no other occurance of GPL-3.0 use, lets mark the
>     >> licence correctly.
>     >
>     > Unless the macro is actually shipped with any of the packages, I don't
>     > think we actually need to do this. Generally, LICENSE should be the
>     > intersection of all LICENSE_${PN}*.
> 
>     its not shipped on target,
> 
>     >
>     > I think the correct fix here is actually:
>     >
>     > LICENSE = "GPLv2+ & PD"
> 
>     why did you drop LGPLv2.1+
> 
> 
> I think we need a way to indicate the license of the source in addition to the
> license of what we ship, to cover the case where the license affects the ability
> to redistribute sources. I'd thought that the base LICENSE was essentially that.
> If that's not the case, then we should give some careful thought to how to cover
> both.

The way the recipe 'LICENSE =' field was defined, AFAIK, was that it was the
license of the source used to construct the binaries.

So if the autoconf was GPLv3, but the package and it's sources are GPLv2+, it
would be listed as GPLv2+.

Making this assumption allows us to be confident that the general license of
recipe matches the binaries constructed by the recipe, allowing LICENSE-${PN} =
${LICENSE} in the general case.

This does certainly put in an interesting situation though if there is an
obscure license where the binaries and sources are effectively under different
restrictions.  (Perhaps if a build environment contained a license that required
an advertising clause, but the produced binaries did not include it.  The
obligation to advertise or not could be up for some debate by a lawyer, even
though the source code may need to be redistributed.)

Do you know of any cases where this may be true or where end users may have
concerns that a license is not properly represented?

--Mark

> -- 
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
> 
> 


