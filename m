Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 74CBD65F69
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 01:53:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4J1rQWw013494
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 18 May 2014 18:53:27 -0700 (PDT)
Received: from [128.224.162.149] (128.224.162.149) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Sun, 18 May 2014 18:53:26 -0700
Message-ID: <53796414.1040503@windriver.com>
Date: Mon, 19 May 2014 09:53:24 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1400219191.git.rongqing.li@windriver.com>
	<CAJTo0Lb6euhg7DvXoFG62-tgASvPcJGRSHAu1GcHn9oXTHudkw@mail.gmail.com>
In-Reply-To: <CAJTo0Lb6euhg7DvXoFG62-tgASvPcJGRSHAu1GcHn9oXTHudkw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6] subversion: backport 6 CVE patches
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
X-List-Received-Date: Mon, 19 May 2014 01:53:39 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 05/16/2014 06:39 PM, Burton, Ross wrote:
> On 16 May 2014 07:00,  <rongqing.li@windriver.com> wrote:
>>    subversion: fix for Security Advisory CVE-2013-1849
>>    subversion: fix for Security Advisory CVE-2013-4505
>>    subversion: fix for Security Advisory CVE-2013-4131
>>    subversion: fix for Security Advisory CVE-2013-1845
>>    subversion: fix for Security Advisory CVE-2013-1847 and CVE-2013-1846
>>    subversion: fix for Security Advisory CVE-2013-4277
>
> Are these intended to be backported to daisy?

These patches can be cherry-picked to daisy, no need to modification.

-Roy


>   For master, presumably
> we could upgrade to 1.7.16 or 1.8.9?
>
> Ross
>
>

-- 
Best Reagrds,
Roy | RongQing Li

