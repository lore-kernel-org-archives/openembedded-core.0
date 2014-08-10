Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 72EBB60EFA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Aug 2014 11:17:18 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Aug 2014 04:17:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,836,1400050800"; d="scan'208";a="586061383"
Received: from mrdissan-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.124])
	by orsmga002.jf.intel.com with ESMTP; 10 Aug 2014 04:17:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Sun, 10 Aug 2014 12:17:16 +0100
Message-ID: <4144636.z3IdHmx8Ax@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.8-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <alpine.LFD.2.11.1408090914290.7338@localhost>
References: <alpine.LFD.2.11.1408081529290.23581@localhost>
	<53E54245.4070704@linux.intel.com>
	<alpine.LFD.2.11.1408090914290.7338@localhost>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Remove "SRC_URI_OVERRIDES_PACKAGE_ARCH = 0" from tslib.bb
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
X-List-Received-Date: Sun, 10 Aug 2014 11:17:21 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 09 August 2014 09:17:16 Robert P. J. Day wrote:
> On Fri, 8 Aug 2014, Saul Wold wrote:
> > On 08/08/2014 12:31 PM, Robert P. J. Day wrote:
> > > Given that there are no machine-specific files for the tslib recipe
> > > anymore, might as well remove this line.
> > 
> > Robert,
> > 
> > Can you please review the commit guidelines
> > 
> > http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> > 
> > The summary line should be in the form of
> > tslib: Remove ...
> 
>   serious question -- how does one identify the "primary item" under
> consideration if it's scattered over several files. recently, i
> submitted a patch to remove a few references to "do_package_write",
> a deleted task. the existing references under meta/:
> 
> conf/documentation.conf:do_package_write[doc] = "Creates the actual packages
> and places them in the Package Feed area"
> recipes-core/meta/meta-ide-support.bb:do_populate_ide_support[recrdeptask]
> = "do_package_write"
> recipes-core/meta/package-index.bb:do_package_write[noexec] = "1"
> recipes-devtools/installer/adt-installer_1.0.bb:do_package_write[noexec] =
> "1"
> 
>   i'm assuming, in this case, the primary item would be
> "do_package_write"?

When you're making a blanket change like this it's OK to not have a "primary 
item". Most of the time though you end up changing just one recipe or class at 
a time, and then you should specify it.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

