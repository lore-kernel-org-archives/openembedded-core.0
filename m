Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 22EA76CD4B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 10:02:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 11 Mar 2014 03:02:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,629,1389772800"; d="scan'208";a="496058249"
Received: from sleopold-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.85])
	by fmsmga002.fm.intel.com with ESMTP; 11 Mar 2014 03:02:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Tue, 11 Mar 2014 10:02:01 +0000
Message-ID: <2472430.vmDQzt5qix@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.3 (Linux/3.13.6-200.fc20.x86_64; KDE/4.12.3; x86_64; ; )
In-Reply-To: <531ED455.50702@windriver.com>
References: <531ECDCE.3020805@sonarnerd.net> <531ED455.50702@windriver.com>
MIME-Version: 1.0
Cc: Jussi Laako <jussi@sonarnerd.net>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [dora]Re: Failure in license.bbclass
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
X-List-Received-Date: Tue, 11 Mar 2014 10:02:22 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Hongxu,

The person you need to CC is Robert Yang since he maintains the dora branch. 
FWIW I hadn't anticipated this patch being backported, but I guess if 
functionality now in dora relies upon it we have no choice :(

Cheers,
Paul


On Tuesday 11 March 2014 17:16:05 Hongxu Jia wrote:
> It seems dora has some patches of oe-pkgdata-util not
> rebased from poky, such as:
> 
> commit 6ce287937e86a43d696e3615aa18d439928b7691
> Author: Paul Eggleton <paul.eggleton@linux.intel.com>
> Date:   Fri Oct 18 14:52:10 2013 +0100
> 
>      scripts/oe-pkgdata-util: add ability to find a recipe from a target
> package
> 
> //Hongxu
> 
> On 03/11/2014 04:48 PM, Jussi Laako wrote:
> > Hi,
> > 
> > Your recent (from November) change to license.bbclass in Yocto Dora
> > release completely breaks COPY_LIC_DIRS.
> > 
> > Running the command manually for any package results in command line
> > syntax error:
> > jussi@porkkala:/home/scratch/jussi/poky/build> oe-pkgdata-util
> > lookup-recipe
> > /home/scratch/jussi/poky/build/tmp/sysroots/cubox-i/pkgdata
> > alsa-conf-base
> > syntax: oe-pkgdata-util glob [-d] <pkgdatadir> <vendor-os> <pkglist>
> > "<globs>"
> > 
> >                      read-value [-d] <pkgdatadir> <vendor-os>
> > 
> > <value-name> "<package-name>_<package_architecture>"
> > 
> > 
> > Best regards,
> > 
> >     - Jussi

-- 

Paul Eggleton
Intel Open Source Technology Centre

