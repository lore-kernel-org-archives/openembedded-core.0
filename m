Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7DF5C78170
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 12:49:30 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jun 2017 05:49:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,315,1493708400"; d="scan'208";a="271771821"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 08 Jun 2017 05:49:30 -0700
To: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <a5c78ee6-8320-7508-18d1-16762bed364c@linux.intel.com>
	<20170515135023.4090-1-jose.perez.carranza@linux.intel.com>
	<CAJTo0LYe=7Ug3wJSWwPX5VT=cy7GDe0Kf79uPFmC1tMj-0b-6Q@mail.gmail.com>
	<e1d6c111-bd9d-af76-ae44-d6921c723ba6@linux.intel.com>
	<1fc0defa-748a-bff4-2f72-7bc0d0f160d9@linux.intel.com>
	<f602be74-9ed6-ceed-0a94-e1486f956add@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <3e99ba6b-5841-dbe3-b44b-25ffe906f04f@linux.intel.com>
Date: Thu, 8 Jun 2017 15:49:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <f602be74-9ed6-ceed-0a94-e1486f956add@linux.intel.com>
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
X-List-Received-Date: Thu, 08 Jun 2017 12:49:30 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/08/2017 03:49 PM, Jose Perez Carranza wrote:

> 1. bitbake core-image-sato using shared states (I'm using local sstates)

When you do this, tmp/deploy/rpm should get re-populated with rpm 
packages, regardless of whether they're taken from sstate, or rebuilt.

Can you check why this does not happen on your side?

Alex

