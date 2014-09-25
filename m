Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7AE72609B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 22:48:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8PMmvdA005247
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 25 Sep 2014 15:48:57 -0700 (PDT)
Received: from msp-dhcp33.wrs.com (172.25.34.33) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 25 Sep 2014 15:48:56 -0700
Message-ID: <54249BD8.1030702@windriver.com>
Date: Thu, 25 Sep 2014 17:48:56 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <yocto@yoctoproject.org>, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1411641352-19058-1-git-send-email-f.deldegan@endian.com>
	<CAJTo0LYf-qWXia8EuKSnck5=yYLGspckqm27y3kxMDESSdL5Og@mail.gmail.com>
In-Reply-To: <CAJTo0LYf-qWXia8EuKSnck5=yYLGspckqm27y3kxMDESSdL5Og@mail.gmail.com>
Subject: Re: [yocto] [PATCH] bash: update to latest (025) patchset (fixes CVE-2014-6271)
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
X-List-Received-Date: Thu, 25 Sep 2014 22:48:59 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/14, 5:40 PM, Burton, Ross wrote:
> Hu Francesco,
>
> On 25 September 2014 11:35, Francesco Del Degan <f.deldegan@endian.com> wrote:
>> Updated to reflect the latest patchset in bash 4.3.
>> Fixes the CVE-2014-6271.
>
> I'm hearing that this isn't a complete fix, so lets wait for more patches.
>
> Is it possible to cherry-pick just the security fixes, instead of
> every patch they've released?
>
> Finally, patches for oe-core should go to openembedded-core@, not yocto@.
>
> Ross
>

Patch 025 fixes CVE-2014-6271, but does NOT fix CVE-2014-7169 or possibly two 
other issues people are currently looking into.  (None of this is confidential 
BTW..  you can all follow along on the oss-security mailing list.)

So I would recommend that someone get the 025 patch (don't forget to patch bash 
3.2 as well) in.. and we should wait until their is an official one for 7169.

--Mark

