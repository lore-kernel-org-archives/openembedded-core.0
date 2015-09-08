Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C9FBB60132
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 03:05:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8835l3P006655
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 7 Sep 2015 20:05:47 -0700 (PDT)
Received: from [128.224.162.158] (128.224.162.158) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 7 Sep 2015 20:05:47 -0700
Message-ID: <55EE5089.4000006@windriver.com>
Date: Tue, 8 Sep 2015 11:05:45 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1440568697-32101-1-git-send-email-rongqing.li@windriver.com>	<CAJTo0LZsddTKL-4ZikhvnFrsLr3EmOG2QAKyx8JFB4m7fXbKtQ@mail.gmail.com>
	<55DE6549.50707@windriver.com>
In-Reply-To: <55DE6549.50707@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][v2] perf: fix the install-python_ext
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
X-List-Received-Date: Tue, 08 Sep 2015 03:05:49 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

ping

-Roy

On 2015年08月27日 09:18, Rongqing Li wrote:
>
>
> On 2015年08月26日 18:16, Burton, Ross wrote:
>>
>> On 26 August 2015 at 06:58, <rongqing.li@windriver.com
>> <mailto:rongqing.li@windriver.com>> wrote:
>>
>>     +export PYTHON_SITEPACKAGES_DIR
>>
>>
>> Why do you export this and then use \$(PYTHON_SITEPACKAGES_DIR), isn't
>> just using ${PYTHON_SITEPACKAGES_DIR} directly so the expansion is
>> performed by bitbake neater?
>>
>> Ross
>
>
> keep it same as original codes.
>
> other reason is that this change is under work-shared dir, it will see
> puzzle if see the source code from other package, like linux kernel,
>
>

-- 
Best Reagrds,
Roy | RongQing Li

