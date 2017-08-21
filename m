Return-Path: <andrej.valek@siemens.com>
Received: from lizzard.sbs.de (lizzard.sbs.de [194.138.37.39])
	by mail.openembedded.org (Postfix) with ESMTP id 13404782A0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 06:12:42 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id v7L6Cfft018917
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Mon, 21 Aug 2017 08:12:42 +0200
Received: from [192.168.253.100] ([163.242.56.100])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id v7L6Ceov023196
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 21 Aug 2017 08:12:40 +0200
To: Randy MacLeod <randy.macleod@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	Armin Kuster <akuster808@gmail.com>
References: <1502981085-18209-1-git-send-email-andrej.valek@siemens.com>
	<1502987497.13978.239.camel@linuxfoundation.org>
	<b911b7ff-0309-e459-0baf-b0fab4b68747@siemens.com>
	<1503048946.32591.0.camel@linuxfoundation.org>
	<aa161775-9c09-bf1f-8190-9c6e701f07c7@siemens.com>
	<c9d3d7c6-f6d0-c316-1e1e-8b67f652ae4a@windriver.com>
From: Andrej Valek <andrej.valek@siemens.com>
Message-ID: <dff127f0-b668-0d09-3270-ce1d67c04891@siemens.com>
Date: Mon, 21 Aug 2017 08:12:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <c9d3d7c6-f6d0-c316-1e1e-8b67f652ae4a@windriver.com>
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
X-List-Received-Date: Mon, 21 Aug 2017 06:12:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hello Armin,

Could You please merge it into krogoth and morty branch?

@Randy: last commit into those branches was ~5weeks ago, so they are
still maintained.

Regards,
Andrej

On 08/18/2017 05:46 PM, Randy MacLeod wrote:
> On 2017-08-18 06:05 AM, Andrej Valek wrote:
>> OK thank You, so please merge it into these branches.
> 
> Add Armin, who maintains those branches:
>     https://wiki.yoctoproject.org/wiki/Releases
> Is Krogoth still maintained? It's listed at Stable in the link above.
> 
> ../Randy
> 
> 
> 
>>
>> Regards,
>> Andrej
>>
>> On 08/18/2017 11:35 AM, Richard Purdie wrote:
>>> On Fri, 2017-08-18 at 08:26 +0200, Andrej Valek wrote:
>>>> Yes, for actual branch is not required. But for branches like krogoth
>>>> and morty, where HOSTTOOLS is not implemented, is this necessary.
>>>
>>> Lets just apply this to krogoth/morty then...
>>>
>>> Cheers,
>>>
>>> Richard
>>>
> 
> 

