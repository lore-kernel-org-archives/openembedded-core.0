Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 0A07E755F8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 15:18:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 16 Jun 2016 08:18:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,480,1459839600"; d="scan'208";a="1003335912"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2016 08:18:07 -0700
To: openembedded-core@lists.openembedded.org, jpardeiro@rapyuta-robotics.com
References: <1466087231-14928-1-git-send-email-jpardeiro@rapyuta-robotics.com>
	<CABcZANkvgj_+Dje4T9h9Z3W4pdWvvpej_PYdwFLEX4mDVHR7mg@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <9cafe80c-2cfb-c068-b5d9-a18c5bcc9947@linux.intel.com>
Date: Thu, 16 Jun 2016 18:17:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <CABcZANkvgj_+Dje4T9h9Z3W4pdWvvpej_PYdwFLEX4mDVHR7mg@mail.gmail.com>
Subject: Re: [PATCH] The CMake recipes contain a mismatch between the environmental variable which defines where the Modules are installed and the location where they actually are. This patch fixes the environmental variable to point to the proper folder defined according to the cmake version.
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
X-List-Received-Date: Thu, 16 Jun 2016 15:18:09 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/16/2016 05:45 PM, Christopher Larson wrote:
> Thanks for the contribution, though, it's appreciated. Perhaps someone
> else can comment on the patch itself.

The idea behind the fix is correct (latest cmake seems to have its 
modules in /usr/share/cmake-<version>/Modules rather than 
/usr/share/cmake/Modules), but the patch is wrong in multiple ways:

1) needs to be rebased against latest master, the line it's patching has 
been changed over a year ago actually.

2) the patch is only adding another patch :) This extra layer needs to go.

3) the commit message should contain a single, short sentence in the 
first paragraph that explains what the patch is doing:

"cmake.bbclass: set the modules directory correctly"

Then the rest of the commit message should explain why that needs to 
happen and also can go into further details of how the problem is fixed.

Alex


