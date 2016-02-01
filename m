Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BAE39771D8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 22:23:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u11MN3Op025564
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Feb 2016 14:23:03 -0800 (PST)
Received: from [172.25.44.9] (172.25.44.9) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 1 Feb 2016 14:23:03 -0800
To: Andre McCurdy <armccurdy@gmail.com>,
	<openembedded-core@lists.openembedded.org>, "Huang, Jie (Jackie)"
	<Jackie.Huang@windriver.com>
References: <1453937316-1311-1-git-send-email-armccurdy@gmail.com>
	<1453937316-1311-3-git-send-email-armccurdy@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <56AFDAC5.9000008@windriver.com>
Date: Mon, 1 Feb 2016 17:23:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1453937316-1311-3-git-send-email-armccurdy@gmail.com>
X-Originating-IP: [172.25.44.9]
Subject: Re: [PATCH 2/3] glib-2.0: drop add-march-i486-into-CFLAGS-automatically.patch
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
X-List-Received-Date: Mon, 01 Feb 2016 22:23:05 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-01-27 06:28 PM, Andre McCurdy wrote:
> The reasoning behind this patch isn't clear. ${CC} should always
> contain appropriate -march flags. If the build is misconfigured
> somehow (or someone is trying to build for i386) then we want the
> configure scipt to generate an error, not to try to quietly try to
> fix it (adding -march=i486 to CFLAGS is potentially going to cause
> more problems than it solves).
>
> Since this patch is unlikely to ever be merged upstream and it's not
> helpful in any typical OE build, drop it rather than maintaining it.
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>

Jackie,

Do you remember why this patch was needed?

-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

