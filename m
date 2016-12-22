Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id CC95777682
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 14:31:12 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 22 Dec 2016 06:31:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,388,1477983600"; d="scan'208";a="1075247084"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 22 Dec 2016 06:30:54 -0800
To: "Yu, Mingli" <mingli.yu@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <1482308378-15213-1-git-send-email-mingli.yu@windriver.com>
	<CAJTo0LYT4YrWxex7mOLhBsWqKR_9cmJgO66dxzCoJT-U6kWDqQ@mail.gmail.com>
	<f00958f8-1c4a-e0ae-8a13-d6f672c8a850@linux.intel.com>
	<585B397B.6080206@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <24ee0d1e-573d-04ec-8cac-e59c9acf593d@linux.intel.com>
Date: Thu, 22 Dec 2016 16:30:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <585B397B.6080206@windriver.com>
Subject: Re: [PATCH] gpgme: add GPGME_STATUS_KEY_CONSIDERED
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
X-List-Received-Date: Thu, 22 Dec 2016 14:31:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/22/2016 04:24 AM, Yu, Mingli wrote:
> Thanks Alex!
> Actually I ever tried to upgrade gpgme to 1.8.0 before send out this
> patch, but there comes other ptest failed issues for python-pygpgme
> which not exist on current gpgme 1.6.0 if we simply update gpgme to 1.8.0.
>
> Anyway I prefer to wait for more update for python-pygpgme from
> https://pagure.io/pygpgme/commits/master before we move forward to gpgme
> 1.8.0.

pygpgme upstream hasn't released a new version since 2012; the link 
above is someone's fork to fix the pressing issues, and there's no 
indication they will do more fixing. I suggest you just take the 
necessary patches, add them to pygpgme recipe, and update gpgme recipe 
at the same time. You can also review debian/ubuntu's pygpgme packages 
to see what custom patching they have there.

Alex


