Return-Path: <mikko.ylinen@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 8E8C060557
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 06:59:11 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 29 Mar 2017 23:59:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,245,1486454400"; d="scan'208";a="66779334"
Received: from janmalax-mobl1.ger.corp.intel.com (HELO [10.252.22.91])
	([10.252.22.91])
	by orsmga002.jf.intel.com with ESMTP; 29 Mar 2017 23:59:09 -0700
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <20170329092638.11677-1-mikko.ylinen@linux.intel.com>
	<CAJTo0LaLhSaC3bx09=qc+gL7YsPKD0YEtukZafUXcxZdW37dwQ@mail.gmail.com>
	<4cf87faa3852485a820c7526323ef2ab@XBOX02.axis.com>
From: Mikko Ylinen <mikko.ylinen@linux.intel.com>
Message-ID: <0b00658b-a9c7-680c-9ec3-c6cee05b7f67@linux.intel.com>
Date: Thu, 30 Mar 2017 09:59:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <4cf87faa3852485a820c7526323ef2ab@XBOX02.axis.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: check 'efi' in MACHINE_FEATURES
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
X-List-Received-Date: Thu, 30 Mar 2017 06:59:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 30/03/17 02:36, Peter Kjellerstedt wrote:
>
> For the record, this is just correcting a regression that was 
> introduced with my change to use bb.utils.filter() where I apparently 
> missed that not all the features were DISTRO_FEATURES…
>

Yes, this was the case. I got a report that 'bootctl' is no longer 
installed part of systemd.

> That said, I do agree that it would be preferable to get rid of the 
> machine specific dependency if possible.
>
>

I'm fine. Perhaps 'efi' should not be a PACKAGECONFIG at all (and 
unconditionally disabled here) and
the functionality (just bootctl?) is moved in systemd-boot. Thoughts?

-- Mikko

