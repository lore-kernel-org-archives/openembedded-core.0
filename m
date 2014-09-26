Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A7BD46017E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Sep 2014 01:41:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8Q1ftMO021969
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 25 Sep 2014 18:41:57 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Thu, 25 Sep 2014 18:41:54 -0700
Message-ID: <5424C460.8020302@windriver.com>
Date: Fri, 26 Sep 2014 09:41:52 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1411636114.git.Chong.Lu@windriver.com>
	<bfe37164c0903446469c66e1bacfc77207c69e65.1411636114.git.Chong.Lu@windriver.com>
	<CAJTo0La5JxzLKA=VHs3wwnqSwVtEOEEn9ODPtkG_1Fo-P37RcQ@mail.gmail.com>
In-Reply-To: <CAJTo0La5JxzLKA=VHs3wwnqSwVtEOEEn9ODPtkG_1Fo-P37RcQ@mail.gmail.com>
X-Originating-IP: [128.224.162.204]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] apt: fix for CVE-2014-0478
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
X-List-Received-Date: Fri, 26 Sep 2014 01:41:59 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 09/26/2014 12:23 AM, Burton, Ross wrote:
> On 25 September 2014 10:09, Chong Lu <Chong.Lu@windriver.com> wrote:
>> +++ b/meta/recipes-devtools/apt/apt-0.9.9.4/apt-0.9.9.4-CVE-2014-0478.patch
>> @@ -0,0 +1,188 @@
>> +This patch comes from:
>> +https://bugs.debian.org/cgi-bin/bugreport.cgi?msg=73;filename=apt_0.9.7.9%2Bdeb7u2.debdiff;att=1;bug=749795
>> +
>> +diff -uarN apt-0.9.9.4-org/cmdline/apt-get.cc apt-0.9.9.4/cmdline/apt-get.cc
> This should have Upstream-Status and Signed-off-by tags.
>
> Ross
>
>

OK. I will resend a V2.

Best Regards
Chong


