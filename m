Return-Path: <naveen.kumar.saini@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 47D8E7D2AD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 02:19:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Apr 2019 19:19:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,360,1549958400"; d="scan'208";a="143551077"
Received: from optimus-prime.png.intel.com (HELO [172.30.199.130])
	([172.30.199.130])
	by fmsmga007.fm.intel.com with ESMTP; 16 Apr 2019 19:19:57 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20190416055919.9090-1-naveen.kumar.saini@intel.com>
	<b7de17b7188d78a1da3c7200ce5263edcf979a22.camel@linuxfoundation.org>
From: "Saini, Naveen Kumar" <naveen.kumar.saini@intel.com>
Message-ID: <95a0e409-ad9c-759e-bcf2-c9e6b20a2e50@intel.com>
Date: Wed, 17 Apr 2019 10:20:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <b7de17b7188d78a1da3c7200ce5263edcf979a22.camel@linuxfoundation.org>
Subject: Re: [PATCH] bitbake.conf: add git-lfs to HOSTTOOLS_NONFATAL
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
X-List-Received-Date: Wed, 17 Apr 2019 02:19:57 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On Selasa 16 Apr 2019 06:23 , Richard Purdie wrote:
> On Tue, 2019-04-16 at 13:59 +0800, Naveen Saini wrote:
>> This provides git large file storage (lfs) extension.
>>
>> Include git-lfs conditionally. If git-lfs is present on host and repo
>> has lfs pointers, then git-lfs will be used. If git-lfs is not
>> present
>> on host, it will be ignored.
>>
>> [YOCTO #13198]
>>
>> Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
>> ---
>>   meta/conf/bitbake.conf | 3 +++
>>   1 file changed, 3 insertions(+)
> 
> This sounds like we swap the current situation where things are
> deterministic for a situation where the situation is not deterministic?
> 
> I'm not sure that is an improvement.

Currently, if host machine has git-lfs installed, build always fails
and if host doesn't have git-lfs installed, build passes but
does not download files pointed by lfs. So, the current behaviour
depends on whether or not git-lfs is installed.

With this patch, build will pass in both the cases and files stored
using lfs will be fetched when git-lfs is present. So this is more
deterministic than before? If git-lfs isn't present, then files won't
be fetched as before.

Should this be added to HOSTTOOLS instead so lfs files are always
fetched for packages that use it?

> 
> Cheers,
> 
> Richard
> 

Regards,
Naveen

