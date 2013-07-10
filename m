Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DAAB86A59E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 01:26:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6A1QHs5010999
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 9 Jul 2013 18:26:17 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 9 Jul 2013 18:26:15 -0700
Message-ID: <51DCB835.4070507@windriver.com>
Date: Wed, 10 Jul 2013 09:26:13 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1373372649.git.hongxu.jia@windriver.com>
	<4535187.OqzhIf4Y4R@helios> <51DC1027.9030801@windriver.com>
	<1402577.4PhkADxV84@helios>
In-Reply-To: <1402577.4PhkADxV84@helios>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/5] nss: add version 3.15.1
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
X-List-Received-Date: Wed, 10 Jul 2013 01:26:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Got it, I will check the one in meta-browser again to make sure everything
is handled, and resend the patch.

Thanks,
Hongxu

On 07/09/2013 09:38 PM, Paul Eggleton wrote:
> On Tuesday 09 July 2013 21:29:11 Hongxu Jia wrote:
>> 1, 3.15.1 is the newest version, and file structure has more change than
>> previous version.
>>
>> 2, 3.13.3 just skip signing, and cheksum file doesn't be generated.
>>
>> 3, 3.13.3 doesn't completely fix incorrect shebang of perl (PATCH 5/5)
>>
>> 4, 3.13.3's package doesn't contain ${D}${bindir}/  and ${D}${sysconfdir}
>>
>> I think 3.15.1 is better.
> The reason I ask is that if merged this will effectively replace the one in
> meta-browser, so as long as it handles everything that the meta-browser recipe
> does it should be OK.
>
> Cheers,
> Paul
>


