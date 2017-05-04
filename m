Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A7B7471CB8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 May 2017 09:53:45 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 May 2017 02:53:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,287,1491289200"; d="scan'208";a="82391858"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 04 May 2017 02:53:45 -0700
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
References: <c70316f009e94504b29ff2b9d177dd33@XBOX02.axis.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <b5e9622b-3b01-a793-21ea-b15ea730e8bd@linux.intel.com>
Date: Thu, 4 May 2017 12:53:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <c70316f009e94504b29ff2b9d177dd33@XBOX02.axis.com>
Cc: "OE Core \(openembedded-core@lists.openembedded.org\)"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Regression with RPM4 and unversioned DSOs
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
X-List-Received-Date: Thu, 04 May 2017 09:53:46 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/04/2017 11:46 AM, Peter Kjellerstedt wrote:
> Since I would very much like to avoid having to add explicit runtime
> dependencies for all those dependencies that were previously automatically
> detected, which would be a nightmare, I am now looking for any help as to
> where to find the code that adds the dependencies on the packages providing
> DSOs and to see if it is possible to change it to also detect dependencies
> on unversioned DSOs.

I'm not sure such implicit dependency detection at rpm generation point 
is guaranteed to work in the first place. Don't we have a package_qa 
check for this that should be failing? Can you publish a minimal layer 
so I can reproduce locally?

If you want to poke in rpm4 source, I think grepping for
use_internal_dependency_generator is a good starting point.

Alex

