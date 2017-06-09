Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A7D9D7827E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 09:22:01 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Jun 2017 02:22:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,317,1493708400"; d="scan'208";a="111114391"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 09 Jun 2017 02:22:02 -0700
To: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <a5c78ee6-8320-7508-18d1-16762bed364c@linux.intel.com>
	<20170515135023.4090-1-jose.perez.carranza@linux.intel.com>
	<CAJTo0LYe=7Ug3wJSWwPX5VT=cy7GDe0Kf79uPFmC1tMj-0b-6Q@mail.gmail.com>
	<e1d6c111-bd9d-af76-ae44-d6921c723ba6@linux.intel.com>
	<f3d6469c-b0a8-6f75-7c02-e8afd0cf04bd@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <77fb98df-ff8a-c3d7-c995-7c8de3c4cf3d@linux.intel.com>
Date: Fri, 9 Jun 2017 12:22:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <f3d6469c-b0a8-6f75-7c02-e8afd0cf04bd@linux.intel.com>
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
X-List-Received-Date: Fri, 09 Jun 2017 09:22:02 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/08/2017 07:35 PM, Alexander Kanavin wrote:
> I haven't been able to reproduce the installroot failure, works fine here.

The installroot issue is most likely due to dnf architectures not being 
properly configured (which causes breakage when the architecture is not 
one of the standard ones that the upstream has hardcoded). Yes, the 
error message is unhelpful and leads one to think the repo is somehow 
broken or is missing packages :)

Copy the contents of /etc/rpm and /etc/dnf into installroot dir before 
running dnf, and you should be good to go. Test on x32, for example.

Alex


