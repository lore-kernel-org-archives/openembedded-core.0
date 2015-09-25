Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7EDE87701A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 11:03:13 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 25 Sep 2015 04:03:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,586,1437462000"; d="scan'208";a="652104286"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 25 Sep 2015 04:03:12 -0700
Message-ID: <560529FA.20304@linux.intel.com>
Date: Fri, 25 Sep 2015 14:03:22 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1443043997.19044.35.camel@linuxfoundation.org>
In-Reply-To: <1443043997.19044.35.camel@linuxfoundation.org>
Subject: Re: [PATCH] gcc-shared-source: Set empty SRC_URI
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
X-List-Received-Date: Fri, 25 Sep 2015 11:03:16 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 09/24/2015 12:33 AM, Richard Purdie wrote:
> gcc-source is the only gcc recipe meant to handle the fetch/unpack/patch
> tasks, the other gcc recipes then depend on this.
>
> This approach has been creating some confusion for tools like the archiver.
> The simplest way to signal to these processes that there is no source
> is to empty SRC_URI at the same time we disable the other tasks.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

This has broken the upstream version check for the gcc recipes, which 
was working fine before:

http://packages.yoctoproject.org/


Alex




