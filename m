Return-Path: <raphael.kubo.da.costa@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 967946C196
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2018 15:51:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Nov 2018 07:51:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,240,1539673200"; d="scan'208";a="106865629"
Received: from rkubodac-desk.ger.corp.intel.com ([10.252.29.51])
	by fmsmga004.fm.intel.com with ESMTP; 16 Nov 2018 07:51:21 -0800
From: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
To: akuster808 <akuster808@gmail.com>
In-Reply-To: <5d7a7c30-0d55-da47-c6a2-1dc0fcddce5c@gmail.com> (akuster's
	message of "Wed, 14 Nov 2018 08:22:00 -0800")
Organization: Intel Corporation
References: <20181114132336.71049-1-raphael.kubo.da.costa@intel.com>
	<5d7a7c30-0d55-da47-c6a2-1dc0fcddce5c@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Fri, 16 Nov 2018 16:51:20 +0100
Message-ID: <871s7l6mx3.fsf@rkubodac-desk.ger.corp.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [rocko][PATCH] m4: Workaround gnulib's fseeko.c implementation
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
X-List-Received-Date: Fri, 16 Nov 2018 15:51:21 -0000
Content-Type: text/plain

akuster808 <akuster808@gmail.com> writes:

> On 11/14/18 5:23 AM, Raphael Kubo da Costa wrote:
>
>> From: Khem Raj <raj.khem@gmail.com>
>>
>> exposed by glibc 2.28 for details see
>> https://lists.gnu.org/r/bug-gnulib/2018-03/msg00000.html
>>
>> (From OE-Core rev: acca7f964bf9c21f3777085563a7928b8246f17f)
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Signed-off-by: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
>
> in in stable/rocko-nmut. Odd thing it, this is not in patchwork but the
> sumo version is.

Thanks. I need a few more patches to get host tools to build here on
Fedora 29, but now I'm even more confused as to where to send them :-)

What's the relationship between the -next, -nmut and -nmut2 branches in
Yocto's poky-contrib? How do they interact with oe-core's -next
branches? And what's the process for merging them into the actual stable
branches?

