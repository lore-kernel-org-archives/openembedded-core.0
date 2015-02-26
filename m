Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0D1AA71637
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 22:37:50 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 26 Feb 2015 14:29:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,655,1418112000"; d="scan'208";a="691359002"
Received: from localhost.jf.intel.com (HELO [10.7.201.37]) ([10.7.201.37])
	by orsmga002.jf.intel.com with ESMTP; 26 Feb 2015 14:37:51 -0800
Message-ID: <54EFA03E.9030904@linux.intel.com>
Date: Thu, 26 Feb 2015 14:37:50 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1424971893-6258-1-git-send-email-openembedded-devel@urbanec.net>	<1424987235.26813.42.camel@linuxfoundation.org>
	<CAP9ODKoZO1m-2BomHz6h_YtmwKsoEURsCxAMXPmYN3X6E1xqfQ@mail.gmail.com>
In-Reply-To: <CAP9ODKoZO1m-2BomHz6h_YtmwKsoEURsCxAMXPmYN3X6E1xqfQ@mail.gmail.com>
Cc: Peter Urbanec <openembedded-devel@urbanec.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0: Shorten __FILE__ in gst_debug_log output on all platforms.
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
X-List-Received-Date: Thu, 26 Feb 2015 22:37:55 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 02/26/2015 02:00 PM, Otavio Salvador wrote:
> On Thu, Feb 26, 2015 at 6:47 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Fri, 2015-02-27 at 04:31 +1100, Peter Urbanec wrote:
>>> On WIN32 the file argument to gst_debug_log_valist is shortened to just
>>> the filename. This is useful not only for MSVC, but also with gcc/Linux
>>> when doing cross-compilation builds and out-of-tree builds.
>>
>> Ultimately I think we need to address this issue in gcc itself, probably
>> setting some kind of base path in the environment which it removes from
>> __FILE__ (set to ${S}). There were more complex discussions about using
>> the same mapping code as can be used with the debug symbols code too.

The bug https://gcc.gnu.org/bugzilla/show_bug.cgi?id=47047 looks to still be 
open. Should we open a Yocto bug to update that patch to apply to a more recent gcc?

> Agreed; this should indeed be a global fix as this affects virtually
> all packages.
>


