Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3E3BC73120
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 11:40:20 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Jun 2017 04:40:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,360,1493708400"; d="scan'208";a="1162119136"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 19 Jun 2017 04:40:21 -0700
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
	<d8d07071866bfeac6bccb8e50f099d9cb3113d2a.1497615866.git.alexander.kanavin@linux.intel.com>
	<642953f4-8927-acdc-a469-6970a3fb450d@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <e905342f-1cf6-73ef-c6d9-d3782129a036@linux.intel.com>
Date: Mon, 19 Jun 2017 14:40:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <642953f4-8927-acdc-a469-6970a3fb450d@gmail.com>
Subject: Re: [PATCH 20/32] icu: update to 59.1
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
X-List-Received-Date: Mon, 19 Jun 2017 11:40:23 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/16/2017 08:54 PM, Khem Raj wrote:

>> -# icu configure defaults to CXX11 if no -std= option is passed in CXXFLAGS
>> -# therefore pass one
>> -BUILD_CXXFLAGS_append_pn-icu-native = " -std=c++98"
>> -
>
> I think this change should be tried on oldest supported distro for build
> host like centos, I wonder if the std option was papering over c++11
> missing bits on gcc 4.8

At least centos has officially supported gcc 6.x packages, so those can 
and should be used (and required by Yocto documentation). We should not 
be held back by default compiler versions which may be too old.


Alex


