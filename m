Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E7C3460CEB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Jul 2014 21:12:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s61LCQKa010192
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 1 Jul 2014 14:12:27 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.234) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Tue, 1 Jul 2014 14:12:26 -0700
Message-ID: <53B32439.6050804@windriver.com>
Date: Tue, 1 Jul 2014 16:12:25 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1404244287.git.mark.hatle@windriver.com>
	<7ec8091f15256ddcbadf4051867119ae82d333d3.1404244287.git.mark.hatle@windriver.com>
	<CAJTo0LYnb4YifRMXyPdaX7ZQMBvT3Hw2S9bN-q4Uxmiz2x3efw@mail.gmail.com>
In-Reply-To: <CAJTo0LYnb4YifRMXyPdaX7ZQMBvT3Hw2S9bN-q4Uxmiz2x3efw@mail.gmail.com>
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
X-List-Received-Date: Tue, 01 Jul 2014 21:12:33 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/1/14, 3:56 PM, Burton, Ross wrote:
> On 1 July 2014 21:01, Mark Hatle <mark.hatle@windriver.com> wrote:
>> +LICENSE = "AGPL-3.0"
>
> Presumably AGPL-v3 has the same clauses that caused
> INCOMPATIBLE_LICENSES to exist?
>
> Does this mean that we should update the documentation to add AGPL-3.0
> to the list of licenses being blacklisted in no-v3 builds, and that in
> no-v3 images we can't have rpm on the target?

I'm not sure.  We likely need someone (with a legal background) to investigate 
and let us know.

Baring that, it's likely that AGPL-3.0 has similar restrictions to GPL v3 and 
LGPL v3.

This might make it worthwhile in keeping the older Sleepycat licensed version 
around and making related changes to RPM to allow use of the older version if 
appropriate.

--Mark

> Ross
>


