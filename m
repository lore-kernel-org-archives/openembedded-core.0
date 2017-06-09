Return-Path: <jose.perez.carranza@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A7D4A7828D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 12:52:11 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Jun 2017 05:52:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,317,1493708400"; d="scan'208";a="112913580"
Received: from jgperezc-mobl1.zpn.intel.com (HELO [10.219.4.33])
	([10.219.4.33])
	by fmsmga006.fm.intel.com with ESMTP; 09 Jun 2017 05:52:11 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <a5c78ee6-8320-7508-18d1-16762bed364c@linux.intel.com>
	<20170515135023.4090-1-jose.perez.carranza@linux.intel.com>
	<CAJTo0LYe=7Ug3wJSWwPX5VT=cy7GDe0Kf79uPFmC1tMj-0b-6Q@mail.gmail.com>
	<e1d6c111-bd9d-af76-ae44-d6921c723ba6@linux.intel.com>
	<f3d6469c-b0a8-6f75-7c02-e8afd0cf04bd@linux.intel.com>
	<77fb98df-ff8a-c3d7-c995-7c8de3c4cf3d@linux.intel.com>
From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
Message-ID: <7026ae1f-e4d1-d712-5636-580c8c658fe0@linux.intel.com>
Date: Fri, 9 Jun 2017 07:54:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <77fb98df-ff8a-c3d7-c995-7c8de3c4cf3d@linux.intel.com>
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
X-List-Received-Date: Fri, 09 Jun 2017 12:52:11 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Thank you Alex !

I will work on a patch with your approach

On 06/09/2017 04:22 AM, Alexander Kanavin wrote:
> On 06/08/2017 07:35 PM, Alexander Kanavin wrote:
>> I haven't been able to reproduce the installroot failure, works fine 
>> here.
>
> The installroot issue is most likely due to dnf architectures not 
> being properly configured (which causes breakage when the architecture 
> is not one of the standard ones that the upstream has hardcoded). Yes, 
> the error message is unhelpful and leads one to think the repo is 
> somehow broken or is missing packages :)
>
> Copy the contents of /etc/rpm and /etc/dnf into installroot dir before 
> running dnf, and you should be good to go. Test on x32, for example.
>
> Alex
>

-- 
Saludos
José


