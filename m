Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8CCC860797
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 22:04:33 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 18 Jul 2016 15:04:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,386,1464678000"; d="scan'208";a="848733403"
Received: from mlopezva-mobl2.zpn.intel.com (HELO [10.219.5.49])
	([10.219.5.49])
	by orsmga003.jf.intel.com with ESMTP; 18 Jul 2016 15:04:32 -0700
To: akuster808 <akuster808@gmail.com>, openembedded-core@lists.openembedded.org
References: <cover.1456412549.git.mariano.lopez@linux.intel.com>
	<5249539744d86c132ab2566a3bb99de260880e6d.1468241364.git.mariano.lopez@linux.intel.com>
	<57856CDA.5070201@gmail.com>
From: Mariano Lopez <mariano.lopez@linux.intel.com>
Message-ID: <578D5274.2070208@linux.intel.com>
Date: Mon, 18 Jul 2016 17:04:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <57856CDA.5070201@gmail.com>
Subject: Re: [PATCHv3 1/2] cve-check-tool: Add recipe
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
X-List-Received-Date: Mon, 18 Jul 2016 22:04:35 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 07/12/2016 05:19 PM, akuster808 wrote:
> Mariano,
>
>
> On 07/11/2016 05:52 AM, mariano.lopez@linux.intel.com wrote:
>> From: Mariano Lopez <mariano.lopez@linux.intel.com>
>>
>> cve-check-tool is a program for public CVEs checking.
>> This tool also seek to determine if a vulnerability has
>> been addressed by a patch.
> By tool do you mean the "cve-check-tool"? All the Nvd DB can tell you if
> an CVE has been assigned, anything more than that is not guaranteed.
>
> Look at https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-5320

Sorry for the confusion, here I was referring to patches in OE that 
address the CVE, the class will look for the CVE tag for this.

>
>> The recipe also includes the do_populate_cve_db task
>> that will populate the database used by the tool.
> This DB is big. May want to add a note to that affect. Maybe a note
> about how to share the DB across builds like with the AB.

You are right, the DB is big and it will take some time to download. By 
default the tool will download the DB to DL_DIR, so if you have this dir 
shared, it will be downloaded just one time, and incremental updates later.

>
> time for me to play with this.
>
> Thanks for driving this.

Glad to be helping with this.

> regards,
> Armin
>
Mariano

