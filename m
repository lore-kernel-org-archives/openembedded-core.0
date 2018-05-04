Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9A66C74CF6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 12:54:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 May 2018 05:54:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,362,1520924400"; d="scan'208";a="53174669"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 04 May 2018 05:54:08 -0700
To: Paulo Neves <ptsneves@gmail.com>
References: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
	<20180504123244.43049-14-alexander.kanavin@linux.intel.com>
	<CAJO0J4hyjRyj+Zzz2Y7BTg0aB-dfEQXX4pJSi11n4Vc2iYkrJw@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <ff98c2cd-77b7-ff1d-7417-9868c760dd10@linux.intel.com>
Date: Fri, 4 May 2018 15:48:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAJO0J4hyjRyj+Zzz2Y7BTg0aB-dfEQXX4pJSi11n4Vc2iYkrJw@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 14/14] babeltrace: switch over to git
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
X-List-Received-Date: Fri, 04 May 2018 12:54:08 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/04/2018 03:46 PM, Paulo Neves wrote:
> I always wondered, what is the rationale for not always using the git
> repositories? If there is one why did we change for this specific
> recipe?
> 
> I ask this because I am in the process of creating a massive layer,
> whose only purpose is to have the software come from the git
> repository and not from the tarballs of the original poky recipes.

Git repositories can be much slower to clone, than it would be to 
download an equivalent tarball. Otherwise, I have no particular preference.

Alex

