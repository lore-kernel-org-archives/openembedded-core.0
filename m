Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id DAA6060069
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 08:38:49 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 May 2017 01:38:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,358,1491289200"; d="scan'208";a="88532692"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2017 01:38:46 -0700
To: Robert Yang <liezhi.yang@windriver.com>,
	Awais Belal <awais_belal@mentor.com>,
	openembedded-core@lists.openembedded.org
References: <20170518065043.1662-1-awais_belal@mentor.com>
	<62e4fbc9-931b-d0dd-e71b-99002495c32e@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <a577a0c9-e1df-a657-a00b-4c5cd69c4609@linux.intel.com>
Date: Thu, 18 May 2017 11:36:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <62e4fbc9-931b-d0dd-e71b-99002495c32e@windriver.com>
Subject: Re: [PATCH] autogen-native: allow user to set POSIX_SHELL as desired
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
X-List-Received-Date: Thu, 18 May 2017 08:38:50 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/18/2017 10:23 AM, Robert Yang wrote:
>> +-      test -x "$POSIX_SHELL" && break
>> ++      test -n "$POSIX_SHELL" && break
>
> The problem is libopts.m4 is auto generated, so it may override
> when upgrade autogen-native.

That's right. The file is generated from libopts.def in the same 
directory. I now looked at the code finally :) and I think it's better 
to leave the POSIX_SHELL variable alone (and not set it from the recipe 
either because it has no effect), and go back to the original idea of 
patching the place where it's used to make a shebang line - I think 
there's only one such place in the source code.

But fixing libopts.def is okay too, I just think it's more trouble.

Alex


