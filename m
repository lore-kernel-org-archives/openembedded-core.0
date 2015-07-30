Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 629387646C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 15:17:06 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 30 Jul 2015 08:17:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,577,1432623600"; d="scan'208";a="738875750"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by orsmga001.jf.intel.com with ESMTP; 30 Jul 2015 08:17:05 -0700
Message-ID: <55BA402F.80102@linux.intel.com>
Date: Thu, 30 Jul 2015 18:18:07 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, 
	Martin Jansa <martin.jansa@gmail.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
	<4dc547325ca078af13412654a8533507f26978ad.1438262915.git.alexander.kanavin@linux.intel.com>
	<20150730143117.GE2457@jama>
	<CAJTo0LZiQVfWtAtPqA3CNVFG7tAikMybeXZwnOwd+0mU+fWRZg@mail.gmail.com>
In-Reply-To: <CAJTo0LZiQVfWtAtPqA3CNVFG7tAikMybeXZwnOwd+0mU+fWRZg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 06/26] eglinfo: change version from 1.0 to 1.0.0 to match the upstream git tag
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
X-List-Received-Date: Thu, 30 Jul 2015 15:17:08 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/30/2015 06:02 PM, Burton, Ross wrote:

>     Why don't you set PV in eglinfo.inc and rename them to _git.bb
>     <http://git.bb>?
>
>
> I think we're going to need the TSC to resolve the opinion in style
> here.  Again, when it's a release that just happens to use git, I do
> prefer keeping the PV in the filename.

I agree; it is good to easily tell what is a versioned release, and what 
is a git snapshot. Also, there's less "PV = ..." clutter inside the 
recipe that way.

Alex


