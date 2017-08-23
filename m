Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0020278302
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 17:19:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7NHJKGZ020008
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 23 Aug 2017 10:19:20 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 23 Aug 2017 10:19:19 -0700
To: Khem Raj <raj.khem@gmail.com>, Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
References: <352435b6-964b-505d-ceba-ffb5f8bd00ea@windriver.com>
	<d82dd608-8d33-fdb0-73de-79333f80fa60@windriver.com>
	<CAMKF1srbnYTRGX_OfOcG+PHFHqV0--rArZdqPrxZd7x8-PbW-A@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <9f4849ce-60e9-f1db-ec75-e9410a6a8718@windriver.com>
Date: Wed, 23 Aug 2017 12:19:18 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srbnYTRGX_OfOcG+PHFHqV0--rArZdqPrxZd7x8-PbW-A@mail.gmail.com>
Subject: Re: pkgconfig vs pkgconf
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
X-List-Received-Date: Wed, 23 Aug 2017 17:19:20 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 8/23/17 11:57 AM, Khem Raj wrote:
> 
> On Wed, Aug 23, 2017 at 9:19 AM Mark Hatle <mark.hatle@windriver.com
> <mailto:mark.hatle@windriver.com>> wrote:
> 
>     On 8/23/17 10:46 AM, Mark Hatle wrote:
>     > As of this morning, I'm not getting a warning about a preferred provider being
> 
>     typo.. 'I'm -NOW- getting a warning'
> 
>     sorry for the confusion...
> 
>     > necessary to differentiate between pkgconfig and pkgconf.
>     >
>     > I've set the following to make it "go away".  But I assume we need to set a
>     > default somewhere in the system...
>     >
>     > PREFERRED_PROVIDER_pkconfig = "pkgconfig"
>     > PREFERRED_PROVIDER_pkgconfig-native = "pkgconfig-native"
>     >
>     > PREFERRED_RPROVIDER_pkgconfig = "pkgconfig"
>     >
> 
> 
> How about nativesdk ? I filed a bug for this earlier 

didn't show up in my specific use-case, but I wasn't building an SDK.

--Mark

> 
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 


