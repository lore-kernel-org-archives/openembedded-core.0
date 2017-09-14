Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id B722A781CD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 04:12:51 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Sep 2017 21:12:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,390,1500966000"; d="scan'208";a="151125763"
Received: from babarret-mobl1.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.71.243])
	by fmsmga005.fm.intel.com with ESMTP; 13 Sep 2017 21:12:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Sep 2017 16:12:48 +1200
Message-ID: <5748329.heIiOPyve6@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <60de8119fc92e3c61f7c616e560f1637e15f98ac.1505211385.git.paul.eggleton@linux.intel.com>
References: <cover.1505211385.git.paul.eggleton@linux.intel.com>
	<60de8119fc92e3c61f7c616e560f1637e15f98ac.1505211385.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] devtool: rework source extraction so that dependencies are handled
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
X-List-Received-Date: Thu, 14 Sep 2017 04:12:51 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 12 September 2017 10:18:38 PM NZST Paul Eggleton wrote:
> +        tinfoil.run_command('invalidateParseCache')

This was only needed due to a bitbake bug that I have sent a fix for, so I'm
about to send a v2 for this series that omits this call.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

