Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 66C8460851
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 10:12:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Jul 2018 03:12:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,315,1526367600"; d="scan'208";a="243468468"
Received: from bachaue1-mobl.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.34.184])
	by fmsmga006.fm.intel.com with ESMTP; 06 Jul 2018 03:12:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>, Chen Qi <Qi.Chen@windriver.com>
Date: Fri, 06 Jul 2018 12:12:06 +0200
Message-ID: <52791220.vcYpphDNgo@localhost.localdomain>
Organization: Intel Corporation
In-Reply-To: <99ad3edc2b6c1e86c3a9a377a1bf245bced38148.1528252931.git.liezhi.yang@windriver.com>
References: <cover.1528252931.git.liezhi.yang@windriver.com>
	<99ad3edc2b6c1e86c3a9a377a1bf245bced38148.1528252931.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 09/11] populate_sdk_ext.bbclass: add ESDK_MANIFEST_EXCLUDES
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
X-List-Received-Date: Fri, 06 Jul 2018 10:12:08 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Robert / Chen

On Wednesday, 6 June 2018 4:54:44 AM CEST Robert Yang wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
> 
> Add ESDK_MANIFEST_EXCLUDES to enable excluding items in sdk-conf-manifest.
> 
> By default, files under conf/ are all added to sdk-conf-manifest, as the
> manifest file is set to 'conf/*'.
> 
> However, there are situations where some configuration files under conf/
> directory are not intended to be added to sdk-conf-manifest, thus adding
> ESDK_MANIFEST_EXCLUDES to enable users to do this.
> 
> This variable takes the form of glob matching.
> e.g.
> ESDK_MANIFEST_EXCLUDES = "conf/autogen*"
> This would exclude all files under conf/ starting with 'autogen' from
> sdk-conf-manifest.

This patch (and 05/11, SDK_LAYERS_EXCLUDE*) worry me a little in that they 
have the potential to break the resulting eSDK or make it behave in a manner 
that is different from the build system that produced it. Having said that 
it's going to be reasonably clear to the user what's happened, assuming they 
remember they set these variables and in any case I don't expect these are 
going to be set by many people. Accordingly I won't object to these patches, 
but could you please add a warning about this issue to the commit message for 
both? We'd also better ensure they get documented with similar warnings.

Apart from that I'd like to see a different name for the variable here - we 
don't use the prefix ESDK_ anywhere else, so perhaps SDK_CONF_MANIFEST_EXCLUDE 
?

Cheers,
Paul



-- 

Paul Eggleton
Intel Open Source Technology Centre



