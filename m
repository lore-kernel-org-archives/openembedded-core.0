Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 60C687E9F0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 01:08:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5S17C7W006457
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Jun 2019 18:08:03 -0700
Received: from [128.224.162.148] (128.224.162.148) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Thu, 27 Jun 2019 18:07:47 -0700
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1561605262.git.Qi.Chen@windriver.com>
	<d6c08eda49cd84388b7547243ee0e3d73a488b53.1561605262.git.Qi.Chen@windriver.com>
	<7850229.D4MhMV1OIs@localhost.localdomain>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <634c0c10-c4df-d448-622e-778bc07415a9@windriver.com>
Date: Fri, 28 Jun 2019 09:20:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <7850229.D4MhMV1OIs@localhost.localdomain>
X-Originating-IP: [128.224.162.148]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] devtool: warn user about multiple layer having the same base name
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
X-List-Received-Date: Fri, 28 Jun 2019 01:08:28 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 06/28/2019 07:25 AM, Paul Eggleton wrote:
> On Thursday, 27 June 2019 3:14:55 PM NZST Chen Qi wrote:
>> Currently `devtool finish RECIPE meta' will silently succeed even
>> if there are multiple layers having the same base name of 'meta'.
>> e.g. meta layer from oe-core and meta layer from meta-secure-core.
> Good catch!
>
>> We should at least give user a warning in such case. With the patch,
>> we will get warning like below.
>>
>> WARNING: Multiple layers have the same base name 'meta', use the first one '<PROJ_DIR>/oe-core/meta'.
>> WARNING: Consider using path instead of base name to specify layer:
>> 	 	  <PROJ_DIR>/oe-core/meta
>> 		  <PROJ_DIR>/meta-secure-core/meta
>>
> "use the first one" -> "using the first one"
>
> However I'm wondering if this is the right behaviour. What if the user realises they actually wanted the second one? Given it's a warning the finish operation would have proceeded and the user will have to clean things up manually. Rather than a warning, should we in fact be erroring out and requiring the user to be more specific in this case?
>
> Cheers,
> Paul
>
More reasonable. I'll send out V2.

Best Regards,

Chen Qi


