Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6A0777E3BC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 23:25:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jun 2019 16:25:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,425,1557212400"; d="scan'208";a="360881046"
Received: from qnguyen5-mobl.ccr.corp.intel.com (HELO localhost.localdomain)
	([10.255.155.227])
	by fmsmga005.fm.intel.com with ESMTP; 27 Jun 2019 16:25:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chen Qi <Qi.Chen@windriver.com>
Date: Fri, 28 Jun 2019 11:25:40 +1200
Message-ID: <7850229.D4MhMV1OIs@localhost.localdomain>
Organization: Intel Corporation
In-Reply-To: <d6c08eda49cd84388b7547243ee0e3d73a488b53.1561605262.git.Qi.Chen@windriver.com>
References: <cover.1561605262.git.Qi.Chen@windriver.com>
	<d6c08eda49cd84388b7547243ee0e3d73a488b53.1561605262.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] devtool: warn user about multiple layer having the same base name
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
X-List-Received-Date: Thu, 27 Jun 2019 23:25:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, 27 June 2019 3:14:55 PM NZST Chen Qi wrote:
> Currently `devtool finish RECIPE meta' will silently succeed even
> if there are multiple layers having the same base name of 'meta'.
> e.g. meta layer from oe-core and meta layer from meta-secure-core.

Good catch!

> We should at least give user a warning in such case. With the patch,
> we will get warning like below.
> 
> WARNING: Multiple layers have the same base name 'meta', use the first one '<PROJ_DIR>/oe-core/meta'.
> WARNING: Consider using path instead of base name to specify layer:
> 	 	  <PROJ_DIR>/oe-core/meta
> 		  <PROJ_DIR>/meta-secure-core/meta
> 

"use the first one" -> "using the first one"

However I'm wondering if this is the right behaviour. What if the user realises they actually wanted the second one? Given it's a warning the finish operation would have proceeded and the user will have to clean things up manually. Rather than a warning, should we in fact be erroring out and requiring the user to be more specific in this case?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



