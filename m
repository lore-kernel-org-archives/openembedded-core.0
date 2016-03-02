Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9506676710
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Mar 2016 14:22:12 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 02 Mar 2016 06:22:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,529,1449561600"; d="scan'208";a="927968083"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 02 Mar 2016 06:21:59 -0800
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
	<549d5d18a9fe89af398559b3f8df60bb66643392.1456415870.git.alexander.kanavin@linux.intel.com>
	<89F0A1C5-6710-4F62-A646-0A2FDDDC75D8@gmail.com>
	<56D5A3B1.8080008@linux.intel.com>
	<CAMKF1sqDVjNH_XLhbY+86BdFx9vZZpaw8j-XNDTM67st=LWW=Q@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <56D6F62C.2020000@linux.intel.com>
Date: Wed, 2 Mar 2016 16:18:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqDVjNH_XLhbY+86BdFx9vZZpaw8j-XNDTM67st=LWW=Q@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/19] nspr: update to 4.12
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
X-List-Received-Date: Wed, 02 Mar 2016 14:22:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/01/2016 04:58 PM, Khem Raj wrote:

>> The failing patch is applied only when musl is in use (and so the regression
>> went unnoticed). Can you rework it so that it can be applied
>> unconditionally?
>
> This probably could be however OE-Core supports musl and poky-tiny
> defaults to it. It will be good to test
> changes for it when changing OE-Core at the least bitbake -cpatch <recipe>

Yes, but that's a job for autobuilder, I'm afraid. When doing local 
changes, I have to draw the line somewhere about what I test, and what I 
don't, and testing builds against various libc providers is outside of that.

Generally, patches should be unconditional, because a) we should be able 
to send them upstream, b) conditional patches create several slightly 
different versions of source code, which is a maintenance headache.


Alex


