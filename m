Return-Path: <jan.kiszka@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 149ED71BD4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jun 2017 15:14:09 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v56FE7WJ004911
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Tue, 6 Jun 2017 17:14:07 +0200
Received: from md1f2u6c.ww002.siemens.net ([139.25.68.37])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id v56FE6tc021188;
	Tue, 6 Jun 2017 17:14:07 +0200
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <15e918fb-c2e6-3005-6221-08601c804271@siemens.com>
	<a60f39a6-8355-82dc-20b2-5f7b3d6397b3@linux.intel.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <af72aeb2-915e-0c63-60e9-18b6c7bce5ad@siemens.com>
Date: Tue, 6 Jun 2017 17:14:06 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
	Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <a60f39a6-8355-82dc-20b2-5f7b3d6397b3@linux.intel.com>
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
X-List-Received-Date: Tue, 06 Jun 2017 15:14:10 -0000
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2017-06-06 16:12, Alexander Kanavin wrote:
> On 06/06/2017 01:17 PM, Jan Kiszka wrote:
>> devtool add / recipetool create do not work properly /wrt shrinkwrap
>> when it comes to node-red-node-serialport. npm shrinkwrap finds a number
>> of extraneous packages and refuses to generate an output.
>>
>> There are various workarounds discussed in [1]. For me this seems to
>> work:
> 
> You forgot to include the actual [1] :)

Ah, sorry: https://github.com/npm/npm/issues/4435

> 
>> But it may have unwanted side effects. So, what would be the proper way
>> to address this issue?
> 
> A few months ago we had a long, big discussion about how to support
> these kinds of language environments in a way that is sustainable (I
> personally do not think the current approach with npm is viable in the
> long term). Here's the initial couple of emails:
> 
> http://lists.openembedded.org/pipermail/openembedded-architecture/2017-March/000480.html
> 
> 
> http://lists.openembedded.org/pipermail/openembedded-architecture/2017-March/000481.html
> 

Yeah, good points. Probably this problem is also related to OE
reimplementing parts of the npm logic.

But I suppose those concepts won't materialize very soon, will they? I'm
also looking for a short-term solution, at least some reasonable tactic
to generate such recipes in the meantime. Is there something in that
thread I should dig into?

Jan

-- 
Siemens AG, Corporate Technology, CT RDA ITP SES-DE
Corporate Competence Center Embedded Linux

