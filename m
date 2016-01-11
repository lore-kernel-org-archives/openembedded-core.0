Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 93C1C73179
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 18:52:09 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 11 Jan 2016 10:52:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,554,1444719600"; d="scan'208";a="724817919"
Received: from bitbang.jf.intel.com (HELO [10.7.199.73]) ([10.7.199.73])
	by orsmga003.jf.intel.com with ESMTP; 11 Jan 2016 10:52:09 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
References: <1452277369.7598.136.camel@linuxfoundation.org>
From: Randy Witt <randy.e.witt@linux.intel.com>
Message-ID: <5693F9D9.3090206@linux.intel.com>
Date: Mon, 11 Jan 2016 10:52:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1452277369.7598.136.camel@linuxfoundation.org>
Subject: Re: [PATCH] pixz: Add 1.0.6
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
X-List-Received-Date: Mon, 11 Jan 2016 18:52:09 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 01/08/2016 10:22 AM, Richard Purdie wrote:
> xz gives better compression results than bzip/gz but is often slower.
> Using parallel compression mitigates this somewhat and is particularly
> useful for the SDK.

xz as of 5.2.0 allows for multi-threaded compression.

http://git.tukaani.org/?p=xz.git;a=blob;f=NEWS;hb=HEAD

