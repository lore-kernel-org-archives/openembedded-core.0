Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2047B71A38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 15:13:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u9IFDDQp013795
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Oct 2016 08:13:13 -0700 (PDT)
Received: from [172.25.44.6] (172.25.44.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 18 Oct 2016 08:13:12 -0700
To: Jussi Kukkonen <jussi.kukkonen@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1476469708.git.jussi.kukkonen@intel.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <0464acab-69a2-715d-5a3d-61e3961e8ccb@windriver.com>
Date: Tue, 18 Oct 2016 11:13:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <cover.1476469708.git.jussi.kukkonen@intel.com>
X-Originating-IP: [172.25.44.6]
Subject: Re: [PATCH 0/2] Re-add piglit to sdk images
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
X-List-Received-Date: Tue, 18 Oct 2016 15:13:14 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-10-14 02:31 PM, Jussi Kukkonen wrote:
> Piglit was removed because the current version was making sdk
> images too large. This patchset reduces the installed size by 1.5GB
> and adds piglit back to core-tools-testapps.
>
> Running piglit still requires the same amount of space so in practice
> this is useful for installed images only.
>
> Q: Do I need to declare a runtime dependency that typically comes
> from busybox (tar)?

Yes, because some people try to eliminate busybox from their image.
-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

