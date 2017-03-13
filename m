Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 97094776D2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 14:25:29 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Mar 2017 07:25:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,159,1486454400"; d="scan'208";a="1141538992"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 13 Mar 2017 07:25:30 -0700
To: Mark Hatle <mark.hatle@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
	<fbae88fe04c9ca949e0b3a021c4cf015c666da9d.1489144807.git.alexander.kanavin@linux.intel.com>
	<e8c2ff30-fe00-5413-6ce7-4182f6e53e49@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <3d49bfd1-97a4-f8c3-1394-73c3754b0d03@linux.intel.com>
Date: Mon, 13 Mar 2017 16:24:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <e8c2ff30-fe00-5413-6ce7-4182f6e53e49@windriver.com>
Subject: Re: [PATCH 36/44] package_rpm.bbclass: do not set the OS dynamically when building rpms
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
X-List-Received-Date: Mon, 13 Mar 2017 14:25:29 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 03/10/2017 06:57 PM, Mark Hatle wrote:
> On 3/10/17 5:24 AM, Alexander Kanavin wrote:
>> Packages need to contain just one value for the os field, otherwise
>> rpm will refuse to install them if they don't match what is in
>> /etc/rpm/platform.
>
> How will this work with nativesdk for things like targeting mingw (windows),
> darwin, or even alternative OS like Zephyr?
>
> I'm thinking if 'linux-gnu' is invalid, then a simple conversion to 'linux'
> would be better then hard coding everything to 'linux'.

I don't believe that the OS name embedded into packages is actually used 
anywhere to make decisions about which package to install. It's just 
that some packages have one value for it, others have another, and rpm 4 
does not allow that (rpm 5 does, and so several OS values gets written 
into /etc). So I bring them all to a common value.

Alex

