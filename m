Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7F82B73E65
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 15:13:08 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 26 Jun 2015 08:13:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,685,1427785200"; d="scan'208";a="753756602"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by orsmga002.jf.intel.com with ESMTP; 26 Jun 2015 08:13:10 -0700
Message-ID: <558D6C19.5030409@linux.intel.com>
Date: Fri, 26 Jun 2015 18:13:29 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: =?windows-1252?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>, 
	openembedded-core@lists.openembedded.org, 
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>, poky@yoctoproject.org
References: <558C5E43.6010709@linux.intel.com>
In-Reply-To: <558C5E43.6010709@linux.intel.com>
Subject: Re: [poky] Automatic Upgrade Helper Announcement
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
X-List-Received-Date: Fri, 26 Jun 2015 15:13:09 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

On 06/25/2015 11:02 PM, Aníbal Limón wrote:
> I'm glad to announce the enabling of Automatic Upgrade Helper (a.k.a.
> AUH), the AUH is a service
> that provides recipe upgrades and will be run on weekly basis.
>
> If you are a maintainer (listed in [1]) you will receive AUH emails with
> Recipe upgrades when AUH
> detects that upgrade is needed.

I'm currently doing a related activity - going through oe-core recipes 
in alphabetical order, and making sure that upstream version information 
for them is correct.

I've found a few cases where the upstream check is performed on a stale 
directory (so the recipe is reported 'up to date' even though it's not), 
or the reported upstream version is totally bogus [1], or the upstream 
version is 'unknown' even though it can be retrieved with a correct 
entry in package_regex.inc. Expect patches to come this way soon.

[1] http://recipes.yoctoproject.org/rrs/recipedetail/155/


Alex

