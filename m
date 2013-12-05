Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 71C9B6DBF6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 13:46:03 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Dec 2013 05:46:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,833,1378882800"; d="scan'208";a="445152529"
Received: from pmcgurk-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.121.191])
	by fmsmga002.fm.intel.com with ESMTP; 05 Dec 2013 05:46:02 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 05 Dec 2013 13:46:01 +0000
Message-ID: <1488626.cfz6jNar0U@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <2dd7befefe608408e58b46ac7af3daafe7d5aa82.1386175183.git.paul.eggleton@linux.intel.com>
References: <cover.1386175183.git.paul.eggleton@linux.intel.com>
	<2dd7befefe608408e58b46ac7af3daafe7d5aa82.1386175183.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] libarchive: add e2fsprogs to DEPENDS
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
X-List-Received-Date: Thu, 05 Dec 2013 13:46:03 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 04 December 2013 16:40:28 Paul Eggleton wrote:
> libarchive's configure script looks for ext2fs/ext2_fs.h in order to use
> some defines for file attributes support if present (but doesn't link to
> any additional libraries.) There is no configure option to disable this,
> and if e2fsprogs is rebuilding between do_configure and do_compile you
> can currently get a failure. Since we normally only build this recipe
> for the target, and this functionality should really be supported on all
> linux systems, just add the dependency as most normal Linux distros seem
> to.

Actually this has problems building for nativesdk since there is no nativesdk-
e2fsprogs; scratch this while I figure out a better solution.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

