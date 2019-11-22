Return-Path: <quentin.schulz@streamunlimited.com>
X-Greylist: delayed 2696 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 22 Nov 2019 16:00:51 UTC
Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
	by mail.openembedded.org (Postfix) with ESMTP id 8510D7FCE3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2019 16:00:51 +0000 (UTC)
Received: from bsmtp2.bon.at (unknown [192.168.181.103])
	by bsmtp3.bon.at (Postfix) with ESMTPS id 47KKkj1Cw5z5vd0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2019 16:15:57 +0100 (CET)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 47KKkd5djnz5tlH;
	Fri, 22 Nov 2019 16:15:53 +0100 (CET)
Date: Fri, 22 Nov 2019 16:15:52 +0100
From: Quentin Schulz <quentin.schulz@streamunlimited.com>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20191122151552.rvbxrqris4ytn56f@qschulz>
References: <1571325700-5138-1-git-send-email-akuster808@gmail.com>
	<20191017184222.GN17412@denix.org>
	<2e2b16b4-fff6-b84c-1f48-0e020a0f3629@gmail.com>
	<20191017200153.GO17412@denix.org>
	<80a9db47-73ab-3326-3488-d5d9649e352f@ni.com>
	<21ecbf49-d34f-414c-bb05-636626ac6ee9@gmail.com>
MIME-Version: 1.0
In-Reply-To: <21ecbf49-d34f-414c-bb05-636626ac6ee9@gmail.com>
User-Agent: NeoMutt/20180716
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [thud][PATCH] Revert "OpkgPM: use --add-ignore-recommends to process BAD_RECOMMENDATIONS"
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
X-List-Received-Date: Fri, 22 Nov 2019 16:00:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

On Fri, Oct 18, 2019 at 02:18:15PM -0700, akuster808 wrote:
> 
> 
> On 10/18/19 10:58 AM, Alejandro Del Castillo wrote:
> >
> > On 10/17/19 3:01 PM, Denys Dmytriyenko wrote:
> >> On Thu, Oct 17, 2019 at 12:21:11PM -0700, akuster808 wrote:
> >>> On 10/17/19 11:42 AM, Denys Dmytriyenko wrote:
> >>>> Thank you for this revert! I've been pulling my hair out past couple days
> >>>> figuring out why BAD_RECOMMENDATIONS stopped working for us. This fixed it.
> >>> What I find curious is that the offending commit has been in thud since
> >>> July 29th and we are just now hearing about issues.
> >> Yeah, in our case we only noticed the issue when we started preparing the
> >> latest release and found extra packages that weren't supposed to be there.
> > Is there a bugzilla ticket tracking the issue? 
> I am not aware of any for thud. IIRC, this commit was a backport request
> from the community.
> 
> It would be interesting if those who have issues with thud check against
> master.
> 

Given that I took the patches from 2.7 (warrior) for backport, we should
be safe from that side.

Tested anyway with poky c9a1a608f5146e5dcfebc8e566cb7f6388a3986f
(warrior), and:
1. BAD_RECOMMENDATIONS are not pulled, as intended and expected,
2. the bug I explained in my cover letter[1] as a reason for backporting
the patch Armin has since reverted does not happen,

Quentin

[1] https://lists.yoctoproject.org/g/poky/message/11671
-- 
StreamUnlimited Engineering GmbH
High Tech Campus Vienna, Gutheil-Schoder-Gasse 10, 1100 Vienna, Austria
quentin.schulz@streamunlimited.com, www.streamunlimited.com

