Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 049CD65D3C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Nov 2014 01:43:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sA41h1J4028720
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Nov 2014 17:43:01 -0800 (PST)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Mon, 3 Nov 2014 17:43:00 -0800
Message-ID: <54582F22.9010409@windriver.com>
Date: Tue, 4 Nov 2014 09:42:58 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1415007085-2342-1-git-send-email-Chong.Lu@windriver.com>
	<CAJTo0LYbLmb9EVbPFf+xtQfn8OVT02j+HUX7JfSYPwZ-hSQ6zQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYbLmb9EVbPFf+xtQfn8OVT02j+HUX7JfSYPwZ-hSQ6zQ@mail.gmail.com>
X-Originating-IP: [128.224.162.204]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] curl: Security Advisory - curl - CVE-2014-3620
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
X-List-Received-Date: Tue, 04 Nov 2014 01:43:11 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 11/03/2014 07:59 PM, Burton, Ross wrote:
>
> On 3 November 2014 09:31, Chong Lu <Chong.Lu@windriver.com 
> <mailto:Chong.Lu@windriver.com>> wrote:
>
>      meta/recipes-support/curl/curl/CVE-2014-3620.patch |   69
>     ++++++++++++++++++++
>
>
> ERROR: Command Error: exit status: 1  Output:
> Applying patch CVE-2014-3620.patch
> patching file lib/cookie.c
> patching file tests/data/test61
> Hunk #1 FAILED at 21.
>
> Assuming that this is a line ending problem again, do you have this 
> commit in a git repository somewhere?
>
> Ross

Hi Ross,

This patch has included in 
http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=chonglu/curl

Best Regards
Chong

