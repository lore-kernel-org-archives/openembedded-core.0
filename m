Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 1B3C5788CD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 10:44:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Mar 2018 03:44:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,315,1517904000"; d="scan'208";a="35547836"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 16 Mar 2018 03:44:09 -0700
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20180315225010.48-1-Martin.Jansa@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <43bf1dcc-afc2-53ca-34c1-57b2d2e1d810@linux.intel.com>
Date: Fri, 16 Mar 2018 12:37:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180315225010.48-1-Martin.Jansa@gmail.com>
Subject: Re: [PATCH] patch.py: Use git format-patch with --no-signature --no-numbered params
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
X-List-Received-Date: Fri, 16 Mar 2018 10:44:09 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/16/2018 12:50 AM, Martin Jansa wrote:
> * --no-signature saves unnecessary .patch modifications when executed on
>    host with different git version
> * --no-numbered saves unnecessary .patch modifications when number of the
>    applied patches is changed (the number is still in the filename so the
>    order how they should be applied is still preserved)
> * both options exist for very long time, I've tested them with git 1.9.1
>    from Ubuntu 14.04 and I'm quite sure they were available even in much
>    older releases, so there shouldn't be any issue on relatively new sanity
>    tested distros

Thanks, this should reduce the churn. By the way, when reviewing a 
change to a patch, it is *far* easier to look at it with a side by side 
diff tool than the usual +- format. I use vscode with gitlens extension 
(can't believe I am recommending a Microsoft product, but here we are).

Alex

