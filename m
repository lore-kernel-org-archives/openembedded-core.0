Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 7B17E78255
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 15:34:31 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Nov 2017 08:34:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,339,1505804400"; d="scan'208";a="917293462"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 03 Nov 2017 08:34:31 -0700
To: akuster808 <akuster808@gmail.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <20171102053922.33426-1-raj.khem@gmail.com>
	<44258d74-acbd-45cf-0a00-c82554be03ec@linux.intel.com>
	<CAP9ODKqKMjmPLm0yP91ojS3OX5rLkEW34uwrvR02V5rcs4VWGA@mail.gmail.com>
	<8a2910bb-d958-60e6-a04d-ce7593c4b83b@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <daa2889c-e7cc-a1e8-fb25-7df9bc3d2e3d@linux.intel.com>
Date: Fri, 3 Nov 2017 17:34:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <8a2910bb-d958-60e6-a04d-ce7593c4b83b@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] musl: Update to 1.1.18
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
X-List-Received-Date: Fri, 03 Nov 2017 15:34:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11/03/2017 05:08 PM, akuster808 wrote:

> SRCPV causes package versioning havoc. You can not tell what version
> 1.1.8+git(hash)  or 1.1.8+git(hash) is the latest on a system. Can your
> package manage figure that out?

I thought the entire point of SRCPV is to provide something that is 
guaranteed to increase over time? It makes sense when taking random 
revisions from git, but when git is used only for tagged releases, it's 
just annoying visual clutter.

Alex

