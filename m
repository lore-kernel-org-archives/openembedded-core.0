Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5604E6FF97
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 13:25:21 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 22 Dec 2015 05:25:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,464,1444719600"; d="scan'208";a="879035827"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 22 Dec 2015 05:25:20 -0800
To: Andre McCurdy <armccurdy@gmail.com>
References: <cover.1449671297.git.alexander.kanavin@linux.intel.com>
	<91b12be58798efa4bcd8742b50d48077aa3ae6bd.1449671297.git.alexander.kanavin@linux.intel.com>
	<CAJ86T=Uo0tAtbNYXYkmcvm2bqMUeq79it_cH5aSChgtNsBdsNA@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <56794E98.3050605@linux.intel.com>
Date: Tue, 22 Dec 2015 15:22:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=Uo0tAtbNYXYkmcvm2bqMUeq79it_cH5aSChgtNsBdsNA@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/10] mirrors: replace references to archive.apache.org
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
X-List-Received-Date: Tue, 22 Dec 2015 13:25:22 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/22/2015 12:21 AM, Andre McCurdy wrote:
>> -http://www.apache.org/dist  http://archive.apache.org/dist \n \
>> +http://www.eu.apache.org/dist  http://www.us.apache.org/dist \n \
>
> Is this change correct? Shouldn't mirrors.bbclass provide a fallback
> to the historical releases URL (so that things keep working if the
> oe-core version of an apache.org package is no longer a current
> version) ?

When I have checked, archive.apache.org did not have the latest releases 
of subversion, so it can't be relied on as a primary upstream source. On 
the other hand, primary mirrors only keep the latest releases, and 
remove anything else. So the right thing would be to first try to use 
those primary mirrors, and fall back to archive if those mirrors no 
longer have the version we need.

This problem also shows up with debian upstream.

Alex


