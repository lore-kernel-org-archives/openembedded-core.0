Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 115F26BAAB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2019 00:46:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x9H0k7Cl017624
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Oct 2019 17:46:07 -0700
Received: from [172.25.44.5] (172.25.44.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 16 Oct 2019 17:46:06 -0700
To: Ross Burton <ross.burton@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <20191015054827.7103-1-dan.callaghan@opengear.com>
	<20191015061510.21803-1-dan.callaghan@opengear.com>
	<e41fa2a4-1744-993c-d38a-f98229726251@gmail.com>
	<1571123420-sup-6304@galangal.danc.bne.opengear.com>
	<84b5c0f5-e790-84e4-967c-6eace1f673ba@intel.com>
	<1571178617-sup-8448@galangal.danc.bne.opengear.com>
	<37f8a95f-310d-ee4b-bf5e-b91041955076@intel.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <5f7b9234-5cca-fbea-3cce-a9ddbb18a24d@windriver.com>
Date: Wed, 16 Oct 2019 20:46:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <37f8a95f-310d-ee4b-bf5e-b91041955076@intel.com>
X-Originating-IP: [172.25.44.5]
Subject: Re: [PATCH v2] elfutils: add PACKAGECONFIG for compression algorithms
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
X-List-Received-Date: Thu, 17 Oct 2019 00:46:08 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 10/16/19 6:10 AM, Ross Burton wrote:
> On 15/10/2019 23:46, Dan Callaghan wrote:
>> It does seem like it would be simpler to just take bzip2-native out of
>> ASSUME_PROVIDED, but I guess leaving it in there lets people avoid
>> building bzip2-native under some circumstances.
> 
> I believe it's a bootstrap speed thing.  If we can assume bzip2 on the 
> host exists we don't need to build it to get going, which is especially 
> fun if you need to decompress bzip2 files to build bzip2...

To save other people from checking if the bzip2 recipe and Ross are mad:

$ grep "SRC_URI =" meta/recipes-extended/bzip2/bzip2_1.0.8.bb
SRC_URI = "https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz \

so the recipe is sane at least. ;-)
../Randy

> 
> Ross


-- 
# Randy MacLeod
# Wind River Linux

