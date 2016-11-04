Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 237F071AA7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2016 13:56:35 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga105.fm.intel.com with ESMTP; 04 Nov 2016 06:56:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,443,1473145200"; d="scan'208";a="27487446"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 04 Nov 2016 06:56:35 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <6511599a-ddb1-77b0-f42e-69afeaa60cae@linux.intel.com>
	<1480827.LzmdYstA2d@peggleto-mobl.ger.corp.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <f0b4bd5b-5873-f261-8536-0e24821922ba@linux.intel.com>
Date: Fri, 4 Nov 2016 15:54:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <1480827.LzmdYstA2d@peggleto-mobl.ger.corp.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: using devtool for rebasing patches
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
X-List-Received-Date: Fri, 04 Nov 2016 13:56:36 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 11/03/2016 09:29 PM, Paul Eggleton wrote:

> "devtool upgrade" is designed specifically to handle the upgrade case and
> tries to rebase the old patches onto the new version, putting you into
> resolution mode with "git am" if it fails to apply a patch. I appreciate that
> you may now be working through sorting out all of the patches to reduce the
> fuzziness when applying, and that won't help in that scenario, but it would
> definitely be worth considering for upgrades.

Fair enough, although I was not aware of this feature of devtool until 
now, despite being a major contributor of package upgrades to oe-core :) 
We have had a miscommunication issue, it seems.

> I'm open to implementing better support for handling patch application failure
> for devtool modify - in fact there is a bug open for just that:
>
>   https://bugzilla.yoctoproject.org/show_bug.cgi?id=8325

THanks, I just wrote a comment there, and made the patch fuzz bug depend 
on this one :)

Alex

