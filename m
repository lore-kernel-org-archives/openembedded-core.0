Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2A6516E666
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 09:13:17 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Oct 2017 02:13:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,304,1505804400"; d="scan'208";a="168323511"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 27 Oct 2017 02:13:17 -0700
To: "Slater, Joseph" <joe.slater@windriver.com>,
	Andre McCurdy <armccurdy@gmail.com>
References: <20171024232359.63328-1-jslater@windriver.com>
	<CAJ86T=V_Miu6Ui_zBOWzKRtPTbv6HE_O3B_Y5swmzRap2JgaAw@mail.gmail.com>
	<52a0c834-6e5f-3bbc-7e99-206607dab4a4@linux.intel.com>
	<CAJ86T=UV_XVjq6SEvc_9-46b1W+N_v6aBjvJOEorov5NYpTLcQ@mail.gmail.com>
	<007BD92917A2324FA403BCF9A464CF84CF437C9D@ALA-MBC.corp.ad.wrs.com>
	<007BD92917A2324FA403BCF9A464CF84CF43876F@ALA-MBC.corp.ad.wrs.com>
	<CAJ86T=XbzgBuJgs4s=8MphbTM4OLU5JqBA_pL7ABCkM49u80vA@mail.gmail.com>
	<007BD92917A2324FA403BCF9A464CF84CF438A56@ALA-MBC.corp.ad.wrs.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <96497d52-63c7-aac7-6645-e983e2e1e0cc@linux.intel.com>
Date: Fri, 27 Oct 2017 12:13:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84CF438A56@ALA-MBC.corp.ad.wrs.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] qemumips64: no qemu-usermode for n32
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
X-List-Received-Date: Fri, 27 Oct 2017 09:13:18 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/26/2017 11:51 PM, Slater, Joseph wrote:
> I think values for the BACKFILL_CONSIDERED can be used, but only if they are literals.  I don't think any variable expansion occurs when getVar() is used at the point of backfilling.  I think the a better way of setting MACHINE or DISTRO_FEATURES would be to directly append/remove  using overrides.  In any case, I do not believe any of the CONSIDERED definitions work.

We use the same-style disabling of qemu-usermode in other machine 
definitions (powerpc64, x86 x32), and they do seem to work there. 
Something's not right here.


Alex

