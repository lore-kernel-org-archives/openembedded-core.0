Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id CCAC060807
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Nov 2017 11:24:42 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Nov 2017 03:24:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,352,1505804400"; d="scan'208";a="1240248903"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 06 Nov 2017 03:24:41 -0800
To: Neal Gompa <ngompa13@gmail.com>
References: <20170930180655.25134-1-otavio@ossystems.com.br>
	<20170930180655.25134-2-otavio@ossystems.com.br>
	<7738c857-3635-f56f-45fd-cd7d5b5eb82e@linux.intel.com>
	<CAP9ODKqpb2nGy9M55g44Onm6Bub4nZ8xKQv4A+LEuoqtkwtRPQ@mail.gmail.com>
	<CAEg-Je_s1xCS1zMWNeLZtXyvHWhOUAyxWk5SS36BqEHZomc6Gw@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <4b807580-6ab7-1dc1-7163-c941d035a5aa@linux.intel.com>
Date: Mon, 6 Nov 2017 13:24:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAEg-Je_s1xCS1zMWNeLZtXyvHWhOUAyxWk5SS36BqEHZomc6Gw@mail.gmail.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] lib/oe/package_manager.py (rpm): Allow use of non-signed feeds
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
X-List-Received-Date: Mon, 06 Nov 2017 11:24:43 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/06/2017 07:04 AM, Neal Gompa wrote:

> This logic is kind of dumb, but basically, this is how this works:
> 
> gpgcheck - controls pkg_gpgcheck and repo_gpgcheck. With gpgcheck=1,
> DNF defaults to pkg_gpgcheck=1 and repo_gpgcheck=0, but if gpgcheck=0,
> repo_gpgcheck is forced off.
> pkg_gpgcheck (not currently working)
> repo_gpgcheck - enable repo_gpgcheck, this is default to 0 (thus, disabled)
> 
> At some point, this needs to be fixed in libdnf and dnf so that the
> options are saner...

Dnf documentation claims otherwise: gpgcheck is for package signing and 
repo_gpgcheck is for feed signing, one is not dependent on the other.

I looked at the code, and couldn't find any spot where one overrides or 
controls the other. Can you point it out please? Until then, I think the 
current code is correct.

Alex

