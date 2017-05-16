Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 11AF077E32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 14:07:51 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 May 2017 07:07:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,349,1491289200"; d="scan'208";a="101255639"
Received: from bkearns-mobl.ger.corp.intel.com (HELO [10.252.10.90])
	([10.252.10.90])
	by orsmga005.jf.intel.com with ESMTP; 16 May 2017 07:07:40 -0700
User-Agent: Microsoft-MacOutlook/f.20.0.170309
Date: Tue, 16 May 2017 17:07:39 +0300
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
Message-ID: <CB3B2E08-268C-4D53-BE2C-BD83B7020E91@linux.intel.com>
Thread-Topic: [OE-core] [PATCH v2 00/20] support profile-optimized build for
	Python
References: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
	<8519c496-eafb-fac3-190c-5eb0e4dbe6e2@linux.intel.com>
In-Reply-To: <8519c496-eafb-fac3-190c-5eb0e4dbe6e2@linux.intel.com>
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
X-List-Received-Date: Tue, 16 May 2017 14:07:54 -0000
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: 7bit

On 16/05/2017, 16.23, "Alexander Kanavin" <alexander.kanavin@linux.intel.com> wrote:

    On 05/16/2017 04:18 PM, Markus Lehtonen wrote:
    > This patchset makes it possible to make a PGO (profile-guided-optimization)
    > build of python. This version of the patchset is almost identical to v1
    > submitted back in February, with these changes:
    > - rebased on top of latest oe-core master
    > - exclude profile data for Modules/posixmodule of Python 2.7 as it was not
    >   working correctly
    
    How about doing this only for Python 3.x? We'd like to stick to our 
    resolution of deprecating 2.x, which means not introducing any new 
    dependencies or images that need it.

You're probably right. There's not much use in churning soon-to-be-deprecated Python 2.x. I will submit a new patchset for Python 3.x only. Python 2.x could be added later if deprecation wouldn't happen for some reason.

    
    Also, python-pgo-image commits should probably be all squashed into one 
    (with comments within files replacing the commit messages).
    
Point taken.


Thanks,
  Markus
    



