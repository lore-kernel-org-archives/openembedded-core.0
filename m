Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id AF7D677EAE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 12:35:02 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 May 2017 05:35:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,359,1491289200"; d="scan'208";a="89019756"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 18 May 2017 05:35:02 -0700
To: "Belal, Awais" <Awais_Belal@mentor.com>,
	Robert Yang <liezhi.yang@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20170518065043.1662-1-awais_belal@mentor.com>
	<62e4fbc9-931b-d0dd-e71b-99002495c32e@windriver.com>
	<a577a0c9-e1df-a657-a00b-4c5cd69c4609@linux.intel.com>
	<1495106583673.65036@mentor.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <62eacb9b-662a-c259-0bbf-364c488cb194@linux.intel.com>
Date: Thu, 18 May 2017 15:32:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1495106583673.65036@mentor.com>
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
X-List-Received-Date: Thu, 18 May 2017 12:35:03 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/18/2017 02:23 PM, Belal, Awais wrote:
>> That's right. The file is generated from libopts.def in the same
>> directory. I now looked at the code finally :) and I think it's
>> better to leave the POSIX_SHELL variable alone (and not set it from
>> the recipe either because it has no effect), and go back to the
>> original idea of patching the place where it's used to make a
>> shebang line - I think there's only one such place in the source
>> code.
>
>> But fixing libopts.def is okay too, I just think it's more
>> trouble.
>
> The usage of libopts.def has been deprecated upstream:
> git://git.sv.gnu.org/autogen.git #
> 5cbe233387d7f7b36752736338d1cd4f71287daa but they've still kept
> libopts.m4 so I think this patch will do for future use as well and
> shouldn't have a problem.

I just checked why is autogen in oe-core in the first place. The only 
thing that needs it now is grub, and it will no longer be necessary when 
Khem's grub 2.02 patch shows up in master. So then we can remove the 
whole thing. But thanks for fixing! :)

Alex

