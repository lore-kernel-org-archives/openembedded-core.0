Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 82609719B5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 06:01:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uBD61AnV000772
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 12 Dec 2016 22:01:11 -0800
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 12 Dec 2016 22:01:10 -0800
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1479363545.git.liezhi.yang@windriver.com>
	<5cea51d1030f17c4c8fecfb4da3b04bd63a2b6c2.1479363545.git.liezhi.yang@windriver.com>
	<4153349.TypEQkvbtP@peggleto-mobl.ger.corp.intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <bcfd077b-eee2-fa8e-dfd3-a2470d07ec3f@windriver.com>
Date: Tue, 13 Dec 2016 14:01:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <4153349.TypEQkvbtP@peggleto-mobl.ger.corp.intel.com>
Subject: Re: [PATCH 5/8] oeqa/sdkext/devtool.py: don't reset when the test is failed
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
X-List-Received-Date: Tue, 13 Dec 2016 06:01:14 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 12/13/2016 12:48 PM, Paul Eggleton wrote:
> On Wed, 16 Nov 2016 22:19:34 Robert Yang wrote:
>> The contents are helpful to debug when the error happens.
>
> In this case removing this is OK because we're operating on an eSDK that the
> tests install. However, this wouldn't be appropriate for the devtool oe-
> selftest tests since they are operating on the user's build system itself -
> not that you probably have any intention of changing those, I just wanted to
> note that.

Sorry, I don't quite understand, does selftest uses oeqa/sdkext/devtool.py,
please ? Even if it uses devtool.py, I still think that we need keep the error
contents for debugging when the error happens. It's very hard to debug when
there is no error log or no workspace.

// Robert

>
> Cheers,
> Paul
>

