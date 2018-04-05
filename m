Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 0A1CD75058
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 19:07:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Apr 2018 12:07:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,412,1517904000"; d="scan'208";a="41008654"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 05 Apr 2018 12:07:46 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
References: <1522947905.11431.438.camel@linuxfoundation.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <3b467178-c954-4f02-d903-03c8fa9f95a3@linux.intel.com>
Date: Thu, 5 Apr 2018 22:01:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1522947905.11431.438.camel@linuxfoundation.org>
Subject: Re: master branch and stabilisation
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
X-List-Received-Date: Thu, 05 Apr 2018 19:07:47 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/05/2018 08:05 PM, Richard Purdie wrote:
> So I now get to spend my time trying to figure out which patch broke
> what so I can report back on it and make the branch build again by
> dropping the broken patches.
> 
> This means I'm trying to do full on day to day development as usual as
> well as trying to sort release issues like the imminent fedora28 issue
> I should be paying attention to instead.
> 
> So, a question, what do people want me to do?

You can file bugs with master-next failures and assign them to me, 
without looking at the failed logs at all. Multitasking is stressful for 
the brain, much better to do things one after the other than switch 
context. And I'm not particularly time crunched now.

We should probably more strictly enforce the freeze - just reject the 
patches and ask to rebase and re-send after a specific date.

Alex

