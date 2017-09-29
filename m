Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C1D7177794
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 12:49:44 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Sep 2017 05:49:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,452,1500966000"; d="scan'208";a="157511850"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 29 Sep 2017 05:49:44 -0700
To: "Burton, Ross" <ross.burton@intel.com>,
	Libertad Cruz <libertad.cruz@intel.com>
References: <1506545019-4144-1-git-send-email-libertad.cruz@intel.com>
	<CAJTo0LaLdMPpsypShHpxfdQRfBrxwgVSBUAFNS+mPKkohFVbDw@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <bd2992c1-0723-96d6-1679-df35334de2e7@linux.intel.com>
Date: Fri, 29 Sep 2017 15:45:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaLdMPpsypShHpxfdQRfBrxwgVSBUAFNS+mPKkohFVbDw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] dpky.py: Adds testcases for dpkg package manager
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
X-List-Received-Date: Fri, 29 Sep 2017 12:49:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09/28/2017 04:28 PM, Burton, Ross wrote:

> Either search it for some essential packages ("ii dpkg" would be a good 
> start), or remove the test.

We actually don't even have meta/lib/oeqa/runtime/cases/dpkg.py in 
master; the patch is modifying a file that doesn't exist. Hence, 
patchwork failure.

Alex

