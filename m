Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2FFBC6FF56
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 12:46:04 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 08 Jan 2016 04:46:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,538,1444719600"; d="scan'208";a="630142861"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Jan 2016 04:46:05 -0800
To: openembedded-core@lists.openembedded.org
References: <1450828680-662-1-git-send-email-armccurdy@gmail.com>
	<1450828680-662-3-git-send-email-armccurdy@gmail.com>
	<CAJ86T=VLQvP0mE3zCOYEr=Tkx0LJ-MYFh9kyEYZT7-1XYVi+XQ@mail.gmail.com>
	<CAJTo0LZi8hpETfuWBOTan=8B83V5up_fzM2__rK4ZmXZXf2UPg@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <568FAEE6.2090502@linux.intel.com>
Date: Fri, 8 Jan 2016 14:43:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZi8hpETfuWBOTan=8B83V5up_fzM2__rK4ZmXZXf2UPg@mail.gmail.com>
Subject: Re: [PATCH 2/3] valgrind: don't restrict to armv7a
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
X-List-Received-Date: Fri, 08 Jan 2016 12:46:05 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 01/07/2016 11:39 PM, Burton, Ross wrote:
>
> On 7 January 2016 at 21:03, Andre McCurdy <armccurdy@gmail.com
> <mailto:armccurdy@gmail.com>> wrote:
>
>     Ping. This is more urgent now that arch-armv7ve.inc has been merged to
>     oe-core master.
>
>
> Sadly 3.11 totally breaks on PPC, so that's blocking.  Maybe rebase the
> patch to master before the 3.11 upgrade?

I'll fix the PPC breakage and resend (with Andre's fix commits if they 
aren't yet in master against old version by then).

Alex


