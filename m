Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 60DEF73EFD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 06:33:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t466X9JP023133
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 May 2015 23:33:09 -0700 (PDT)
Received: from [128.224.162.142] (128.224.162.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 5 May 2015 23:33:09 -0700
Message-ID: <5549B5A4.7080902@windriver.com>
Date: Wed, 6 May 2015 14:33:08 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1430810046-27021-1-git-send-email-rongqing.li@windriver.com>
	<CAJTo0LZegzqLHxrTkyyH3ybErWejuZLQh9ZgFCxcJJwfEaPswQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZegzqLHxrTkyyH3ybErWejuZLQh9ZgFCxcJJwfEaPswQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] apt: upgrade to 1.0.9.9
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
X-List-Received-Date: Wed, 06 May 2015 06:33:10 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年05月05日 23:34, Burton, Ross wrote:
>
> On 5 May 2015 at 08:14, <rongqing.li@windriver.com
> <mailto:rongqing.li@windriver.com>> wrote:
>
>     Upgrade to fix the several CVEs: CVE-2014-0488, CVE-2014-0490
>     Remove apt-0.9.9.4-CVE-2014-0478.patch, which was backport.
>     Romve no-ko-translation.patch, apt-1.0.9.9 has ko translation
>     Update use-host.patch no-curl.patch db_linking_hack.patch and
>     noconfigure.patch
>     Not build the test cases since it requires gtest
>
>
> What runtime testing was done with this upgrade in place?
>
> Ross

apt-cache search by copy host's /var/lib/dpkg/status
apt-get -h
Not too much;

-Roy


-- 
Best Reagrds,
Roy | RongQing Li

