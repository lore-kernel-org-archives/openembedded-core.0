Return-Path: <anders@chargestorm.se>
Received: from stoexhubfe02.domain01.net (STOEXHUBFE02.domain01.net
	[83.145.59.141])
	by mail.openembedded.org (Postfix) with ESMTP id AD1376084E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jul 2014 07:47:12 +0000 (UTC)
Received: from ad.chargestorm.se (213.114.64.43) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Thu, 3 Jul 2014 09:47:11 +0200
Date: Thu, 3 Jul 2014 09:46:54 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20140703074654.GA10498@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <cover.1404244287.git.mark.hatle@windriver.com>
	<7ec8091f15256ddcbadf4051867119ae82d333d3.1404244287.git.mark.hatle@windriver.com>
	<CAJTo0LYnb4YifRMXyPdaX7ZQMBvT3Hw2S9bN-q4Uxmiz2x3efw@mail.gmail.com>
	<53B32439.6050804@windriver.com>
MIME-Version: 1.0
In-Reply-To: <53B32439.6050804@windriver.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
X-GFI-SMTP-Submission: 1
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
X-List-Received-Date: Thu, 03 Jul 2014 07:47:19 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Mark Hatle <mark.hatle@windriver.com> [140701 23:12]:

> On 7/1/14, 3:56 PM, Burton, Ross wrote:
> > On 1 July 2014 21:01, Mark Hatle <mark.hatle@windriver.com> wrote:
> >> +LICENSE = "AGPL-3.0"

> > Presumably AGPL-v3 has the same clauses that caused
> > INCOMPATIBLE_LICENSES to exist?

> > Does this mean that we should update the documentation to add AGPL-3.0
> > to the list of licenses being blacklisted in no-v3 builds, and that in
> > no-v3 images we can't have rpm on the target?

> I'm not sure.  We likely need someone (with a legal background) to investigate 
> and let us know.

That's probably the best idea.

> Baring that, it's likely that AGPL-3.0 has similar restrictions to GPL v3 and 
> LGPL v3.

I took a quick look at AGPL-3.0, and as far as I can see, all the
clauses that makes companies avoid GPL-3.0 are also in AGPL-3.0. Thus,
INCOMPATIBLE_LICENSES ought to be extended to also cover AGPL-3.0.

> This might make it worthwhile in keeping the older Sleepycat licensed version 
> around and making related changes to RPM to allow use of the older version if 
> appropriate.

That's definitely something we need, just as we keep  GPLv2 versions
around when the upstream project has switched to GPLv3.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

