Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 230FB62134
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 12:45:32 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Oct 2017 05:45:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,431,1503385200"; d="scan'208";a="167404206"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 25 Oct 2017 05:45:32 -0700
To: Josef Holzmayr <holzmayr@rsi-elektrotechnik.de>,
	openembedded-core@lists.openembedded.org
References: <1508934851-3067-1-git-send-email-holzmayr@rsi-elektrotechnik.de>
	<1508934851-3067-3-git-send-email-holzmayr@rsi-elektrotechnik.de>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <587f92e6-3141-a108-e731-7923a53d1ca1@linux.intel.com>
Date: Wed, 25 Oct 2017 15:45:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1508934851-3067-3-git-send-email-holzmayr@rsi-elektrotechnik.de>
Subject: Re: [PATCH 2/2] bc: bump version to 1.07.1
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
X-List-Received-Date: Wed, 25 Oct 2017 12:45:33 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/25/2017 03:34 PM, Josef Holzmayr wrote:
>   meta/recipes-extended/bc/bc_1.06.bb                | 26 --------------------
>   meta/recipes-extended/bc/bc_1.07.1.bb              | 25 +++++++++++++++++++

Please enable diff.renames in your git configuration, and resend.

Also the changes to the recipe need to be explained in the commit 
message itself, not in the cover letter (which never makes it into the 
commit history).

Also, how is "GPLv2 & GPLv3+" different to the previous "GPLv2+"?

Alex

