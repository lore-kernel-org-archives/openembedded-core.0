Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0122660119
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 16:36:40 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 06 Jul 2016 09:36:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,319,1464678000"; d="scan'208";a="730459393"
Received: from besquive-mobl2.amr.corp.intel.com ([10.219.128.62])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Jul 2016 09:36:41 -0700
Message-ID: <1467823018.3528.1.camel@linux.intel.com>
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
Reply-To: benjamin.esquivel@linux.intel.com
To: mariano.lopez@linux.intel.com, openembedded-core@lists.openembedded.org
In-Reply-To: <cover.1467634829.git.mariano.lopez@linux.intel.com>
References: <cover.1467634829.git.mariano.lopez@linux.intel.com>
Organization: Intel Corporation
Date: Wed, 06 Jul 2016 11:36:58 -0500
Mime-Version: 1.0
X-Mailer: Evolution 3.18.5.2 (3.18.5.2-1.fc23) 
Subject: Re: [PATCHv2 0/1] Add command line parameter support for tag in testexport
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
X-List-Received-Date: Wed, 06 Jul 2016 16:36:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Looks good. Thanks for sending this.

Benjamin

On Mon, 2016-07-04 at 12:23 +0000, mariano.lopez@linux.intel.com wrote:
> From: Mariano Lopez <mariano.lopez@linux.intel.com>
> 
> This allows to specify the tag to be used to filter test as an
> argument of
> runexported.py.
> 
> Changes in v2:
> 
> - Use a specific dictionary instead of kwargs
> 
> The following changes since commit
> 5c11e365e19357f721c49d076971567e7b64b61b:
> 
>   lib/oeqa: add Galculator to SDK and runtime tests (2016-07-01
> 16:22:48 +0100)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib mariano/bug8532v2
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bu
> g8532v2
> 
> Mariano Lopez (1):
>   oetest.py: Add command line parameter support for tag in testexport
> 
>  meta/lib/oeqa/oetest.py      | 16 +++++++++++++---
>  meta/lib/oeqa/runexported.py |  6 +++++-
>  2 files changed, 18 insertions(+), 4 deletions(-)
> 
> -- 
> 2.6.6
> 

