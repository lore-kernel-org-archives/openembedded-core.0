Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A5DB1781F2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 11:31:13 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jun 2017 04:31:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,314,1493708400"; d="scan'208";a="110683094"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 08 Jun 2017 04:31:13 -0700
To: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <a5c78ee6-8320-7508-18d1-16762bed364c@linux.intel.com>
	<20170515135023.4090-1-jose.perez.carranza@linux.intel.com>
	<CAJTo0LYe=7Ug3wJSWwPX5VT=cy7GDe0Kf79uPFmC1tMj-0b-6Q@mail.gmail.com>
	<e1d6c111-bd9d-af76-ae44-d6921c723ba6@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <1fc0defa-748a-bff4-2f72-7bc0d0f160d9@linux.intel.com>
Date: Thu, 8 Jun 2017 14:31:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <e1d6c111-bd9d-af76-ae44-d6921c723ba6@linux.intel.com>
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
X-List-Received-Date: Thu, 08 Jun 2017 11:31:13 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/07/2017 08:31 PM, Jose Perez Carranza wrote:
> When I tried this test image was built without using states hence
> "busybox*.rpm" and "curl*.rpm"where present under
> "tmp/deploy/rpm/core2_64" hence the repo i taking tha packages form
> there to add them to repo and used on the image, but when using sstates
> those packages are not being built so are not present on local build
> directory. is there any way to force those packages to be built to have
> them available on tmp/deploy/rpm/core2_64?

I can try to help if you provide steps to reproduce: if I merely do

rm -rf build/tmp
bitbake core-image-sato

then the build/tmp/deploy/rpm directory gets fully re-populated.


Alex


