Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6E8237199F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 06:27:35 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP; 28 Nov 2016 22:27:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,715,1473145200"; d="scan'208";a="1074882059"
Received: from schan1-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.189.70])
	by fmsmga001.fm.intel.com with ESMTP; 28 Nov 2016 22:27:34 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Tue, 29 Nov 2016 19:27:32 +1300
Message-ID: <14375940.ArtjuEAhVL@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.8.8-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <90784e81-531a-1da8-4660-e4946916ca69@windriver.com>
References: <cover.1479871728.git.liezhi.yang@windriver.com>
	<1910837.9fFbRdU0ck@peggleto-mobl.ger.corp.intel.com>
	<90784e81-531a-1da8-4660-e4946916ca69@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] base-passwd: set root's default password to 'root'
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
X-List-Received-Date: Tue, 29 Nov 2016 06:27:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tue, 29 Nov 2016 13:36:58 Robert Yang wrote:
> On 11/29/2016 11:45 AM, Paul Eggleton wrote:
> > On Tue, 29 Nov 2016 10:45:51 Robert Yang wrote:
> >> We may also need something like IMAGE_FEATURES += "test" to make it can
> >> work with -ctestimage.
> > 
> > Not sure I follow your reasoning here - can you explain what this feature
> > would do?
> 
> For example, the "bitbake <image> -ctestimage" requires a few pkgs
> installed, such as psplash-default, see the testcase in
> meta/lib/oeqa/runtime/smart.py:
> 
>      def test_smart_install(self):
>          self.smart('remove -y psplash-default')
>          self.smart('install -y psplash-default')
> 
> The test would fail without psplash-default installed, and also it requires
> sshd installed on the target. When IMAGE_FETURES += "test", we can install
> these required packages, I'm not sure this is a good idea, or maybe we can
> enhance testimge.bbclass to do it. Another way to fix the problem might be
> not hardcode the package name.

We have other means of dealing with that specifically - i.e. have the test 
skip itself if a package required for the test is not in the image. I think we 
already have examples of that.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

