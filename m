Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9D87B6189F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 23:52:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 01RNpkLp018514
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 27 Feb 2020 15:52:07 -0800
Received: from [128.224.23.162] (128.224.23.162) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Thu, 27 Feb 2020 15:51:49 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Alexander Kanavin
	<alex.kanavin@gmail.com>
References: <20200226180746.121476-1-trevor.gamblin@windriver.com>
	<20200226180746.121476-2-trevor.gamblin@windriver.com>
	<CANNYZj-EJ8kzbvRd5fnb2HKGUHFVnmnZfMfta99cFxO+q8Abpw@mail.gmail.com>
	<a0aceaefac62b9b582f8dba155f5d6118d096bea.camel@linuxfoundation.org>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <40e95e22-241a-d98b-63a4-f557bdb8ef9b@windriver.com>
Date: Thu, 27 Feb 2020 18:51:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <a0aceaefac62b9b582f8dba155f5d6118d096bea.camel@linuxfoundation.org>
X-Originating-IP: [128.224.23.162]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2 v3] coreutils: add ptest
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
X-List-Received-Date: Thu, 27 Feb 2020 23:52:49 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 2/27/20 6:26 PM, Richard Purdie wrote:
> On Wed, 2020-02-26 at 19:13 +0100, Alexander Kanavin wrote:
>> valgrind, gdb and strace are already pulled into core-image-sato-sdk-
>> ptest (the one that runs the slow ptests on the AB), so there is no
>> harm in adding them here as well.
> Actually, there is.
>
> Adding valgrind to the RDEPENDS of coreutils means all builds end up
> needing to include valgrind. We really don't want that.
>
> I know this is bad but it is the way dependencies work today :(
Should I resubmit with gdb and strace?
>
> Cheers,
>
> Richard
>
>
>

