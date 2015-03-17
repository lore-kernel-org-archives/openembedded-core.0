Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 96AE365CD0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2015 12:20:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2HCKEPi002869
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Mar 2015 05:20:14 -0700 (PDT)
Received: from server.local (128.224.20.209) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 17 Mar 2015 05:20:14 -0700
Message-ID: <55081BFD.40607@windriver.com>
Date: Tue, 17 Mar 2015 08:20:13 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1426525757.git.bruce.ashfield@windriver.com>
	<82c728adf7229f85982233033cf23c1c6041069c.1426525757.git.bruce.ashfield@windriver.com>
	<CAJTo0LYgteZ1kuHLj4WJr6D12_9JRD2+McYtO7TVrCAOoUDtKg@mail.gmail.com>
In-Reply-To: <CAJTo0LYgteZ1kuHLj4WJr6D12_9JRD2+McYtO7TVrCAOoUDtKg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] perf: drop PR
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
X-List-Received-Date: Tue, 17 Mar 2015 12:20:18 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-03-17 3:01 AM, Burton, Ross wrote:
>
> On 16 March 2015 at 19:27, Bruce Ashfield <bruce.ashfield@windriver.com
> <mailto:bruce.ashfield@windriver.com>> wrote:
>
>     -PR = "r9"
>
>
> In general you can only remove PR if it's r0 (as that's the default in
> bitbake.conf), so this will have to remain until the PV for perf is
> changed.  But perf is versioned according to the kernel that it's built
> against so I think this PR is destined to stay forever as perf has no
> control over it's own version.

cool. That's fine with me, I honestly didn't know the rules, and
that's why i kept it separate!

But doesn't that mean that my bash RDEPENDS fix needs a PR
bump ?

Bruce

>
> Ross


