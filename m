Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A172377E32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 14:16:18 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 May 2017 07:16:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,349,1491289200"; d="scan'208";a="101258581"
Received: from bkearns-mobl.ger.corp.intel.com (HELO [10.252.10.90])
	([10.252.10.90])
	by orsmga005.jf.intel.com with ESMTP; 16 May 2017 07:16:18 -0700
User-Agent: Microsoft-MacOutlook/f.20.0.170309
Date: Tue, 16 May 2017 17:16:16 +0300
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
Message-ID: <E650DF92-0721-468C-9F99-A8A002F15A5F@linux.intel.com>
Thread-Topic: [OE-core] [PATCH v2 00/20] support profile-optimized build for
	Python
References: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
	<1494942315.27342.33.camel@linuxfoundation.org>
In-Reply-To: <1494942315.27342.33.camel@linuxfoundation.org>
Mime-version: 1.0
Subject: Re: [PATCH v2 00/20] support profile-optimized build for Python
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
X-List-Received-Date: Tue, 16 May 2017 14:16:19 -0000
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: 7bit



On 16/05/2017, 16.45, "Richard Purdie" <richard.purdie@linuxfoundation.org> wrote:

    On Tue, 2017-05-16 at 16:18 +0300, Markus Lehtonen wrote:
    > This patchset makes it possible to make a PGO (profile-guided-
    > optimization) build of python. This version of the patchset is almost
    > identical to v1 submitted back in February, with these changes:
    > - rebased on top of latest oe-core master - exclude profile data for
    > Modules/posixmodule of Python 2.7 as it was not working correctly
    > 
    > [YOCTO #9338]
    > 
    
    I'm wondering if recipe specific sysroots might have made this problem
    a bit easier?
    
    It should now be possible to build the two packages with conflicting
    files and as long as you exclude the recipe from the shlibs code and
    set the RPROVIDES correctly, it should all work without as many
    invasive changes?
    
    Of course I haven't tested that...

I'll try that out. That, accompanied with dropping Python 2.x support (thanks Alexander) would make the patchset significantly simpler.

Cheers,
   MArkus

 



