Return-Path: <dvhart@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 48246734E3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Mar 2015 20:37:19 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 27 Mar 2015 13:37:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,480,1422950400"; d="scan'208";a="671666921"
Received: from dvhart-mac02.jf.intel.com (HELO [10.24.5.109]) ([10.24.5.109])
	by orsmga001.jf.intel.com with ESMTP; 27 Mar 2015 13:37:19 -0700
User-Agent: Microsoft-MacOutlook/14.4.8.150116
Date: Fri, 27 Mar 2015 13:37:17 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: Juro Bystricky <juro.bystricky@intel.com>,
	<openembedded-core@lists.openembedded.org>
Message-ID: <D13B0D59.C4118%dvhart@linux.intel.com>
Thread-Topic: [PATCH] oe-git-proxy: Redirect error messages to STDERR
References: <1427476655-5162-1-git-send-email-juro.bystricky@intel.com>
In-Reply-To: <1427476655-5162-1-git-send-email-juro.bystricky@intel.com>
Mime-version: 1.0
Cc: richard.purdie@intel.com
Subject: Re: [PATCH] oe-git-proxy: Redirect error messages to STDERR
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
X-List-Received-Date: Fri, 27 Mar 2015 20:37:21 -0000
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit

On 3/27/15, 10:17 AM, "Juro Bystricky" <juro.bystricky@intel.com> wrote:

>oe-git-proxy script needs socat. If socat is not found,
>an error message is issued on STDOUT. This leads to a misleading
>git message:
>
>fatal: protocol error: bad line length character: ERRO
>
>instead of the intended message:
>
>ERROR: socat binary not in PATH
>
>Redirecting the error message to STDERR fixes this issue.
>
>Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>

Thanks Juro, good fix.

Reviewed-by: Darren Hart <dvhart@linux.intel.com>

-- 
Darren Hart
Intel Open Source Technology Center




