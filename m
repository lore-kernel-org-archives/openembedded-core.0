Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D149C6069C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 10:31:09 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Oct 2017 03:31:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,422,1503385200"; d="scan'208";a="163738181"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 23 Oct 2017 03:31:09 -0700
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20171020141155.26412-1-raj.khem@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <501fc640-a5ec-c4ea-7956-89c8c1479336@linux.intel.com>
Date: Mon, 23 Oct 2017 13:26:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171020141155.26412-1-raj.khem@gmail.com>
Subject: Re: [PATCH V3] libcheck: Upgrade to 0.11.0
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
X-List-Received-Date: Mon, 23 Oct 2017 10:31:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/20/2017 05:11 PM, Khem Raj wrote:
> -SRC_URI = "${SOURCEFORGE_MIRROR}/check/check-${PV}.tar.gz \
> -          "
> +SRCREV = "cbc78bab899858f3ece1f218168da54aac757bb0"
>   
> -SRC_URI[md5sum] = "53c5e5c77d090e103a17f3ed7fd7d8b8"
> -SRC_URI[sha256sum] = "f5f50766aa6f8fe5a2df752666ca01a950add45079aa06416b83765b1cf71052"
> +SRC_URI = "git://github.com/libcheck/check;protocol=https"
>   
> -S = "${WORKDIR}/check-${PV}"
> +S = "${WORKDIR}/git"

Why the change to git?


Alex

