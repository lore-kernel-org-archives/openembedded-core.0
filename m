Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id CB6F760778
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 20:28:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Jan 2018 12:28:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,398,1511856000"; d="scan'208";a="21701398"
Received: from cdsouzax-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.64.40])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Jan 2018 12:28:14 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Date: Tue, 23 Jan 2018 09:28:11 +1300
Message-ID: <2335819.HfQnGk64D5@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <bf7a1c1e-1414-3c2f-e9f6-a4e690a9d8d6@xilinx.com>
References: <151648753376.31338.5162580593839986526@git.openembedded.org>
	<CA+chaQeic6SOL06JEqGOUPsZg2-HPJ9PJmKnTCyLnq7y0eSXdQ@mail.gmail.com>
	<bf7a1c1e-1414-3c2f-e9f6-a4e690a9d8d6@xilinx.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 01/06: python: Restructure python packaging and replace it with autopackaging
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
X-List-Received-Date: Mon, 22 Jan 2018 20:28:16 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Alejandro,

On Tuesday, 23 January 2018 8:02:07 AM NZDT Alejandro Enedino Hernandez Samaniego wrote:
> Its backwards compatible, in the way that the usage should be the same, 
> in this case, this sort of failures are expected, since the mentioned 
> packages: enum, readline, textutils no longer exist, and they should 
> never have existed in the first place, they were always required to get 
> a minimal python working, so they are now part of python(3)-core, which 
> means the dependencies are actually met but recipes which RDEPEND on 
> them should be modified , please see 
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=7aaffbede46ce352b91c7a5c5f825a6f3b5b1c2e 
> regarding some of the RDEPEND fixes on oe-core, I expect there should be 
> several like this for meta-python.

It seems to me we need to do one of two things:

A) Add explicit RPROVIDES so that the core package provides these things
for compatibility with existing recipes

or

B) Add something to the migration guide to explain what users need to do in
order to fix their recipes after this change - the staging area for these is on the wiki
(doesn't have to be fully fleshed out, just the bare details would be sufficient)
  https://wiki.yoctoproject.org/wiki/FutureMigrationGuide

Could you please take care of this?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

