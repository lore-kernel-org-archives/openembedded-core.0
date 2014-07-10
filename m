Return-Path: <anders@chargestorm.se>
Received: from stoexhub03.domain01.net (STOEXHUB03.domain01.net
	[83.145.59.144])
	by mail.openembedded.org (Postfix) with ESMTP id 34395703A9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jul 2014 11:40:13 +0000 (UTC)
Received: from ad.chargestorm.se (213.114.64.43) by stoexhub03.domain01.net
	(10.12.10.3) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Thu, 10 Jul 2014 13:40:11 +0200
Date: Thu, 10 Jul 2014 13:39:51 +0200
From: Anders Darander <anders@chargestorm.se>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20140710113951.GD30958@ad.chargestorm.se>
Mail-Followup-To: "Burton, Ross" <ross.burton@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
References: <cover.1404244287.git.mark.hatle@windriver.com>
	<7ec8091f15256ddcbadf4051867119ae82d333d3.1404244287.git.mark.hatle@windriver.com>
	<CAJTo0LYnb4YifRMXyPdaX7ZQMBvT3Hw2S9bN-q4Uxmiz2x3efw@mail.gmail.com>
	<53B32439.6050804@windriver.com>
	<20140703074654.GA10498@ad.chargestorm.se>
	<CAJTo0LYo=kpnBDvgaDgZHeoM6pGidJw_FibaZfoLdK3sF64AcQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYo=kpnBDvgaDgZHeoM6pGidJw_FibaZfoLdK3sF64AcQ@mail.gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
X-GFI-SMTP-Submission: 1
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] db: Uprev to 6.0.30
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
X-List-Received-Date: Thu, 10 Jul 2014 11:40:21 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi,

Sorry for the long delay...

* Burton, Ross <ross.burton@intel.com> [140703 15:43]:

> On 3 July 2014 08:46, Anders Darander <anders@chargestorm.se> wrote:
> >> Baring that, it's likely that AGPL-3.0 has similar restrictions to GPL v3 and
> >> LGPL v3.

> > I took a quick look at AGPL-3.0, and as far as I can see, all the
> > clauses that makes companies avoid GPL-3.0 are also in AGPL-3.0. Thus,
> > INCOMPATIBLE_LICENSES ought to be extended to also cover AGPL-3.0.

> So this is https://bugzilla.yoctoproject.org/show_bug.cgi?id=6499.

> Do you agree with my suggestion that LGPLv3 also needs to be excluded?

Yes, I agree with you on that one.

Though, before pushing the changes to the documentation in YP Bug 6499,
(well it seems that they're already pushed), does setting 
INCOMPATIBLE_LICENSES = "GPLv3 LGPLv3 AGPL-3.0"
work on master today?

It's quite likely that I've missed a commit making it work. I know that
I've tried this on daisy, and it started building quite a few GPLv3
packages. (In the previous builds in that build-dir, I had only GPLv3 in
that list). Thus my worries that we might document something not
working. (Though I hope I just missed the right commit).

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

