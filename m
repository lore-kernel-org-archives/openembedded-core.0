Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 72FE674CBF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 09:28:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Apr 2018 02:28:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,410,1517904000"; d="scan'208";a="40879134"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 05 Apr 2018 02:28:50 -0700
To: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1522787704-31367-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<BY2PR02MB347EFB6CB0A95ABACA6EE59B9A40@BY2PR02MB347.namprd02.prod.outlook.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <5e1190c3-0bc9-7fe6-b1db-bb1f5218b7ab@linux.intel.com>
Date: Thu, 5 Apr 2018 12:22:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <BY2PR02MB347EFB6CB0A95ABACA6EE59B9A40@BY2PR02MB347.namprd02.prod.outlook.com>
Subject: Re: [PATCH] package_manager.py: Skip gpgcheck while using dnf on target
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
X-List-Received-Date: Thu, 05 Apr 2018 09:28:50 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/04/2018 09:27 PM, Manjukumar Harthikote Matha wrote:
>> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
>> index e006dc6..9f22fb0 100644
>> --- a/meta/lib/oe/package_manager.py
>> +++ b/meta/lib/oe/package_manager.py
>> @@ -674,7 +674,7 @@ class RpmPM(PackageManager):
>>               gpg_opts += 'repo_gpgcheck=1\n'
>>               gpg_opts += 'gpgkey=file://%s/pki/packagefeed-gpg/PACKAGEFEED-GPG-
>> KEY-%s-%s\n' % (self.d.getVar('sysconfdir'), self.d.getVar('DISTRO'),
>> self.d.getVar('DISTRO_CODENAME'))
>>
>> -        if self.d.getVar('RPM_SIGN_PACKAGES') == '0':
>> +        if self.d.getVar('RPM_SIGN_PACKAGES') != '1':
>>               gpg_opts += 'gpgcheck=0\n'
>>
>>           bb.utils.mkdirhier(oe.path.join(self.target_rootfs, "etc", "yum.repos.d"))
>> --
> 
> Any feedback/concerns on this patch?

Generally we don't positively acknowledge patches, as it would create 
too much traffic on the mailing list. If no one said anything so far, 
then no one has concerns. Also, have a little patience please.

Alex

