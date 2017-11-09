Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4A49378458
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 16:49:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Nov 2017 08:49:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,370,1505804400"; 
   d="scan'208";a="788399"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2017 08:49:26 -0800
To: Mark Hatle <mark.hatle@windriver.com>, Mark Wielaard <mark@klomp.org>,
	Neal Gompa <ngompa13@gmail.com>
References: <20171018121423.1310-1-alexander.kanavin@linux.intel.com>
	<264c9619-62e7-ef43-9412-f00e9a1028ba@linux.intel.com>
	<634edf6c-23d9-1dbf-6c51-caef2f30c06f@windriver.com>
	<d4391631-e05e-bae9-363e-6d9fb7f3e3b6@linux.intel.com>
	<CAEg-Je-MW3k897aKZmmjh4Q-eFD8Kko=7FLRByv19sGYK1ZxRg@mail.gmail.com>
	<0afcb034-1acf-3a4b-b27a-010b7073a308@linux.intel.com>
	<1510153768.10879.80.camel@klomp.org>
	<26ddd9fc-7d5d-0dd7-fc48-c7e3ca5d4128@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <11998e65-4aa2-e2a4-7933-7058a9c84576@linux.intel.com>
Date: Thu, 9 Nov 2017 18:49:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <26ddd9fc-7d5d-0dd7-fc48-c7e3ca5d4128@windriver.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: update to 4.14.0
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
X-List-Received-Date: Thu, 09 Nov 2017 16:49:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/08/2017 05:31 PM, Mark Hatle wrote:

>> BTW. If you really don't want to use debugedit then you could use
>> something simple like a quick hack to list all sources I wrote some
>> time ago:
>> https://lists.fedorahosted.org/archives/list/elfutils-devel@lists.fedor
>> ahosted.org/message/VZP4G5N2ELYZEDAB3QYLXYHDGX4WMCUF/
>> (see the dwarfsrcfiles.c attachement)
> 
> This may very well do what we need.   Our output does not depend on RPM (or any
> specific package manager.)  We had simply been using the debugedit from RPM as
> it was the best tool for the job.  Now that GCC has the debug-prefix-map option,
> we no longer really need debugedit.

After poking some more at elfutils/binutils, I think that indeed the 
dwarfsrcfiles.c is what we need.

The standard utilities can dump the full debug table content on you, but 
they don't have a simple 'give me all sources' feature. And parsing that 
output is more fragile than I thought: there are 'compile units' and 
there are sources used to form them, and linking the two into a simple 
list of sources isn't easy.

Thanks a lot!

Alex

