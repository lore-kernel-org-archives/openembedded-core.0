Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 8BB606FEFA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 07:42:08 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP; 13 Jul 2017 00:42:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,353,1496127600"; d="scan'208";a="878323825"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Jul 2017 00:42:07 -0700
Date: Thu, 13 Jul 2017 10:42:50 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20170713074248.GA4886@mbabyjoh-desk.ger.corp.intel.com>
References: <1499777893-16292-1-git-send-email-maxin.john@intel.com>
	<1499777893-16292-2-git-send-email-maxin.john@intel.com>
	<CAJTo0LZabyvyXxGkFeeBOCNGy7p50+-Zb7p8WuvZTbvxc=bRfg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZabyvyXxGkFeeBOCNGy7p50+-Zb7p8WuvZTbvxc=bRfg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "Lock, Joshua G" <joshua.g.lock@intel.com>,
	Christopher Larson <chris_larson@mentor.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] pkgconf: add recipe
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
X-List-Received-Date: Thu, 13 Jul 2017 07:42:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ross,

On Wed, Jul 12, 2017 at 11:13:58PM +0100, Burton, Ross wrote:
>>On 11 July 2017 at 13:58, Maxin B. John <maxin.john at intel.com> wrote:
>> Move pkgconf recipe to oe-core from meta-pkgconf:
>>https://github.com/kergoth/meta-kergoth-wip/tree/master/meta-pkgconf
>
>Fails under mingw, which is a regression compared to pkg-config.
>
>libpkgconf/.libs/path.o:path.c:(.text+0x164): undefined reference to `lstat'
>libpkgconf/.libs/path.o:path.c:(.text+0x1f9): undefined reference to `S_ISLNK'
>libpkgconf/.libs/path.o:path.c:(.text+0x2e5): undefined reference to `readlink'
>
>(http://errors.yoctoproject.org/Errors/Details/147303/)

Thanks, will look into it (this patch wasn't tested with mingw before).

>Ross
Best Regards,
Maxin

