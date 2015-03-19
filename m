Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D5B6F65CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 09:37:49 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 19 Mar 2015 02:37:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,428,1422950400"; d="scan'208";a="682368922"
Received: from migoe-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.2.29])
	by fmsmga001.fm.intel.com with ESMTP; 19 Mar 2015 02:37:48 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Thu, 19 Mar 2015 09:37:47 +0000
Message-ID: <1854796.UtEVgRut4l@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.9-200.fc21.x86_64; KDE/4.14.4; x86_64; ; )
In-Reply-To: <2d7e85e6c09f99cac9e6f7c7bd9e33411dc7ac63.1426756518.git.liezhi.yang@windriver.com>
References: <cover.1426756518.git.liezhi.yang@windriver.com>
	<2d7e85e6c09f99cac9e6f7c7bd9e33411dc7ac63.1426756518.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] insane.bbclass: add missing QA to WARN_QA
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
X-List-Received-Date: Thu, 19 Mar 2015 09:37:51 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Robert,

On Thursday 19 March 2015 02:17:43 Robert Yang wrote:
> The following QA were not in WARN_QA or ERROR_QA, so they are not in
> ALL_QA:
>
> buildpaths

Last I checked enabling this throws up quite a few issues, some of which 
aren't a problem. Has that been fixed? If not, we can't enable it.

> desktop

I'm pretty sure we kept this one off deliberately as well, there are too many 
bad desktop files out there and for most people it doesn't matter.

> libexec

Does this test work?

> pkgname

Only certain package managers care about the rules this test enforces.

> symlink-to-sysroot

I agree this one should probably be enabled.

> unsafe-references-in-binaries
> unsafe-references-in-scripts

We haven't enabled these because there isn't general agreement that this is a 
problem for everyone.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

