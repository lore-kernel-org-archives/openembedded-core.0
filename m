Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 5783D78299
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 14:10:55 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP; 09 Jun 2017 07:10:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,317,1493708400"; d="scan'208";a="112945516"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by fmsmga006.fm.intel.com with ESMTP; 09 Jun 2017 07:10:56 -0700
Message-ID: <1497017987.26945.178.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 09 Jun 2017 09:19:47 -0500
In-Reply-To: <CAJTo0LZHv-h9Kna7o1HXc8n+XaxTbYtW_=+vbFOd79KgKD=-tA@mail.gmail.com>
References: <20170608204022.427-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<CAJTo0LZHv-h9Kna7o1HXc8n+XaxTbYtW_=+vbFOd79KgKD=-tA@mail.gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] context: allow test execution with buildhistory unless version-going-backwards is present
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
X-List-Received-Date: Fri, 09 Jun 2017 14:10:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-06-09 at 13:51 +0100, Burton, Ross wrote:
> 
> On 8 June 2017 at 21:40, <leonardo.sandoval.gonzalez@linux.intel.com>
> wrote:
>         -        if "buildhistory.bbclass" in
>         self.tc.td["BBINCLUDED"]:
>         +        # buildhistory introduce QA 'version-going-backwards'
>         errors so stop if the latter are enabled
>         +        if "buildhistory.bbclass" in self.tc.td["BBINCLUDED"]
>         and 'version-going-backwards' in self.tc.td['ERROR_QA']:
>         
> 
> Would it be possible instead to remove version-going-backwards from
> ERROR_QA?

At the bug entry, there is a discussion around this. The idea is to keep
buildhistory disable while oe-selftest is executing, but if user really
needs this, 'force' the user to remove this check from the ERROR_QA
string on his/her local.conf.
> 
> 
> Ross



