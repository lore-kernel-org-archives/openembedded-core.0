Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 20E0078384
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 15:08:45 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Aug 2017 08:08:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,421,1498546800"; d="scan'208";a="1187752089"
Received: from lsandov1-mobl3.amr.corp.intel.com (HELO [10.252.202.59])
	([10.252.202.59])
	by fmsmga001.fm.intel.com with ESMTP; 24 Aug 2017 08:08:46 -0700
To: "Marko, Peter" <Peter.Marko@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1503490589-19310-1-git-send-email-peter.marko@siemens.com>
	<6D4566C9E07A8D4DAB6F935696920A84244DDB59@ATVIES991UAMSX.ww300.siemens.net>
From: "Sandoval Gonzalez, Leonardo"
	<leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <d81894e2-8a6d-4d14-b74e-a018b6dccdfc@linux.intel.com>
Date: Thu, 24 Aug 2017 10:08:45 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <6D4566C9E07A8D4DAB6F935696920A84244DDB59@ATVIES991UAMSX.ww300.siemens.net>
Subject: Re: [PATCH] staging: add missing import errno to staging_populate_sysroot_dir
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
X-List-Received-Date: Thu, 24 Aug 2017 15:08:46 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: es-ES



El 8/24/2017 a las 5:50 AM, Marko, Peter escribió:
> Could this be queued also to pyro branch?
> It's commit ID b1e482ae20b9c714f4089d4da6470d041242e441
better to send another patch tagged with 'pyro' at the subject.

> Thanks,
>    Peter
>
>> Fixes error "Exception: NameError: name 'errno' is not defined"
>> during build-sysroots.bb:do_build_target_sysroot
>>
>> Signed-off-by: Marko, Peter <peter.marko@siemens.com>
>> ---
>>   meta/classes/staging.bbclass | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass index 162c8e9..9d3d2ad 100644
>> --- a/meta/classes/staging.bbclass
>> +++ b/meta/classes/staging.bbclass
>> @@ -177,6 +177,7 @@ def staging_processfixme(fixme, target, recipesysroot, recipesysrootnative, d):
>>   def staging_populate_sysroot_dir(targetsysroot, nativesysroot, native, d):
>>       import glob
>>       import subprocess
>> +    import errno
>>   
>>       fixme = []
>>       postinsts = []
>> --
>> 2.1.4


