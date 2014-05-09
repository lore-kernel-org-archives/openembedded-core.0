Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (unknown [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C55A460167
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 May 2014 09:07:14 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 May 2014 02:02:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1017,1389772800"; d="scan'208";a="508915706"
Received: from mbradle1-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.188])
	by orsmga001.jf.intel.com with ESMTP; 09 May 2014 02:06:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Zhenhua Luo <zhenhua.luo@freescale.com>
Date: Fri, 09 May 2014 10:06:46 +0100
Message-ID: <6898433.WFevEzsYNY@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.2-200.fc20.x86_64; KDE/4.12.4; x86_64; ; )
In-Reply-To: <1399616761-10229-1-git-send-email-zhenhua.luo@freescale.com>
References: <1399616761-10229-1-git-send-email-zhenhua.luo@freescale.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] nettle: add openssl-native in the DEPENDS of native build
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
X-List-Received-Date: Fri, 09 May 2014 09:07:15 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Zhenhua,

On Friday 09 May 2014 14:26:01 Zhenhua Luo wrote:
> nettle-native build failed on Linux distro with old openssl installed,
> add the dependency to ensure correct openssl is used by nettle.

I don't think this is the right solution. nettle is required by gnutls, and it 
doesn't make sense to me for gnutls (which replaces openssl) to depend upon 
something that itself depends upon openssl.

FWIW, Valentin posted a patch earlier to disable the functionality by 
specifying the appropriate configure argument.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

