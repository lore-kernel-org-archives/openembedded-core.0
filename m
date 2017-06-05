Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id D26E5779C6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 14:03:35 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP; 05 Jun 2017 07:03:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,300,1493708400"; d="scan'208";a="270359013"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 05 Jun 2017 07:03:29 -0700
To: "Davis, Michael" <michael.davis@essvote.com>,
	Joshua Lock <joshua.g.lock@linux.intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1496329361.git.alexander.kanavin@linux.intel.com>
	<1496585728.6630.165.camel@linuxfoundation.org>
	<4f9f2466-1409-e5d8-917c-58b4864f8863@linux.intel.com>
	<1496668890.3690.7.camel@linux.intel.com>
	<c247784f-f822-9193-c3cd-650ec9581af4@linux.intel.com>
	<655290B7709079438B7932553958E60DA1310D09@ESS-EX01.essvote.corp.local>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <3c4f7666-8de0-a20e-ca59-d0cf339aef1b@linux.intel.com>
Date: Mon, 5 Jun 2017 17:00:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <655290B7709079438B7932553958E60DA1310D09@ESS-EX01.essvote.corp.local>
Subject: Re: [PATCH 0/2] Multi-threaded RPM support
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
X-List-Received-Date: Mon, 05 Jun 2017 14:03:36 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/05/2017 04:47 PM, Davis, Michael wrote:
> I just wanted to note that in my quest to get newer chrome to build I have used centos7 with the official devtoolset-6 scl.
> It was able to build my pyro based distro fine in gcc6.  So Centos7 has an officially supported path that may be viable if it comes down to being the last gcc 4.x distro.

I guess at some point we'll have to officially do this as well, as the 
upstream projects will adopt C/C++11 (or even newer) and otherwise 
become incompatible with 4.x.

Alex

