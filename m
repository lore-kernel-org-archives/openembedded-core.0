Return-Path: <jose.perez.carranza@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 629F6781C8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 13:09:13 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jun 2017 06:09:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,315,1493708400"; d="scan'208";a="112447413"
Received: from jgperezc-mobl1.zpn.intel.com (HELO [10.219.4.33])
	([10.219.4.33])
	by fmsmga006.fm.intel.com with ESMTP; 08 Jun 2017 06:09:13 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <a5c78ee6-8320-7508-18d1-16762bed364c@linux.intel.com>
	<20170515135023.4090-1-jose.perez.carranza@linux.intel.com>
	<CAJTo0LYe=7Ug3wJSWwPX5VT=cy7GDe0Kf79uPFmC1tMj-0b-6Q@mail.gmail.com>
	<e1d6c111-bd9d-af76-ae44-d6921c723ba6@linux.intel.com>
	<1fc0defa-748a-bff4-2f72-7bc0d0f160d9@linux.intel.com>
	<f602be74-9ed6-ceed-0a94-e1486f956add@linux.intel.com>
	<3e99ba6b-5841-dbe3-b44b-25ffe906f04f@linux.intel.com>
From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
Message-ID: <ffb7b2ad-adad-fa79-b01f-ae48f9f81195@linux.intel.com>
Date: Thu, 8 Jun 2017 08:11:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <3e99ba6b-5841-dbe3-b44b-25ffe906f04f@linux.intel.com>
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
X-List-Received-Date: Thu, 08 Jun 2017 13:09:14 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 06/08/2017 07:49 AM, Alexander Kanavin wrote:
> On 06/08/2017 03:49 PM, Jose Perez Carranza wrote:
>
>> 1. bitbake core-image-sato using shared states (I'm using local sstates)
>
> When you do this, tmp/deploy/rpm should get re-populated with rpm 
> packages, regardless of whether they're taken from sstate, or rebuilt.
All those steps are done on a fresh build directory, so the first time 
that image is built packages are not being populated when rebuilding the 
image packages are get pupulated, but AB only built once the image and 
then execute testimage.
>
> Can you check why this does not happen on your side?
>
> Alex

-- 
Saludos
José


