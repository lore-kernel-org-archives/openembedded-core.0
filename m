Return-Path: <jose.perez.carranza@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 82C8078170
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 12:46:55 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jun 2017 05:46:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,315,1493708400"; d="scan'208";a="112438811"
Received: from jgperezc-mobl1.zpn.intel.com (HELO [10.219.4.33])
	([10.219.4.33])
	by fmsmga006.fm.intel.com with ESMTP; 08 Jun 2017 05:46:55 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <a5c78ee6-8320-7508-18d1-16762bed364c@linux.intel.com>
	<20170515135023.4090-1-jose.perez.carranza@linux.intel.com>
	<CAJTo0LYe=7Ug3wJSWwPX5VT=cy7GDe0Kf79uPFmC1tMj-0b-6Q@mail.gmail.com>
	<e1d6c111-bd9d-af76-ae44-d6921c723ba6@linux.intel.com>
	<1fc0defa-748a-bff4-2f72-7bc0d0f160d9@linux.intel.com>
From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
Message-ID: <f602be74-9ed6-ceed-0a94-e1486f956add@linux.intel.com>
Date: Thu, 8 Jun 2017 07:49:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <1fc0defa-748a-bff4-2f72-7bc0d0f160d9@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] runtime/dnf: Add new dnf test cases
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
X-List-Received-Date: Thu, 08 Jun 2017 12:46:59 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 06/08/2017 06:31 AM, Alexander Kanavin wrote:
> On 06/07/2017 08:31 PM, Jose Perez Carranza wrote:
>> When I tried this test image was built without using states hence
>> "busybox*.rpm" and "curl*.rpm"where present under
>> "tmp/deploy/rpm/core2_64" hence the repo i taking tha packages form
>> there to add them to repo and used on the image, but when using sstates
>> those packages are not being built so are not present on local build
>> directory. is there any way to force those packages to be built to have
>> them available on tmp/deploy/rpm/core2_64?
>
> I can try to help if you provide steps to reproduce: if I merely do
>
> rm -rf build/tmp
> bitbake core-image-sato
>
> then the build/tmp/deploy/rpm directory gets fully re-populated.
>
Sure I'm using this branch [1]

The steps that Iḿ following are :

1. bitbake core-image-sato using shared states (I'm using local sstates)
2. Add to the local.conf
         INHERIT += "testimage"
         TEST_SUITES += " ping ssh dnf"
3. bitbake core-image-sato -c testimage

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=jperez/dnf-updates
>
> Alex
>

-- 
Saludos
José


