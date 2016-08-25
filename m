Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4E1406612D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 04:04:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7P44eHa018770
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 24 Aug 2016 21:04:40 -0700
Received: from server.local (147.11.119.189) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 24 Aug 2016 21:04:39 -0700
To: "Burton, Ross" <ross.burton@intel.com>, California Sullivan
	<california.l.sullivan@intel.com>
References: <1471411501-3523-1-git-send-email-california.l.sullivan@intel.com>
	<CAJTo0LZPhnJq+VO5X2R-_FE7-qzSCrQh5XWWpp-vRze5NOnqpA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <b33ff9d7-165c-e7b4-5268-c1f866a59529@windriver.com>
Date: Thu, 25 Aug 2016 00:04:38 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZPhnJq+VO5X2R-_FE7-qzSCrQh5XWWpp-vRze5NOnqpA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RFC 1/1] kernel.bbclass: Add kernel_version_sanity_check function
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
X-List-Received-Date: Thu, 25 Aug 2016 04:04:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-08-24 5:56 PM, Burton, Ross wrote:
> Bruce, can you have a look at this?

Wow. 8 days ago, and I admit that I didn't notice it go past.

Yes, I'll have a look at this during the day on Thursday.

Bruce

>
> Ross
>
> On 17 August 2016 at 06:25, California Sullivan
> <california.l.sullivan@intel.com
> <mailto:california.l.sullivan@intel.com>> wrote:
>
>     The kernel being built should match what the recipe claims it is
>     building. This function ensures that happens for anyone using
>     LINUX_VERSION as they should. As it will likely break outside kernels
>     not using LINUX_VERSION, only enable the function for linux-yocto for
>     now.
>
>     Signed-off-by: California Sullivan <california.l.sullivan@intel.com
>     <mailto:california.l.sullivan@intel.com>>
>     ---
>     I'm not absolutely sure this is the correct path to solve the issue.
>     This patch relies on LINUX_VERSION being set which isn't a guarantee.
>     There is probably a more general solution that I'm not thinking of.
>
>
>


