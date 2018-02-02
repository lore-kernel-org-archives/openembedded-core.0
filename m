Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 3DB0678821
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Feb 2018 10:47:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Feb 2018 02:47:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,448,1511856000"; d="scan'208";a="14499845"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga007.jf.intel.com with ESMTP; 02 Feb 2018 02:47:38 -0800
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <20180201180210.21652-1-alexander.kanavin@linux.intel.com>
	<19458201.5gAgVaIamb@peggleto-mobl.ger.corp.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <1b58ce97-b073-46d9-15ad-95313e4544c6@linux.intel.com>
Date: Fri, 2 Feb 2018 12:47:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <19458201.5gAgVaIamb@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/20] oe-selftest: add a test for recipes without maintainers
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
X-List-Received-Date: Fri, 02 Feb 2018 10:47:38 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02/01/2018 10:41 PM, Paul Eggleton wrote:
> I understand the intention, but I don't think oe-selftest is the right place to be
> doing this. It's going to fail for sure if you have any non-OE-Core layers in
> your configuration.
> 
> One thing I have continued to campaign for (and I'm aware that not everyone
> completely agrees) is that oe-selftest should be able to be run with people's
> own configurations, we shouldn't necessarily assume that it's only our default
> being tested - that way we maximise oe-selftest's utility and audience. Of
> course there's a limit to that, if someone's esoteric configuration breaks it
> they get to keep the pieces - but this will definitely break with anyone's
> custom configuration, esoteric or otherwise.

I do agree with this. We've had this exact conversation with Ross a few 
weeks back, and he promised to fix the test so that it's limited to 
recipes in oe-core. Take me re-sending the patch as a gentle reminder 
for that. :)

> By all means let's have a script that does this - it's even trivial to write one
> with tinfoil.

No manual scripts (that no one except me even knows about) please. I 
really do want to automate this, and have it run regularly on the 
autobuilder. Otherwise, one can just issue:

bitbake -c checkpkg world && grep -v @ tmp/log/checkpkg.csv


Alex

