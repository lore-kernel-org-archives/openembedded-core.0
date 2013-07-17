Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9CDC96A5A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 12:40:05 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Jul 2013 05:40:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,684,1367996400"; d="scan'208";a="371626808"
Received: from unknown (HELO helios.localnet) ([10.252.122.65])
	by fmsmga002.fm.intel.com with ESMTP; 17 Jul 2013 05:40:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jul 2013 13:40:04 +0100
Message-ID: <4310192.sd3ZMDPNbq@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-26-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <cover.1373630218.git.laurentiu.palcu@intel.com>
References: <cover.1372686507.git.laurentiu.palcu@intel.com>
	<cover.1373630218.git.laurentiu.palcu@intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/1] xinput-calibrator: move it from meta-oe to oe-core (cover letter only)
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
X-List-Received-Date: Wed, 17 Jul 2013 12:40:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Laurentiu,

On Friday 12 July 2013 15:04:02 Laurentiu Palcu wrote:
> Changes in v3:
>  * do not install pointercal.xinput if it's the default one;
> 
> Changes in v2:
>  * run calibration through xsession file;
>  * allow normal user to write his calibration data to
> ~/.pointercal/pointercal.xinput and then use it when system boots;

I'm not sure if you saw, but I noticed when this was in Saul's consolidated 
pull that this drops PR (previous value was "r6"). I know it seems trivial but 
we're not increasing PV so if we hope to supersede the recipe from meta-oe, 
this will have to be preserved. Same goes for pointercal-xinput which had a PR 
value of "r4". Thus, this patch hasn't yet been merged.

Could you send a v4 which restores these?

Thanks,
Paul 

-- 

Paul Eggleton
Intel Open Source Technology Centre

