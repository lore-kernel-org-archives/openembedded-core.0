Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 19A8E6023E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 17:17:41 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 28 Jun 2013 10:14:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,960,1363158000"; d="scan'208";a="337123950"
Received: from unknown (HELO helios.localnet) ([10.252.122.97])
	by orsmga001.jf.intel.com with ESMTP; 28 Jun 2013 10:16:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Kai Kang <kai.kang@windriver.com>
Date: Fri, 28 Jun 2013 18:16:29 +0100
Message-ID: <5322253.NAOJVtts1F@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-25-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <7a0305f34aa1f986856e699b69242e353986b6dc.1371802236.git.kai.kang@windriver.com>
References: <cover.1371802236.git.kai.kang@windriver.com>
	<7a0305f34aa1f986856e699b69242e353986b6dc.1371802236.git.kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] strace: add configure options libaio and acl
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
X-List-Received-Date: Fri, 28 Jun 2013 17:17:41 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 21 June 2013 16:12:21 Kai Kang wrote:
> Add strace configure options libaio and acl to enable or disable build
> with them. Then PACKAGECONFIG can be used to handle dependency.
> 
> Set "libaio" as a default feature of PACKAGECONFIG.
>...
> 
> +PACKAGECONFIG_class-target ?= "libaio"
> +PACKAGECONFIG_class-target += "${@base_contains('DISTRO_FEATURES', 'acl',
> 'acl', '', d)}"

I realise this has already been merged, but I think there are a couple of issues
with the above. Firstly, for consistency, I think the first option should be
called "aio" and not "libaio". Secondly, although this seems to work the use
of overrides, += and ?= together is a little bit confusing. Perhaps the following
would be a bit clearer:

PACKAGECONFIG_class-target ?= "aio \
                               ${@base_contains('DISTRO_FEATURES', 'acl', 'acl', '', d)}"

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

