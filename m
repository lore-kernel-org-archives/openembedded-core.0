Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2006762252
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 05:35:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7D5ZM2O017860
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 Aug 2014 22:35:22 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 12 Aug 2014 22:35:20 -0700
Message-ID: <53EAF917.7050604@windriver.com>
Date: Wed, 13 Aug 2014 13:35:19 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Mike Looijmans <mike.looijmans@topic.nl>, "Burton, Ross"
	<ross.burton@intel.com>
References: <53EA5178.7020209@topic.nl>	<CAJTo0LY+Kp14Sn4bdFtX4eYCK4Oea52MEG-=s6TbG_CKoMx9Pg@mail.gmail.com>
	<53EAF40B.8050301@topic.nl>
In-Reply-To: <53EAF40B.8050301@topic.nl>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Autotools and "foreign"
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
X-List-Received-Date: Wed, 13 Aug 2014 05:35:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/13/2014 01:13 PM, Mike Looijmans wrote:
> On 08/12/2014 08:57 PM, Burton, Ross wrote:
>> On 12 August 2014 18:40, Mike Looijmans <mike.looijmans@topic.nl> wrote:
>>> Is there an alternative to manually patching all of these packages to get
>>> them to compile once more?
>>
>> Depends on the package, but generally you'll need to update the
>> automake macro at the top of configure.ac (and submit a patch upstream
>> as this should have been fixed years ago).
>
> Basically, you're saying "no" then?
>
>> Encouraging said upstreams to use autoreconf instead of (likely)
>> home-grown crazy would be a good move whilst you're talking to them.
>
> That might be the case if said upstream people actually still existed. Most of
> these packages have since long been abandoned.
>
> So I guess I'll have to cook up a class that works around it, just adding the
> "missing" files into the S directory might do the trick.
>

How about add this to configure.ac:

AM_INIT_AUTOMAKE([foreign])

// Robert


> Mike.
>
>
> Met vriendelijke groet / kind regards,
>
> Mike Looijmans
>
> TOPIC Embedded Systems
> Eindhovenseweg 32-C, NL-5683 KH Best
> Postbus 440, NL-5680 AK Best
> Telefoon: (+31) (0) 499 33 69 79
> Telefax:  (+31) (0) 499 33 69 70
> E-mail: mike.looijmans@topic.nl
> Website: www.topic.nl
>
> Please consider the environment before printing this e-mail
>
> Bezoek ons op 9 en 10 september tijdens Technology for Health Den Bosch (stand 53)
> http://www.technologyforhealth.nl
>

