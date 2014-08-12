Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E627C609C0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 16:11:09 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Aug 2014 09:04:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,849,1400050800"; d="scan'208";a="557496946"
Received: from glucy-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.202])
	by orsmga001.jf.intel.com with ESMTP; 12 Aug 2014 09:10:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 12 Aug 2014 17:10:29 +0100
Message-ID: <1992651.1Jo3sssU9p@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.8-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <20140812154825.GQ14848@jama>
References: <8971389.fH3VELLT3O@peggleto-mobl5.ger.corp.intel.com>
	<20140812154825.GQ14848@jama>
MIME-Version: 1.0
Cc: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [yocto] Automatic upgrade helper
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
X-List-Received-Date: Tue, 12 Aug 2014 16:11:12 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 12 August 2014 17:48:25 Martin Jansa wrote:
> On Tue, Aug 12, 2014 at 04:19:41PM +0100, Paul Eggleton wrote:
> > Hi folks,
> > 
> > I'd like to announce the immediate availability of the Automatic Upgrade
> > Helper, a tool for automating the task of upgrading recipes when a new
> > upstream release occurs. It utilises the build system to check if a new
> > version of the software built by a particular recipe is available, and if
> > it is, it will attempt to upgrade the recipe to build that new version.
> > The outcome of the process is emailed to the maintainer of the recipe
> > along with a patch to do the upgrade, so that they can send the patch to
> > be merged (if the build succeeded with no warnings) or develop the patch
> > further if problems occurred.
> 
> Does it also check buildhistory output for unexpected changes in
> packaging?
> 
> If it doesn't it should ask maintainer to do so manually before
> submitting the patch.

Not at the moment, but that's definitely something I agree we should add (and 
fairly quickly, it should be pretty trivial to do.)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

