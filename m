Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 60C6D6057A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 12:49:33 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP; 17 Oct 2016 05:49:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,357,1473145200"; d="scan'208";a="773563246"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 17 Oct 2016 05:49:34 -0700
To: openembedded-core@lists.openembedded.org, akuster808 <akuster808@gmail.com>
References: <1475856809-16759-1-git-send-email-akuster808@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <e64cfb1d-995f-2e15-1fb5-e247af22c707@linux.intel.com>
Date: Mon, 17 Oct 2016 15:47:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <1475856809-16759-1-git-send-email-akuster808@gmail.com>
Subject: Re: [V2][PATCH] mklibs-native: update broken SRC_URI
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
X-List-Received-Date: Mon, 17 Oct 2016 12:49:34 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 10/07/2016 07:13 PM, Armin Kuster wrote:
> -SRC_URI = "http://ftp.de.debian.org/debian/pool/main/m/mklibs/${BPN}_${PV}.tar.xz \
> +SRC_URI = "http://snapshot.debian.org/archive/debian/20160207T221625Z/pool/main/m/${BPN}/${BPN}_${PV}.tar.xz \

This breaks the upstream version check. Please also set the 
UPSTREAM_CHECK_URI to the upstream directory where new versions of 
mklibs are guaranteed to appear.

Alex


