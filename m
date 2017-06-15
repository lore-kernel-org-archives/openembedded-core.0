Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7FCAE7839F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 14:00:36 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Jun 2017 07:00:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,343,1493708400"; d="scan'208";a="981213344"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 15 Jun 2017 07:00:21 -0700
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1497534748.git.pkj@axis.com>
	<08af10d045a72ea2101d9f3fae9c3fccd7b4a565.1497534748.git.pkj@axis.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <ecaf5f12-2cf6-38fa-8f58-c9196ade9c85@linux.intel.com>
Date: Thu, 15 Jun 2017 17:00:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <08af10d045a72ea2101d9f3fae9c3fccd7b4a565.1497534748.git.pkj@axis.com>
Subject: Re: [PATCH 09/11] package_rpm.bbclass: Filter out unwanted file deps for nativesdk packages
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
X-List-Received-Date: Thu, 15 Jun 2017 14:00:37 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/15/2017 04:53 PM, Peter Kjellerstedt wrote:
> Filter out any file dependencies on absolute paths and any
> dependencies on Perl modules for nativesdk packages. It is assumed
> that they will be provided by the native host if needed, and they mess
> up the dependency handling if they are present.

Does this mean you can also drop the "bin/sh" hack from here in the same 
file?

     print_deps(srcrprovides + (" /bin/sh" if 
srcname.startswith("nativesdk-") else ""), "Provides", spec_preamble_top, d)


Alex


