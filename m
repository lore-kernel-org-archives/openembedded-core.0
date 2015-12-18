Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B8C9A73198
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 13:13:51 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 18 Dec 2015 05:13:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,446,1444719600"; d="scan'208";a="863961000"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 18 Dec 2015 05:13:51 -0800
To: openembedded-core@lists.openembedded.org
References: <1450352712-31476-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
	<CAJTo0LZkPQgzt6Kttmg4sWrXQk_m+iT9qLK1sR-ftkMBZxK0YA@mail.gmail.com>
	<567402B6.8060907@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <56740607.3060906@linux.intel.com>
Date: Fri, 18 Dec 2015 15:11:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.3.0
MIME-Version: 1.0
In-Reply-To: <567402B6.8060907@linux.intel.com>
Subject: Re: [PATCH] boost: update to 1.59.0
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
X-List-Received-Date: Fri, 18 Dec 2015 13:13:51 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 12/18/2015 02:57 PM, Alexander Kanavin wrote:

>> This adds a new library so the packaging needs to be updated to reflect
>> that.  The obvious problem is that the development/debug/test packages
>> are all called libboost-timer after this upgrade.
>>
>> Once fixed (extend BOOST_LIBS) it would be good to set FILES_${PN} to ""
>> so this can't happen in the future, and instead you'd get
>> installed-not-shipped errors.
>
> Also, the latest upstream is 1.60.0.

(released yesterday, so don't take it as submitter's fault)

Alex


