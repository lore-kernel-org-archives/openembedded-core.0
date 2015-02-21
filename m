Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3AA1C71633
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Feb 2015 01:57:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1L1vNlZ007178
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 20 Feb 2015 17:57:23 -0800 (PST)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 20 Feb 2015 17:57:23 -0800
Message-ID: <54E7E601.2000102@windriver.com>
Date: Sat, 21 Feb 2015 09:57:21 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1424230079.git.liezhi.yang@windriver.com>	
	<eceff7d5f3e72ad90a818f7c8b42270f4c8ccb9b.1424230079.git.liezhi.yang@windriver.com>	
	<54E6C721.7060505@windriver.com>
	<1424436783.11836.44.camel@linuxfoundation.org>
In-Reply-To: <1424436783.11836.44.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] gettext 0.16.1: disable native
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
X-List-Received-Date: Sat, 21 Feb 2015 01:57:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 02/20/2015 08:53 PM, Richard Purdie wrote:
> On Fri, 2015-02-20 at 13:33 +0800, Robert Yang wrote:
>> Any comments on the two patches, please ?
>
> Well, I'm not convinced these are correct.
>
> If you have differing native and target gettext versions, I don't think
> it will work well and we're storing up potential trouble.
>
> Having said that, I haven't replied so far as you're going to ask how
> this breaks and how we fix it and I simply don't know. The patches don't
> look/feel right though.

Thanks, maybe we can fix the lower version gettext-native, I will try.

// Robert

>
> Cheers,
>
> Richard
>
>
>

