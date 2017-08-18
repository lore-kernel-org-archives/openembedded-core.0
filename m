Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 166FD77D1A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 15:46:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7IFkcLM001302
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 18 Aug 2017 08:46:39 -0700 (PDT)
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 18 Aug 2017 08:46:38 -0700
To: Andrej Valek <andrej.valek@siemens.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Armin Kuster
	<akuster808@gmail.com>
References: <1502981085-18209-1-git-send-email-andrej.valek@siemens.com>
	<1502987497.13978.239.camel@linuxfoundation.org>
	<b911b7ff-0309-e459-0baf-b0fab4b68747@siemens.com>
	<1503048946.32591.0.camel@linuxfoundation.org>
	<aa161775-9c09-bf1f-8190-9c6e701f07c7@siemens.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <c9d3d7c6-f6d0-c316-1e1e-8b67f652ae4a@windriver.com>
Date: Fri, 18 Aug 2017 11:46:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <aa161775-9c09-bf1f-8190-9c6e701f07c7@siemens.com>
X-Originating-IP: [172.25.44.7]
Subject: Re: [PATCH] ca-certificates: prevent executing update-ca-certificates from host system
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
X-List-Received-Date: Fri, 18 Aug 2017 15:46:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2017-08-18 06:05 AM, Andrej Valek wrote:
> OK thank You, so please merge it into these branches.

Add Armin, who maintains those branches:
    https://wiki.yoctoproject.org/wiki/Releases
Is Krogoth still maintained? It's listed at Stable in the link above.

../Randy



> 
> Regards,
> Andrej
> 
> On 08/18/2017 11:35 AM, Richard Purdie wrote:
>> On Fri, 2017-08-18 at 08:26 +0200, Andrej Valek wrote:
>>> Yes, for actual branch is not required. But for branches like krogoth
>>> and morty, where HOSTTOOLS is not implemented, is this necessary.
>>
>> Lets just apply this to krogoth/morty then...
>>
>> Cheers,
>>
>> Richard
>>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

