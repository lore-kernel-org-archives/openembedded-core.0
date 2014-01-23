Return-Path: <Ming.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A10C26B05F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 07:22:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0N7MeGu025281
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 22 Jan 2014 23:22:40 -0800 (PST)
Received: from [128.224.162.153] (128.224.162.153) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Wed, 22 Jan 2014 23:22:38 -0800
Message-ID: <52E0C33B.3090605@windriver.com>
Date: Thu, 23 Jan 2014 15:22:35 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <1390459548-21038-1-git-send-email-ming.liu@windriver.com>
	<1390461261.24755.12.camel@e130.pbcl.net>
In-Reply-To: <1390461261.24755.12.camel@e130.pbcl.net>
X-Originating-IP: [128.224.162.153]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] quilt: add ac_cv_path_BASH to CACHED_CONFIGUREVARS also for native
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
X-List-Received-Date: Thu, 23 Jan 2014 07:22:38 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/23/2014 03:14 PM, Phil Blundell wrote:
> On Thu, 2014-01-23 at 14:45 +0800, Ming Liu wrote:
>>   
>> +CACHED_CONFIGUREVARS += "ac_cv_path_BASH=/bin/bash"
>>   
>> -CACHED_CONFIGUREVARS += "ac_cv_path_BASH=${base_bindir}/bash"
> Why did you change this from ${base_bindir} to a hardcoded path?
Because base_bindir would be expanded as '${base_prefix}/bin' for native 
recipe, then it has to set DEPENDS on bash-native which I think is not 
what it supposed to be, the change would let it locate bash from host 
environment.

//Ming Liu
>
> p.
>
>
>
>


