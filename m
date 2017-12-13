Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 559C87889B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 14:52:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Dec 2017 06:52:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,397,1508828400"; 
   d="scan'208";a="2219316"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga008.fm.intel.com with ESMTP; 13 Dec 2017 06:52:38 -0800
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org,
	"Burton, Ross" <ross.burton@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1512438000.git.paul.eggleton@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <9f22104c-91c0-750b-0a57-dee30d779d47@linux.intel.com>
Date: Wed, 13 Dec 2017 16:53:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <cover.1512438000.git.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 00/12] devtool improvements
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
X-List-Received-Date: Wed, 13 Dec 2017 14:52:38 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/05/2017 03:41 AM, Paul Eggleton wrote:
> A set of improvements for devtool, mostly aimed at improving the
> handling of recipes that fetch multiple source trees (i.e. have multiple
> tarballs or repositories in SRC_URI), with a couple of other fixes
> thrown in.

Unfortunately, this badly breaks 'devtool upgrade':

======
ak@kanavin-desktop:~/development/poky/build$ devtool upgrade openssl -V 
1.0.2n
.....
WARNING: This recipe fetches more than one source tree. Each source tree 
will be tracked in a separate git repository.
NOTE: Extracting upgraded version source...
ERROR: Execution of 'git checkout devtool-base -b devtool-1.0.2n' failed 
with exit code 128:
fatal: 'devtool-base' is not a commit and a branch 'devtool-1.0.2n' 
cannot be created from it
=====

I would strongly request that this patchset not be merged into master 
until the issue is resolved.

Alex


