Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 922D76612D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 10:14:29 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Oct 2017 03:14:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,396,1503385200"; d="scan'208";a="139587422"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 18 Oct 2017 03:14:29 -0700
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
References: <20171017124339.3966-1-alexander.kanavin@linux.intel.com>
	<20171017090703.85ac6135846b0a469bca4631@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <7279bf95-7391-73d9-523a-8296e4a487be@linux.intel.com>
Date: Wed, 18 Oct 2017 13:09:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171017090703.85ac6135846b0a469bca4631@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] scripts/send-recipe-update-reminders: send recipe version update reminders by email
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
X-List-Received-Date: Wed, 18 Oct 2017 10:14:29 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/17/2017 05:07 PM, Leonardo Sandoval wrote:
> 
> I like the idea of a simpler script to do this job.
> 
> Just one minor comment on the code: I would use non-zero exit values 
> in case of errors

Yep, fixed and will resent.

> and as a possible future enhancement, use a template (jinja2 for 
> example) to format the email and just populate this with the data 
> from checkpkg.

Current version of the script relies entirely on python3's standard
library; I wouldn't like to introduce 3rd party dependencies. Standard
string formatting is fine for the job imo, although I stretched the
readability to the limit :)

> AUH is the system that send emails with upgrade statistics (basically
> the system tries to upgrade and prepare the patch if possible) and
> RRS is the system that sends emails reporting upgradable recipes
> (just those recipes that needs to upgrade). I know, a bit confusing
> but in your context you are referring to the RRS.
Actually, the point of the script is that it sends *personal* reminders 
- RRS wasn't doing that, and I'm not sure how much attention anyone paid 
to those summaries that RRS sent to yocto ML. So it's a replacement for 
both perhaps, except it doesn't have the ambition to also do the update 
work for the maintainer, but 'devtool upgrade && devtool finish' is 
arguably not more difficult than xsel|git am, followed by author reset :)

Alex

