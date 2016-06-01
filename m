Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6AE17771AD;
	Wed,  1 Jun 2016 12:14:07 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 01 Jun 2016 05:13:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,400,1459839600"; d="scan'208";a="712198999"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by FMSMGA003.fm.intel.com with ESMTP; 01 Jun 2016 05:13:54 -0700
Date: Wed, 1 Jun 2016 15:14:21 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20160601121420.GA19162@mbabyjoh-desk.ger.corp.intel.com>
References: <20160530150145.6341.71576@opal.openembedded.org>
	<CA+chaQeoERJhi2gUNOReHVWpjM_pzcQj6NYqW6Qy_Jsm7-7uAQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQeoERJhi2gUNOReHVWpjM_pzcQj6NYqW6Qy_Jsm7-7uAQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] branch master updated (bb4ead9 -> b746223)
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
X-List-Received-Date: Wed, 01 Jun 2016 12:14:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Martin,

On Wed, Jun 01, 2016 at 01:06:08PM +0200, Martin Jansa wrote:
.... 

>adds  ac512ff   libpam: update to 1.3.0
>.....
>Maxim, you might want to check dependencies of libpam.
>
>In my bbappend for 1.2.1 (which still seems to be needed for 1.3.0):
># Replace bison with bison-native, configure only checks for ac_prog 
># configure:for ac_prog in 'bison -y' byacc
># add libxml2-native for deterministic build (it detects xmlcatalog and xmllint)
>DEPENDS = "bison-native flex flex-native cracklib libxml2-native"
<snip>

Thanks for sharing this. I will update the recipe soon.

Best Regards,
Maxin

