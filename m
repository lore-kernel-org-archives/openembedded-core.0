Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 042CD71CAA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 22:50:16 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 19 Jan 2017 14:50:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,256,1477983600"; d="scan'208";a="924550216"
Received: from bitbang.jf.intel.com (HELO [10.7.199.68]) ([10.7.199.68])
	by orsmga003.jf.intel.com with ESMTP; 19 Jan 2017 14:50:16 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1484764234.git.randy.e.witt@linux.intel.com>
	<cc6a7fcca781a3a153ba5cfbfe7a45282a55f917.1484764234.git.randy.e.witt@linux.intel.com>
	<CAJTo0LZ3u-+2SGOL=SgHG=14xSJn_9koEyCoOMDStXUmDsuDLg@mail.gmail.com>
From: Randy Witt <randy.e.witt@linux.intel.com>
Message-ID: <c80f8a75-c4b1-a2b5-92ba-f05461a62205@linux.intel.com>
Date: Thu, 19 Jan 2017 14:50:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ3u-+2SGOL=SgHG=14xSJn_9koEyCoOMDStXUmDsuDLg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] selftest/containerimage.py: Add container IMAGE_FSTYPES test
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
X-List-Received-Date: Thu, 19 Jan 2017 22:50:17 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/19/2017 04:01 AM, Burton, Ross wrote:
> On 18 January 2017 at 18:31, Randy Witt <randy.e.witt@linux.intel.com>
> wrote:
>
>> +        expected_files = [
>> +                    './',
>> +                    './bin/',
>> +                    './bin/theapp',
>> +                    './etc/',
>> +                    './etc/default/',
>> +                    './etc/default/postinst',
>> +                    './etc/ld.so.cache',
>> +                    './etc/timestamp',
>> +                    './etc/version',
>> +                    './run/',
>> +                    './var/',
>> +                    './var/cache/',
>> +                    './var/cache/ldconfig/',
>> +                    './var/cache/ldconfig/aux-cache',
>> +                    './var/cache/opkg/',
>> +                    './var/lib/',
>> +                    './var/lib/opkg/'
>> +                ]
>>
>> These should use ${bindir} etc so they're resilient to distros changing
> the paths (please use get_bb_vars() to only invoke bitbake once).
>
> +        image = os.path.join(self.builddir, "tmp/deploy/images/qemux86/
>> container-test-image-qemux86.tar.bz2")
>>
>
> Don't hardcode this path, use ${DEPLOY_DIR_IMAGE} (fetch it with the paths
> above for speed) which will get you to tmp/deploy/images/[machine].  Again,
> these paths can change (poky sets TMPDIR to tmp, nodistro uses
> tmp-${TCLIBC}).
>
> Ross
>

I just sent a v2, but screwed up the subject. I'll resend the whole series again 
even though only 3/3 changed, to hopefully make it easier on you.


