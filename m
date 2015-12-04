Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 112F160291
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Dec 2015 10:20:38 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 04 Dec 2015 02:20:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,380,1444719600"; 
   d="scan'208";a="7423784"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 04 Dec 2015 02:20:38 -0800
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <cover.1449152021.git.alexander.kanavin@linux.intel.com>
	<CAP9ODKomNG8pbmjH=-k2qVOBrmnopeTjht6devfRJD=mH=NpZQ@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <5661685E.9080001@linux.intel.com>
Date: Fri, 4 Dec 2015 12:18:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKomNG8pbmjH=-k2qVOBrmnopeTjht6devfRJD=mH=NpZQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/9] Move Qt4 recipes to a separate meta-qt4 layer
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
X-List-Received-Date: Fri, 04 Dec 2015 10:20:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/03/2015 09:21 PM, Otavio Salvador wrote:

>> Qt4 is reaching end of life at the end of 2015, and will not be supported
>> upstream. Qt4 recipes are moved out of oe-core to a separate meta-qt4 layer
>> available here:
>> http://git.yoctoproject.org/cgit/cgit.cgi/meta-qt4/about/
>>
>> This patchset removes Qt4 from oe-core. I cannot send it to the list for review
>> because it contains very long lines that SMTP cannot handle.
>
> Personally I would prefer this to be done in a single patch. If
> someone wants to revert it locally it is easier and it also makes
> easier for people to understand why it has been done and keep
> everything at buildable state across commits.

That's fine with me. Ross, can you squish these commits together in your 
testing branch?


Alex


