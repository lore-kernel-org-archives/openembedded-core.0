Return-Path: <jan.kiszka@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 3A85A72F2A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 12:04:17 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v57C4GFq018209
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 7 Jun 2017 14:04:16 +0200
Received: from md1f2u6c.ww002.siemens.net ([139.25.68.37])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id v57C4Fpe018362;
	Wed, 7 Jun 2017 14:04:16 +0200
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <15e918fb-c2e6-3005-6221-08601c804271@siemens.com>
	<a60f39a6-8355-82dc-20b2-5f7b3d6397b3@linux.intel.com>
	<af72aeb2-915e-0c63-60e9-18b6c7bce5ad@siemens.com>
	<615663ca-d13f-9bca-6e3d-e5dc22cfaebf@linux.intel.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <3989e16e-7a69-5f0a-90e9-3fcd1ed8b14d@siemens.com>
Date: Wed, 7 Jun 2017 14:04:15 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
	Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <615663ca-d13f-9bca-6e3d-e5dc22cfaebf@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: Fun with npm shrinkwrap
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
X-List-Received-Date: Wed, 07 Jun 2017 12:04:18 -0000
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2017-06-07 13:43, Alexander Kanavin wrote:
> On 06/06/2017 06:14 PM, Jan Kiszka wrote:
> 
>> Yeah, good points. Probably this problem is also related to OE
>> reimplementing parts of the npm logic.
>>
>> But I suppose those concepts won't materialize very soon, will they? I'm
>> also looking for a short-term solution, at least some reasonable tactic
>> to generate such recipes in the meantime. Is there something in that
>> thread I should dig into?
> 
> What I am getting at is that it would be awesome if you convince your
> management that npm support in Yocto is a problem that needs a better
> solution and work on it. Yes, this means you can't work on product
> development for quite some time; this is the price for using open source
> projects without a commercial support contract :)

We are such a instance support :) - but we also need to get paid / pay
our contractors.

> 
> My apologies if this is not the answer you were seeking.
> 

I'm getting your point, even more now as I ran into a package that does
not even install at all (node-red-contrib-opcua). Can't promise anything
at this point, but I will carry this forward, in all directions.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA ITP SES-DE
Corporate Competence Center Embedded Linux

