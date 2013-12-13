Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CD5AC6E245
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 06:08:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBD68cjv000091
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Dec 2013 22:08:38 -0800 (PST)
Received: from [128.224.162.242] (128.224.162.242) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 12 Dec 2013 22:08:37 -0800
Message-ID: <52AAA463.5040100@windriver.com>
Date: Fri, 13 Dec 2013 14:08:35 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1386752561.git.liezhi.yang@windriver.com>		
	<1386771992.4332.76.camel@ted> <1386772701.4332.80.camel@ted>	
	<52A95C72.3030605@windriver.com> <1386891243.504.47.camel@ted>
In-Reply-To: <1386891243.504.47.camel@ted>
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 000/122 V2] [dora] fixes for dora (cover leter only)
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
X-List-Received-Date: Fri, 13 Dec 2013 06:08:40 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 12/13/2013 07:34 AM, Richard Purdie wrote:
> On Thu, 2013-12-12 at 14:49 +0800, Robert Yang wrote:
>
> Other than the patches I've mentioned, things should be merged in the
> dora branch. We've found some build issues. I've pushed a fix for the
> qt3 one, we also have one with lttng-modules which we don't have a fix
> for yet.
>

Hi RP,

For the failure of lttng-modules, it seemed the auto builder didn't take
the patches that I had sent to poky@yoctoproject.org:

[poky] [PATCH 2/3] [dora] meta-yocto-bsp: update SRCREVs for 3.10.17 and 
beagleboard fixes

Would you please help to merge it (them) ?

The branch robert/dora-next-oecore only contains the patches for oe-core,
while the robert/dora-next contains patches for bitbake, oe-core and
meta-yoctoX, I'm sorry that I didn't explain this clearly.

// Robert

> Cheers,
>
> Richard
>
>
>

