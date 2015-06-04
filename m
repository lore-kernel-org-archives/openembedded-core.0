Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2857A75762
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 10:58:50 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 04 Jun 2015 03:58:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,552,1427785200"; d="scan'208";a="502642992"
Received: from byanakie-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.5.122])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Jun 2015 03:58:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Thu, 04 Jun 2015 11:58:50 +0100
Message-ID: <1458452.9dRPSlXxbo@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/3.19.7-200.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <cover.1432310410.git.paul.eggleton@linux.intel.com>
References: <cover.1432310410.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [daisy][PATCH 0/1] Backport of gcc header fix from master/dizzy
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
X-List-Received-Date: Thu, 04 Jun 2015 10:58:54 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 22 May 2015 17:02:03 Paul Eggleton wrote:
> I made this backport earlier but missed actually sending it.
> 
> 
> The following change since commit 5a577ec878a15f3caaf4893b819825ffb8c81266:
> 
>   build-appliance-image: Update to daisy head revision (2015-05-13 13:27:45
> +0100)
> 
> is available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib
> paule/gcc-omp-fix-daisy
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paul
> e/gcc-omp-fix-daisy
> 
> Paul Eggleton (1):
>   gcc: ensure target gcc headers can be included
> 
>  meta/recipes-devtools/gcc/gcc-4.8.inc              |  1 +
>  .../gcc/gcc-4.8/target-gcc-includedir.patch        | 81
> ++++++++++++++++++++++ 2 files changed, 82 insertions(+)
>  create mode 100644
> meta/recipes-devtools/gcc/gcc-4.8/target-gcc-includedir.patch

Now that 1.6.3 is out can we look at merging this?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

