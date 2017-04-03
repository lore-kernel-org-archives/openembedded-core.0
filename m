Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id EDEFB71CAF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 09:10:25 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga104.jf.intel.com with ESMTP; 03 Apr 2017 02:10:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,269,1486454400"; d="scan'208";a="83589522"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 03 Apr 2017 02:10:26 -0700
To: openembedded-core@lists.openembedded.org
References: <1491187907-5752-1-git-send-email-yin.thong.choong@intel.com>
	<1491187907-5752-5-git-send-email-yin.thong.choong@intel.com>
	<CAHiDW_HmcNpGPrmf+oDiKaU8EHS=RoXYZW3XkzPKuZKLFmNauw@mail.gmail.com>
	<CF0C948DE8E2634BB64BF489FF9EF7E7CB114D@PGSMSX105.gar.corp.intel.com>
	<CAHiDW_Ee=0nyBAsHkagd0hfS0orWBDu9ahh4k=2uQHR0tet2Fg@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <957114aa-76e3-2eff-a5c1-9e7d4c75badc@linux.intel.com>
Date: Mon, 3 Apr 2017 12:09:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAHiDW_Ee=0nyBAsHkagd0hfS0orWBDu9ahh4k=2uQHR0tet2Fg@mail.gmail.com>
Subject: Re: [PATCH 4/8] logrotate: replace fedorahosted.org SRC_URI with yoctoproject.org source
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
X-List-Received-Date: Mon, 03 Apr 2017 09:10:26 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 04/03/2017 11:30 AM, Jussi Kukkonen wrote:

> This is true, there's not that much in the repo itself to create trust.
> The major show of trust is here though:
> http://pkgs.fedoraproject.org/cgit/rpms/logrotate.git/commit/?id=9cb55142e51b82085d6c3136448c1f441454e351
> Fedora/Red Hat themselves changed to use this repo when the fedorahosted
> repos were EOL'd (see also Red Hat folks working on the github issues in
> January).
>
> If the release tarballs have been re-generated and the hashes no longer
> match, I'd still prefer modifying the recipe to use github (after
> manually diffing to make sure they are the same source release of
> course) but I can understand a differing viewpoint in this case.
>
> It would be good to mention the issue in the commit message, whichever
> way this is solved.

If github is not trustworthy, I'd say taking the tarball from Debian 
should be good enough. Same applies to chkconfig - we just shouldn't 
self-host these things, as that guarantees support headaches.


Alex


